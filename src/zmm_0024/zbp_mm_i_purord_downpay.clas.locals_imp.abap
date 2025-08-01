CLASS lhc_zmm_i_purord_downpay DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR zmm_i_purord_downpay RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zmm_i_purord_downpay RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zmm_i_purord_downpay.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zmm_i_purord_downpay.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zmm_i_purord_downpay.

    METHODS read FOR READ
      IMPORTING keys FOR READ zmm_i_purord_downpay RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zmm_i_purord_downpay.

    METHODS updatedownpayment FOR MODIFY
      IMPORTING keys FOR ACTION zmm_i_purord_downpay~updatedownpayment RESULT result.

ENDCLASS.

CLASS lhc_zmm_i_purord_downpay IMPLEMENTATION.

  METHOD get_instance_features.
    IF requested_features-%action-updatedownpayment = if_abap_behv=>mk-on .

      SELECT FROM zmm_i_purord_downpay
            FIELDS purchaseorder, downpaymentupdated
            FOR ALL ENTRIES IN @keys
            WHERE purchaseorder = @keys-purchaseorder
            INTO TABLE @DATA(lt_result).

      result = VALUE #(
            FOR ls_result IN lt_result (
              %tky                                = ls_result-purchaseorder
              %features-%action-updatedownpayment = COND #( WHEN ls_result-downpaymentupdated = 'C'
                                                            THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled )
            ) ).

*      failed-zmm_i_purord_downpay =  VALUE #( FOR key IN keys ( %tky = key-%tky ) )  .
*      reported-zmm_i_purord_downpay = VALUE #( FOR key IN keys (
*                                            %tky                = key-%tky
*                              %action-updateDownPayment         = if_abap_behv=>mk-on
*                              %msg                = NEW /dmo/cm_flight_messages(
*                                                                      textid = /dmo/cm_flight_messages=>enter_customer_id
*                                                                      severity = if_abap_behv_message=>severity-error )
*
*                              %element-purchaseorder = if_abap_behv=>mk-on
*
*
*      ) ).



    ENDIF.

  ENDMETHOD.

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

  METHOD updatedownpayment.

    DATA lr_purchaseorder TYPE RANGE OF zmm_i_purord_downpay-purchaseorder.
    DATA lt_po_header_update TYPE TABLE FOR UPDATE i_purchaseordertp_2.
    DATA lt_po_item_update TYPE TABLE FOR UPDATE i_purchaseordertp_2\\purchaseorderitem.
    DATA lv_downpaymenttype TYPE zmm_i_purord_downpay-downpaymenttype VALUE 'M'.
    DATA lv_DownPaymentUpdated TYPE zmm_i_purord_downpay-DownPaymentUpdated VALUE 'C'.
    lr_purchaseorder = VALUE #(  FOR row IN keys ( sign = 'I' option = 'EQ' low = row-purchaseorder ) ).

    IF lr_purchaseOrder IS NOT INITIAL.
      SELECT FROM zmm_i_purord_downpay AS purchaseorderdownpayment
            FIELDS purchaseorder,
                   purchaseorderdate,
                   supplier,
                   purchasingorganization,
                   purorgdownpaymentflag,
                   purorgdownpaymenpercent,
                   \_purchaseorderitem[ (*) ]-purchaseorderitem,
                   ( \_purchaseorderitem[ (*) ]-netpriceamount * \_purchaseorderitem[ (*) ]-orderquantity  ) AS itemprice
            WHERE purchaseorderdownpayment~purchaseorder IN @lr_purchaseorder AND
                  purorgdownpaymentflag = 'X'
            ORDER BY purchaseorderdownpayment~purchaseorder ASCENDING
            INTO TABLE @DATA(lt_po_aggregated).

      IF lt_po_aggregated IS NOT INITIAL.
        TYPES: BEGIN OF ty_po_sum,
                 purchaseorder           TYPE zmm_i_purord_downpay-purchaseorder,
                 purchaseorderdate       TYPE zmm_i_purord_downpay-purchaseorderdate,
                 purorgdownpaymenpercent TYPE zmm_i_purord_downpay-purorgdownpaymenpercent,
                 purorgdownpaymentflag   TYPE zmm_i_purord_downpay-purorgdownpaymentflag,
                 downpaymentamount       TYPE zmm_i_purord_downpay-downpaymentamount,
               END OF ty_po_sum.

        DATA: lt_po_aggregated_sum    TYPE STANDARD TABLE OF ty_po_sum.

        " 그룹핑하여 itemprice 합산
        lt_po_aggregated_sum = VALUE #(
                                       FOR GROUPS <group> OF ls_po IN lt_po_aggregated
                                       GROUP BY ( purchaseorder               = ls_po-purchaseorder
                                                  purchaseorderdate           = ls_po-purchaseorderdate
                                                  purorgdownpaymenpercent = ls_po-purorgdownpaymenpercent
                                                  purorgdownpaymentflag    = ls_po-purorgdownpaymentflag
                                                 )
                                       (
                                         purchaseorder               = <group>-purchaseorder
                                         purchaseorderdate           = <group>-purchaseorderdate
                                         purorgdownpaymenpercent     = <group>-purorgdownpaymenpercent
                                         purorgdownpaymentflag       = <group>-purorgdownpaymentflag
                                         downpaymentamount           = REDUCE i_purchaseordertp_2-downpaymentamount( INIT total = 0
                                                                                                                      FOR ls_item IN GROUP <group>
                                                                                                                      NEXT total = total + ls_item-itemprice
                                                                                                                   )
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
*                                                                            yy1_downpaymentupdated_pdh    = if_abap_behv=>mk-on
                                                                         )
                          purchaseorder                         = ls_sum-purchaseorder
                          downpaymentduedate                    = ls_sum-purchaseorderdate
                          downpaymentpercentageoftotamt         = ls_sum-purorgdownpaymenpercent
                          downpaymenttype                       = lv_downpaymenttype
*                          yy1_downpaymentupdated_pdh            = lv_DownPaymentUpdated

                          downpaymentamount                     = ( ls_sum-downpaymentamount * ls_sum-purorgdownpaymenpercent / 100 )
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
                            downpaymentpercentageoftotamt       = ls_po_item-purorgdownpaymenpercent
                            downpaymenttype                     = lv_downpaymenttype
                            downpaymentamount                   = ( ls_po_item-itemprice * ls_sum-purorgdownpaymenpercent / 100 )
                        ) TO lt_po_item_update.
        ENDLOOP.



        MODIFY ENTITIES OF i_purchaseordertp_2 PRIVILEGED
        ENTITY purchaseorder
        UPDATE FROM lt_po_header_update
        ENTITY purchaseorderitem
        UPDATE FROM lt_po_item_update
        MAPPED  DATA(lt_mapped)
        REPORTED DATA(lt_reported)
        FAILED DATA(lt_failed).
      ENDIF.



    ENDIF.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_zmm_i_purord_downpay DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zmm_i_purord_downpay IMPLEMENTATION.

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
