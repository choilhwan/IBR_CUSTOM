 CLASS lhc_zr_onlineshop_006  DEFINITION INHERITING FROM cl_abap_behavior_handler.
   PRIVATE SECTION.
     METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
       IMPORTING REQUEST requested_authorizations FOR ZrOnlineshop006
       RESULT result.
     METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
       IMPORTING keys REQUEST requested_authorizations FOR  ZrOnlineshop006 RESULT result.

     METHODS create_pr FOR MODIFY
       IMPORTING keys FOR ACTION ZrOnlineshop006~create_pr RESULT result .

     METHODS calculate_order_id FOR DETERMINE ON MODIFY
       IMPORTING keys FOR ZrOnlineshop006~calculate_order_id.
     METHODS call_create_pr FOR DETERMINE ON SAVE
       IMPORTING keys FOR ZrOnlineshop006~call_create_pr.
     METHODS Activate FOR MODIFY
       IMPORTING keys FOR ACTION ZrOnlineshop006~Activate.
     METHODS Edit FOR MODIFY
       IMPORTING keys FOR ACTION ZrOnlineshop006~Edit.
     METHODS update_determination FOR DETERMINE ON MODIFY
       IMPORTING keys FOR ZrOnlineshop006~update_determination.
     METHODS test_pr FOR MODIFY
       IMPORTING keys FOR ACTION ZrOnlineshop006~test_pr RESULT result.

*        METHODS earlynumbering_create FOR NUMBERING
*      IMPORTING entities FOR CREATE ZrOnlineshop006.
 ENDCLASS.

 CLASS lhc_zr_onlineshop_006  IMPLEMENTATION.

   METHOD get_instance_authorizations.
   ENDMETHOD.

   METHOD calculate_order_id.
     DATA:
       online_shops TYPE TABLE FOR UPDATE zr_onlineshop_006,
       online_shop  TYPE STRUCTURE FOR UPDATE zr_onlineshop_006.

*     SELECT MAX( orderid ) FROM zr_onlineshop_006 INTO @DATA(max_order_id).

     READ ENTITIES OF zr_onlineshop_006 IN LOCAL MODE
        ENTITY ZrOnlineshop006
         ALL FIELDS
           WITH CORRESPONDING #( keys )
           RESULT DATA(lt_online_shop_result)
       FAILED    DATA(lt_failed)
       REPORTED  DATA(lt_reported).
     DATA(today) = cl_abap_context_info=>get_system_date( ).

     LOOP AT lt_online_shop_result INTO DATA(online_shop_read).
*       max_order_id += 1.

       online_shop               = CORRESPONDING #( online_shop_read ).
*       online_shop-orderid      = max_order_id.
       online_shop-Creationdate  = today.
       online_shop-Deliverydate  = today + 10.
       APPEND online_shop TO online_shops.
     ENDLOOP.

     DATA(lv_flag) = abap_false .
     IF lv_flag EQ abap_false.
       MODIFY ENTITIES OF Zr_ONLINESHOP_006 IN LOCAL MODE
       ENTITY Zr_ONLINESHOP_006 UPDATE SET FIELDS WITH online_shops
       MAPPED   DATA(ls_mapped_modify)
       FAILED   DATA(lt_failed_modify)
       REPORTED DATA(lt_reported_modify).
     ELSE.

     ENDIF.

     IF lt_failed_modify IS INITIAL.

     ENDIF.



   ENDMETHOD.

   METHOD create_pr.

     IF keys IS NOT INITIAL.

     MODIFY ENTITIES OF i_purchaserequisitiontp
 ENTITY purchaserequisition
    CREATE FIELDS ( purchaserequisitiontype )
    WITH VALUE #(  ( %cid                    = 'My%CID_1'
                     purchaserequisitiontype = 'NB' ) )

   CREATE BY \_purchaserequisitionitem
   FIELDS ( plant
            purchaserequisitionitemtext
            accountassignmentcategory
            requestedquantity
            baseunit
            purchaserequisitionprice
            purreqnitemcurrency
            materialgroup
            purchasinggroup
            purchasingorganization
                )
   WITH VALUE #(
                 (    %cid_ref = 'My%CID_1'
                      %target = VALUE #(
                                    (     %cid                            = 'My%ItemCID_1'
                                          plant                           = '4310'
                                          purchaserequisitionitemtext     = 'created from PAAS API 007'
                                            accountassignmentcategory     = 'U'
                                          requestedquantity               = '8.00'
                                          baseunit                        = 'EA'
                                          purchaserequisitionprice        = '10.00'
                                          purreqnitemcurrency             = 'EUR'
                                          materialgroup                   = 'A001'
                                          purchasinggroup                 = '001'
                                          purchasingorganization          = '4310'

                                          )
                                       )
                  )
                )
 ENTITY purchaserequisitionitem

 CREATE BY \_purchasereqnacctassgmt
    FIELDS ( CostCenter
             GLAccount
             Quantity
             BaseUnit )
    WITH VALUE #( (   %cid_ref = 'My%ItemCID_1'
                      %target  = VALUE #( ( %cid         = 'My%AccntCID_1'
                                            CostCenter   = 'JMW-COST'
                                            GLAccount    = '0000400000' ) ) ) )
 CREATE BY \_purchasereqnitemtext
   FIELDS ( plainlongtext )
   WITH VALUE #(  (   %cid_ref = 'My%ItemCID_1'
                     %target  = VALUE #( ( %cid          = 'My%TextCID_1'
                                          textobjecttype = 'B01'
                                         language        = 'E'
                                          plainlongtext  = 'item text created from PAAS API 007'
                                        ) ( %cid         = 'My%TextCID_2'
                                          textobjecttype = 'B02'
                                          language       = 'E'
                                          plainlongtext  = 'item2 text created from PAAS API 007'
                                        ) )
              )   )
          REPORTED DATA(ls_pr_reported)
          MAPPED DATA(ls_pr_mapped)
          FAILED DATA(ls_pr_failed).
     zbp_r_onlineshop_006=>cv_pr_mapped = value #( for key in keys ( order_uuid = key-orderuuid ) ).
       LOOP AT ls_pr_mapped-purchaserequisition ASSIGNING FIELD-SYMBOL(<fs_mapped>).
         APPEND VALUE #(    %param = <fs_mapped>-%pid ) TO result.
         READ TABLE zbp_r_onlineshop_006=>cv_pr_mapped INDEX sy-index ASSIGNING FIELD-SYMBOL(<fs_tmp>).
         if sy-subrc = 0.
         <fs_tmp>-pid = <fs_mapped>-%pid.
         ENDIF.

       ENDLOOP.

     ENDIF.
   ENDMETHOD.

   METHOD get_global_authorizations.

   ENDMETHOD.

   METHOD call_create_pr.
     MODIFY ENTITIES OF Zr_ONLINESHop_006 IN LOCAL MODE
  ENTITY ZrOnlineshop006 EXECUTE create_pr FROM CORRESPONDING #( keys )
  FAILED DATA(lt_pr_failed)
  REPORTED DATA(lt_pr_reported).

     reported = CORRESPONDING #( DEEP lt_pr_reported ).

   ENDMETHOD.

   METHOD Activate.
*     MODIFY ENTITIES OF Zr_ONLINESHOP_006 IN LOCAL MODE
*    ENTITY ZrOnlineshop006 EXECUTE create_pr FROM CORRESPONDING #( keys  )
*    RESULT DATA(lt_result)
*    FAILED DATA(lt_pr_failed)
*    MAPPED DATA(lt_mapped)
*    REPORTED DATA(lt_pr_reported).
*
*     IF lt_pr_failed IS INITIAL.
*       zbp_r_onlineshop_006=>cv_pr_mapped-purchaserequisition = VALUE #( FOR ls_result IN lt_result ( %pid = ls_result-%param ) ).
*     ENDIF.



   ENDMETHOD.

   METHOD Edit.
   ENDMETHOD.

   METHOD update_determination.
   ENDMETHOD.

*  METHOD earlynumbering_create.
*  data: ls_entity type RESPONSE FOR mapped EARLY zr_onlineshop_006.
*
*   loop at entities into data(entity).
*   if entity-%key is not INITIAL.
*   CONTINUE.
*   ENDIF.
*   entity-%key-OrderUuid = cl_system_uuid=>create_uuid_x16_static( ).
*   append CORRESPONDING #( entity ) to ls_entity-zronlineshop006.
*   ENDLOOP.
*   mapped = ls_entity.
*  ENDMETHOD.

   METHOD test_pr.
   ENDMETHOD.


 ENDCLASS.
 CLASS lsc_zr_onlineshop_006 DEFINITION INHERITING FROM cl_abap_behavior_saver.
   PROTECTED SECTION.

     METHODS save_modified REDEFINITION.


 ENDCLASS.

 CLASS lsc_zr_onlineshop_006 IMPLEMENTATION.

   METHOD save_modified.
     DATA : lt_online_shop_as TYPE STANDARD TABLE OF Zshop_AS_006,
            ls_online_shop_as TYPE                   Zshop_AS_006,
            lt_online_shop    TYPE STANDARD TABLE OF zonlineshop_006,
            lt_orderid type TABLE FOR UPDATE zr_onlineshop_006.


     IF create-zronlineshop006  IS NOT INITIAL.
          lt_orderid = CORRESPONDING #(  create-zronlineshop006  ).
       IF zbp_r_onlineshop_006=>cv_pr_mapped IS NOT INITIAL.

         LOOP AT zbp_r_onlineshop_006=>cv_pr_mapped ASSIGNING FIELD-SYMBOL(<ls_pid>).

           CONVERT KEY OF i_purchaserequisitiontp
                   FROM TEMPORARY VALUE #( %pid = <ls_pid>-pid ) TO FINAL(lv_final) .

           READ TABLE lt_orderid ASSIGNING FIELD-SYMBOL(<fs_orderif>) WHERE OrderUuid = <ls_pid>-order_uuid.
           if sy-subrc = 0.
           <fs_orderif>-OrderId = conv #( lv_final ).
           ENDIF.


         ENDLOOP.
         data: lt_insert type STANDARD TABLE OF zonlineshop_006.
         lt_insert = CORRESPONDING #( lt_orderid  mapping FROM ENTITY   ).
         MODIFY zonlineshop_006  from TABLE @lt_insert.
*        MODIFY ENTITIES OF zr_onlineshop_006 in LOCAL MODE
*        ENTITY ZrOnlineshop006
*        update FIELDS ( OrderId ) WITH CORRESPONDING #(   lt_orderid  )
*        REPORTED data(lt_reported)
*        MAPPED data(lt_mapped)
*        FAILED data(lt_failed).

       ENDIF.
     ENDIF.


   ENDMETHOD.

 ENDCLASS.
