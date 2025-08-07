CLASS zcl_apl_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_APL_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TRY.
        " Create a new application log
        DATA(l_log) = cl_bali_log=>create( ).

        " Add a header to the log
        l_log->set_header( header = cl_bali_header_setter=>create( object = 'ZOBJECT3'
                                                                   subobject = 'ZSUBOBJECT'
                                                                   external_id = 'External ID' ) ).

        " Add a message as item to the log
        DATA(l_message) = cl_bali_message_setter=>create( severity = if_bali_constants=>c_severity_error
                                                          id = 'PO'
                                                          number = '000' ).
        l_log->add_item( item = l_message ).

*        " Add a second message, this time from system fields SY-MSGID, ...
*        MESSAGE ID 'ZTEST' TYPE 'S' NUMBER '058' INTO DATA(l_text).

        l_log->add_item( item = cl_bali_message_setter=>create_from_sy( ) ).

        " Add a free text to the log

        DATA(l_free_text) = cl_bali_free_text_setter=>create( severity = if_bali_constants=>c_severity_error
                                                              text = 'Some Error Text' ).

        l_log->add_item( item = l_free_text ).

        " Add an exception to the log
        DATA: i TYPE i.
        TRY.
            i = 1 / 0.
          CATCH cx_sy_zerodivide INTO DATA(l_ref).
        ENDTRY.

        DATA(l_exception) = cl_bali_exception_setter=>create( severity = if_bali_constants=>c_severity_error
                                                              exception = l_ref ).
        l_log->add_item( item = l_exception ).

        " Save the log into the database
        cl_bali_log_db=>get_instance( )->save_log( log = l_log ).

      CATCH cx_bali_runtime INTO DATA(l_runtime_exception).
        out->write( l_runtime_exception->get_text(  ) ).
    ENDTRY.

*    TRY.
*        DATA(l_log) = cl_bali_log=>create_with_header(
*                        header = cl_bali_header_setter=>create( object = 'ZOBJECT'
*                                                                subobject = 'ZSUBOBJECT'
*                                                                external_id = 'External ID2' ) ).
*      CATCH cx_bali_runtime INTO DATA(l_exception).
*        out->write( l_exception->get_text(  ) ).
*    ENDTRY.
...
  ENDMETHOD.
ENDCLASS.
