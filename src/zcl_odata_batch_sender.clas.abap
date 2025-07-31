CLASS zcl_odata_batch_sender DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      BEGIN OF ty_result,
        success TYPE abap_bool,
        message TYPE string,
      END OF ty_result,
      ty_t_result TYPE STANDARD TABLE OF ty_result.
    CLASS-METHODS send_batch_create_requests
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
        et_results          TYPE   zcl_odata_batch_sender=>ty_t_result.

ENDCLASS.

CLASS zcl_odata_batch_sender IMPLEMENTATION.

  METHOD send_batch_create_requests.
    LOOP AT et_results INTO DATA(lt_tmp).
    ENDLOOP.
    DATA: lo_destination     TYPE REF TO if_http_destination,
          lo_http_client     TYPE REF TO if_web_http_client,
          lo_client_proxy    TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_batch_request   TYPE REF TO /iwbep/if_cp_request_batch,
          lo_changeset       TYPE REF TO /iwbep/if_cp_request_changeset,
          lo_create_request  TYPE REF TO  /iwbep/if_cp_request_create,
*          lo_responses_batch TYPE  REF TO /iwbep/if_cp_response_batch,
          lt_requests        LIKE TABLE OF lo_create_request.
*          lt_payloads       TYPE STANDARD TABLE OF any.

*      lo_http_client  TYPE REF TO if_web_http_client,
*      lo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy,
*      lo_r_request    TYPE REF TO /iwbep/if_cp_request_read_list,
*      lo_r_response   TYPE REF TO /iwbep/if_cp_response_read_lst,
*      lo_c_request    TYPE REF TO /iwbep/if_cp_request_create,
*      lo_c_response   TYPE REF TO /iwbep/if_cp_response_create.
*      lo_create_request    TYPE REF TO /iwbep/if_cp_request_create,
*      lo_create_response   TYPE REF TO /iwbep/if_cp_response_create,
*      lo_batch_request     TYPE REF TO /iwbep/if_cp_request_batch,
*      lo_changeset_request TYPE REF TO /iwbep/if_cp_request_changeset.

    FIELD-SYMBOLS: <i_payload>  TYPE any,
                   <fs_payload> TYPE any .

    TRY.

*        <i_payload> = i_payload.

        " 1. keys → payloads 매핑 (콜백)
        DATA(lo_payloads) = io_mapper->map_keys_to_payloads( i_payload ).
        ASSign lo_payloads->* to <fs_payload>.

        " 2. 커뮤니케이션 시나리오 기반 Destination 생성
        lo_destination = cl_http_destination_provider=>create_by_comm_arrangement(
                          comm_scenario = iv_comm_scenario service_id = iv_outbound_service  ).

        " 3. HTTP 클라이언트 생성
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

        " 4. 클라이언트 프록시 생성
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v4_remote_proxy(
          EXPORTING
            is_proxy_model_key = VALUE #( repository_id       = 'DEFAULT'
                                          proxy_model_id      = iv_proxy_model_id
                                          proxy_model_version = iv_proxy_version )
            io_http_client           = lo_http_client
            iv_relative_service_root = iv_service_root ).

        " 5. 배치 리퀘스트 + Changeset 생성
        lo_batch_request = lo_client_proxy->create_request_for_batch( ).
        lo_changeset     = lo_batch_request->create_request_for_changeset( ).

        " 6. Payload마다 Create 요청 생성하여 Changeset에 추가
        LOOP AT <fs_payload> ASSIGNING FIELD-SYMBOL(<ls_payload>).
          lo_create_request = lo_client_proxy->create_resource_for_entity_set( iv_entity_set_name )->create_request_for_create( ).
          lo_create_request->set_business_data( <ls_payload> ).
          lo_changeset->add_request( lo_create_request ).
          APPEND lo_create_request to lt_requests.
        ENDLOOP.

        " 7. Changeset을 Batch에 추가하고 실행
        lo_batch_request->add_request( lo_changeset ).
        lo_batch_request->execute( ).
        lo_batch_request->check_execution( ).
        lo_create_request->get_response( ).
*        lo_changeset_request->check_execution(  ).
*        lo_r_request->check_execution( ).
*        lo_create_request->check_execution( ).

        " 8. 응답 파싱 및 결과 반환
*        DATA(lt_responses) = lo_batch_response->get_responses( ).
*        LOOP AT lt_responses INTO DATA(lo_resp).
*          APPEND VALUE ty_result(
*            success = lo_resp->is_successful( )
*            message = CONV string( lo_resp->get_message( ) )
*          ) TO et_results.
*        ENDLOOP.

      CATCH cx_root INTO DATA(lx).
        APPEND VALUE ty_result(
          success = abap_false
          message = lx->get_text( )
        ) TO et_results.
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
