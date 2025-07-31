CLASS ycl_test_ih03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS ycl_test_ih03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

DATA: lo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy.
     lo_client_proxy = cl_web_odata_client_factory=>create_v2_local_proxy( VALUE #( service_id = '/IWPGW/TASKPROCESSING'  service_version = '0002' ) ).





  ENDMETHOD.
ENDCLASS.
