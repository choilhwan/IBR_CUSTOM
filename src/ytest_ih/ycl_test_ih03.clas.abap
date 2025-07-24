CLASS ycl_test_ih03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.

                endclass.



    CLASS ycl_test_ih03 IMPLEMENTATION.


    METHOD if_oo_adt_classrun~main.

try.
DATA(lo_client_proxy)  =
CL_WEB_ODATA_CLIENT_FACTORY=>create_v2_local_proxy( VALUE #( service_id = 'SGBT_NTE_CDS_API_D_SRV' service_version = '0001'  ) ) .
DATA(lo_entity_list_resource) = lo_client_proxy->create_resource_for_entity_set( 'TaskCollection' ).
DATA(lo_read_list_request) = lo_entity_list_resource->create_request_for_read( ).
DATA(lo_read_list_response) = lo_read_list_request->execute( ).
catch  cx_root into data(error).
ENDTRY.

*     SELECT _product~product,
*           _productplant~plant,
*           _productplant~yy1_transferstatus_plt AS transferstatus,
*           _productplant~yy1_transferdate_plt AS transferdate,
*           _product~baseunit
*        FROM i_product AS _product
*            JOIN i_productdescription AS _productdesc ON _product~product = _productdesc~product AND
*                                                         _productdesc~Language = @sy-langu
*            JOIN i_productplantbasic AS _productplant ON _product~product =  _productplant~product and
*                                                        _productplant~yy1_transferstatus_plt <> '전송완료'
*         INTO TABLE @DATA(lt_result).
* if sy-subrc eq 0.
*  out->write( lines( lt_result ) ).
* ENDIF.




    ENDMETHOD.
ENDCLASS.
