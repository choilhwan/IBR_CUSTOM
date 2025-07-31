CLASS ycl_test_ih05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_test_ih05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lr_purchaseorder TYPE RANGE OF y_r_purchaseorder-purchaseorder.
    DATA lt_po_hd_update TYPE TABLE FOR UPDATE i_purchaseordertp_2.
    DATA lt_po_item_update TYPE TABLE FOR UPDATE i_purchaseordertp_2\\purchaseorderitem.


    lr_purchaseorder = VALUE #(  ( sign = 'I' option = 'EQ' low = '4500000000' ) ).

*
*
*    "header select
*
*    SELECT FROM y_r_purchaseorder
*        FIELDS purchaseorder,
*               purchaseorderdate,
**               downpaymenttype,
**               downpaymentduedate,
**               downpaymentamount,
**               downpaymentpercentageoftotamt,
**               supplier,
**               purchasingorganization,
**               \_purchaseorderitem[ (*) ]-purchaseorderitem,
**               ( \_purchaseorderitem[ (*) ]-netpriceamount * \_purchaseorderitem[ (*) ]-orderquantity  ) AS itemprice,
*               \_supplierpurchasingorg[ (*) ]-yy1_downpaymentpercent_spo AS downpaymentpercentfrompg,
*               \_supplierpurchasingorg[ (*) ]-yy1_downpaymenttype_spo AS downpaymenttypefrompg
*        WHERE y_r_purchaseorder~purchaseorder IN @lr_purchaseorder
*        ORDER BY y_r_purchaseorder~purchaseorder ASCENDING
*        INTO TABLE @DATA(lt_head).
*
*    "item select
*
*    SELECT FROM y_r_purchaseorder
*        FIELDS purchaseorder,
*               \_purchaseorderitem[ (*) ]-purchaseorderitem,
*               ( \_purchaseorderitem[ (*) ]-netpriceamount * \_purchaseorderitem[ (*) ]-orderquantity  ) AS totalItemPrice
*        WHERE y_r_purchaseorder~purchaseorder IN @lr_purchaseorder
*        ORDER BY y_r_purchaseorder~purchaseorder ASCENDING
*        INTO TABLE @DATA(lt_item).
*
*    LOOP AT lt_head INTO DATA(ls_head).
*      APPEND VALUE #( purchaseorder = ls_head-purchaseorder
*                      downpaymentduedate = ls_head-purchaseorderdate
*                      downpaymentpercentageoftotamt = ls_head-downpaymentpercentfrompg
*                       ) TO lt_po_hd_update.
*    ENDLOOP.



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
        INTO TABLE @DATA(lt_po).


    TYPES: BEGIN OF ty_po_sum,
             purchaseorder              TYPE y_r_purchaseorder-purchaseorder,
             purchaseorderdate          TYPE y_r_purchaseorder-purchaseorderdate,
             yy1_downpaymentpercent_spo TYPE i_supplierpurchasingorg-yy1_downpaymentpercent_spo,
             yy1_downpaymenttype_spo    TYPE i_supplierpurchasingorg-yy1_downpaymenttype_spo,
             downpaymentamount          TYPE i_purchaseordertp_2-downpaymentamount,
           END OF ty_po_sum.

    DATA: lt_po_sum    TYPE STANDARD TABLE OF ty_po_sum.

    " 그룹핑하여 itemprice 합산
    lt_po_sum = VALUE #(
      FOR GROUPS <group> OF ls_po IN lt_po
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

    " lt_po_update 테이블에 매핑
    LOOP AT lt_po_sum INTO DATA(ls_sum).
      APPEND VALUE #(
        purchaseorder               = ls_sum-purchaseorder
        downpaymentduedate           = ls_sum-purchaseorderdate
        downpaymentpercentageoftotamt = ls_sum-yy1_downpaymentpercent_spo
        downpaymenttype    = ls_sum-yy1_downpaymenttype_spo
        downpaymentamount                 = ( ls_sum-downpaymentamount * ls_sum-yy1_downpaymentpercent_spo / 100 )
      ) TO lt_po_hd_update.
    ENDLOOP.

*    "lt_pi_item_update 테이블에 매핑
    LOOP AT lt_po INTO DATA(ls_po_item).
      APPEND VALUE #(
        purchaseorder               = ls_po_item-purchaseorder
        downpaymentduedate           = ls_po_item-purchaseorderdate
        downpaymentpercentageoftotamt = ls_po_item-yy1_downpaymentpercent_spo
        downpaymenttype    = ls_po_item-yy1_downpaymenttype_spo
        downpaymentamount                 = ( ls_po_item-itemprice * ls_sum-yy1_downpaymentpercent_spo / 100 )
      ) TO lt_po_item_update.
    ENDLOOP.



    out->write( lt_po ).
    out->write( lt_po_hd_update ).
    out->write( lt_po_item_update ).



  ENDMETHOD.
ENDCLASS.

