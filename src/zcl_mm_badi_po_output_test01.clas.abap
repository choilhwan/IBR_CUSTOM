CLASS zcl_mm_badi_po_output_test01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_mmpur_po_output_item_ext .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mm_badi_po_output_test01 IMPLEMENTATION.


  METHOD if_mmpur_po_output_item_ext~enrich_po_output.
  ENDMETHOD.
ENDCLASS.
