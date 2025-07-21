CLASS zcl_mm_test0002 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_MM_TEST0002 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    " Variables for http_client and client_proxy
*    DATA:
*      lo_http_client  TYPE REF TO if_web_http_client,
*      lo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy,
*      lo_r_request    TYPE REF TO /iwbep/if_cp_request_read_list,
*      lo_r_response   TYPE REF TO /iwbep/if_cp_response_read_lst,
*      lo_c_request    TYPE REF TO /iwbep/if_cp_request_create,
*      lo_c_response   TYPE REF TO /iwbep/if_cp_response_create.
*
*    TRY.
**   data(lo_object) = new cl_swf_flex_ifs_run_hdl( iv_scenario_id ).
**data(lo_instance) = CL_SWF_CPWF_API_FACTORY_A4C=>get_api_instance( ).
**lo_instance->get_user_task_instances( iv_cpwf_handle =  ).
*        DATA : lv_url TYPE string.
*        lv_url =  |https://my425314.s4hana.cloud.sap:443/sap/opu/odata/IWPGW/TASKPROCESSING;mo;v=2/TaskCollection|.
*
*        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( i_destination = cl_http_destination_provider=>create_by_url( lv_url )
*                        ).
*
*        DATA(lo_request) = lo_http_client->get_http_request( ).
*        DATA(lo_response) = lo_http_client->execute( i_method = if_web_http_client=>get ).
*        DATA(lv_response_status) = lo_response->get_status(  ).
*        DATA(lv_response_all) = lo_response->get_header_fields( ).
*        DATA(lo_cookies) = lo_response->get_cookies( ).
*        DATA(lv_response_cdata) = lo_response->get_text( ).
*      CATCH cx_root INTO DATA(err2).
*        "handle exception
*        out->write( err2->get_text( ) ).
*
*    ENDTRY.
*
*    out->write( lv_response_cdata ).

      endmethod.
ENDCLASS.
