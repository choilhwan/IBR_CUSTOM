CLASS lsc_zmm_r_product_cjwms DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save  REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_zmm_r_product_cjwms IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

  METHOD save.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZMM_R_PRODUCT_CJWMS DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zmm_r_product_cjwms RESULT result.

    METHODS read FOR READ
      IMPORTING keys FOR READ zmm_r_product_cjwms RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zmm_r_product_cjwms.
    METHODS TransferToWMS FOR MODIFY
      IMPORTING keys FOR ACTION zmm_r_product_cjwms~TransferToWMS RESULT result.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zmm_r_product_cjwms RESULT result.
    METHODS _updateStatus
      IMPORTING VALUE(it_product) TYPE zbp_mm_r_product_cjwms=>ty_t_product_result
                VALUE(i_cid)      TYPE abp_behv_cid
      EXPORTING et_mapped         TYPE any
                et_failed         TYPE any
                et_reported       TYPE any.
    METHODS _select_products
      IMPORTING ir_product     TYPE zbp_mm_r_product_cjwms=>ty_r_product
      RETURNING VALUE(rt_data) TYPE zbp_mm_r_product_cjwms=>ty_t_product_result. " Replace with actual structure

    METHODS _build_payload
      IMPORTING it_product        TYPE zbp_mm_r_product_cjwms=>ty_t_product_result
      RETURNING VALUE(rs_payload) TYPE zbp_mm_r_product_cjwms=>ty_s_headerinfo.
ENDCLASS.

CLASS lhc_ZMM_R_PRODUCT_CJWMS IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD TransferToWMS.
    TYPES: ty_r_products TYPE RANGE OF zmm_r_product_cjwms-Product.
    TYPES: BEGIN OF ty_s_cidmap,
             cid     TYPE abp_behv_cid,
             product TYPE zmm_r_product_cjwms-Product,
           END OF ty_s_cidmap.
    TYPES: ty_t_cidmap TYPE STANDARD TABLE OF ty_s_cidmap WITH EMPTY KEY.
    DATA : lr_products TYPE ty_r_products,
           lt_cidmap   TYPE ty_t_cidmap,
           lv_communicationScenario TYPE if_com_management=>ty_cscn_id  VALUE 'ZTEST_COM_EAI_WMS' ,
           lv_outboundService type if_com_management=>ty_cscn_outb_srv_id VALUE 'Z_TEST_OUTBOUND_CJWMS_REST'
           .

    READ TABLE keys INTO DATA(ls_key) INDEX 1.
    IF sy-subrc EQ 0.
      DATA(lv_cid) = ls_key-%cid.
      LOOP AT  ls_key-%param-_item INTO DATA(ls_item).
        APPEND VALUE #( sign = 'I' option = 'EQ' low = ls_item-Product  ) TO lr_products .
*            APPEND VALUE #( cid = ls_key-%cid_ref product = ls_item-Product   ) TO lt_cidmap.
      ENDLOOP.

      DATA(lt_product)   = _select_products( lr_products ).
      if lt_product is INITIAL.
        result = value #( ( %cid = lv_cid  %param = value #( severity = 'E' reason = 'E' text = 'Data Not Founded' ) ) ).
        return.
      ENDIF.
      zbp_mm_r_product_cjwms=>gt_product_plant = CORRESPONDING #( lt_product ).
      DATA(ls_payload)  = _build_payload( lt_product ).
**********************************************************************
      DATA(lv_respone) = zcl_http_outbound=>send_rest_request(
         iv_comm_scenario = lv_communicationScenario
         iv_http_method = if_web_http_client=>post
         iv_outbound_service = lv_outboundService
*    iv_url = ''
         i_payload = ls_payload
      ).
**********************************************************************
      APPEND INITIAL LINE TO result ASSIGNING FIELD-SYMBOL(<fs_result>).
      <fs_result>-%cid = lv_cid.
      <fs_result>-%param-reason = lv_respone-status-reason.
      <fs_result>-%param-text = lv_respone-body.
      <fs_result>-%param-severity = COND #( WHEN lv_respone-status-code = 200 THEN 'S' ELSE 'E' ).
      IF <fs_result>-%param-severity = 'S'.
        DATA : lt_mapped   TYPE RESPONSE FOR MAPPED I_ProductTP_2,
               lt_failed   TYPE RESPONSE FOR MAPPED I_ProductTP_2,
               lt_reported TYPE RESPONSE FOR MAPPED I_ProductTP_2.

        _updatestatus( EXPORTING it_product = zbp_mm_r_product_cjwms=>gt_product_plant
                                 i_cid = lv_cid
                       IMPORTING et_mapped = lt_mapped
                                 et_failed = lt_failed
                                 et_reported = lt_reported ).
        IF lt_failed IS NOT INITIAL.
          <fs_result>-%param = VALUE #( severity = 'E' reason = 'Failed' text = 'Failed To Update I_Productplant Status' ).
          return.
        ENDIF.

      ENDIF.
    ENDIF.



  ENDMETHOD.

  METHOD _updatestatus.
    DATA: lt_update   TYPE TABLE FOR UPDATE i_producttp_2\\productplant.

    lt_update = CORRESPONDING #( it_product MAPPING product = product plant = plant EXCEPT * ).
    DATA(lv_update_date) =  cl_abap_context_info=>get_system_date( ).
    LOOP AT lt_update ASSIGNING FIELD-SYMBOL(<fs_update>).
      <fs_update>-yy1_transferstatus_plt = '전송완료'.
      <fs_update>-yy1_transferdate_plt = lv_update_date.
      <fs_update>-%control-YY1_TransferDate_PLT = if_abap_behv=>mk-on.
      <fs_update>-%control-YY1_TransferStatus_PLT = if_abap_behv=>mk-on.
    ENDLOOP.

    MODIFY ENTITIES OF i_producttp_2 PRIVILEGED
    ENTITY productplant
    UPDATE FROM lt_update
    MAPPED et_mapped
    REPORTED et_reported
    FAILED et_failed.

  ENDMETHOD.
  METHOD _select_products.
    SELECT
      FROM zmm_r_product_cjwms AS _products
      FIELDS
         Product,
         BaseUnit,
         \_ProductPlantBasic[ (*) ]-Plant,
*        ProductDescKR,
*        ProductDescEN,
         \_ProductDesc[ ONE TO EXACT ONE WHERE Language = '3'  ]-ProductDescription AS ProductDescKR,
         \_ProductDesc[ ONE TO EXACT ONE WHERE Language = 'E'  ]-ProductDescription AS ProductDescEN,
         \_ProductGroupText_2[ ONE TO EXACT ONE WHERE Language = '3' ]-ProductGroup,
         \_ProductGroupText_2[ ONE TO EXACT ONE WHERE Language = '3' ]-ProductGroupName
      WHERE _products~product IN @ir_product
      INTO TABLE @rt_data.
  ENDMETHOD.

  METHOD _build_payload.


    rs_payload = VALUE zbp_mm_r_product_cjwms=>ty_s_headerinfo(
      _item_info = CORRESPONDING #(
                                    it_product MAPPING
                                                item_cd = product
                                                strr_item_nm_ko = productdescriptionkr
                                                strr_item_nm_en = productdescriptionen EXCEPT * )
      _logisticsinfo = CORRESPONDING #(
                                    it_product MAPPING
                                                logi_item_cd = product
                                                strr_item_strg_cd = baseunit
                                                logi_item_nm_ko = productdescriptionkr
                                                logi_item_nm_en = productdescriptionen
                                                item_gcd = productgroup
                                                item_gcdnm = productgroupname EXCEPT * )
     ).
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

ENDCLASS.
