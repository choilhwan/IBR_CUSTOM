CLASS zcl_mm_products_to_cjwms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    CLASS-DATA:
      BEGIN OF gs_com_info,
        comm_scenario TYPE if_com_management=>ty_cscn_id VALUE '',
        service_id    TYPE if_com_management=>ty_cscn_outb_srv_id VALUE '',
      END OF gs_com_info,
      BEGIN OF  gs_proxy_model_key,
        repository_id       TYPE /iwbep/if_cp_runtime_types=>ty_proxy_model_repo_id,
        proxy_model_id      TYPE /iwbep/if_cp_runtime_types=>ty_proxy_model_id VALUE '',
        proxy_model_version TYPE /iwbep/if_cp_runtime_types=>ty_proxy_model_version VALUE '',
*      type /iwbep/if_cp_runtime_types=>ty_s_proxy_model_key .
      END OF gs_proxy_model_key,
      gv_relative_service_root TYPE string VALUE '/root'.
    TYPES:
      ty_r_product TYPE RANGE OF matnr,
      BEGIN OF ty_s_product_result,
        product                TYPE i_product-product,
        baseunit               TYPE i_product-baseunit,
        plant                  TYPE i_productplantbasic-plant,
        yy1_transferstatus_plt TYPE i_productplantbasic-yy1_transferstatus_plt,
        yy1_transferdate_plt   TYPE i_productplantbasic-yy1_transferdate_plt,
        productdescriptionkr   TYPE i_productdescription-productdescription,
        productdescriptionen   TYPE i_productdescription-productdescription,
        productgroup           TYPE i_productgrouptext_2-productgroup,
        productgroupname       TYPE i_productgrouptext_2-productgroupname,
      END OF ty_s_product_result,
      ty_t_product_result TYPE STANDARD TABLE OF ty_s_product_result WITH EMPTY KEY,
      BEGIN OF ty_s_iteminfo,
        item_cd             TYPE c LENGTH 50,       "i_product-product                            고객사 판매코드(SKU or SKUID)[LOGI_ITEM_CD와 동일]
        strr_item_nm_ko     TYPE c LENGTH 385,      "I_ProductDescription-productdescription      고객사 판매품목명(한글)[LOGI_ITEM_NM_KO]
        strr_item_nm_en     TYPE c LENGTH 385,                                                    "고객사 판매품목명(ENG), 역직구/특송 고객사 해당[LOGI_ITEM_NM_EN]
        strr_item_nm_locale TYPE c LENGTH 768,                                                    "고객사 판매품목명(현지언어), 역직구/특송 고객사 해당[LOGI_ITEM_NM_LOCALE]
        owner_item_cd       TYPE c LENGTH 50,                                                     "고객사 품목코드
      END OF ty_s_iteminfo,
      ty_t_iteminfo TYPE STANDARD TABLE OF ty_s_iteminfo WITH EMPTY KEY,
      BEGIN OF ty_s_logisticsinfo,
        proc_flg                  TYPE c LENGTH 1,                 "품목의 상태 구분 (신규 U:수정 D:삭제)
        strr_item_strg_cd         TYPE c LENGTH 20,                "단위코드 (EA로 전송)
        logi_item_cd              TYPE c LENGTH 50,                "물류품목코드(ITEM_CD)
        logi_ordr_item_cd         TYPE c LENGTH 50,                "변경 시 원품목 코드
        logi_barcode              TYPE c LENGTH 50,                "물류바코드(스캔 가능), 없으면 미입력
        logi_item_nm_ko           TYPE c LENGTH 385,               "물류품목명
        logi_item_nm_en           TYPE c LENGTH 385,               "물류품목명(ENG), 해외 출고 센터용
        logi_item_nm_locale       TYPE c LENGTH 768,               "물류품목명(현지언어), 해외 출고 센터용
        logi_owner_item_cd        TYPE c LENGTH 50,                "고객내부코드
        logi_bom_qty              TYPE p LENGTH 11 DECIMALS 5,     "수량
        width                     TYPE p LENGTH 11 DECIMALS 5,     "너비(cm)
        height                    TYPE p LENGTH 11 DECIMALS 5,     "높이(cm)
        depth                     TYPE p LENGTH 11 DECIMALS 5,     "깊이(cm)
        vol                       TYPE p LENGTH 11 DECIMALS 5,     "부피(user-defined)
        upd_vol                   TYPE p LENGTH 11 DECIMALS 5,     "수정부피(user-defined)
        weight                    TYPE p LENGTH 11 DECIMALS 5,     "무게(kg)
        net_wt                    TYPE p LENGTH 11 DECIMALS 5,     "순무게(kg)
        box_qty                   TYPE p LENGTH 11 DECIMALS 5,     "박스입수(기본값:1)
        box_div_yn                TYPE c LENGTH 1,                 "박스주문분리(기본값:N)
        item_gcd                  TYPE c LENGTH 20,                "품목그룹코드(코드화 관리 시)
        item_gcdnm                TYPE c LENGTH 20,                "품목그룹명(미관리 시 X)
        item_gcd2                 TYPE c LENGTH 20,                "품목카테고리 코드 2
        item_gcdnm2               TYPE c LENGTH 20,                "품목카테고리명 2
        img_url                   TYPE c LENGTH 120,               "품목이미지URL(미관리 시 X)
        style                     TYPE c LENGTH 15,                "스타일(미관리 시 X)
        color                     TYPE c LENGTH 200,               "컬러(미관리 시 X)
        clothing_sizes            TYPE c LENGTH 20,                "사이즈(미관리 시 X)
        brand                     TYPE c LENGTH 20,                "브랜드(미관리 시 X)
        category                  TYPE c LENGTH 100,               "카테고리(미관리 시 X)
        vdt_flag                  TYPE c LENGTH 1,                 "유통기한 관리 여부 (N:미관리,P:생산일자,V:유통기한)
        vdt_period                TYPE i,                          "유효기간(일 기준)
        inb_shelf_life_tolerance  TYPE i,                          "입고 유통기한 오차
        outb_shelf_life_tolerance TYPE i,                          "출고 유통기한 오차
        suppr_id                  TYPE c LENGTH 15,                "공급처 코드
        suppr_nm                  TYPE c LENGTH 50,                "공급처명
        package_type              TYPE c LENGTH 10,                "POLY:폴리 포장, 그 외:BOX
        big_size_gds              TYPE c LENGTH 1,                 "이형품목여부(N:기본,Y:이형)
        outb_vas_yn               TYPE c LENGTH 2,                 "개별포장여부(Y,N,Q) 상세(01,51,52,71,72)
        pv_item_type              TYPE c LENGTH 1,                 "온도값(0:상온,1:냉장,2:냉동,9:기타)
        user_col1                 TYPE c LENGTH 100,               "고객사별 설정(별도 협의 없을 시 미사용)
        user_col2                 TYPE c LENGTH 100,               "〃
        user_col3                 TYPE c LENGTH 100,               "〃
        user_col4                 TYPE c LENGTH 100,               "〃
        user_col5                 TYPE c LENGTH 100,               "〃
        user_col6                 TYPE c LENGTH 100,               "〃
        user_col7                 TYPE c LENGTH 100,               "〃
        user_col8                 TYPE c LENGTH 100,               "〃
        user_col9                 TYPE c LENGTH 100,               "〃
        user_col10                TYPE c LENGTH 100,               "〃
        desc_print_nm             TYPE c LENGTH 385,               "출력용 품목명
        price                     TYPE decfloat34,                 "금액
        brand_nm                  TYPE c LENGTH 100,               "브랜드명
      END OF ty_s_logisticsinfo,
      ty_t_logisticsinfo TYPE STANDARD TABLE OF ty_s_logisticsinfo WITH EMPTY KEY,
      BEGIN OF ty_s_headerinfo,
        api_id         TYPE c LENGTH 20,                           "승인id(api 호출 식별용 cj it부여)
        security_cd    TYPE c LENGTH 30,                           "보안키(api 호출 식별용 cj it부여)
        wh_cd          TYPE c LENGTH 20,                           "보관창고 코드(api 호출 식별용 cj it부여)
        strr_id        TYPE c LENGTH 15,                           "고객사 코드(api 호출 식별용 cj it부여)
        item_flg       TYPE c LENGTH 1 ,                           "I:품목 b:bom 구조(기본값:i)
        _item_info     TYPE ty_t_iteminfo,
        _logisticsinfo TYPE ty_t_logisticsinfo,
      END OF ty_s_headerinfo.
    CLASS-METHODS transfer
      IMPORTING i_keys     TYPE any
      EXPORTING e_result   TYPE any
                e_mapped   TYPE any
                e_failed   TYPE any
                e_reported TYPE any.
    METHODS : constructor.

  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_mm_products_to_cjwms IMPLEMENTATION.

  METHOD transfer.
    DATA: lt_result TYPE TABLE FOR ACTION RESULT zmm_r_product\\product~transfer_cjwms,
          lt_keys   TYPE TABLE FOR ACTION IMPORT  zmm_r_product\\product~transfer_cjwms.
    lt_keys = i_keys.

    DATA(lo_payload_mapper) = NEW lcl_payload_mapper(  ).
********************************************************************** 1번 send_rest_request
    DATA(response) = zcl_http_outbound=>send_rest_request(
                                        iv_comm_scenario    = 'ZTEST_COM_EAI_WMS'
                                        iv_outbound_service = 'Z_TEST_OUTBOUND_CJWMS_REST'
                                        i_payload             = i_keys
                                        io_mapper           =  lo_payload_mapper
     ).
********************************************************************** 3번 get_request - test 용
*    DATA(response) = zcl_http_outbound=>get_http_rest( iv_comm_scenario    = 'ZTEST_COM_EAI_WMS'
*                   iv_outbound_service = 'Z_TEST_OUTBOUND_CJWMS_REST'
*                  ).

    LOOP AT lt_keys INTO DATA(ls_key).
      APPEND INITIAL LINE TO lt_result ASSIGNING FIELD-SYMBOL(<fs_result>).
      <fs_result>-%cid = ls_key-%cid.
      <fs_result>-%param-reason = response-status-reason.
      <fs_result>-%param-text = response-body.
      <fs_result>-%param-severity = COND #( WHEN response-status-code = 200 THEN 'S' ELSE 'E' ).
      IF <fs_result>-%param-severity = 'S'.
        lcl_payload_maker=>update_status( EXPORTING it_product = lo_payload_mapper->gt_products[ sy-index ]
                                 i_cid = ls_key-%cid
                       IMPORTING et_mapped = e_mapped
                                 et_failed = e_failed
                                 et_reported = e_reported ).
        IF e_failed IS NOT INITIAL.
          <fs_result>-%param = VALUE #( severity = 'E' reason = 'Failed' text = 'Failed To Update Status' ).
        ENDIF.
      ENDIF.
    ENDLOOP.
    e_result = lt_result.

  ENDMETHOD.



  METHOD if_oo_adt_classrun~main.
    out->write( |Run TRANSFER logic via action binding.| ).
  ENDMETHOD.

  METHOD constructor.


  ENDMETHOD.

ENDCLASS.

