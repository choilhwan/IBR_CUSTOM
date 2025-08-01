CLASS ycl_test_ih05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_test_ih05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA : ls_insert TYPE zmm_a_downpay_vh.

    ls_insert = VALUE #( code = 'A' text = '전체'  ).

    DELETE zmm_a_downpay_vh from  @ls_insert .

*    ls_insert = VALUE #( code = 'C' text = '완료'  ).
*     INSERT zmm_a_downpay_vh from  @ls_insert .
*    ls_insert = VALUE #( code = 'N' text = '미완료'  ).
* INSERT zmm_a_downpay_vh from  @ls_insert .
 commit WORK.
  ENDMETHOD.
ENDCLASS.

