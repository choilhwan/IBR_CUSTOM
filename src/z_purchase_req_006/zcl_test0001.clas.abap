CLASS zcl_test0001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TEST0001 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    ""Create the $batch request at the client proxy instance
    DATA: lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_batch_request TYPE REF TO /iwbep/if_cp_request_batch.

    TRY.
        lo_batch_request = lo_client_proxy->create_request_for_batch( ).
      CATCH /iwbep/cx_gateway.
        "handle exception
    ENDTRY.

    ""Create the changeset request using the $batch request instance
    DATA: lo_changeset_request TYPE REF TO /iwbep/if_cp_request_changeset.

    TRY.
        lo_changeset_request = lo_batch_request->create_request_for_changeset( ).
      CATCH /iwbep/cx_gateway.
        "handle exception
    ENDTRY.

    ""Add the CREATE request to the changeset request
    DATA: lo_create_request    TYPE REF TO /iwbep/if_cp_request_create.

    READ ENTITIES OF I_JournalEntryTP
    ENTITY JournalEntry
    ALL FIELDS WITH VALUE #( ( CompanyCode = '4310' FiscalYear = '2024' ) )
    RESULT DATA(result)
    FAILED DATA(failed)
    REPORTED DATA(reported).

    if failed is INITIAL.
    out->write( data = reported-journalentry ).
    return.
    ENDIF.

    data(lt_journalEntry) = result.
    data lo_tmp type ref to /iwbep/if_cp_data_desc_node.
    TRY.
*    select * from i_salesdocument into table @data(lt_Tab).
        lo_create_request->set_deep_business_data(  is_business_data = lt_journalEntry io_data_description = lo_tmp  ).
        lo_changeset_request->add_request( lo_create_request ).
      CATCH /iwbep/cx_gateway.
        "handle exception
    ENDTRY.

    "Add both the READ and the change_set request into the $batch request. Run the $batch request
    DATA: lo_read_request      TYPE REF TO /iwbep/if_cp_request_read_list.

    TRY.
        lo_batch_request->add_request( lo_read_request ).
      CATCH /iwbep/cx_gateway.
        "handle exception
    ENDTRY.
    TRY.
        lo_batch_request->add_request( lo_changeset_request ).
      CATCH /iwbep/cx_gateway.
        "handle exception
    ENDTRY.
    TRY.
        lo_batch_request->execute( ).
      CATCH /iwbep/cx_cp_remote /iwbep/cx_gateway.
        "handle exception
    ENDTRY.

    ""Check that the four requests ran successfully. (optional)
    TRY.
        lo_batch_request->check_execution( ).
      CATCH /iwbep/cx_cp_remote /iwbep/cx_gateway.
        "handle exception
    ENDTRY.
    TRY.
        lo_changeset_request->check_execution( ).
      CATCH /iwbep/cx_cp_remote /iwbep/cx_gateway.
        "handle exception
    ENDTRY.
    TRY.
        lo_read_request->check_execution( ).
      CATCH /iwbep/cx_cp_remote /iwbep/cx_gateway.
        "handle exception
    ENDTRY.
    TRY.
        lo_create_request->check_execution( ).
      CATCH /iwbep/cx_cp_remote /iwbep/cx_gateway.
        "handle exception
    ENDTRY.

    ""Get the READ response instance using the READ request instance and use it to fetch the corresponding business data
    DATA: lo_read_response TYPE REF TO /iwbep/if_cp_response_read_lst.
*    FIELD-SYMBOLS : <fs_employee> TYPE ref to data.
    DATA lt_employee              TYPE STANDARD TABLE OF zc_onlineshop_006.
    TRY.
        lo_read_response = lo_read_request->get_response( ).
      CATCH /iwbep/cx_cp_remote /iwbep/cx_gateway.
        "handle exception
    ENDTRY.
    TRY.
        lo_read_response->get_business_data( IMPORTING et_business_data = lt_employee ).
      CATCH /iwbep/cx_gateway.
        "handle exception
    ENDTRY.

    ""Get the CREATE response instance using the CREATE request instance and use it to fetch the corresponding business data
    DATA: lo_create_response TYPE REF TO /iwbep/if_cp_response_create.
*    FIELD-SYMBOLS: <fs_team> type ref to data.
    DATA ls_team  TYPE zc_onlineshop_006.


    TRY.
        lo_create_response = lo_create_request->get_response( ).
      CATCH /iwbep/cx_cp_remote /iwbep/cx_gateway.
        "handle exception
    ENDTRY.
    TRY.
        lo_create_response->get_business_data( IMPORTING es_business_data = ls_team ).
      CATCH /iwbep/cx_gateway.
        "handle exception
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
