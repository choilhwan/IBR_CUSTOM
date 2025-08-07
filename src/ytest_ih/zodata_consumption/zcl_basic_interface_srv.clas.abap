CLASS zcl_basic_interface_srv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES ts_external_system TYPE Z_BASIC_INTERFACE_SRV=>tys_external_system_2.
    TYPES tt_external_system TYPE Z_BASIC_INTERFACE_SRV=>tyt_external_system_2.
    TYPES ts_mall TYPE Z_BASIC_INTERFACE_SRV=>tys_mall_2.
    TYPES tt_mall TYPE Z_BASIC_INTERFACE_SRV=>tyt_mall_2.

    METHODS send_external_system
        IMPORTING
            lt_items       TYPE tt_external_system
        EXPORTING
            ev_text     TYPE string
     .

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BASIC_INTERFACE_SRV IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA business_data Type ts_external_system.
    DATA business_datas TYPE tt_external_system.
    business_data = VALUE #(
          system_id  = '1010'
          seq        = 1
    ).
    APPEND business_data TO business_datas.
    business_data = VALUE #(
          system_id  = '1010'
          seq        = 2
    ).
    APPEND business_data TO business_datas.
    DATA lv_text TYPE string.
    TRY.
        send_external_system(

          EXPORTING
            lt_items   = business_datas
          IMPORTING
            ev_text = lv_text
          ) .

          if business_datas is not INITIAL.
          out->write( business_datas ).
          ENDIF.
          out->write( lv_text ).
      CATCH cx_root INTO DATA(exception).
        out->write( cl_message_helper=>get_latest_t100_exception( exception )->if_message~get_text( ) ).


    ENDTRY.
  ENDMETHOD.


    METHOD send_external_system.
    "Variables Setting

    DATA:
      lo_http_client  TYPE REF TO if_web_http_client,
      lo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_r_resource   TYPE REF TO /iwbep/if_cp_resource_entity,
      lo_r_request    TYPE REF TO /iwbep/if_cp_request_read,
      lo_r_response   TYPE REF TO /iwbep/if_cp_response_read,
      lo_c_request    TYPE REF TO /iwbep/if_cp_request_create,
      lo_c_response   TYPE REF TO /iwbep/if_cp_response_create.
    DATA:
      ls_entity_key TYPE ts_external_system,
      ls_already_exist TYPE ts_external_system,
      lt_update  TYPE tt_external_system,
      lt_insert  TYPE tt_external_system.
    DATA:
      lv_comm_scenario type if_com_management=>ty_cscn_id.

    " 1. Get the destination of remote system; Create http client

    TRY.
        lv_comm_scenario = 'Z_OBS_ODATA_IBR_BTP'.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
                                                    comm_scenario  = lv_comm_scenario
**                                                comm_system_id = '<Comm System ID>'
                                                 service_id     = ''
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
                                                  proxy_model_id      = 'Z_BASIC_INTERFACE_SRV'
                                                  proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/basic'  " = the service endpoint in the service binding in PRV' ).
            ).
      CATCH /iwbep/cx_gateway cx_web_http_client_error INTO DATA(err3).
        ev_text = err3->get_text( ).
        RETURN.
    ENDTRY.
    ASSERT lo_http_client IS BOUND .
    "3. get If Item already Exist
    LOOP AT lt_items INTO DATA(ls_item).
        TRY.
            clear ls_already_exist.
            ls_entity_key = VALUE #(
                  system_id  = ls_item-system_id
                  seq        = ls_item-seq
            ).
            lo_r_resource = lo_client_proxy->create_resource_for_entity_set( 'EXTERNAL_SYSTEM' )->navigate_with_key( ls_entity_key ).

            lo_r_response = lo_r_resource->create_request_for_read( )->execute( ).

            lo_r_response->get_business_data( IMPORTING es_business_data = ls_already_exist ).

            "if ls_already_exist is initial.
            "    APPEND ls_item to lt_update.
            "else.
            "    APPEND ls_item to lt_insert.
            "endif.
            APPEND ls_item to lt_update.
          CATCH /iwbep/cx_cp_remote  INTO DATA(err6).
            "ev_text = err6->get_text( ).
            APPEND ls_item to lt_insert.
            "RETURN.
          CATCH /iwbep/cx_gateway INTO DATA(err7).
            "handle exception
            ev_text = err7->get_text( ).
            RETURN.
        ENDTRY.
    ENDLOOP.



    ENDMETHOD.
ENDCLASS.
