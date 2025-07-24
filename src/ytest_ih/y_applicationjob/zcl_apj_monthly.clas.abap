CLASS zcl_apj_monthly DEFINITION PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_apj_rt_run.
    INTERFACES if_apj_dt_defaults.

    TYPES:
      BEGIN OF ty_name_range,
        sign   TYPE c LENGTH 1,
        option TYPE c LENGTH 2,
        low    TYPE c LENGTH 50,
        high   TYPE c LENGTH 50,
      END OF ty_name_range.
    TYPES: ty_name_ranges TYPE STANDARD TABLE OF ty_name_range WITH EMPTY KEY.

    "! <p class="shorttext synchronized" lang="en">Numbers available</p>
    DATA numbers_available TYPE abap_bool VALUE abap_true.
    "! <p class="shorttext synchronized" lang="en">Numbers</p>
    DATA numbers TYPE RANGE OF i.
    "! <p class="shorttext synchronized" lang="en">Names available</p>
    DATA names_available TYPE abap_bool VALUE abap_true.
    "! <p class="shorttext synchronized" lang="en">Names</p>
    DATA names TYPE ty_name_ranges.
    "! <p class="shorttext synchronized" lang="en">Some text</p>
    DATA text TYPE c LENGTH 255.
    "! <p class="shorttext synchronized" lang="en">Public attribute which is not used on the selection screen</p>
    DATA another_public_attribute TYPE c LENGTH 10.
ENDCLASS.
CLASS zcl_apj_monthly IMPLEMENTATION.
  METHOD if_apj_rt_run~execute.
    TRY.

        SELECT _product~product,
               _plant~plant,
               _desc~productdescription,
               _grouptext~productgroup,
               _grouptext~productgroupname
                FROM i_product AS _product
                    JOIN i_productdescription AS _desc  ON _product~product =  _desc~product AND _desc~language = '3'
                    JOIN i_productgrouptext_2 AS _grouptext ON _product~productgroup = _grouptext~productgroup AND _grouptext~language = '3'
                    JOIN i_productplantbasic AS _plant ON _product~product = _plant~product
                INTO TABLE @DATA(lt_payload).

*        SELECT * FROM  yttransferlog  FOR ALL ENTRIES IN @lt_payload WHERE product EQ @lt_payload-product INTO data(lt_).

        DATA: lv_id TYPE c LENGTH 4 VALUE '0002'.
        DATA: lt_tab TYPE STANDARD TABLE OF zr_ttest01000.

        MODIFY ENTITIES OF zr_ttest01000
        ENTITY zrttest01000
        CREATE AUTO FILL CID FIELDS ( dummy createdby )
        WITH VALUE #( (  %key-dummy = lv_id createdby = CONV #( sy-uname ) ) )
        MAPPED DATA(mapped)
        FAILED DATA(failed)
        REPORTED DATA(reported).

        DATA(l_log) = cl_bali_log=>create_with_header(
                            header = cl_bali_header_setter=>create( object = 'ZOBJECT'
                                                                    subobject = 'ZSUBOBJECT' ) ).

        IF failed-zrttest01000 IS INITIAL.
          COMMIT ENTITIES BEGIN RESPONSE OF zr_ttest01000 FAILED DATA(comm_failed) REPORTED DATA(comm_reported).
          l_log->add_item( item = cl_bali_free_text_setter=>create( severity = if_bali_constants=>c_severity_information
                                                                 text = |modify failed { sy-uname }  | ) ).
          COMMIT ENTITIES END.
        ELSE.
          READ TABLE reported-zrttest01000 INDEX 1 INTO DATA(ls_mapped).
          DATA(lv_msg) = ls_mapped-%msg->if_message~get_text( ).
          l_log->add_item( item = cl_bali_free_text_setter=>create( severity = if_bali_constants=>c_severity_error
                                                            text = |modify failed { sy-uname } { lv_msg } | ) ).

        ENDIF.

**********************************************************************

*
*        IF numbers_available = abap_true AND '42' IN numbers.
*          l_log->add_item( item = cl_bali_free_text_setter=>create( severity = if_bali_constants=>c_severity_information
*                                                                    text = '42 is in the number ranges' ) ).
*        ENDIF.
*
*        IF names_available = abap_true AND names IS NOT INITIAL.
*          l_log->add_item( item = cl_bali_free_text_setter=>create( severity = if_bali_constants=>c_severity_status
*                                                                    text = 'Some names are available' ) ).
*        ENDIF.

*        l_log->add_item( item = cl_bali_free_text_setter=>create( severity = if_bali_constants=>c_severity_status
*                                                                  text = CONV #( text ) ) ).

        cl_bali_log_db=>get_instance( )->save_log_2nd_db_connection( log = l_log
                                                                     assign_to_current_appl_job = abap_true ).
      CATCH cx_bali_runtime INTO DATA(l_runtime_exception).
        " some error handling
    ENDTRY.
**********************************************************************
  ENDMETHOD.
  METHOD if_apj_dt_defaults~fill_attribute_defaults.

    numbers = VALUE #( ( sign = 'I' option = 'BT' low = '1' high = '10' )
                       ( sign = 'I' option = 'BT' low = '91' high = '100' ) ).
    text = 'Some text'.
  ENDMETHOD.
ENDCLASS.

