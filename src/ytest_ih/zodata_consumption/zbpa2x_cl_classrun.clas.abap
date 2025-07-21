" Test stuff
CLASS zbpa2x_cl_classrun DEFINITION

  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      BEGIN OF tys_a_business_partner_ty,
        business_partner          TYPE c LENGTH 10,
        business_partner_category TYPE c LENGTH 1,
        first_name                TYPE c LENGTH 40,
        last_name                 TYPE c LENGTH 40,
      END OF tys_a_business_partner_ty.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZBPA2X_CL_CLASSRUN IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA:
      ls_business_partner TYPE tys_a_business_partner_ty,
      lo_http_client      TYPE REF TO if_web_http_client,
      lo_client_proxy     TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request          TYPE REF TO /iwbep/if_cp_request_create,
      lo_response         TYPE REF TO /iwbep/if_cp_response_create.

    TRY.
        " Create http client
        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
                                 comm_scenario  = 'ZBPA2X_CS_BUPA'
                                 service_id     = 'ZBPA2X_OBS_BUPA_REST' ).

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
          EXPORTING
            is_proxy_model_key = VALUE #( repository_id = 'DEFAULT'
            proxy_model_id = 'ZBPA2X_SCM_BUPA'
            proxy_model_version = '0001' )
            io_http_client = lo_http_client
            iv_relative_service_root = ''
"            iv_relative_service_root = '/sap/opu/odata/sap/API_BUSINESS_PARTNER'
            ).

        ASSERT lo_http_client IS BOUND.
        " Navigate to the resource and create a request for the create operation
        lo_request = lo_client_proxy->create_resource_for_entity_set( zbpa2x_scm_bupa=>gcs_entity_set-a_business_partner )->create_request_for_create( ).

        DATA(lv_userid) = cl_abap_context_info=>get_user_technical_name( ).

        SELECT SINGLE *
        FROM I_BusinessUserBasic
            WITH PRIVILEGED ACCESS
        WHERE userid = @lv_userid INTO
        @DATA(ls_businessuser).

        IF sy-subrc <> 0.
          out->write( |Error retrieving business user { lv_userid }| ).
          RETURN.
        ENDIF.

        ls_business_partner = VALUE #(
           business_partner_category = '1'
           first_name = ls_businessuser-firstname
           last_name = ls_businessuser-lastname

         ).

        " Set the business data for the created entity
        lo_request->set_business_data( ls_business_partner ).
        " Execute the request
        lo_response = lo_request->execute( ).
        " Get the after image
        lo_response->get_business_data( IMPORTING es_business_data = ls_business_partner ).
        out->write( |Business partner { ls_business_partner-business_partner } was created| ).

      CATCH cx_root INTO DATA(lx_exception).
        " Handle remote Exception
        " It contains details about the problems of your http(s) connection
        out->write( lx_exception->get_text( ) ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
