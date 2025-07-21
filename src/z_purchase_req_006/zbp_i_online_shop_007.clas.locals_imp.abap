 CLASS lsc_zi_online_shop_act DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.
    METHODS save_modified REDEFINITION.
 ENDCLASS.

 CLASS lsc_zi_online_shop_act IMPLEMENTATION.

 METHOD save_modified.
    DATA : lt_online_shop_as TYPE STANDARD TABLE OF Zshop_AS_006,
           ls_online_shop_as TYPE                   Zshop_AS_006.
    IF zbp_i_online_shop_007=>cv_pr_mapped-purchaserequisition IS NOT INITIAL.
      LOOP AT zbp_i_online_shop_007=>cv_pr_mapped-purchaserequisition ASSIGNING FIELD-SYMBOL(<fs_pr_mapped>).
        CONVERT KEY OF i_purchaserequisitiontp FROM <fs_pr_mapped>-%pid TO DATA(ls_pr_key).
        <fs_pr_mapped>-purchaserequisition = ls_pr_key-purchaserequisition.
      ENDLOOP.
    ENDIF.
    IF create-online_shop IS NOT INITIAL.
     " Creates internal table with instance data
      lt_online_shop_as = CORRESPONDING #( create-online_shop ).
      lt_online_shop_as[ 1 ]-purchasereqn =  ls_pr_key-purchaserequisition .
      insert Zshop_AS_006 FROM TABLE @lt_online_shop_as.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
 CLASS lhc_zi_online_shop_007  DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
     METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
     IMPORTING keys REQUEST requested_authorizations FOR  online_shop RESULT result.

    METHODS create_pr FOR MODIFY
      IMPORTING keys FOR ACTION online_shop~create_pr.

   METHODS calculate_order_id FOR DETERMINE ON MODIFY
     IMPORTING keys FOR online_shop~calculate_order_id.

 ENDCLASS.

 CLASS lhc_zi_online_shop_007  IMPLEMENTATION.

 METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD calculate_order_id.
    DATA:
      online_shops TYPE TABLE FOR UPDATE ZI_ONLINE_SHOP_007,
      online_shop  TYPE STRUCTURE FOR UPDATE ZI_ONLINE_SHOP_007.

    SELECT MAX( order_id ) FROM ZI_ONLINE_SHOP_007 INTO @DATA(max_order_id).
    READ ENTITIES OF ZI_ONLINE_SHOP_007 IN LOCAL MODE
       ENTITY Online_Shop
        ALL FIELDS
          WITH CORRESPONDING #( keys )
          RESULT DATA(lt_online_shop_result)
      FAILED    DATA(lt_failed)
      REPORTED  DATA(lt_reported).
    DATA(today) = cl_abap_context_info=>get_system_date( ).

    LOOP AT lt_online_shop_result INTO DATA(online_shop_read).
     max_order_id += 1.

      online_shop               = CORRESPONDING #( online_shop_read ).
    online_shop-order_id      = max_order_id.
      online_shop-Creationdate  = today.
     online_shop-Deliverydate  = today + 10.
      APPEND online_shop TO online_shops.
    ENDLOOP.
    MODIFY ENTITIES OF ZI_ONLINE_SHOP_007 IN LOCAL MODE
   ENTITY ZI_ONLINE_SHOP_007 UPDATE SET FIELDS WITH online_shops
   MAPPED   DATA(ls_mapped_modify)
   FAILED   DATA(lt_failed_modify)
   REPORTED DATA(lt_reported_modify).


    IF lt_failed_modify IS INITIAL.
          MODIFY ENTITIES OF ZI_ONLINE_SHOP_007 IN LOCAL MODE
      ENTITY Online_Shop EXECUTE create_pr FROM CORRESPONDING #( keys )
      FAILED DATA(lt_pr_failed)
      REPORTED DATA(lt_pr_reported).

      reported = CORRESPONDING #( deep lt_pr_reported ).


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

*          if ls_pr_reported is NOT INITIAL.
*             loop at ls_pr_reported-purchaserequisition into data(ls_reported) .
*             ls_reported-%msg
*             ls_reported-
*             ENDLOOP.
*          ENDIF.
*          reported = value #( ( online_shop   ) ).
*        append value #(  ) to reported.
      zbp_i_online_shop_007=>cv_pr_mapped = ls_pr_mapped.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
