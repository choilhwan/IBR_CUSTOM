CLASS ycl_test_ih04 DEFINITION PUBLIC
  FINAL
  CREATE PUBLIC.
  PUBLIC SECTION.
    METHODS: create_purchase_requisition
      IMPORTING iv_material         TYPE string
                iv_quantity         TYPE i
      RETURNING VALUE(rv_pr_number) TYPE string.
ENDCLASS.



CLASS YCL_TEST_IH04 IMPLEMENTATION.


  METHOD create_purchase_requisition.
    DATA:
      lv_number            TYPE banfn  , "
      lt_return            TYPE STANDARD TABLE OF bapireturn, "
      lv_rel_status_new    TYPE frgzu, "
      lv_rel_code          TYPE c length 2, "
      lv_rel_indicator_new TYPE frgkz, "
      lv_no_commit_work    TYPE bapiflag-bapiflag. "   SPACE

*    CALL FUNCTION 'BAPI_REQUISITION_RELEASE_GEN'  "Release Entire Purchase Requisition
*      EXPORTING
*        number            = lv_number
*        rel_code          = lv_rel_code
*        no_commit_work    = lv_no_commit_work
*      IMPORTING
*        rel_status_new    = lv_rel_status_new
*        rel_indicator_new = lv_rel_indicator_new
*      TABLES
*        return            = lt_return
*      . " BAPI_REQUISITION_RELEASE_GEN

  ENDMETHOD.
ENDCLASS.
