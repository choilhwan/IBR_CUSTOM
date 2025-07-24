CLASS zcl_badi_material_ref01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_ex_material_reference .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_badi_material_ref01 IMPLEMENTATION.


  METHOD if_ex_material_reference~create_material.
*  if i_marc is NOT INITIAL.
*   data(lv_data) = 'TEST'.
*   MOVE-CORRESPONDING i_marc to e_marcu.
*   e_marcu-yy1_transferstatus_plt = lv_data.
*  ENDIF.
  ENDMETHOD.
ENDCLASS.
