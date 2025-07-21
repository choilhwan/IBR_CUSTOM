CLASS z_test_run001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS Z_TEST_RUN001 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lo_http_client TYPE REF TO if_web_http_client.
*    DATA: lv_url TYPE string VALUE 'https://ibr-erp-dev-scm-basic-interface-srv.cfapps.ap12.hana.ondemand.com/basic/Master'.
    DATA: lv_url TYPE string VALUE 'https://ibr-erp-dev-scm-basic-interface-srv.cfapps.ap12.hana.ondemand.com/basic/ssMaster'.
    TRY.

        lo_http_client = cl_web_http_client_manager=>create_by_http_destination(
                        i_destination = cl_http_destination_provider=>create_by_url( lv_url ) ).

       data(lo_response) =   lo_http_client->execute( i_method =  if_web_http_client=>get ).
       lo_response->get_status( ).
      CATCH cx_root INTO DATA(cx).

        return.
    ENDTRY.
     out->write( lo_response->get_status( ) ).
  ENDMETHOD.
ENDCLASS.
