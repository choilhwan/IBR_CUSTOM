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
CLASS lhc_zmm_r_productplant DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zmm_r_productplant RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zmm_r_productplant.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zmm_r_productplant.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zmm_r_productplant.

    METHODS read FOR READ
      IMPORTING keys FOR READ zmm_r_productplant RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zmm_r_productplant.

    METHODS transfer FOR MODIFY
      IMPORTING keys FOR ACTION zmm_r_productplant~transfer RESULT result.

ENDCLASS.

CLASS lhc_zmm_r_productplant IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD transfer.
    DATA: lv_ok TYPE abap_boolean.
    "제품 + 설명 + 그룹명 조회
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
    DATA: payload TYPE zbp_mm_a_send_materials=>ty_payload.

    READ TABLE keys TRANSPORTING NO FIELDS INDEX 1.
    IF sy-subrc NE 0.
      RETURN. ""key 값이 없는 경우
    ENDIF.

    READ ENTITIES OF i_producttp_2 PRIVILEGED
    ENTITY productplant
    FIELDS ( plant product yy1_transferstatus_plt )
    WITH VALUE #( FOR key IN keys ( %key-plant = key-plant
                                    %key-product = key-product
                                     ) )
    RESULT DATA(read_result)
    FAILED DATA(read_failed)
    REPORTED DATA(read_reported).

    IF read_failed IS NOT INITIAL.
      RETURN. ""요청한 키값에 대한 데이터가 없는 경우
    ELSE.
      READ TABLE read_result TRANSPORTING NO FIELDS WHERE yy1_transferstatus_plt  = '전송완료'.
      IF sy-subrc  EQ 0.
        RETURN. ""이미 전송완료된 필드가 들어있는경우
      ENDIF.
    ENDIF.

    IF lv_ok EQ 'X'.

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
      FOR ALL ENTRIES IN @read_result
      WHERE a~product = @read_result-product
      INTO CORRESPONDING FIELDS OF TABLE @lt_product_text.


      LOOP AT read_result INTO DATA(ls_read_result).
        APPEND INITIAL LINE TO payload-item_info ASSIGNING FIELD-SYMBOL(<fs_item_info>).
        APPEND INITIAL LINE TO payload-logi_item_info ASSIGNING FIELD-SYMBOL(<fs_logi_item_info>).

        READ TABLE lt_product_text ASSIGNING FIELD-SYMBOL(<fs_product_text>) WHERE product = ls_read_result-product.
        IF sy-subrc EQ 0.
          <fs_item_info>-item_cd = ls_read_result-product.
          <fs_item_info>-strr_item_nm_ko = <fs_product_text>-productdescription.
          <fs_logi_item_info>-strr_item_strg_cd = <fs_product_text>-baseunit.
          <fs_logi_item_info>-logi_item_cd = <fs_product_text>-product.
          <fs_logi_item_info>-logi_item_nm_ko = <fs_product_text>-productdescription.
          <fs_logi_item_info>-item_gcd = <fs_product_text>-productgroup.
          <fs_logi_item_info>-item_gcdnm = <fs_product_text>-productgroupname.
        ENDIF.
      ENDLOOP.

      DATA: lv_eai_response_code TYPE c LENGTH 10.

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
*
        ELSE.
          "최종 업데이트 성공시


*      result = VALUE #( (  %cid = 'test' %param-dummy = '1' %param-product = '1' ) ).

*        failed-zmm_a_send_materials = VALUE #(  ( product = '1' plant = '1' %fail-cause = if_abap_behv=>cause-unspecific ) ).

        ENDIF.

    ENDIF.

ENDif.

  ENDMETHOD.

ENDCLASS.

CLASS lsc_zmm_r_productplant DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zmm_r_productplant IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
*      DATA:
*      lv_number            TYPE banfn  , "
*      lt_return            TYPE STANDARD TABLE OF bapireturn, "
*      lv_rel_status_new    TYPE frgzu, "
*      lv_rel_code          TYPE c length 2, "
*      lv_rel_indicator_new TYPE frgkz, "
*      lv_no_commit_work    TYPE bapiflag-bapiflag. "   SPACE
*   CALL FUNCTION 'BAPI_REQUISITION_RELEASE_GEN'  "Release Entire Purchase Requisition
*      EXPORTING
*        number            = lv_number
*        rel_code          = lv_rel_code
*        no_commit_work    = lv_no_commit_work
*      IMPORTING
*        rel_status_new    = lv_rel_status_new
*        rel_indicator_new = lv_rel_indicator_new
*      TABLES
*        return            = lt_return
*      . " BAPI_REQUISITION_RELEASE_GEN
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
