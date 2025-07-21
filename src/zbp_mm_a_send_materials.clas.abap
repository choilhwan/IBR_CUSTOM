CLASS zbp_mm_a_send_materials DEFINITION PUBLIC ABSTRACT FINAL FOR BEHAVIOR OF zmm_a_send_materials.
  PUBLIC SECTION.
    TYPES: BEGIN OF ty_logi_item_info,
             proc_flg                  TYPE c LENGTH 1,
             strr_item_strg_cd         TYPE string,
             logi_item_cd              TYPE string,
             logi_ordr_item_cd         TYPE string,
             logi_barcode              TYPE string,
             logi_item_nm_ko           TYPE string,
             logi_item_nm_en           TYPE string,
             logi_item_nm_locale       TYPE string,
             logi_owner_item_cd        TYPE string,
             logi_bom_qty              TYPE decfloat34,
             width                     TYPE decfloat34,
             height                    TYPE decfloat34,
             depth                     TYPE decfloat34,
             vol                       TYPE decfloat34,
             upd_vol                   TYPE decfloat34,
             weight                    TYPE decfloat34,
             net_wt                    TYPE decfloat34,
             box_qty                   TYPE decfloat34,
             box_div_yn                TYPE c LENGTH 1,
             item_gcd                  TYPE string,
             item_gcdnm                TYPE string,
             item_gcd2                 TYPE string,
             item_gcdnm2               TYPE string,
             img_url                   TYPE string,
             style                     TYPE string,
             color                     TYPE string,
             clothing_sizes            TYPE string,
             brand                     TYPE string,
             category                  TYPE string,
             vdt_flag                  TYPE c LENGTH 1,
             vdt_period                TYPE int4,
             inb_shelf_life_tolerance  TYPE int4,
             outb_shelf_life_tolerance TYPE int4,
             suppr_id                  TYPE string,
             suppr_nm                  TYPE string,
             package_type              TYPE string,
             big_size_gds              TYPE c LENGTH 1,
             outb_vas_yn               TYPE string,
             pv_item_type              TYPE c LENGTH 1,
             user_col1                 TYPE string,
             user_col2                 TYPE string,
             user_col3                 TYPE string,
             user_col4                 TYPE string,
             user_col5                 TYPE string,
             user_col6                 TYPE string,
             user_col7                 TYPE string,
             user_col8                 TYPE string,
             user_col9                 TYPE string,
             user_col10                TYPE string,
             desc_print_nm             TYPE string,
*             price                     TYPE p LENGTH 17 DECIMALS 5, "아밥 p타입은 렝스가 16으로 제한됨
             price                     TYPE decfloat34,
             brand_nm                  TYPE string,
           END OF ty_logi_item_info.

    TYPES: BEGIN OF ty_item_info,
             item_cd             TYPE string,
             strr_item_nm_ko     TYPE string,
             strr_item_nm_en     TYPE string,
             strr_item_nm_locale TYPE string,
             owner_item_cd       TYPE string,
           END OF ty_item_info.

    TYPES: ty_t_item_info        TYPE STANDARD TABLE OF ty_item_info        WITH DEFAULT KEY.
    TYPES: ty_t_logi_item_info   TYPE STANDARD TABLE OF ty_logi_item_info   WITH DEFAULT KEY.

    TYPES: BEGIN OF ty_payload,
             api_id         TYPE string,
             security_cd    TYPE string,
             wh_cd          TYPE string,
             strr_id        TYPE string,
             item_flg       TYPE c LENGTH 1,
             item_info      TYPE ty_t_item_info,        " ← 별도 배열
             logi_item_info TYPE ty_t_logi_item_info,   " ← 별도 배열
           END OF ty_payload.
ENDCLASS.



CLASS ZBP_MM_A_SEND_MATERIALS IMPLEMENTATION.
ENDCLASS.
