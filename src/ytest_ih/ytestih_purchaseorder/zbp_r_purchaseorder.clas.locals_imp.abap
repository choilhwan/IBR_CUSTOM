CLASS lhc_y_r_purchaseorder DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR y_r_purchaseorder RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE y_r_purchaseorder.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE y_r_purchaseorder.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE y_r_purchaseorder.

    METHODS read FOR READ
      IMPORTING keys FOR READ y_r_purchaseorder RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK y_r_purchaseorder.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR y_r_purchaseorder RESULT result.

    METHODS downpayment FOR MODIFY
      IMPORTING keys FOR ACTION y_r_purchaseorder~downpayment.

ENDCLASS.

CLASS lhc_y_r_purchaseorder IMPLEMENTATION.

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

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD downpayment.




  ENDMETHOD.

ENDCLASS.

CLASS lsc_y_r_purchaseorder DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_y_r_purchaseorder IMPLEMENTATION.

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
