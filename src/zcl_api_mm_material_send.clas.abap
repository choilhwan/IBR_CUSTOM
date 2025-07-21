CLASS zcl_api_mm_material_send DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_product,
             product TYPE i_producttp_2-product,
           END OF ty_product,
           tt_product TYPE STANDARD TABLE OF ty_product,
           BEGIN OF ty_productplant,
             product TYPE i_producttp_2-product,
             plant   TYPE i_productplanttp_2-plant,
           END OF ty_productplant,
           tt_productplant TYPE STANDARD TABLE OF ty_productplant,
           BEGIN OF ty_item_info,
             product            TYPE i_producttp_2-product, "자재
             productdescription TYPE i_productdescriptiontp_2-productdescription, "자재내역
           END OF ty_item_info,
           tt_item_info TYPE STANDARD TABLE OF ty_item_info,
           BEGIN OF ty_logi_item_info,
             product            TYPE i_producttp_2-product, "자재
             productdescription TYPE i_productdescriptiontp_2-productdescription, "자재내역
             baseunit           TYPE i_producttp_2-baseunit,
           END OF ty_logi_item_info,
           tt_logi_item_info TYPE STANDARD TABLE OF ty_logi_item_info,
           BEGIN OF ty_cjwms,
             api_id         TYPE c LENGTH 20,
             security_cd    TYPE c LENGTH 30,
             wh_cd          TYPE c LENGTH 20,
             strr_id        TYPE c LENGTH 15,
             item_flg       TYPE c LENGTH 1,
             item_info      TYPE ty_item_info,
             logi_item_info TYPE ty_logi_item_info,
           END OF ty_cjwms,
           tt_cjwms TYPE STANDARD TABLE OF ty_cjwms WITH EMPTY KEY.
    CLASS-DATA : productplant TYPE tt_productplant.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS _get_data IMPORTING it_data TYPE data EXPORTING out_data TYPE data.
    METHODS _mofify_data IMPORTING i_data TYPE data EXPORTING out_data TYPE data.
ENDCLASS.



CLASS ZCL_API_MM_MATERIAL_SEND IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.
    DATA: lv_url             TYPE string VALUE '대한통운API',
          lv_method          TYPE string,
          lv_data            TYPE string,
          lt_requested_data  TYPE tt_product,
          lt_cjwms           TYPE tt_cjwms,
          lv_json            TYPE string,
          lv_response_status TYPE if_web_http_response=>http_status,
          lv_responsetxt     TYPE string,
          lv_response_body   TYPE string.

    " 요청 정보 수집
    lv_data = request->get_text( ).
    lv_method = request->get_method( ).
   if lv_method ne 'POST'.
*    response->set_status(  i_code = '400'  i_reason = 'Client Execution Failed').
*    response->set_text( 'only post allowed' ).
*    return.
 ENDIF.


    " JSON → ABAP 변환
    /ui2/cl_json=>deserialize(
      EXPORTING json = lv_data
                pretty_name = /ui2/cl_json=>pretty_mode-camel_case
      CHANGING  data = lt_requested_data
    ).

    " 비즈니스 로직 수행
    IF lt_requested_data IS NOT INITIAL.
      _get_data(
        EXPORTING it_data = lt_requested_data
        IMPORTING out_data = lt_cjwms
      ).
    ENDIF.

    " 결과 JSON 변환
    lv_json = /ui2/cl_json=>serialize( EXPORTING data = lt_cjwms ).

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
      DATA : lv_modify_result TYPE string.
      _mofify_data(
      EXPORTING
        i_data    = lv_response_body
        IMPORTING
        out_data  = lv_modify_result
      ).
      lv_responsetxt = lv_modify_result.
    ENDIF.

    " 응답 상태 보완
    IF lv_response_status-code IS INITIAL.
      lv_response_status-code = 500.
      lv_response_status-reason = 'Unknown Failure'.
    ENDIF.

    response->set_status(
      i_code   = lv_response_status-code
      i_reason = lv_response_status-reason
    ).
    response->set_text( lv_responsetxt ).
    response->set_header_field(
            i_name  = if_web_http_header=>content_type
            i_value = 'application/json' ) ##NO_TEXT.

*    IF lv_response_status-code EQ 200.
*      _mofify_data( i_data = lv_response_body ).
*    ENDIF.
*
*    " 응답 설정
*    IF lv_response_status-code IS INITIAL.
*      lv_response_status-code =  200.
*      lv_response_status-reason = 'OK'.
*    ENDIF.
*
*    response->set_status(
*      i_code   = lv_response_status-code
*      i_reason = lv_response_status-reason
*    ).
*
*    response->set_header_field(
*                i_name  = if_web_http_header=>content_type
*                i_value = 'application/json' ) ##NO_TEXT.
*
*    response->set_text( lv_responsetxt ).
**********************************************************************
  ENDMETHOD.


  METHOD _get_data.
    DATA: lt_out TYPE tt_cjwms.
    DATA: lt_product TYPE tt_product.
    lt_product = CORRESPONDING #( it_data ).

* READ ENTITIES OF i_producttp_2 FORWARDING PRIVILEGED
*      ENTITY  product
*      BY \_productdescription
*      FIELDS ( product productdescription language )
*      WITH VALUE #(  FOR ls_product IN lt_product ( %key-product = ls_product-product ) )
*      LINK DATA(lt_link)
*      RESULT DATA(lt_plant_result)
*      BY \_ProductPlant
*      FIELDS ( product  plant BaseUnit )
*      WITH VALUE #(  FOR ls_product IN lt_product ( %key-product = ls_product-product ) )
*      LINK DATA(lt_link2)
*      RESULT DATA(lt_desc_result)
*      FAILED DATA(lt_failed)
*      REPORTED DATA(lt_reported).


    SELECT _product~product AS product,
           _productplant~plant AS plant,
           _productplant~yy1_transferstatus_plt AS transferstatus,
           _productplant~yy1_transferdate_plt AS transferdate,
           _product~baseunit AS baseunit,
           _productdesc~productdescription AS productdesc
      FROM i_product AS _product
          JOIN i_productdescription AS _productdesc ON _product~product = _productdesc~product AND
                                                       _productdesc~language = @sy-langu
          JOIN i_productplantbasic AS _productplant ON _product~product =  _productplant~product AND
                                                      _productplant~yy1_transferstatus_plt <> '전송완료'
       INTO TABLE @DATA(lt_result).
    IF sy-subrc NE 0.
      RETURN.
    ELSE.
      LOOP AT lt_result INTO DATA(ls_result).
        productplant = VALUE #( BASE productplant ( product = ls_result-product plant = ls_result-plant ) ).
        lt_out = VALUE #( BASE lt_out
                          ( logi_item_info-baseunit = ls_result-baseunit  logi_item_info-product = ls_result-product  logi_item_info-productdescription = ls_result-productdesc
                          item_info-product = ls_result-product item_info-productdescription = ls_result-productdesc )
                          ) .
      ENDLOOP.
      out_data = CORRESPONDING #(  lt_out   ).
    ENDIF.
*
*    "전송상태로 필터링
*    SELECT product, plant, yy1_transferstatus_plt, yy1_transferdate_plt
*        FROM i_productplantbasic FOR ALL ENTRIES IN @lt_product
*        WHERE product = @lt_product-product AND
*              yy1_transferstatus_plt NE '전송완료'
*        INTO TABLE @DATA(lt_productplant).
*
*    "product desc info get
*    READ ENTITIES OF i_producttp_2 FORWARDING PRIVILEGED
*      ENTITY  product
*      BY \_productdescription
*      FIELDS ( product productdescription language )
*      WITH VALUE #(  FOR ls_productplant IN lt_productplant ( %key-product = ls_productplant-product ) )
*      LINK DATA(lt_link)
*      RESULT DATA(lt_desc_result)
*      FAILED DATA(lt_failed)
*      REPORTED DATA(lt_reported).
*
*
*
*    "desc mapping
*    DATA: lt_item_info TYPE tt_item_info.
*    DATA: lt_logi_item_info TYPE tt_logi_item_info.
*    LOOP AT lt_productplant ASSIGNING FIELD-SYMBOL(<fs_productplant>).
*      READ TABLE lt_desc_result ASSIGNING FIELD-SYMBOL(<fs_desc_result>) WITH KEY %pky-product = <fs_productplant>-product  %pky-language = sy-langu.
*      IF sy-subcs EQ 0.
*        lt_item_info = VALUE #( BASE lt_item_info ( product = <fs_productplant>-product productdescription = <fs_desc_result>-productdescription  ) ).
*        lt_logi_item_info = VALUE #( BASE lt_logi_item_info ( product = <fs_productplant>-product productdescription = <fs_desc_result>-productdescription  baseunit =  ) ).
*      ENDIF.
*
*    ENDLOOP.
*
*
*
**    READ ENTITIES OF i_producttp_2 FORWARDING PRIVILEGED
**       ENTITY  product
**       BY \
**       ALL FIELDS WITH VALUE #(  FOR key IN keys ( %key-product = key-product
**                                                   %key-plant = key-product ) )
**       RESULT DATA(lt_result)
**       FAILED DATA(lt_failed)
**       REPORTED DATA(lt_reported).
*
**    SELECT * FROM
**    i_product AS a
**    JOIN i_product\_productdescription_2 AS b
**    ON a~product = b~product
**    INTO TABLE @DATA(lt_tmp).                  .
*
*
*    DATA(lv_today) = cl_abap_context_info=>get_system_date( ).
*    MODIFY ENTITIES OF i_producttp_2 FORWARDING PRIVILEGED
*        ENTITY productplant
*        UPDATE FIELDS ( yy1_transferstatus_plt )
*        WITH VALUE #( FOR key IN keys ( %cid_ref = key-%cid_ref
*                                        %key-product = key-product
*                                         %key-plant = key-plant
*                                        yy1_transferstatus_plt = '전송완료'
*                                        yy1_transferdate_plt = lv_today  ) )
*        REPORTED DATA(lt_reported2)
*        FAILED DATA(lt_failed2).
*
*    out_data = ''.

  ENDMETHOD.


  METHOD _mofify_data.

    DATA(lv_date) = cl_abap_context_info=>get_system_date( ).
    DATA lt_updated  TYPE tt_productplant.

    " 1. 응답 JSON → lt_updated 변환
    /ui2/cl_json=>deserialize(
      EXPORTING json = i_data
                pretty_name = /ui2/cl_json=>pretty_mode-camel_case
      CHANGING  data = lt_updated
    ).

    IF lt_updated IS INITIAL.
      out_data = |[ERROR] 응답 JSON에서 제품 정보를 추출할 수 없습니다.| .
      RETURN.
    ENDIF.

    " 2. MODIFY ENTITIES
    MODIFY ENTITIES OF i_producttp_2 FORWARDING PRIVILEGED
      ENTITY productplant
      UPDATE FIELDS ( yy1_transferdate_plt yy1_transferstatus_plt )
      WITH VALUE #(
        FOR keygroup IN lt_updated INDEX INTO idx (
          %cid_ref = |update:{ idx }|
          %key-product = keygroup-product
          %key-plant   = keygroup-plant
          yy1_transferdate_plt = lv_date
          yy1_transferstatus_plt = '전송완료'
        )
      )
      MAPPED DATA(mapped)
      FAILED DATA(failed)
      REPORTED DATA(reported).

    " 3. 커밋 처리
    COMMIT ENTITIES BEGIN
      RESPONSE OF i_producttp_2
      FAILED DATA(r_failed)
      REPORTED DATA(r_reported).

    IF r_failed IS INITIAL.
      out_data = |[SUCCESS] { lines( lt_updated ) }건 전송 상태 '전송완료'로 업데이트됨.|.
    ELSE.
      out_data = |[ERROR] 일부 엔티티 커밋 실패: { lines( r_reported-productplant ) }건|.
    ENDIF.

    COMMIT ENTITIES END.

  ENDMETHOD.
ENDCLASS.
