"!@testing SRVB:ZMM_UI_PRODUCTPLANT_O4
CLASS ltc_CREATE DEFINITION FINAL FOR TESTING DURATION SHORT RISK LEVEL HARMLESS.

PRIVATE SECTION.


METHODS:
 CREATE FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_CREATE IMPLEMENTATION.


METHOD CREATE.
DATA:
  ls_business_data TYPE ZMM_R_PRODUCTPLANT,
  lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
  lo_request       TYPE REF TO /iwbep/if_cp_request_create,
  lo_response      TYPE REF TO /iwbep/if_cp_response_create.


lo_client_proxy = /iwbep/cl_cp_factory_unit_tst=>create_v4_local_proxy(
                EXPORTING
                  is_service_key     = VALUE #( service_id      = 'ZMM_UI_PRODUCTPLANT'
                                                repository_id   = 'SRVD'
                                                service_version = '0001' )
                   iv_do_write_traces = abap_true ).


* Prepare business data
ls_business_data = VALUE #(
          product                         = 'Product'
          plant                           = 'Plant'
          purchasinggroup                 = 'Purchasinggroup'
          countryoforigin                 = 'Countryoforigin'
          regionoforigin                  = 'Regionoforigin'
          productioninvtrymanagedloc      = 'Productioninvtrymanagedloc'
          profilecode                     = 'Profilecode'
          profilevaliditystartdate        = '20170101'
          availabilitychecktype           = 'Availabilitychecktype'
          fiscalyearvariant               = 'Fiscalyearvariant'
          periodtype                      = 'Periodtype'
          profitcenter                    = 'Profitcenter'
          goodsreceiptduration            = '1'
          maintenancestatusname           = 'Maintenancestatusname'
          ismarkedfordeletion             = abap_true
          mrptype                         = 'Mrptype'
          mrpresponsible                  = 'Mrpresponsible'
          abcindicator                    = 'Abcindicator'
          minimumlotsizequantity          = '1'
          maximumlotsizequantity          = '1'
          fixedlotsizequantity            = '1'
          consumptiontaxctrlcode          = 'Consumptiontaxctrlcode'
          iscoproduct                     = abap_true
          configurableproduct             = 'Configurableproduct'
          stockdeterminationgroup         = 'Stockdeterminationgroup'
          hasposttoinspectionstock        = abap_true
          isbatchmanagementrequired       = abap_true
          serialnumberprofile             = 'Serialnumberprofile'
          isnegativestockallowed          = abap_true
          hasconsignmentctrl              = 'Hasconsignmentctrl'
          ispurgacrosspurggroup           = abap_true
          isinternalbatchmanaged          = abap_true
          productcfopcategory             = 'Productcfopcategory'
          productisexcisetaxrelevant      = abap_true
          underdelivtolerancelimit        = '1'
          overdelivtolerancelimit         = '1'
          procurementtype                 = 'Procurementtype'
          specialprocurementtype          = 'Specialprocurementtype'
          productionschedulingprofile     = 'Productionschedulingprofile'
          productionsupervisor            = 'Productionsupervisor'
          safetystockquantity             = '1'
          goodsissueunit                  = 'Goodsissueunit'
          sourceofsupplycategory          = 'Sourceofsupplycategory'
          consumptionreferenceproduct     = 'Consumptionreferenceproduct'
          consumptionreferenceplant       = 'Consumptionreferenceplant'
          consumptionrefusageenddate      = '20170101'
          consumptionqtymultiplier        = '1'
          productunitgroup                = 'Productunitgroup'
          distrcntrdistributionprofile    = 'Distrcntrdistributionprofile'
          goodissueprocessingdays         = '1'
          planneddeliverydurationindays   = '1'
          productiscriticalprt            = abap_true
          productlogisticshandlinggroup   = 'Productlogisticshandlinggroup'
          materialfreightgroup            = 'Materialfreightgroup'
          originalbatchreferencematerial  = 'Originalbatchreferencematerial'
          origlbatchmanagementisrequired  = 'Origlbatchmanagementisrequired'
          productconfiguration            = '1'
          productmincontroltemperature    = '1'
          productmaxcontroltemperature    = '1'
          productcontroltemperatureunit   = 'Productcontroltemperatureunit'
          valuationcategory               = 'Valuationcategory'
          baseunit                        = 'Baseunit'
          itemuniqueidentifierisrelevant  = 'Itemuniqueidentifierisrelevant'
          itemuniqueidentifiertype        = 'Itemuniqueidentifiertype'
          extallocofitmunqidtisrelevant   = 'Extallocofitmunqidtisrelevant'
          yy1_transferdate_plt            = '20170101'
          yy1_transferstatus_plt          = 'Yy1TransferstatusPlt'
          createdbyuser                   = 'Createdbyuser'
          creationdatetime                = 20170101123000
          lastchangedbyuser               = 'Lastchangedbyuser'
          lastchangedatetime              = 20170101123000 ).

" Navigate to the resource and create a request for the create operation
lo_request = lo_client_proxy->create_resource_for_entity_set( 'PRODUCTPLANT' )->create_request_for_create( ).

" Set the business data for the created entity
lo_request->set_business_data( ls_business_data ).

" Execute the request
lo_response = lo_request->execute( ).

" Get the after image
*lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

cl_abap_unit_assert=>fail( 'Implement your assertions' ).
ENDMETHOD.

ENDCLASS.

"!@testing SRVB:ZMM_UI_PRODUCTPLANT_O4
CLASS ltc_READ_ENTITY DEFINITION FINAL FOR TESTING DURATION SHORT RISK LEVEL HARMLESS.

PRIVATE SECTION.


METHODS:
 READ_ENTITY FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_READ_ENTITY IMPLEMENTATION.


METHOD READ_ENTITY.
DATA:
  ls_entity_key    TYPE ZMM_R_PRODUCTPLANT,
  ls_business_data TYPE ZMM_R_PRODUCTPLANT,
  lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
  lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
  lo_request       TYPE REF TO /iwbep/if_cp_request_read,
  lo_response      TYPE REF TO /iwbep/if_cp_response_read.



     lo_client_proxy = /iwbep/cl_cp_factory_unit_tst=>create_v4_local_proxy(
                     EXPORTING
                       is_service_key     = VALUE #( service_id      = 'ZMM_UI_PRODUCTPLANT'
                                                     repository_id   = 'SRVD'
                                                     service_version = '0001' )
                        iv_do_write_traces = abap_true ).


" Set entity key
ls_entity_key = VALUE #(
          product  = 'Product'
          plant    = 'Plant' ).

" Navigate to the resource
lo_resource = lo_client_proxy->create_resource_for_entity_set( 'PRODUCTPLANT' )->navigate_with_key( ls_entity_key ).

" Execute the request and retrieve the business data
lo_response = lo_resource->create_request_for_read( )->execute( ).
lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

cl_abap_unit_assert=>fail( 'Implement your assertions' ).
ENDMETHOD.

ENDCLASS.

"!@testing SRVB:ZMM_UI_PRODUCTPLANT_O4
CLASS ltc_READ_LIST DEFINITION FINAL FOR TESTING DURATION SHORT RISK LEVEL HARMLESS.

PRIVATE SECTION.


METHODS:
 READ_LIST FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_READ_LIST IMPLEMENTATION.


METHOD READ_LIST.
DATA:
  lt_business_data TYPE TABLE OF ZMM_R_PRODUCTPLANT,
  lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
  lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
  lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

*DATA:
* lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
* lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
* lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
* lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
* lt_range_PRODUCT TYPE RANGE OF productnumber,
* lt_range_PLANT TYPE RANGE OF werks_d.



     lo_client_proxy = /iwbep/cl_cp_factory_unit_tst=>create_v4_local_proxy(
                     EXPORTING
                       is_service_key     = VALUE #( service_id      = 'ZMM_UI_PRODUCTPLANT'
                                                     repository_id   = 'SRVD'
                                                     service_version = '0001' )
                        iv_do_write_traces = abap_true ).


" Navigate to the resource and create a request for the read operation
lo_request = lo_client_proxy->create_resource_for_entity_set( 'PRODUCTPLANT' )->create_request_for_read( ).

" Create the filter tree
*lo_filter_factory = lo_request->create_filter_factory( ).
*
*lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'PRODUCT'
*                                                        it_range             = lt_range_PRODUCT ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'PLANT'
*                                                        it_range             = lt_range_PLANT ).

*lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
*lo_request->set_filter( lo_filter_node_root ).

lo_request->set_top( 50 )->set_skip( 0 ).

" Execute the request and retrieve the business data
lo_response = lo_request->execute( ).
lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

*cl_abap_unit_assert=>fail( 'Implement your assertions' ).
cl_abap_unit_assert=>assert_not_initial(
  act = lt_business_data
  msg = 'No business data was returned from the OData service.'
).

ENDMETHOD.

ENDCLASS.

"!@testing SRVB:ZMM_UI_PRODUCTPLANT_O4
CLASS ltc_UPDATE DEFINITION FINAL FOR TESTING DURATION SHORT RISK LEVEL HARMLESS.

PRIVATE SECTION.


METHODS:
 UPDATE FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_UPDATE IMPLEMENTATION.


METHOD UPDATE.
DATA:
  ls_business_data TYPE ZMM_R_PRODUCTPLANT,
  ls_entity_key    TYPE ZMM_R_PRODUCTPLANT,
  lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
  lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
  lo_request       TYPE REF TO /iwbep/if_cp_request_update,
  lo_response      TYPE REF TO /iwbep/if_cp_response_update.



lo_client_proxy = /iwbep/cl_cp_factory_unit_tst=>create_v4_local_proxy(
                EXPORTING
                  is_service_key     = VALUE #( service_id      = 'ZMM_UI_PRODUCTPLANT'
                                                repository_id   = 'SRVD'
                                                service_version = '0001' )
                   iv_do_write_traces = abap_true ).


" Set entity key
ls_entity_key = VALUE #(
          product  = 'Product'
          plant    = 'Plant' ).

" Prepare the business data
ls_business_data = VALUE #(
          product                         = 'Product'
          plant                           = 'Plant'
          purchasinggroup                 = 'Purchasinggroup'
          countryoforigin                 = 'Countryoforigin'
          regionoforigin                  = 'Regionoforigin'
          productioninvtrymanagedloc      = 'Productioninvtrymanagedloc'
          profilecode                     = 'Profilecode'
          profilevaliditystartdate        = '20170101'
          availabilitychecktype           = 'Availabilitychecktype'
          fiscalyearvariant               = 'Fiscalyearvariant'
          periodtype                      = 'Periodtype'
          profitcenter                    = 'Profitcenter'
          goodsreceiptduration            = '1'
          maintenancestatusname           = 'Maintenancestatusname'
          ismarkedfordeletion             = abap_true
          mrptype                         = 'Mrptype'
          mrpresponsible                  = 'Mrpresponsible'
          abcindicator                    = 'Abcindicator'
          minimumlotsizequantity          = '1'
          maximumlotsizequantity          = '1'
          fixedlotsizequantity            = '1'
          consumptiontaxctrlcode          = 'Consumptiontaxctrlcode'
          iscoproduct                     = abap_true
          configurableproduct             = 'Configurableproduct'
          stockdeterminationgroup         = 'Stockdeterminationgroup'
          hasposttoinspectionstock        = abap_true
          isbatchmanagementrequired       = abap_true
          serialnumberprofile             = 'Serialnumberprofile'
          isnegativestockallowed          = abap_true
          hasconsignmentctrl              = 'Hasconsignmentctrl'
          ispurgacrosspurggroup           = abap_true
          isinternalbatchmanaged          = abap_true
          productcfopcategory             = 'Productcfopcategory'
          productisexcisetaxrelevant      = abap_true
          underdelivtolerancelimit        = '1'
          overdelivtolerancelimit         = '1'
          procurementtype                 = 'Procurementtype'
          specialprocurementtype          = 'Specialprocurementtype'
          productionschedulingprofile     = 'Productionschedulingprofile'
          productionsupervisor            = 'Productionsupervisor'
          safetystockquantity             = '1'
          goodsissueunit                  = 'Goodsissueunit'
          sourceofsupplycategory          = 'Sourceofsupplycategory'
          consumptionreferenceproduct     = 'Consumptionreferenceproduct'
          consumptionreferenceplant       = 'Consumptionreferenceplant'
          consumptionrefusageenddate      = '20170101'
          consumptionqtymultiplier        = '1'
          productunitgroup                = 'Productunitgroup'
          distrcntrdistributionprofile    = 'Distrcntrdistributionprofile'
          goodissueprocessingdays         = '1'
          planneddeliverydurationindays   = '1'
          productiscriticalprt            = abap_true
          productlogisticshandlinggroup   = 'Productlogisticshandlinggroup'
          materialfreightgroup            = 'Materialfreightgroup'
          originalbatchreferencematerial  = 'Originalbatchreferencematerial'
          origlbatchmanagementisrequired  = 'Origlbatchmanagementisrequired'
          productconfiguration            = '1'
          productmincontroltemperature    = '1'
          productmaxcontroltemperature    = '1'
          productcontroltemperatureunit   = 'Productcontroltemperatureunit'
          valuationcategory               = 'Valuationcategory'
          baseunit                        = 'Baseunit'
          itemuniqueidentifierisrelevant  = 'Itemuniqueidentifierisrelevant'
          itemuniqueidentifiertype        = 'Itemuniqueidentifiertype'
          extallocofitmunqidtisrelevant   = 'Extallocofitmunqidtisrelevant'
          yy1_transferdate_plt            = '20170101'
          yy1_transferstatus_plt          = 'Yy1TransferstatusPlt'
          createdbyuser                   = 'Createdbyuser'
          creationdatetime                = 20170101123000
          lastchangedbyuser               = 'Lastchangedbyuser'
          lastchangedatetime              = 20170101123000 ).

" Navigate to the resource and create a request for the update operation
lo_resource = lo_client_proxy->create_resource_for_entity_set( 'PRODUCTPLANT' )->navigate_with_key( ls_entity_key ).
lo_request = lo_resource->create_request_for_update( /iwbep/if_cp_request_update=>gcs_update_semantic-put ).


lo_request->set_business_data( ls_business_data ).

" Execute the request and retrieve the business data
lo_response = lo_request->execute( ).

" Get updated entity
*CLEAR ls_business_data.
*lo_response->get_business_data( importing es_business_data = ls_business_data ).
cl_abap_unit_assert=>fail( 'Implement your assertions' ).
ENDMETHOD.

ENDCLASS.

"!@testing SRVB:ZMM_UI_PRODUCTPLANT_O4
CLASS ltc_DELETE_ENTITY DEFINITION FINAL FOR TESTING DURATION SHORT RISK LEVEL HARMLESS.

PRIVATE SECTION.


METHODS:
 DELETE_ENTITY FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_DELETE_ENTITY IMPLEMENTATION.


METHOD DELETE_ENTITY.
DATA:
  ls_entity_key    TYPE ZMM_R_PRODUCTPLANT,
  ls_business_data TYPE ZMM_R_PRODUCTPLANT,
  lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
  lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
  lo_request       TYPE REF TO /iwbep/if_cp_request_delete.


     lo_client_proxy = /iwbep/cl_cp_factory_unit_tst=>create_v4_local_proxy(
                     EXPORTING
                       is_service_key     = VALUE #( service_id      = 'ZMM_UI_PRODUCTPLANT'
                                                     repository_id   = 'SRVD'
                                                     service_version = '0001' )
                        iv_do_write_traces = abap_true ).


"Set entity key
ls_entity_key = VALUE #(
          product  = 'Product'
          plant    = 'Plant' ).

"Navigate to the resource and create a request for the delete operation
lo_resource = lo_client_proxy->create_resource_for_entity_set( 'PRODUCTPLANT' )->navigate_with_key( ls_entity_key ).
lo_request = lo_resource->create_request_for_delete( ).


" Execute the request
lo_request->execute( ).

cl_abap_unit_assert=>fail( 'Implement your assertions' ).
ENDMETHOD.

ENDCLASS.
