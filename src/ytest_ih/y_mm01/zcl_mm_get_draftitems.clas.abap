CLASS zcl_mm_get_draftitems DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_items IMPORTING purchasingdocument TYPE purchasingdocument  purchasingdocumentitem TYPE purchasingdocumentitem
                      EXPORTING approver type   I_BusinessUserVH-UserID.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_MM_GET_DRAFTITEMS IMPLEMENTATION.


  METHOD get_items.

*    purchasingdocument  type purchasingdocument
*purchasingdocumentitem  type purchasingdocumentitem optional

    SELECT  SINGLE YY1_approvaltest2_PRI FROM i_purchaserequisitionitemapi01
    WHERE  purchaserequisition = @purchasingdocument AND purchaserequisitionitem = @purchasingdocumentitem
    INTO @DATA(ls_tmp).
     if ls_tmp is not INITIAL.
     select SINGLE userid from I_BusinessUserBasic WHERE BusinessPartner =  @ls_tmp into @data(lv_userid).
     approver = lv_userid.
     ENDIF.
  ENDMETHOD.
ENDCLASS.
