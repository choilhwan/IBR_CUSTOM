CLASS z06_check_purch_req DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_mm_pur_s4_pr_check .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS Z06_CHECK_PURCH_REQ IMPLEMENTATION.


  METHOD if_mm_pur_s4_pr_check~check.
  IF sy-uname = 'CB9980000020' or  ( cl_abap_context_info=>get_user_technical_name( ) ) = 'CB9980000020'.
DATA ls_message TYPE mmpur_s_messages.
READ TABLE  purchaserequisitionitem_table  INTO DATA(ls_pur_req_itm) INDEX 1    .

  IF ls_pur_req_itm-orderedquantity > 10.
    ls_message-messageid = 'DUMMY'.
    ls_message-messagetype = 'E'.
    ls_message-messagenumber = '001'.
    ls_message-messagevariable1 = ' Quantity limit 10'.           "Place holder
    APPEND ls_message TO messages.
  ENDIF.

  IF ls_pur_req_itm-deliverydate - ( cl_abap_context_info=>get_system_date( ) ) > 180.
    ls_message-messageid = 'DUMMY'.
    ls_message-messagetype = 'E'.
    ls_message-messagenumber = '001'.
    ls_message-messagevariable1 = 'Delivery date limit 180 days '.           "Place holder
    APPEND ls_message TO messages.
  ENDIF.
ENDIF.

*
*    DATA(lv_tech_name) = cl_abap_context_info=>get_user_formatted_name( ).
*    DATA ls_message TYPE mmpur_s_messages.
*
*    TRY.
*
*        IF lv_tech_name = '###Your Name###Max Mustermann###'.
*          READ TABLE  purchaserequisitionitem_table  INTO DATA(ls_pur_req_itm) INDEX 1    .
*
*          IF ls_pur_req_itm-orderedquantity > 10.
*            ls_message-messageid = 'DUMMY'.
*            ls_message-messagetype = 'E'.
*            ls_message-messagenumber = '001'.
*            ls_message-messagevariable1 = ' Quantity limit 10'.           "Place holder
*            APPEND ls_message TO messages.
*          ENDIF.
*
*          IF ls_pur_req_itm-deliverydate - ( cl_abap_context_info=>get_system_date( ) ) > 180.
*            ls_message-messageid = 'DUMMY'.
*            ls_message-messagetype = 'E'.
*            ls_message-messagenumber = '001'.
*            ls_message-messagevariable1 = 'Delivery date limit 180 days '.           "Place holder
*            APPEND ls_message TO messages.
*          ENDIF.
*
*        ENDIF.
*
*    ENDTRY.

  ENDMETHOD.
ENDCLASS.
