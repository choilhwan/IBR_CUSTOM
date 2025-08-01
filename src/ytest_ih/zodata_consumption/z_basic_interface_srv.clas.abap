"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>Basic_Interface_Srv</em>
CLASS z_basic_interface_srv DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">Types for "OData Primitive Types"</p>
      BEGIN OF tys_types_for_prim_types,
        "! Used for primitive type RETURN
        return TYPE string,
      END OF tys_types_for_prim_types.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of COMMON_GROUP_2</p>
      BEGIN OF tys_value_controls_1,
        "! REFERENCE_COLUMN
        reference_column TYPE /iwbep/v4_value_control,
        "! CREATED_AT
        created_at       TYPE /iwbep/v4_value_control,
        "! CREATED_BY
        created_by       TYPE /iwbep/v4_value_control,
        "! MODIFIED_AT
        modified_at      TYPE /iwbep/v4_value_control,
        "! MODIFIED_BY
        modified_by      TYPE /iwbep/v4_value_control,
        "! TO_DETAILS
        to_details       TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_1.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of COMMON_DETAIL_2</p>
      BEGIN OF tys_value_controls_2,
        "! DETAIL_ENG_NAME
        detail_eng_name TYPE /iwbep/v4_value_control,
        "! CREATED_AT
        created_at      TYPE /iwbep/v4_value_control,
        "! CREATED_BY
        created_by      TYPE /iwbep/v4_value_control,
        "! MODIFIED_AT
        modified_at     TYPE /iwbep/v4_value_control,
        "! MODIFIED_BY
        modified_by     TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_2.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of MASTER_2</p>
      BEGIN OF tys_value_controls_3,
        "! BRAND_NAME
        brand_name             TYPE /iwbep/v4_value_control,
        "! COMPANY_ID
        company_id             TYPE /iwbep/v4_value_control,
        "! COMPANY_NAME
        company_name           TYPE /iwbep/v4_value_control,
        "! MALL_TYPE_CD
        mall_type_cd           TYPE /iwbep/v4_value_control,
        "! MALL_TYPE_NAME
        mall_type_name         TYPE /iwbep/v4_value_control,
        "! MALL_COUNTRY_CD
        mall_country_cd        TYPE /iwbep/v4_value_control,
        "! PLATFORM_ID
        platform_id            TYPE /iwbep/v4_value_control,
        "! PLATFORM_NAME
        platform_name          TYPE /iwbep/v4_value_control,
        "! AVAILABLE_WAREHOUSE_CD
        available_warehouse_cd TYPE /iwbep/v4_value_control,
        "! DELIVERY_WHAREHOUSE_CD
        delivery_wharehouse_cd TYPE /iwbep/v4_value_control,
        "! RETURN_WAREHOUSE_CD
        return_warehouse_cd    TYPE /iwbep/v4_value_control,
        "! PG_ID
        pg_id                  TYPE /iwbep/v4_value_control,
        "! PG_NAME
        pg_name                TYPE /iwbep/v4_value_control,
        "! CREATED_AT
        created_at             TYPE /iwbep/v4_value_control,
        "! CREATED_BY
        created_by             TYPE /iwbep/v4_value_control,
        "! MODIFIED_AT
        modified_at            TYPE /iwbep/v4_value_control,
        "! MODIFIED_BY
        modified_by            TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_3.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of EXTERNAL_SYSTEM_2</p>
      BEGIN OF tys_value_controls_4,
        "! SYSTEM_CD
        system_cd                TYPE /iwbep/v4_value_control,
        "! API_TYPE
        api_type                 TYPE /iwbep/v4_value_control,
        "! API_ENDPOINT
        api_endpoint             TYPE /iwbep/v4_value_control,
        "! ENDPOINT_DESCRIPTION
        endpoint_description     TYPE /iwbep/v4_value_control,
        "! PG_KEY
        pg_key                   TYPE /iwbep/v4_value_control,
        "! BUCKET_ID
        bucket_id                TYPE /iwbep/v4_value_control,
        "! REFRESH_TOKEN
        refresh_token            TYPE /iwbep/v4_value_control,
        "! REFRESH_TOKEN_EXPIRES_AT
        refresh_token_expires_at TYPE /iwbep/v4_value_control,
        "! ACCESS_TOKEN
        access_token             TYPE /iwbep/v4_value_control,
        "! ACCESS_TOKEN_EXPIRES_AT
        access_token_expires_at  TYPE /iwbep/v4_value_control,
        "! USE_YN
        use_yn                   TYPE /iwbep/v4_value_control,
        "! CREATED_AT
        created_at               TYPE /iwbep/v4_value_control,
        "! CREATED_BY
        created_by               TYPE /iwbep/v4_value_control,
        "! MODIFIED_AT
        modified_at              TYPE /iwbep/v4_value_control,
        "! MODIFIED_BY
        modified_by              TYPE /iwbep/v4_value_control,
        "! TO_MALLS
        to_malls                 TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_4.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of MALL_2</p>
      BEGIN OF tys_value_controls_5,
        "! ADJUSTMENT_FEE
        adjustment_fee TYPE /iwbep/v4_value_control,
        "! BRAND_ID
        brand_id       TYPE /iwbep/v4_value_control,
        "! BRAND_NAME
        brand_name     TYPE /iwbep/v4_value_control,
        "! COMPANY_ID
        company_id     TYPE /iwbep/v4_value_control,
        "! COMPANY_NAME
        company_name   TYPE /iwbep/v4_value_control,
        "! USE_YN
        use_yn         TYPE /iwbep/v4_value_control,
        "! CREATED_AT
        created_at     TYPE /iwbep/v4_value_control,
        "! CREATED_BY
        created_by     TYPE /iwbep/v4_value_control,
        "! MODIFIED_AT
        modified_at    TYPE /iwbep/v4_value_control,
        "! MODIFIED_BY
        modified_by    TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_5.

    TYPES:
      "! <p class="shorttext synchronized">Common_Detail</p>
      BEGIN OF tys_common_detail_2,
        "! <em>Value Control Structure</em>
        value_controls  TYPE tys_value_controls_2,
        "! <em>Key property</em> group_cd
        group_cd        TYPE c LENGTH 3,
        "! <em>Key property</em> detail_cd
        detail_cd       TYPE c LENGTH 30,
        "! detail_kor_name
        detail_kor_name TYPE string,
        "! detail_eng_name
        detail_eng_name TYPE string,
        "! created_at
        created_at      TYPE timestampl,
        "! created_by
        created_by      TYPE string,
        "! modified_at
        modified_at     TYPE timestampl,
        "! modified_by
        modified_by     TYPE string,
      END OF tys_common_detail_2,
      "! <p class="shorttext synchronized">List of Common_Detail</p>
      tyt_common_detail_2 TYPE STANDARD TABLE OF tys_common_detail_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Common_Group</p>
      BEGIN OF tys_common_group_2,
        "! <em>Value Control Structure</em>
        value_controls   TYPE tys_value_controls_1,
        "! <em>Key property</em> group_cd
        group_cd         TYPE c LENGTH 3,
        "! group_name
        group_name       TYPE string,
        "! reference_column
        reference_column TYPE string,
        "! system_id
        system_id        TYPE c LENGTH 10,
        "! created_at
        created_at       TYPE timestampl,
        "! created_by
        created_by       TYPE string,
        "! modified_at
        modified_at      TYPE timestampl,
        "! modified_by
        modified_by      TYPE string,
      END OF tys_common_group_2,
      "! <p class="shorttext synchronized">List of Common_Group</p>
      tyt_common_group_2 TYPE STANDARD TABLE OF tys_common_group_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">External_System</p>
      BEGIN OF tys_external_system_2,
        "! <em>Value Control Structure</em>
        value_controls           TYPE tys_value_controls_4,
        "! <em>Key property</em> system_id
        system_id                TYPE c LENGTH 10,
        "! <em>Key property</em> seq
        seq                      TYPE int4,
        "! system_name
        system_name              TYPE string,
        "! system_cd
        system_cd                TYPE c LENGTH 2,
        "! api_type
        api_type                 TYPE c LENGTH 1,
        "! api_endpoint
        api_endpoint             TYPE string,
        "! endpoint_description
        endpoint_description     TYPE string,
        "! pg_key
        pg_key                   TYPE c LENGTH 100,
        "! bucket_id
        bucket_id                TYPE c LENGTH 10,
        "! refresh_token
        refresh_token            TYPE c LENGTH 500,
        "! refresh_token_expires_at
        refresh_token_expires_at TYPE timestampl,
        "! access_token
        access_token             TYPE c LENGTH 1000,
        "! access_token_expires_at
        access_token_expires_at  TYPE timestampl,
        "! use_yn
        use_yn                   TYPE c LENGTH 1,
        "! created_at
        created_at               TYPE timestampl,
        "! created_by
        created_by               TYPE string,
        "! modified_at
        modified_at              TYPE timestampl,
        "! modified_by
        modified_by              TYPE string,
      END OF tys_external_system_2,
      "! <p class="shorttext synchronized">List of External_System</p>
      tyt_external_system_2 TYPE STANDARD TABLE OF tys_external_system_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Mall</p>
      BEGIN OF tys_mall_2,
        "! <em>Value Control Structure</em>
        value_controls TYPE tys_value_controls_5,
        "! <em>Key property</em> system_id
        system_id      TYPE c LENGTH 10,
        "! <em>Key property</em> seq
        seq            TYPE int4,
        "! <em>Key property</em> mall_id
        mall_id        TYPE c LENGTH 30,
        "! auth_value
        auth_value     TYPE string,
        "! adjustment_fee
        adjustment_fee TYPE p LENGTH 3 DECIMALS 2,
        "! brand_id
        brand_id       TYPE string,
        "! brand_name
        brand_name     TYPE string,
        "! company_id
        company_id     TYPE string,
        "! company_name
        company_name   TYPE string,
        "! use_yn
        use_yn         TYPE c LENGTH 1,
        "! created_at
        created_at     TYPE timestampl,
        "! created_by
        created_by     TYPE string,
        "! modified_at
        modified_at    TYPE timestampl,
        "! modified_by
        modified_by    TYPE string,
      END OF tys_mall_2,
      "! <p class="shorttext synchronized">List of Mall</p>
      tyt_mall_2 TYPE STANDARD TABLE OF tys_mall_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Master</p>
      BEGIN OF tys_master_2,
        "! <em>Value Control Structure</em>
        value_controls         TYPE tys_value_controls_3,
        "! <em>Key property</em> brand_id
        brand_id               TYPE c LENGTH 10,
        "! brand_name
        brand_name             TYPE string,
        "! company_id
        company_id             TYPE string,
        "! company_name
        company_name           TYPE string,
        "! mall_type_cd
        mall_type_cd           TYPE string,
        "! mall_type_name
        mall_type_name         TYPE string,
        "! mall_country_cd
        mall_country_cd        TYPE string,
        "! platform_id
        platform_id            TYPE string,
        "! platform_name
        platform_name          TYPE string,
        "! available_warehouse_cd
        available_warehouse_cd TYPE string,
        "! delivery_wharehouse_cd
        delivery_wharehouse_cd TYPE string,
        "! return_warehouse_cd
        return_warehouse_cd    TYPE string,
        "! pg_id
        pg_id                  TYPE string,
        "! pg_name
        pg_name                TYPE string,
        "! created_at
        created_at             TYPE timestampl,
        "! created_by
        created_by             TYPE string,
        "! modified_at
        modified_at            TYPE timestampl,
        "! modified_by
        modified_by            TYPE string,
      END OF tys_master_2,
      "! <p class="shorttext synchronized">List of Master</p>
      tyt_master_2 TYPE STANDARD TABLE OF tys_master_2 WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! Common_Detail
        "! <br/> Collection of type 'Common_Detail'
        common_detail   TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'COMMON_DETAIL',
        "! Common_Group
        "! <br/> Collection of type 'Common_Group'
        common_group    TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'COMMON_GROUP',
        "! External_System
        "! <br/> Collection of type 'External_System'
        external_system TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'EXTERNAL_SYSTEM',
        "! Mall
        "! <br/> Collection of type 'Mall'
        mall            TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'MALL',
        "! Master
        "! <br/> Collection of type 'Master'
        master          TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'MASTER',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the function imports</p>
      BEGIN OF gcs_function_import,
        "! getFlexToken
        get_flex_token_2 TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'GET_FLEX_TOKEN_2',
      END OF gcs_function_import.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the bound functions</p>
      BEGIN OF gcs_bound_function,
         "! Dummy field - Structure must not be empty
         dummy TYPE int1 VALUE 0,
      END OF gcs_bound_function.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for complex types</p>
      BEGIN OF gcs_complex_type,
         "! Dummy field - Structure must not be empty
         dummy TYPE int1 VALUE 0,
      END OF gcs_complex_type.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for Common_Detail</p>
        "! See also structure type {@link ..tys_common_detail_2}
        BEGIN OF common_detail_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF common_detail_2,
        "! <p class="shorttext synchronized">Internal names for Common_Group</p>
        "! See also structure type {@link ..tys_common_group_2}
        BEGIN OF common_group_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_details
            to_details TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_DETAILS',
          END OF navigation,
        END OF common_group_2,
        "! <p class="shorttext synchronized">Internal names for External_System</p>
        "! See also structure type {@link ..tys_external_system_2}
        BEGIN OF external_system_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_malls
            to_malls TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_MALLS',
          END OF navigation,
        END OF external_system_2,
        "! <p class="shorttext synchronized">Internal names for Mall</p>
        "! See also structure type {@link ..tys_mall_2}
        BEGIN OF mall_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF mall_2,
        "! <p class="shorttext synchronized">Internal names for Master</p>
        "! See also structure type {@link ..tys_master_2}
        BEGIN OF master_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF master_2,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define Common_Detail</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_common_detail_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Common_Group</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_common_group_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define External_System</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_external_system_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Mall</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_mall_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Master</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_master_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define getFlexToken</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_get_flex_token RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define all primitive types</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS define_primitive_types RAISING /iwbep/cx_gateway.

ENDCLASS.


CLASS z_basic_interface_srv IMPLEMENTATION.

  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'Basic_Interface_Srv' ) ##NO_TEXT.

    def_common_detail_2( ).
    def_common_group_2( ).
    def_external_system_2( ).
    def_mall_2( ).
    def_master_2( ).
    def_get_flex_token( ).
    define_primitive_types( ).

  ENDMETHOD.


  METHOD def_common_detail_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'COMMON_DETAIL_2'
                                    is_structure              = VALUE tys_common_detail_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Common_Detail' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'COMMON_DETAIL' ).
    lo_entity_set->set_edm_name( 'Common_Detail' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'GROUP_CD' ).
    lo_primitive_property->set_edm_name( 'group_cd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DETAIL_CD' ).
    lo_primitive_property->set_edm_name( 'detail_cd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DETAIL_KOR_NAME' ).
    lo_primitive_property->set_edm_name( 'detail_kor_name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DETAIL_ENG_NAME' ).
    lo_primitive_property->set_edm_name( 'detail_eng_name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_AT' ).
    lo_primitive_property->set_edm_name( 'created_at' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY' ).
    lo_primitive_property->set_edm_name( 'created_by' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MODIFIED_AT' ).
    lo_primitive_property->set_edm_name( 'modified_at' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MODIFIED_BY' ).
    lo_primitive_property->set_edm_name( 'modified_by' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

  ENDMETHOD.


  METHOD def_common_group_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'COMMON_GROUP_2'
                                    is_structure              = VALUE tys_common_group_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Common_Group' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'COMMON_GROUP' ).
    lo_entity_set->set_edm_name( 'Common_Group' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'GROUP_CD' ).
    lo_primitive_property->set_edm_name( 'group_cd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GROUP_NAME' ).
    lo_primitive_property->set_edm_name( 'group_name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFERENCE_COLUMN' ).
    lo_primitive_property->set_edm_name( 'reference_column' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SYSTEM_ID' ).
    lo_primitive_property->set_edm_name( 'system_id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_AT' ).
    lo_primitive_property->set_edm_name( 'created_at' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY' ).
    lo_primitive_property->set_edm_name( 'created_by' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MODIFIED_AT' ).
    lo_primitive_property->set_edm_name( 'modified_at' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MODIFIED_BY' ).
    lo_primitive_property->set_edm_name( 'modified_by' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_DETAILS' ).
    lo_navigation_property->set_edm_name( 'to_details' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'COMMON_DETAIL_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

  ENDMETHOD.


  METHOD def_external_system_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'EXTERNAL_SYSTEM_2'
                                    is_structure              = VALUE tys_external_system_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'External_System' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'EXTERNAL_SYSTEM' ).
    lo_entity_set->set_edm_name( 'External_System' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SYSTEM_ID' ).
    lo_primitive_property->set_edm_name( 'system_id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SEQ' ).
    lo_primitive_property->set_edm_name( 'seq' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SYSTEM_NAME' ).
    lo_primitive_property->set_edm_name( 'system_name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SYSTEM_CD' ).
    lo_primitive_property->set_edm_name( 'system_cd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'API_TYPE' ).
    lo_primitive_property->set_edm_name( 'api_type' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'API_ENDPOINT' ).
    lo_primitive_property->set_edm_name( 'api_endpoint' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ENDPOINT_DESCRIPTION' ).
    lo_primitive_property->set_edm_name( 'endpoint_description' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PG_KEY' ).
    lo_primitive_property->set_edm_name( 'pg_key' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 100 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUCKET_ID' ).
    lo_primitive_property->set_edm_name( 'bucket_id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFRESH_TOKEN' ).
    lo_primitive_property->set_edm_name( 'refresh_token' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 500 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFRESH_TOKEN_EXPIRES_AT' ).
    lo_primitive_property->set_edm_name( 'refresh_token_expires_at' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCESS_TOKEN' ).
    lo_primitive_property->set_edm_name( 'access_token' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1000 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCESS_TOKEN_EXPIRES_AT' ).
    lo_primitive_property->set_edm_name( 'access_token_expires_at' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'USE_YN' ).
    lo_primitive_property->set_edm_name( 'use_yn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_AT' ).
    lo_primitive_property->set_edm_name( 'created_at' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY' ).
    lo_primitive_property->set_edm_name( 'created_by' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MODIFIED_AT' ).
    lo_primitive_property->set_edm_name( 'modified_at' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MODIFIED_BY' ).
    lo_primitive_property->set_edm_name( 'modified_by' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_MALLS' ).
    lo_navigation_property->set_edm_name( 'to_malls' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'MALL_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).
    lo_navigation_property->create_vcs_value_control( ).

  ENDMETHOD.


  METHOD def_mall_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'MALL_2'
                                    is_structure              = VALUE tys_mall_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Mall' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'MALL' ).
    lo_entity_set->set_edm_name( 'Mall' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SYSTEM_ID' ).
    lo_primitive_property->set_edm_name( 'system_id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SEQ' ).
    lo_primitive_property->set_edm_name( 'seq' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Int32' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MALL_ID' ).
    lo_primitive_property->set_edm_name( 'mall_id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUTH_VALUE' ).
    lo_primitive_property->set_edm_name( 'auth_value' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ADJUSTMENT_FEE' ).
    lo_primitive_property->set_edm_name( 'adjustment_fee' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRAND_ID' ).
    lo_primitive_property->set_edm_name( 'brand_id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRAND_NAME' ).
    lo_primitive_property->set_edm_name( 'brand_name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_ID' ).
    lo_primitive_property->set_edm_name( 'company_id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_NAME' ).
    lo_primitive_property->set_edm_name( 'company_name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'USE_YN' ).
    lo_primitive_property->set_edm_name( 'use_yn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_AT' ).
    lo_primitive_property->set_edm_name( 'created_at' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY' ).
    lo_primitive_property->set_edm_name( 'created_by' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MODIFIED_AT' ).
    lo_primitive_property->set_edm_name( 'modified_at' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MODIFIED_BY' ).
    lo_primitive_property->set_edm_name( 'modified_by' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

  ENDMETHOD.


  METHOD def_master_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'MASTER_2'
                                    is_structure              = VALUE tys_master_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Master' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'MASTER' ).
    lo_entity_set->set_edm_name( 'Master' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRAND_ID' ).
    lo_primitive_property->set_edm_name( 'brand_id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BRAND_NAME' ).
    lo_primitive_property->set_edm_name( 'brand_name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_ID' ).
    lo_primitive_property->set_edm_name( 'company_id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_NAME' ).
    lo_primitive_property->set_edm_name( 'company_name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MALL_TYPE_CD' ).
    lo_primitive_property->set_edm_name( 'mall_type_cd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MALL_TYPE_NAME' ).
    lo_primitive_property->set_edm_name( 'mall_type_name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MALL_COUNTRY_CD' ).
    lo_primitive_property->set_edm_name( 'mall_country_cd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLATFORM_ID' ).
    lo_primitive_property->set_edm_name( 'platform_id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLATFORM_NAME' ).
    lo_primitive_property->set_edm_name( 'platform_name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AVAILABLE_WAREHOUSE_CD' ).
    lo_primitive_property->set_edm_name( 'available_warehouse_cd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_WHAREHOUSE_CD' ).
    lo_primitive_property->set_edm_name( 'delivery_wharehouse_cd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETURN_WAREHOUSE_CD' ).
    lo_primitive_property->set_edm_name( 'return_warehouse_cd' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PG_ID' ).
    lo_primitive_property->set_edm_name( 'pg_id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PG_NAME' ).
    lo_primitive_property->set_edm_name( 'pg_name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_AT' ).
    lo_primitive_property->set_edm_name( 'created_at' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY' ).
    lo_primitive_property->set_edm_name( 'created_by' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MODIFIED_AT' ).
    lo_primitive_property->set_edm_name( 'modified_at' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MODIFIED_BY' ).
    lo_primitive_property->set_edm_name( 'modified_by' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

  ENDMETHOD.


  METHOD def_get_flex_token.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'GET_FLEX_TOKEN' ).
    lo_function->set_edm_name( 'getFlexToken' ) ##NO_TEXT.

    lo_function_import = lo_function->create_function_import( 'GET_FLEX_TOKEN_2' ).
    lo_function_import->set_edm_name( 'getFlexToken' ) ##NO_TEXT.


    lo_return = lo_function->create_return( ).
    lo_return->set_primitive_type( 'RETURN' ).
    lo_return->set_is_nullable( ).

  ENDMETHOD.


  METHOD define_primitive_types.

    DATA lo_primitive_type TYPE REF TO /iwbep/if_v4_pm_prim_type.


    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'RETURN'
                            iv_element             = VALUE tys_types_for_prim_types-return( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.

  ENDMETHOD.

ENDCLASS.
