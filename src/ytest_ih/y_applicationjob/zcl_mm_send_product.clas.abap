CLASS zcl_mm_send_product  DEFINITION PUBLIC.

  PUBLIC SECTION .
    CLASS-METHODS send IMPORTING i_data TYPE data EXPORTING o_data TYPE data.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_mm_send_product IMPLEMENTATION.

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
