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
    SELECT _product~product,
           _plant~plant,
           _desc~productdescription,
           _grouptext~productgroup,
           _grouptext~productgroupname
            FROM i_product AS _product
                JOIN i_productdescription AS _desc  ON _product~product =  _desc~product AND _desc~language = '3'
                JOIN i_productgrouptext_2 AS _grouptext ON _product~productgroup = _grouptext~productgroup AND _grouptext~language = '3'
                JOIN i_productplantbasic AS _plant ON _product~product = _plant~product
            INTO TABLE @DATA(lt_payload).


  ENDMETHOD.
ENDCLASS.
