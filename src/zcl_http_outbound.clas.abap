CLASS zcl_http_outbound DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES:
      BEGIN OF ty_response,
        status TYPE if_web_http_response=>http_status,
        body   TYPE string,
      END OF ty_response,
      BEGIN OF ty_result,
        success TYPE abap_bool,
        message TYPE string,
      END OF ty_result,
      ty_t_result TYPE STANDARD TABLE OF ty_result.
    CLASS-METHODS:
      send_batch_patch_requests
        IMPORTING
                  iv_comm_scenario    TYPE  if_com_management=>ty_cscn_id
                  iv_outbound_service TYPE if_com_management=>ty_cscn_outb_srv_id OPTIONAL
                  iv_service_root     TYPE string
                  iv_proxy_model_id   TYPE string
                  iv_proxy_version    TYPE string
                  iv_entity_set_name  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name
                  i_payload           TYPE any
                  io_mapper           TYPE REF TO zif_rap_batch_payload_mapper
        EXPORTING
                  et_results          TYPE zcl_http_outbound=>ty_t_result
        RETURNING VALUE(rv_response)  TYPE zcl_http_outbound=>ty_response,
      send_batch_create_requests
        IMPORTING
                  iv_comm_scenario    TYPE  if_com_management=>ty_cscn_id
                  iv_outbound_service TYPE if_com_management=>ty_cscn_outb_srv_id OPTIONAL
                  iv_service_root     TYPE string
                  iv_proxy_model_id   TYPE string
                  iv_proxy_version    TYPE string
                  iv_entity_set_name  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name
                  i_payload           TYPE any
                  io_mapper           TYPE REF TO zif_rap_batch_payload_mapper
        EXPORTING
                  et_results          TYPE   zcl_http_outbound=>ty_t_result
        RETURNING VALUE(rv_response)  TYPE ty_response ,
      send_rest_request
        IMPORTING
                  iv_http_method      TYPE if_web_http_client=>method DEFAULT if_web_http_client=>post
                  iv_comm_scenario    TYPE if_com_management=>ty_cscn_id
                  iv_outbound_service TYPE if_com_management=>ty_cscn_outb_srv_id OPTIONAL
                  iv_url              TYPE string OPTIONAL
                  i_payload           TYPE any OPTIONAL
                  io_mapper           TYPE REF TO zif_rap_batch_payload_mapper OPTIONAL
        EXPORTING
                  et_results          TYPE zcl_http_outbound=>ty_t_result
        RETURNING VALUE(rv_response)  TYPE ty_response.

  PRIVATE SECTION.
    CONSTANTS:
      gc_header_name  TYPE string VALUE 'Content-Type',
      gc_header_value TYPE string VALUE 'application/json; charset=UTF-8'.

    CLASS-METHODS:
      _build_response
        IMPORTING
                  iv_status          TYPE if_web_http_response=>http_status
                  iv_body            TYPE string
        RETURNING VALUE(rv_response) TYPE ty_response,

      _handle_exception
        IMPORTING
                  io_error           TYPE REF TO cx_root
        RETURNING VALUE(rv_response) TYPE ty_response.
ENDCLASS.



CLASS zcl_http_outbound IMPLEMENTATION.


  METHOD send_batch_create_requests.
*    LOOP AT et_results INTO DATA(lt_tmp).
*    ENDLOOP.
*    DATA: lo_destination     TYPE REF TO if_http_destination,
*          lo_http_client     TYPE REF TO if_web_http_client,
*          lo_client_proxy    TYPE REF TO /iwbep/if_cp_client_proxy,
*          lo_batch_request   TYPE REF TO /iwbep/if_cp_request_batch,
*          lo_changeset       TYPE REF TO /iwbep/if_cp_request_changeset,
*          lo_create_request  TYPE REF TO  /iwbep/if_cp_request_create,
**          lo_responses_batch TYPE  REF TO /iwbep/if_cp_response_batch,
*          lt_create_requests LIKE TABLE OF lo_create_request.
**          lt_payloads       TYPE STANDARD TABLE OF any.
*
**      lo_http_client  TYPE REF TO if_web_http_client,
**      lo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy,
**      lo_r_request    TYPE REF TO /iwbep/if_cp_request_read_list,
**      lo_r_response   TYPE REF TO /iwbep/if_cp_response_read_lst,
**      lo_c_response   TYPE REF TO /iwbep/if_cp_response_create.
**      lo_create_request    TYPE REF TO /iwbep/if_cp_request_create,
**      lo_create_response   TYPE REF TO /iwbep/if_cp_response_create,
**      lo_batch_request     TYPE REF TO /iwbep/if_cp_request_batch,
**      lo_changeset_request TYPE REF TO /iwbep/if_cp_request_changeset.
*
*    FIELD-SYMBOLS: <i_payload>  TYPE any,
*                   <fs_payload> TYPE any.
*
*    TRY.
*
*
**        <i_payload> = i_payload.
*
*        " 1. keys → payloads 매핑 (콜백)
*        DATA(lo_payloads) = io_mapper->map_keys_to_payloads( i_payload ).
*        ASSIGN lo_payloads->* TO <fs_payload>.
*
*        " 2. 커뮤니케이션 시나리오 기반 Destination 생성
*        lo_destination = cl_http_destination_provider=>create_by_comm_arrangement(
*                          comm_scenario = iv_comm_scenario service_id = iv_outbound_service  ).
*
*        " 3. HTTP 클라이언트 생성
*        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
*
*        " 4. 클라이언트 프록시 생성
*        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v4_remote_proxy(
*          EXPORTING
*            is_proxy_model_key = VALUE #( repository_id       = 'DEFAULT'
*                                          proxy_model_id      = iv_proxy_model_id
*                                          proxy_model_version = iv_proxy_version )
*            io_http_client           = lo_http_client
*            iv_relative_service_root = iv_service_root ).
*
*        " 5. 배치 리퀘스트 생성
*        lo_batch_request = lo_client_proxy->create_request_for_batch( ).
*        " 6. ChangeSet 생성
*        LOOP AT <fs_payload> ASSIGNING FIELD-SYMBOL(<ls_payload>).
*          CLEAR: lo_changeset, lo_create_request .
*          lo_changeset     = lo_batch_request->create_request_for_changeset( ).
*          lo_create_request = lo_client_proxy->create_resource_for_entity_set( iv_entity_set_name )->create_request_for_create( ).
*          lo_create_request->set_business_data( <ls_payload> ).
*          lo_changeset->add_request( lo_create_request ).
*          APPEND lo_create_request TO lt_create_requests.
*        ENDLOOP.
*
*
*
*        " 6. Payload마다 Create 요청 생성하여 Changeset에 추가
*        LOOP AT <fs_payload> ASSIGNING FIELD-SYMBOL(<ls_payload>).
*
*        ENDLOOP.
*
*        " 7. Changeset을 Batch에 추가하고 실행
*        lo_batch_request->add_request( lo_changeset ).
*        lo_batch_request->execute( ).
*        lo_batch_request->check_execution( ).
*        "Check Execution에서 Error 발생안하면
*        rv_response = _build_response(
*            iv_status = VALUE #( code = 200 reason = 'success')
*            iv_body   = 'success' ).
*        LOOP AT lt_create_requests INTO DATA(ls_request).
*          DATA(lo_response) = ls_request->get_response( ).
*          "각 request 레벨로 response를 핸들링 하고자할 때 사용
*        ENDLOOP.
*
**        lo_create_request->get_response( ).
**        lo_changeset_request->check_execution(  ).
**        lo_r_request->check_execution( ).
**        lo_create_request->check_execution( ).
*
*      CATCH cx_root INTO DATA(lx_root).
*        rv_response = _handle_exception( lx_root ).
*    ENDTRY.

  ENDMETHOD.


  METHOD send_batch_patch_requests.

*    DATA: lo_destination    TYPE REF TO if_http_destination,
*          lo_http_client    TYPE REF TO if_web_http_client,
*          lo_client_proxy   TYPE REF TO /iwbep/if_cp_client_proxy,
*          lo_batch_request  TYPE REF TO /iwbep/if_cp_request_batch,
*          lo_changeset      TYPE REF TO /iwbep/if_cp_request_changeset,
*          lo_patch_request  TYPE REF TO /iwbep/if_cp_request_update_l,
*          lt_patch_requests TYPE STANDARD TABLE OF REF TO /iwbep/if_cp_request_update.
*
*    FIELD-SYMBOLS: <fs_payload> TYPE any,
*                   <ls_payload> TYPE any.
*
*    TRY.
*        " Payload 매핑
*        DATA(lo_payloads) = io_mapper->map_keys_to_payloads( i_payload ).
*        ASSIGN lo_payloads->* TO <fs_payload>.
*
*        " Destination
*        lo_destination = cl_http_destination_provider=>create_by_comm_arrangement(
*                            comm_scenario = iv_comm_scenario
*                            service_id    = iv_outbound_service ).
*
*        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
*
*        " OData V4 프록시 생성
*        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v4_remote_proxy(
*          EXPORTING
*            is_proxy_model_key = VALUE #(
*              repository_id       = 'DEFAULT'
*              proxy_model_id      = iv_proxy_model_id
*              proxy_model_version = iv_proxy_version )
*            io_http_client           = lo_http_client
*            iv_relative_service_root = iv_service_root ).
*
*        " Changeset 생성
*        lo_batch_request = lo_client_proxy->create_request_for_batch( ).
*        lo_changeset     = lo_batch_request->create_request_for_changeset( ).
*
*        " PATCH 요청들 생성
*        LOOP AT <fs_payload> ASSIGNING <ls_payload>.
*          lo_patch_request = lo_client_proxy->create_resource_for_entity_set( iv_entity_set_name )->create_request_for_update( ).
*
*
*          lo_patch_request->set_business_data( <ls_payload> ).
*
*          lo_changeset->add_request( lo_patch_request ).
**        APPEND lo_patch_request TO lt_patch_requests.
*        ENDLOOP.
*
*        " Execute
*        lo_batch_request->add_request( lo_changeset ).
*        lo_batch_request->execute( ).
*        lo_batch_request->check_execution( ).
*
*        " 성공 응답 구성
*        rv_response = _build_response(
*            iv_status = VALUE #( code = 200 reason = 'success' )
*            iv_body   = 'success' ).
*
*        LOOP AT lt_patch_requests INTO DATA(ls_patch).
*          DATA(lo_response) = ls_patch->get_response( ).
*          " 각 PATCH 응답 로깅 등 추가 가능
*        ENDLOOP.
*
*      CATCH cx_root INTO DATA(lx_root).
*        rv_response = _handle_exception( lx_root ).
*    ENDTRY.

  ENDMETHOD.


  METHOD send_rest_request.

    DATA: lo_destination TYPE REF TO if_http_destination,
          lo_http_client TYPE REF TO if_web_http_client,
          lo_request     TYPE REF TO if_web_http_request,
          lo_response    TYPE REF TO if_web_http_response,
          lv_json        TYPE string.

    FIELD-SYMBOLS : <fs_payloads> TYPE ANY TABLE.

    TRY.

        " 1. payload mapping (optional)

*        IF io_mapper IS BOUND AND i_payload IS SUPPLIED.
*          DATA(lo_payloads) = io_mapper->map_keys_to_payloads( i_payload ).
*          ASSIGN lo_payloads->* TO <fs_payloads>.
*          IF sy-subrc = 0.
*            lv_json = /ui2/cl_json=>serialize(
*                        data          = <fs_payloads>
*                        format_output = abap_true ).
*          ENDIF.
*        ENDIF.
        lv_json = /ui2/cl_json=>serialize(
                                data          = i_payload
                                format_output = abap_true ).


        " 2. HTTP call
        lo_destination = cl_http_destination_provider=>create_by_comm_arrangement(
                           comm_scenario = iv_comm_scenario
                           service_id    = iv_outbound_service ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_request     = lo_http_client->get_http_request( ).

        IF lv_json IS NOT INITIAL.
          lo_request->set_text( lv_json ).
          lo_request->set_header_field( i_name = gc_header_name i_value = gc_header_value ).
        ENDIF.

        lo_response = lo_http_client->execute( iv_http_method ).

        rv_response = _build_response(
                        iv_status = lo_response->get_status( )
                        iv_body   = lo_response->get_text( ) ).

        lo_http_client->close( ).

      CATCH cx_root INTO DATA(lx_root).
        rv_response = _handle_exception( lx_root ).
    ENDTRY.

  ENDMETHOD.


  METHOD _build_response.
    rv_response = VALUE #( status = iv_status body = iv_body ).
  ENDMETHOD.


  METHOD _handle_exception.
    rv_response = VALUE #(
      status = VALUE #( code = 500 reason = 'Exception' )
      body   = |HTTP 오류: { io_error->get_text( ) }|
    ).
  ENDMETHOD.
ENDCLASS.
