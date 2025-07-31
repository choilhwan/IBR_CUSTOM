CLASS lhc_zmm_r_product DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zmm_r_product RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zmm_r_product.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zmm_r_product.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zmm_r_product.

    METHODS read FOR READ
      IMPORTING keys FOR READ zmm_r_product RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zmm_r_product.

    METHODS transfer_cjwms FOR MODIFY
      IMPORTING keys FOR ACTION zmm_r_product~transfer_cjwms RESULT result.
ENDCLASS.

CLASS lhc_zmm_r_product IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD transfer_cjwms.

    zcl_mm_products_to_cjwms=>transfer( EXPORTING i_keys     = keys
                                        IMPORTING e_result   = result
                                                  e_reported = reported
                                                  e_failed   = failed
                                                  e_mapped   = mapped ).

  ENDMETHOD.

ENDCLASS.

CLASS lsc_zmm_r_product DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zmm_r_product IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
