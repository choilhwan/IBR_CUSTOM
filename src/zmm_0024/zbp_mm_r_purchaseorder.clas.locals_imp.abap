CLASS lhc_zmm_r_purchaseorder DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zmm_r_purchaseorder RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zmm_r_purchaseorder.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zmm_r_purchaseorder.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zmm_r_purchaseorder.

    METHODS read FOR READ
      IMPORTING keys FOR READ zmm_r_purchaseorder RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zmm_r_purchaseorder.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR zmm_r_purchaseorder RESULT result.

    METHODS downpayment FOR MODIFY
      IMPORTING keys FOR ACTION zmm_r_purchaseorder~downpayment RESULT result .

ENDCLASS.

CLASS lhc_zmm_r_purchaseorder IMPLEMENTATION.

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

    DATA lr_purchaseorder TYPE RANGE OF y_r_purchaseorder-purchaseorder.
    DATA lt_po_header_update TYPE TABLE FOR UPDATE i_purchaseordertp_2.
    DATA lt_po_item_update TYPE TABLE FOR UPDATE i_purchaseordertp_2\\purchaseorderitem.

    lr_purchaseorder = VALUE #(  FOR row IN keys ( sign = 'I' option = 'EQ' low = row-purchaseorder ) ).

    IF lr_purchaseorder IS NOT INITIAL.
      SELECT FROM y_r_purchaseorder
            FIELDS purchaseorder,
                   purchaseorderdate,
*               downpaymenttype,
*               downpaymentduedate,
*               downpaymentamount,
*               downpaymentpercentageoftotamt,
                   supplier,
                   purchasingorganization,
                   \_purchaseorderitem[ (*) ]-purchaseorderitem,
                   ( \_purchaseorderitem[ (*) ]-netpriceamount * \_purchaseorderitem[ (*) ]-orderquantity  ) AS itemprice,
                   \_supplierpurchasingorg[ (*) ]-yy1_downpaymentpercent_spo,
                   \_supplierpurchasingorg[ (*) ]-yy1_downpaymenttype_spo
            WHERE y_r_purchaseorder~purchaseorder IN @lr_purchaseorder
            ORDER BY y_r_purchaseorder~purchaseorder ASCENDING
            INTO TABLE @DATA(lt_po_aggregated).


      TYPES: BEGIN OF ty_po_sum,
               purchaseorder              TYPE y_r_purchaseorder-purchaseorder,
               purchaseorderdate          TYPE y_r_purchaseorder-purchaseorderdate,
               yy1_downpaymentpercent_spo TYPE i_supplierpurchasingorg-yy1_downpaymentpercent_spo,
               yy1_downpaymenttype_spo    TYPE i_supplierpurchasingorg-yy1_downpaymenttype_spo,
               downpaymentamount          TYPE i_purchaseordertp_2-downpaymentamount,
             END OF ty_po_sum.

      DATA: lt_po_aggregated_sum    TYPE STANDARD TABLE OF ty_po_sum.

      " 그룹핑하여 itemprice 합산
      lt_po_aggregated_sum = VALUE #(
        FOR GROUPS <group> OF ls_po IN lt_po_aggregated
        GROUP BY ( purchaseorder               = ls_po-purchaseorder
                   purchaseorderdate           = ls_po-purchaseorderdate
                   yy1_downpaymentpercent_spo = ls_po-yy1_downpaymentpercent_spo
                   yy1_downpaymenttype_spo    = ls_po-yy1_downpaymenttype_spo )
        (
          purchaseorder               = <group>-purchaseorder
          purchaseorderdate           = <group>-purchaseorderdate
          yy1_downpaymentpercent_spo = <group>-yy1_downpaymentpercent_spo
          yy1_downpaymenttype_spo    = <group>-yy1_downpaymenttype_spo
          downpaymentamount                 = REDUCE i_purchaseordertp_2-downpaymentamount( INIT total = 0
                                           FOR ls_item IN GROUP <group>
                                           NEXT total = total + ls_item-itemprice )
        )
      ).

      " lt_po_aggregated_update 테이블에 매핑
      LOOP AT lt_po_aggregated_sum INTO DATA(ls_sum).
        APPEND VALUE #(
          %control                              = VALUE #(
                                                            downpaymentduedate            = if_abap_behv=>mk-on
                                                            downpaymentpercentageoftotamt = if_abap_behv=>mk-on
                                                            downpaymenttype               = if_abap_behv=>mk-on
                                                            downpaymentamount             = if_abap_behv=>mk-on
                                                   )
          purchaseorder                         = ls_sum-purchaseorder
          downpaymentduedate                    = ls_sum-purchaseorderdate
          downpaymentpercentageoftotamt         = ls_sum-yy1_downpaymentpercent_spo
          downpaymenttype                       = ls_sum-yy1_downpaymenttype_spo
          downpaymentamount                     = ( ls_sum-downpaymentamount * ls_sum-yy1_downpaymentpercent_spo / 100 )
        ) TO lt_po_header_update.
      ENDLOOP.

*    "lt_pi_item_update 테이블에 매핑
      LOOP AT lt_po_aggregated INTO DATA(ls_po_item).
        APPEND VALUE #(
        %control                              = VALUE #(
                                                          downpaymentduedate            = if_abap_behv=>mk-on
                                                          downpaymentpercentageoftotamt = if_abap_behv=>mk-on
                                                          downpaymenttype               = if_abap_behv=>mk-on
                                                          downpaymentamount             = if_abap_behv=>mk-on
                                                   )
          purchaseorder                       = ls_po_item-purchaseorder
          purchaseorderitem                   = ls_po_item-purchaseorderitem
          downpaymentduedate                  = ls_po_item-purchaseorderdate
          downpaymentpercentageoftotamt       = ls_po_item-yy1_downpaymentpercent_spo
          downpaymenttype                     = ls_po_item-yy1_downpaymenttype_spo
          downpaymentamount                   = ( ls_po_item-itemprice * ls_sum-yy1_downpaymentpercent_spo / 100 )
        ) TO lt_po_item_update.
      ENDLOOP.



*MODIFY ENTITIES OF i_salesordertp
*  ENTITY salesorder
*    UPDATE
*        FIELDS ( purchaseorderbycustomer )
*      WITH VALUE #( ( purchaseorderbycustomer          = 'Change sales order'
*                      %key-salesorder                  = '0000004711' ) )
*  FAILED   data(ls_failed)
*  REPORTED data(ls_reported).
*
*READ ENTITIES OF i_salesordertp
*  ENTITY salesorder
*    FROM VALUE #( ( salesorder = '0000004711' ) )
*  RESULT   DATA(lt_so_head)
*  REPORTED ls_reported
*  FAILED   ls_failed.

      DATA: lt_mapped TYPE RESPONSE FOR MAPPED i_purchaseordertp_2.
      DATA: lt_failed TYPE RESPONSE FOR FAILED i_purchaseordertp_2.
      DATA: lt_reported TYPE RESPONSE FOR REPORTED i_purchaseordertp_2.

      MODIFY ENTITIES OF i_purchaseordertp_2 PRIVILEGED
      ENTITY purchaseorder
      UPDATE FROM lt_po_header_update
      ENTITY purchaseorderitem
      UPDATE FROM lt_po_item_update
      MAPPED  lt_mapped
      REPORTED lt_reported
      FAILED lt_failed.

*      IF lt_reported-purchaseorder IS INITIAL
*            AND lt_reported-purchaseorderitem IS INITIAL.
*        READ ENTITIES OF zmm_r_purchaseorder
*        ENTITY zmm_r_purchaseorder
*        FIELDS (
*           purchaseorder
*     downpaymentduedate
*     downpaymentpercentageoftotamt
*     downpaymenttype
*     downpaymentamount
*        ) WITH VALUE #(
*           FOR purchaseorder IN keys ( purchaseorder = purchaseorder-purchaseorder )
*        )
*        RESULT data(lt_result).
*
*        result = value #( for ls_result in result (  ) )
*
*      ENDIF.
    ENDIF.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zmm_r_purchaseorder DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zmm_r_purchaseorder IMPLEMENTATION.

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
