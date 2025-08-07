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



CLASS ZCL_BADI_MATERIAL_REF01 IMPLEMENTATION.


  METHOD if_ex_material_reference~create_material.
  SELECT  single 'items' as items   from  i_product  WITH PRIVILEGED ACCESS  into  @data(lv_items).
if sy-uname = 'CB9980000020'.
constants: c_reftyp type c value 'C'.

  loop at it_material_tables into data(l_ptab).

    case l_ptab-tbnam.

      when 'MARC'.
*      select from i_product FIELDS * into table @DATA(lt_tmp).
       read table ct_mat_reftab into data(l_ref)
                                   with key rftyp = c_reftyp
                                            tbnam = 'MARC'
                                            statm = 'K'
                                   binary search.
          if sy-subrc ne 0.
            l_ref-rftyp = c_reftyp.
            l_ref-tbnam = 'MARC'.
            l_ref-statm = 'K'.
            insert l_ref into ct_mat_reftab index sy-tabix.
*            move-corresponding i_marc to e_marcu.
*            e_marcu-yy1_transferstatus_plt = 'testhi'.
          endif.


    endcase.

  endloop.
  ENDIF.
  ENDMETHOD.
ENDCLASS.
