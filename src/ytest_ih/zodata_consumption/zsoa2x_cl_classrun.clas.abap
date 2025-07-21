CLASS zsoa2x_cl_classrun DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZSOA2X_CL_CLASSRUN IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA:
      ls_business_data   TYPE zsoa2x_scm_salesorder_v4=>tys_sales_order_type,
      lt_business_data   TYPE zsoa2x_scm_salesorder_v4=>tyt_sales_order_type,
      lo_http_client     TYPE REF TO if_web_http_client,
      lo_client_proxy    TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request         TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_response        TYPE REF TO /iwbep/if_cp_response_read_lst,
      lo_request_create  TYPE REF TO /iwbep/if_cp_request_create,
      lo_response_create TYPE REF TO /iwbep/if_cp_response_create.


    TRY.
        " Create http client
        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
                                                     comm_scenario  = 'ZBPA2X_CS_BUPA'
                                                     comm_system_id = 'ZBPA2X_COM_SYS_S4H'
                                                     service_id     = 'ZSOA2X_SALESORDER_REST' )
                                                     .
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v4_remote_proxy(
          EXPORTING
             is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                 proxy_model_id      = 'ZSOA2X_SCM_SALESORDER_V4'
                                                 proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '' ).

        ASSERT lo_http_client IS BOUND.



        " Navigate to the resource and create a request for the create operation
        "read
*        lo_request = lo_client_proxy->create_resource_for_entity_set( 'A_SALES_ORDER' )->create_request_for_read( ).
*        lo_response = lo_request->execute( ).
*        lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).
        "crate
        lo_request_create = lo_client_proxy->create_resource_for_entity_set( 'SALES_ORDER' )->create_request_for_create( ).
        lo_request_create->set_business_data(
        is_business_data = VALUE  zsoa2x_scm_salesorder_v4=>tys_sales_order_type(
                                                           sales_order_type_2 = 'OR' sales_organization = '4310' distribution_channel = '10'
                                                            organization_division = '00' sold_to_party = '43414310' accounting_doc_external_re = 'test'
                                                            ) ) .
        lo_response_create = lo_request_create->execute( ).
        lo_response_create->get_business_data( IMPORTING es_business_data = ls_business_data ).


        " Get the after image


      CATCH cx_root INTO DATA(lx_root).
        " Handle remote Exception
        IF lx_root IS NOT INITIAL.
          out->write( lx_root->get_text(  ) ).
        ENDIF.


    ENDTRY.
    out->write( lt_business_data ).
  ENDMETHOD.
ENDCLASS.
