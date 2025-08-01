CLASS zcl_btp_basic_interface DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      get_master IMPORTING keys TYPE any,
      send_master IMPORTING keys TYPE any.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_btp_basic_interface IMPLEMENTATION.

  METHOD get_master.

  ENDMETHOD.

  METHOD send_master.




DATA:
  ls_business_data TYPE zscm_btp_basic_interface=>tys_master_2,
  lo_http_client   TYPE REF TO if_web_http_client,
  lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
  lo_request       TYPE REF TO /iwbep/if_cp_request_create,
  lo_response      TYPE REF TO /iwbep/if_cp_response_create.



TRY.
" Create http client
DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
                                             comm_scenario  = 'Z_OBS_ODATA_IBR_BTP'
*                                             comm_system_id = '<Comm System Id>'
                                             service_id     = 'Z_OBS_IBR_BTP_REST' ).
lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v4_remote_proxy(
  EXPORTING
     is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                         proxy_model_id      = 'ZSCM_BTP_BASIC_INTERFACE'
                                         proxy_model_version = '0001' )
    io_http_client             = lo_http_client
    iv_relative_service_root   = '/basic' ).

ASSERT lo_http_client IS BOUND.

DATA(today) = cl_abap_context_info=>get_system_date( ).
data:lv_timel type timestampl.


get TIME STAMP FIELD lv_timel.
ls_business_data = CORRESPONDING #( keys ).
* Prepare business data
*ls_business_data = VALUE #(
*          brand_id                = 'test1'
*          brand_name              = 'test1'
*          company_id              = 'CompanyId'
*          company_name            = 'CompanyName'
*          mall_type_cd            = 'MallTypeCd'
*          mall_type_name          = 'MallTypeName'
*          mall_country_cd         = 'MallCountryCd'
*          platform_id             = 'PlatformId'
*          platform_name           = 'PlatformName'
*          available_warehouse_cd  = 'AvailableWarehouseCd'
*          delivery_wharehouse_cd  = 'DeliveryWharehouseCd'
*          return_warehouse_cd     = 'ReturnWarehouseCd'
*          pg_id                   = 'PgId'
*          pg_name                 = 'PgName'
*          created_at              = lv_timel
*          created_by              = 'CreatedBy'
*          modified_at             = lv_timel
*          modified_by             = 'ModifiedBy' ).

" Navigate to the resource and create a request for the create operation
lo_request = lo_client_proxy->create_resource_for_entity_set( 'MASTER' )->create_request_for_create( ).

" Set the business data for the created entity
lo_request->set_business_data( ls_business_data ).

" Execute the request
lo_response = lo_request->execute( ).

" Get the after image
*lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
" Handle remote Exception
" It contains details about the problems of your http(s) connection


CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
" Handle Exception

CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
" Handle Exception
RAISE SHORTDUMP lx_web_http_client_error.

ENDTRY.

  ENDMETHOD.

ENDCLASS.
