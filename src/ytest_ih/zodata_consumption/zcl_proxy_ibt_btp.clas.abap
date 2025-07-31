CLASS zcl_proxy_IBT_BTP DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES ts_master TYPE z001_fi_model_master=>tys_master_2.
    TYPES tt_master TYPE  z001_fi_model_master=>tyt_master_2 .
    TYPES ts_payment TYPE  z001_fi_model_master=>tys_payment_gateway_2.
    TYPES tt_payment TYPE  z001_fi_model_master=>tyt_payment_gateway_2.

    METHODS get_master
      IMPORTING
        top            TYPE i OPTIONAL
        skip           TYPE i OPTIONAL

      EXPORTING
        et_master_data TYPE tt_master
        ev_text        TYPE string

*
*      RAISING
*        /iwbep/cx_cp_remote
*        /iwbep/cx_gateway
*        cx_web_http_client_error
*        cx_http_dest_provider_error
      .

    INTERFACES if_oo_adt_classrun .
    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_proxy_IBT_BTP IMPLEMENTATION.

  METHOD get_master.

    " Variables for http_client and client_proxy
    DATA:
      lo_http_client  TYPE REF TO if_web_http_client,
      lo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_r_request    TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_r_response   TYPE REF TO /iwbep/if_cp_response_read_lst,
      lo_c_request    TYPE REF TO /iwbep/if_cp_request_create,
      lo_c_response   TYPE REF TO /iwbep/if_cp_response_create.
    DATA:
      ls_in_master  TYPE ts_master,
      lt_in_master  TYPE tt_master,
      ls_out_master TYPE ts_master,
      lt_out_master TYPE tt_master.
    DATA:
      lv_comm_scenario type if_com_management=>ty_cscn_id.

    " 1. Get the destination of remote system; Create http client

    TRY.
        lv_comm_scenario = 'Z_OBS_ODATA_IBR_BTP'.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
                                                    comm_scenario  = lv_comm_scenario
**                                                comm_system_id = '<Comm System ID>'
*                                                 service_id     = ''
    ).
      CATCH cx_http_dest_provider_error INTO DATA(err).
        ev_text = err->get_text( ).
        RETURN.
        "handle exception
    ENDTRY.

    TRY.
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
      CATCH cx_web_http_client_error INTO DATA(err2).
        "handle exception
        ev_text = err2->get_text( ).
        RETURN.
    ENDTRY.

    "2. create client proxy
    TRY.
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v4_remote_proxy(
          EXPORTING
              is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                  proxy_model_id      = 'Z001_FI_MODEL_MASTER'
                                                  proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/basic'  " = the service endpoint in the service binding in PRV' ).
            ).
      CATCH /iwbep/cx_gateway cx_web_http_client_error INTO DATA(err3).
        ev_text = err3->get_text( ).
        RETURN.
    ENDTRY.
    ASSERT lo_http_client IS BOUND .

********************************************************************** Read
*    " 3. Navigate to the resource and create a request for the read operation
    TRY.
        lo_r_request = lo_client_proxy->create_resource_for_entity_set( 'MASTER' )->create_request_for_read( ).
*        lo_r_request->set_top( 50 )->set_skip( 0 ).
        " 4. Execute the request and retrieve the business data
        lo_r_response = lo_r_request->execute( ).
        lo_r_request->check_execution(  ).
        lo_r_response->get_business_data( IMPORTING   et_business_data = et_master_data   ).
      CATCH /iwbep/cx_cp_remote  INTO DATA(err6).
        ev_text = err6->get_text( ).
        RETURN.
      CATCH /iwbep/cx_gateway INTO DATA(err7).
        "handle exception
        ev_text = err7->get_text( ).
        RETURN.
    ENDTRY.
********************************************************************** Create
*    TRY.
*
*DATA lv_timestamp TYPE timestampl.
*
*GET TIME STAMP FIELD lv_timestamp.
*
*
*
** Prepare business data
*        ls_in_master = VALUE #(
*                  brand_id = conv string( lv_timestamp )
*                  brand_name =   conv string( sy-mandt )  ). "080: dev , "100:custom
*
*        " Navigate to the resource and create a request for the create operation
*        lo_c_request = lo_client_proxy->create_resource_for_entity_set( 'MASTER' )->create_request_for_create( ).
*
*        " Set the business data for the created entity
*        lo_c_request->set_business_data( ls_in_master ).
*
*        " Execute the request
*        lo_c_response = lo_c_request->execute( ).
*
*        " Get the after image
*        lo_c_response->get_business_data( IMPORTING es_business_data = ls_out_master ).
*        et_master_data = value #( ( ls_out_master ) ) .
*      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
*        " Handle remote Exception
*        " It contains details about the problems of your http(s) connection
*        ev_text = lx_remote->get_text( ).
*        RETURN.
*
*      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
*        " Handle Exception
*        ev_text = lx_gateway->get_text( ).
*        RETURN.
*      CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
*        " Handle Exception
*        ev_text = lx_web_http_client_error->get_text( ).
*        RETURN.
*    ENDTRY.


********************************************************************** Create Batch
*    DATA:
*      lo_create_request    TYPE REF TO /iwbep/if_cp_request_create,
*      lo_create_response   TYPE REF TO /iwbep/if_cp_response_create,
*      lo_batch_request     TYPE REF TO /iwbep/if_cp_request_batch,
*      lo_changeset_request TYPE REF TO /iwbep/if_cp_request_changeset.
*
*    TRY.
*        lo_batch_request = lo_client_proxy->create_request_for_batch( ).
*        lo_changeset_request = lo_batch_request->create_request_for_changeset( ).
**        DO 2 TIMES.
*          lo_create_request = lo_client_proxy->create_resource_for_entity_set( 'MASTER' )->create_request_for_create( ) .
*          lo_create_request->set_business_data( is_business_data = VALUE ts_master( brand_id = 'raptest'  brand_name = 'rap_test'  ) ).
*          lo_changeset_request->add_request( lo_create_request ).
**          lo_changeset_request->add_request( lo_client_proxy->create_resource_for_entity_set( 'MASTER' )->create_request_for_create( )->set_business_data( is_business_data = VALUE ts_master( brand_id = sy-index  brand_name = 'rap_test'  ) ) ).
**        ENDDO.
*        lo_r_request = lo_client_proxy->create_resource_for_entity_set( 'MASTER' )->create_request_for_read( ).
**        lo_changeset_request->add_request( lo_create_request ).
*        lo_batch_request->add_request( lo_r_request ).
*        lo_batch_request->add_request( lo_changeset_request ).
*
*        lo_batch_request->execute( ).
*        lo_batch_request->check_execution( ).
*        lo_changeset_request->check_execution(  ).
*        lo_r_request->check_execution( ).
*        lo_create_request->check_execution( ).
**
**        lo_r_response = lo_r_request->get_response( ).
**        lo_r_response->get_business_data( IMPORTING et_business_data = lt_out_master ).
**        lo_create_response = lo_create_request->get_response( ).
**        lo_create_response->get_business_data( IMPORTING es_business_data = ls_out_master ).
*      CATCH /iwbep/cx_cp_remote /iwbep/cx_gateway INTO DATA(errr2).
*        "handle exception
*    ENDTRY.




  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    DATA business_data TYPE tt_master.
    DATA lv_text TYPE string.
    TRY.
        get_master(

          IMPORTING
            et_master_data   = business_data
            ev_text = lv_text
          ) .

          if business_data is not INITIAL.
          out->write( business_data ).
          ENDIF.
          out->write( lv_text ).
      CATCH cx_root INTO DATA(exception).
        out->write( cl_message_helper=>get_latest_t100_exception( exception )->if_message~get_text( ) ).


    ENDTRY.
  ENDMETHOD.


  METHOD if_rap_query_provider~select.
  ENDMETHOD.


ENDCLASS.


