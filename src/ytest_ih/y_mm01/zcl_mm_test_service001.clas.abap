class ZCL_MM_TEST_SERVICE001 definition
  public
  create public .

public section.

  interfaces IF_HTTP_SERVICE_EXTENSION .

protected section.
private section.
ENDCLASS.



CLASS ZCL_MM_TEST_SERVICE001 IMPLEMENTATION.


  method IF_HTTP_SERVICE_EXTENSION~HANDLE_REQUEST.

    DATA: lv_body TYPE string.
   data(cookies) = request->get_cookies( ).

*    DATA: lt_product_data TYPE STANDARD TABLE OF zproduct_api_str.

*    " Body JSON 가져오기
*    cl_http_utility=>if_http_utility~get_request_body(
*      EXPORTING request = server
*      IMPORTING data = lv_body ).
*
*    " JSON 파싱
*    /ui2/cl_json=>deserialize(
*      EXPORTING json = lv_body
*      CHANGING data = lt_product_data ).
*
*    " 데이터 처리
*    LOOP AT lt_product_data INTO DATA(ls_product).
*      " 작업 수행
*    ENDLOOP.
*
*    server->response->set_cdata( | "{"message":"처리 완료}" | ).
*    server->response->set_header_field( name = 'Content-Type' value = 'application/json' ).
*****************************************************************************************************************************************************

    DATA:
      lo_http_client  TYPE REF TO if_web_http_client,
      lo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_r_request    TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_r_response   TYPE REF TO /iwbep/if_cp_response_read_lst,
      lo_c_request    TYPE REF TO /iwbep/if_cp_request_create,
      lo_c_response   TYPE REF TO /iwbep/if_cp_response_create.

    TRY.
*   data(lo_object) = new cl_swf_flex_ifs_run_hdl( iv_scenario_id ).
*data(lo_instance) = CL_SWF_CPWF_API_FACTORY_A4C=>get_api_instance( ).
*lo_instance->get_user_task_instances( iv_cpwf_handle =  ).
        DATA : lv_url TYPE string.
        lv_url =  |https://my425314.s4hana.cloud.sap:443/sap/opu/odata/IWPGW/TASKPROCESSING;mo;v=2/TaskCollection|.

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( i_destination = cl_http_destination_provider=>create_by_url( lv_url )
                        ).

        DATA(lo_request) = lo_http_client->get_http_request( ).
        lo_request->set_authorization_basic( i_username = 'ZUSER_ITTEST01'
                                             i_password = 'GDjjGYgNCzUmjbhWHRtJ9USRyPbH@VrsUyFmmiMx' ).
        lo_http_client->set_csrf_token( ).
        DATA(lo_response) = lo_http_client->execute( i_method = if_web_http_client=>get ).
        DATA(lv_response_status) = lo_response->get_status(  ).
        DATA(lv_response_all) = lo_response->get_header_fields( ).
        DATA(lv_response_cdata) = lo_response->get_text( ).
      CATCH cx_root INTO DATA(err2).
        "handle exception
*        out->write( err2->get_text( ) ).

    ENDTRY.

*     out->write( lv_response_cdata ).


*    response->set_status( 0 ).
*    response->set_text( 'success' ).
  endmethod.
ENDCLASS.
