CLASS zcl_mm_badi_imp_test01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_mm_pur_s4_po_post .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mm_badi_imp_test01 IMPLEMENTATION.


  METHOD if_mm_pur_s4_po_post~post.
  ENDMETHOD.
ENDCLASS.
