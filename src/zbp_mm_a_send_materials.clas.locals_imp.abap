CLASS lcl_send_to_eai DEFINITION.

  PUBLIC SECTION .
    CLASS-METHODS send IMPORTING i_data TYPE data EXPORTING o_data TYPE data.

ENDCLASS.

CLASS lcl_send_to_eai IMPLEMENTATION.

  METHOD send.

    DATA: lv_url             TYPE string VALUE 'https://api.com',
          lv_method          TYPE string,
          lv_data            TYPE string,
          lv_json            TYPE string,
          lv_response_status TYPE if_web_http_response=>http_status,
          lv_responsetxt     TYPE string,
          lv_response_body   TYPE string.

    lv_json = /ui2/cl_json=>serialize( EXPORTING data = i_data ).

    TRY.
        " HTTP Client 생성
        DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination(
                                  i_destination = cl_http_destination_provider=>create_by_url( lv_url ) ).
        DATA(lo_request) = lo_http_client->get_http_request( ).

        lo_request->set_text( i_text = lv_json ).

        " 요청 전송
        DATA(lo_response) = lo_http_client->execute( if_web_http_client=>post ).
        lv_response_status = lo_response->get_status( ).
        lv_response_body = lo_response->get_text( ).

*      " 응답 결과 파싱 예시 (LOCATION 필드 기반)
*      DATA(lv_location) = lo_response->get_header_field( i_name = 'LOCATION' ).
*      IF lv_location IS NOT INITIAL.
*        REPLACE ALL OCCURRENCES OF REGEX '[^[:alnum:]]' IN lv_location WITH space.
*        REPLACE ALL OCCURRENCES OF REGEX '[^0-9]' IN lv_location WITH space.
*        CONDENSE lv_location.
*        lv_responsetxt = |처리 완료 - 송장번호: { lv_location }|.
*      ELSE.
*        lv_responsetxt = |처리 완료 - 응답 본문: { lv_response_body }|.
*      ENDIF.

        lo_http_client->close( ).

      CATCH cx_http_dest_provider_error INTO DATA(cx_provider).
        lv_responsetxt = |HTTP Destination 오류: { cx_provider->get_text( ) }|.
        lv_response_status-code = 500.
        lv_response_status-reason = 'Internal Server Error'.

      CATCH cx_web_http_client_error INTO DATA(cx_client).
        lv_responsetxt = |HTTP Client 오류: { cx_client->get_text( ) }|.
        lv_response_status-code = 500.
        lv_response_status-reason = 'Client Execution Failed'.

    ENDTRY.

    IF lv_response_status-code EQ 200.

    ENDIF.

    " 응답 상태 보완
    IF lv_response_status-code IS INITIAL.
      lv_response_status-code = 500.
      lv_response_status-reason = 'Unknown Failure'.
      o_data = 500.
    ENDIF.

*    response->set_status(
*      i_code   = lv_response_status-code
*      i_reason = lv_response_status-reason
*    ).
*    response->set_text( lv_responsetxt ).
*    response->set_header_field(
*            i_name  = if_web_http_header=>content_type
*            i_value = 'application/json' ) ##NO_TEXT.

    o_data = lv_response_status-code.

  ENDMETHOD.

ENDCLASS.

CLASS lsc_zmm_a_send_materials DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save REDEFINITION.
    METHODS cleanup REDEFINITION.

ENDCLASS.

CLASS lsc_zmm_a_send_materials IMPLEMENTATION.

  METHOD save.

  ENDMETHOD.

  METHOD cleanup.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_zmm_a_send_materials DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PUBLIC SECTION.
    INTERFACES: if_rap_query_provider.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zmm_a_send_materials RESULT result.

    METHODS transfer FOR MODIFY
      IMPORTING keys FOR ACTION zmm_a_send_materials~transfer RESULT result.
*    METHODS create FOR MODIFY
*      IMPORTING entities FOR CREATE zmm_a_send_materials.
*
*    METHODS update FOR MODIFY
*      IMPORTING entities FOR UPDATE zmm_a_send_materials.
*
*    METHODS delete FOR MODIFY
*      IMPORTING keys FOR DELETE zmm_a_send_materials.

    METHODS read FOR READ
      IMPORTING keys FOR READ zmm_a_send_materials RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zmm_a_send_materials.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zmm_a_send_materials RESULT result.

*    METHODS map_messages
*      IMPORTING
*        cid          TYPE string
*        is_dependend TYPE abap_bool       DEFAULT  abap_false
*        messages     TYPE SYMSG
*      EXPORTING
*        failed_added TYPE abap_bool
*      CHANGING
*        failed       TYPE tt_booking_failed
*        reported     TYPE tt_booking_reported.

ENDCLASS.

CLASS lhc_zmm_a_send_materials IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD transfer.

    " 1. 요청 파라미터에서 제품 리스트 추출
    LOOP AT keys ASSIGNING FIELD-SYMBOL(<ls_request>).
      IF sy-index NE 1.
        EXIT.
      ENDIF.
      DATA(lt_requested_products) = <ls_request>-%param-product.
      DATA(lv_cid) = <ls_request>-%cid.
    ENDLOOP.

    " 2. 제품 + 설명 + 그룹명 조회
    TYPES: BEGIN OF ty_product_info,
             product                TYPE i_product-product,
             plant                  TYPE i_plant-plant,
             baseunit               TYPE i_product-baseunit,
             productdescription     TYPE i_productdescription-productdescription,
             productgroup           TYPE i_productgrouptext_2-productgroup,
             productgroupname       TYPE i_productgrouptext_2-productgroupname,
             yy1_transferdate_plt   TYPE i_productplantbasic-yy1_transferdate_plt,
             yy1_transferstatus_plt TYPE i_productplantbasic-yy1_transferstatus_plt,
           END OF ty_product_info.

    DATA: lt_product_text        TYPE TABLE OF ty_product_info,
          lt_all_plants          TYPE TABLE OF i_plant-plant,
          lt_product_plant_pairs TYPE TABLE OF ty_product_info,
          lt_products_to_send    TYPE TABLE OF ty_product_info.
**********************************************************************
*  SELECT _product~product AS product,
*           _productplant~plant AS plant,
*           _productplant~yy1_transferstatus_plt AS transferstatus,
*           _productplant~yy1_transferdate_plt AS transferdate,
*           _product~baseunit AS baseunit,
*           _productdesc~productdescription AS productdesc
*      FROM i_product AS _product
*          JOIN i_productdescription AS _productdesc ON _product~product = _productdesc~product AND
*                                                       _productdesc~language = @sy-langu
*          JOIN i_productplantbasic AS _productplant ON _product~product =  _productplant~product AND
*                                                      _productplant~yy1_transferstatus_plt <> '전송완료'
*       INTO TABLE @DATA(lt_result).
*    IF sy-subrc NE 0.
*      RETURN.
*    ELSE.
*      LOOP AT lt_result INTO DATA(ls_result).
*        productplant = VALUE #( BASE productplant ( product = ls_result-product plant = ls_result-plant ) ).
*        lt_out = VALUE #( BASE lt_out
*                          ( logi_item_info-baseunit = ls_result-baseunit  logi_item_info-product = ls_result-product  logi_item_info-productdescription = ls_result-productdesc
*                          item_info-product = ls_result-product item_info-productdescription = ls_result-productdesc )
*                          ) .
*      ENDLOOP.
*      out_data = CORRESPONDING #(  lt_out   ).
*    Endif.
**********************************************************************
    SELECT a~product,
           a~baseunit,
           b~productdescription,
           c~productgroup,
           c~productgroupname
      FROM i_product AS a
      INNER JOIN i_productdescription AS b
        ON a~product = b~product AND b~language = '3'
      INNER JOIN i_productgrouptext_2 AS c
        ON a~productgroup = c~productgroup AND c~language = '3'
      FOR ALL ENTRIES IN @lt_requested_products
      WHERE a~product = @lt_requested_products-product
      INTO CORRESPONDING FIELDS OF TABLE @lt_product_text.

    " 3. 플랜트 전체 조회
    SELECT plant FROM i_plant INTO TABLE @lt_all_plants.

    " 4. product × plant 조합 생성
    LOOP AT lt_product_text ASSIGNING FIELD-SYMBOL(<ls_product>).
      LOOP AT lt_all_plants ASSIGNING FIELD-SYMBOL(<ls_plant>).
        APPEND VALUE ty_product_info(
          product             = <ls_product>-product
          baseunit            = <ls_product>-baseunit
          productdescription  = <ls_product>-productdescription
          productgroup        = <ls_product>-productgroup
          productgroupname    = <ls_product>-productgroupname
          plant               = <ls_plant>
        ) TO lt_product_plant_pairs.
      ENDLOOP.
    ENDLOOP.

    " 5. product × plant 조합에 대한 전송 상태 조회
    READ ENTITIES OF i_producttp_2 PRIVILEGED
      ENTITY productplant
      FIELDS ( product plant yy1_transferdate_plt yy1_transferstatus_plt )
      WITH VALUE #( FOR ls_pair IN lt_product_plant_pairs (
                       %key-product = ls_pair-product
                       %key-plant   = ls_pair-plant ) )
      RESULT DATA(lt_read_status)
      REPORTED DATA(lt_reported_read)
      FAILED  DATA(lt_failed_read).

    SORT lt_read_status BY product plant.

    " 6. 전송상태 ≠ '전송완료'인 것만 필터링
    LOOP AT lt_product_plant_pairs ASSIGNING FIELD-SYMBOL(<ls_combination>).
      READ TABLE lt_read_status ASSIGNING FIELD-SYMBOL(<ls_matched_status>)
        WITH KEY product = <ls_combination>-product
                 plant   = <ls_combination>-plant.
      IF sy-subrc = 0 AND <ls_matched_status>-yy1_transferstatus_plt <> '전송완료'.
        APPEND VALUE ty_product_info(
          product                = <ls_combination>-product
          plant                  = <ls_combination>-plant
          productdescription     = <ls_combination>-productdescription
          productgroup           = <ls_combination>-productgroup
          productgroupname       = <ls_combination>-productgroupname
          yy1_transferdate_plt   = <ls_matched_status>-yy1_transferdate_plt
          yy1_transferstatus_plt = <ls_matched_status>-yy1_transferstatus_plt
        ) TO lt_products_to_send.
      ENDIF.
    ENDLOOP.

    " 7. EAI로 데이터 전송
    DATA: lv_eai_response_code TYPE c LENGTH 10.

    DATA: payload TYPE zbp_mm_a_send_materials=>ty_payload.

    LOOP AT lt_products_to_send INTO DATA(ls_products_to_send).
      " item_info 추가
      APPEND INITIAL LINE TO payload-item_info ASSIGNING FIELD-SYMBOL(<fs_item_info>).
      APPEND INITIAL LINE TO payload-logi_item_info ASSIGNING FIELD-SYMBOL(<fs_logi_info>).
      <fs_item_info>        = CORRESPONDING #( ls_products_to_send MAPPING item_cd = product  strr_item_nm_ko = productdescription EXCEPT *  ).
      <fs_logi_info>        = CORRESPONDING #( ls_products_to_send
                                                  MAPPING logi_item_cd = product
                                                          strr_item_strg_cd = baseunit
                                                           logi_item_nm_ko = productdescription
                                                           item_gcd = productgroup
                                                           item_gcdnm = productgroupname
                                                             ).
    ENDLOOP.

    lcl_send_to_eai=>send(
                          EXPORTING i_data = payload
                          IMPORTING o_data = lv_eai_response_code
                          ).

    " 8. 성공 시 전송 상태 업데이트
    IF lv_eai_response_code = '200'.
      DATA(lv_today) = cl_abap_context_info=>get_system_date( ).
      MODIFY ENTITIES OF i_producttp_2 PRIVILEGED
        ENTITY productplant
        UPDATE FIELDS ( yy1_transferdate_plt yy1_transferstatus_plt )
        WITH VALUE #( FOR ls_updated IN lt_products_to_send (
                         %key-product              = ls_updated-product
                         %key-plant                = ls_updated-plant
                         yy1_transferstatus_plt    = '전송완료'
                         yy1_transferdate_plt      = lv_today ) )
        MAPPED  DATA(lt_updated_mapping)
        FAILED  DATA(lt_update_failed)
        REPORTED DATA(lt_update_reported).


      DATA(lt_mapped_productplant) = lt_updated_mapping-productplant.




      IF lt_update_failed-productplant IS NOT INITIAL.
         "최종 업데이트 실패시
          result = VALUE #( FOR productplant IN lt_mapped_productplant ( %cid = lv_cid %param-product = productplant-product %param-plant = productplant-plant  %param-TransferStatus = 'E'   ) ).

*        failed-zmm_a_send_materials = VALUE #(  ( product = '1' plant = '1' %fail-cause = if_abap_behv=>cause-unspecific ) ).

*        APPEND VALUE #( %msg          = new_message(
*                                  id       = conv #( 'zmsg' )
*                                  number   = cov #( 1 )
*                                  severity = if_abap_behv_message=>severity-error
*                                  v1       = message-msgv1
*                                  v2       = message-msgv2
*                                  v3       = message-msgv3
*                                  v4       = message-msgv4 )
*                %cid          = cid
*                travelid      = travel_id )
*
      ELSE.
        "최종 업데이트 성공시
          result = VALUE #( FOR productplant IN lt_mapped_productplant ( %cid = lv_cid %param-product = productplant-product %param-plant = productplant-plant  %param-TransferStatus = 'S'   ) ).

*      result = VALUE #( (  %cid = 'test' %param-dummy = '1' %param-product = '1' ) ).

*        failed-zmm_a_send_materials = VALUE #(  ( product = '1' plant = '1' %fail-cause = if_abap_behv=>cause-unspecific ) ).

      ENDIF.

    else.
      result = VALUE #( FOR products_faild IN lt_products_to_send ( %cid = lv_cid %param-product = products_faild-product %param-plant = products_faild-plant  %param-TransferStatus = 'E'   ) ).
    ENDIF.

  ENDMETHOD.

*  METHOD create.
*  ENDMETHOD.
*
*  METHOD update.
*  ENDMETHOD.
*
*  METHOD delete.
*  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD if_rap_query_provider~select.

  ENDMETHOD.

  METHOD get_global_authorizations.

  ENDMETHOD.

ENDCLASS.
