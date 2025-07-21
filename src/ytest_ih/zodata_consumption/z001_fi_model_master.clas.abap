"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>Basic_Interface_Srv</em>
CLASS z001_fi_model_master DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of MASTER_2</p>
      BEGIN OF tys_value_controls_1,
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
      END OF tys_value_controls_1.

    TYPES:
      "! <p class="shorttext synchronized">Value Control Structure of PAYMENT_GATEWAY_2</p>
      BEGIN OF tys_value_controls_2,
        "! AUTH_VALUE
        auth_value  TYPE /iwbep/v4_value_control,
        "! PG_NAME
        pg_name     TYPE /iwbep/v4_value_control,
        "! BRAND_ID
        brand_id    TYPE /iwbep/v4_value_control,
        "! BRAND_NAME
        brand_name  TYPE /iwbep/v4_value_control,
        "! CREATED_AT
        created_at  TYPE /iwbep/v4_value_control,
        "! CREATED_BY
        created_by  TYPE /iwbep/v4_value_control,
        "! MODIFIED_AT
        modified_at TYPE /iwbep/v4_value_control,
        "! MODIFIED_BY
        modified_by TYPE /iwbep/v4_value_control,
      END OF tys_value_controls_2.

    TYPES:
      "! <p class="shorttext synchronized">Master</p>
      BEGIN OF tys_master_2,
        "! <em>Value Control Structure</em>
        value_controls         TYPE tys_value_controls_1,
        "! <em>Key property</em> brand_id
        brand_id               TYPE string,
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
        created_by             TYPE c LENGTH 255,
        "! modified_at
        modified_at            TYPE timestampl,
        "! modified_by
        modified_by            TYPE c LENGTH 255,
      END OF tys_master_2,
      "! <p class="shorttext synchronized">List of Master</p>
      tyt_master_2 TYPE STANDARD TABLE OF tys_master_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Payment_Gateway</p>
      BEGIN OF tys_payment_gateway_2,
        "! <em>Value Control Structure</em>
        value_controls TYPE tys_value_controls_2,
        "! <em>Key property</em> pg_id
        pg_id          TYPE string,
        "! <em>Key property</em> mid
        mid            TYPE string,
        "! auth_value
        auth_value     TYPE string,
        "! pg_name
        pg_name        TYPE string,
        "! brand_id
        brand_id       TYPE string,
        "! brand_name
        brand_name     TYPE string,
        "! created_at
        created_at     TYPE timestampl,
        "! created_by
        created_by     TYPE c LENGTH 255,
        "! modified_at
        modified_at    TYPE timestampl,
        "! modified_by
        modified_by    TYPE c LENGTH 255,
      END OF tys_payment_gateway_2,
      "! <p class="shorttext synchronized">List of Payment_Gateway</p>
      tyt_payment_gateway_2 TYPE STANDARD TABLE OF tys_payment_gateway_2 WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! Master
        "! <br/> Collection of type 'Master'
        master          TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'MASTER',
        "! Payment_Gateway
        "! <br/> Collection of type 'Payment_Gateway'
        payment_gateway TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'PAYMENT_GATEWAY',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for complex types</p>
      BEGIN OF gcs_complex_type,
         "! Dummy field - Structure must not be empty
         dummy TYPE int1 VALUE 0,
      END OF gcs_complex_type.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for Master</p>
        "! See also structure type {@link ..tys_master_2}
        BEGIN OF master_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF master_2,
        "! <p class="shorttext synchronized">Internal names for Payment_Gateway</p>
        "! See also structure type {@link ..tys_payment_gateway_2}
        BEGIN OF payment_gateway_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF payment_gateway_2,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define Master</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_master_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Payment_Gateway</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_payment_gateway_2 RAISING /iwbep/cx_gateway.

ENDCLASS.



CLASS Z001_FI_MODEL_MASTER IMPLEMENTATION.


  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'Basic_Interface_Srv' ) ##NO_TEXT.

    def_master_2( ).
    def_payment_gateway_2( ).

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
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.
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
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

  ENDMETHOD.


  METHOD def_payment_gateway_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'PAYMENT_GATEWAY_2'
                                    is_structure              = VALUE tys_payment_gateway_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'Payment_Gateway' ) ##NO_TEXT.
    lo_entity_type->create_complex_prop_for_vcs( 'VALUE_CONTROLS' ).


    lo_entity_set = lo_entity_type->create_entity_set( 'PAYMENT_GATEWAY' ).
    lo_entity_set->set_edm_name( 'Payment_Gateway' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'PG_ID' ).
    lo_primitive_property->set_edm_name( 'pg_id' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MID' ).
    lo_primitive_property->set_edm_name( 'mid' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'AUTH_VALUE' ).
    lo_primitive_property->set_edm_name( 'auth_value' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PG_NAME' ).
    lo_primitive_property->set_edm_name( 'pg_name' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
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

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_AT' ).
    lo_primitive_property->set_edm_name( 'created_at' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 7 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATED_BY' ).
    lo_primitive_property->set_edm_name( 'created_by' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.
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
    lo_primitive_property->set_max_length( 255 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->create_vcs_value_control( ).

  ENDMETHOD.
ENDCLASS.
