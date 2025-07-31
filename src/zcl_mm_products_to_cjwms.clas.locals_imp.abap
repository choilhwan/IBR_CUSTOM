*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_payload_maker DEFINITION  FRIENDS zcl_mm_products_to_cjwms.
  PUBLIC SECTION.
    CLASS-METHODS:
      extract_products
        IMPORTING i_keys            TYPE any
        RETURNING VALUE(rt_product) TYPE zcl_mm_products_to_cjwms=>ty_r_product,

      select_products
        IMPORTING ir_product     TYPE zcl_mm_products_to_cjwms=>ty_r_product
        RETURNING VALUE(rt_data) TYPE zcl_mm_products_to_cjwms=>ty_t_product_result, " Replace with actual structure

      build_payload
        IMPORTING it_product        TYPE zcl_mm_products_to_cjwms=>ty_t_product_result
        RETURNING VALUE(rs_payload) TYPE zcl_mm_products_to_cjwms=>ty_s_headerinfo,

      update_status
        IMPORTING it_product  TYPE zcl_mm_products_to_cjwms=>ty_t_product_result
                  i_cid       TYPE abp_behv_cid
        EXPORTING et_mapped   TYPE any
                  et_failed   TYPE any
                  et_reported TYPE any.



ENDCLASS.

CLASS lcl_payload_maker IMPLEMENTATION.
  METHOD extract_products.
    DATA: lt_keys           TYPE TABLE FOR ACTION IMPORT zmm_r_product\\product~transfer_cjwms,
          lt_product_search TYPE TABLE FOR HIERARCHY zmm_d_product_h\\item_info.

    lt_keys = i_keys.
    READ TABLE lt_keys INDEX 1 INTO DATA(ls_key).
    IF sy-subrc = 0.
      lt_product_search = ls_key-%param-_products.
    ENDIF.

    rt_product = VALUE zcl_mm_products_to_cjwms=>ty_r_product( FOR ls IN lt_product_search
                                     ( sign = 'I' option = 'EQ' low = ls-product ) ).
  ENDMETHOD.

  METHOD select_products.
    SELECT
      FROM zmm_r_product AS _products
      FIELDS
        _products~product,
        _products~baseunit,
        \_productplant[ (*) ]-plant,
        \_productplant[ (*) ]-yy1_transferstatus_plt,
        \_productplant[ (*) ]-yy1_transferdate_plt,
        \_productdescriptionkr[ (*) ]-productdescription AS productdescriptionkr,
        \_productdescriptionen[ (*) ]-productdescription AS productdescriptionen,
        \_productgrouptext_2[ (*) WHERE language = @sy-langu ]-productgroup,
        \_productgrouptext_2[ (*) WHERE language = @sy-langu ]-productgroupname
      WHERE _products~product IN @ir_product
      INTO TABLE @rt_data.
  ENDMETHOD.

  METHOD build_payload.
    rs_payload = VALUE zcl_mm_products_to_cjwms=>ty_s_headerinfo(
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



  METHOD update_status.
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
ENDCLASS.

CLASS lcl_payload_mapper DEFINITION  FRIENDS zcl_mm_products_to_cjwms.
  PUBLIC SECTION.
    INTERFACES zif_rap_batch_payload_mapper.
       DATA:  gt_products TYPE STANDARD TABLE OF zcl_mm_products_to_cjwms=>ty_t_product_result.
ENDCLASS.

CLASS lcl_payload_mapper IMPLEMENTATION.

  METHOD zif_rap_batch_payload_mapper~map_keys_to_payloads.
    DATA: lt_keys TYPE TABLE FOR ACTION IMPORT zmm_r_product\\product~transfer_cjwms.
    DATA: lt_payload TYPE STANDARD TABLE OF   zcl_mm_products_to_cjwms=>ty_s_headerinfo.
    DATA: ls_payload TYPE  zcl_mm_products_to_cjwms=>ty_s_headerinfo.
    FIELD-SYMBOLS <fs> TYPE ANY TABLE.
    DATA: payload TYPE REF TO data.
*    DATA: payload like REF TO lt_payload.
*    FIELD-SYMBOLS <fs_tmp> type any.

    lt_keys = i_keys .

    LOOP AT lt_keys INTO DATA(ls_key).
      DATA(lr_product)   = lcl_payload_maker=>extract_products( i_keys ).
      DATA(lt_product)   = lcl_payload_maker=>select_products( lr_product ).
      Append  lt_product to gt_products.
      ls_payload  = lcl_payload_maker=>build_payload( lt_product ).
      APPEND ls_payload TO lt_payload.
    ENDLOOP.

    CREATE DATA payload TYPE STANDARD TABLE OF zcl_mm_products_to_cjwms=>ty_s_headerinfo.
    ASSIGN payload->* TO <fs>.
    <fs> = lt_payload.
    r_payload = payload.

  ENDMETHOD.

ENDCLASS.
