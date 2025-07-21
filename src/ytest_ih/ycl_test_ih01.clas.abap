CLASS ycl_test_ih01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS fill_deep_structures.
********************************************************************** CL_DEMO_CRRSPNDNG_VARIANTS_ST
    TYPES: BEGIN OF line1,
             col1 TYPE i,
             col2 TYPE i,
           END OF line1,
           BEGIN OF line2,
             col2 TYPE i,
             col3 TYPE i,
             col4 TYPE i,
           END OF line2.

    DATA:
      "deep structures
      BEGIN OF struc11,
        comp1 TYPE c LENGTH 1 VALUE 'W',
        BEGIN OF struc_nested,
          comp1 TYPE c LENGTH 1 VALUE 'X',
          BEGIN OF comp2,
            col1 TYPE c LENGTH 1 VALUE 'Y',
            col2 TYPE c LENGTH 1 VALUE 'Z',
          END OF comp2,
        END OF struc_nested,
        itab  TYPE TABLE OF line1 WITH EMPTY KEY,
      END OF struc11,

      BEGIN OF struc22,
        BEGIN OF struc_nested,
          comp1 TYPE string,
          comp2 TYPE string,
          comp3 TYPE string,
        END OF struc_nested,
        itab  TYPE TABLE OF line2 WITH EMPTY KEY,
        comp4 TYPE i,
      END OF struc22,

      BEGIN OF struc33,
        comp1 TYPE c LENGTH 1 VALUE 'W',
        BEGIN OF struc_nested,
          comp1 TYPE c LENGTH 1 VALUE 'X',
          comp2 type table of line1,
        END OF struc_nested,
        itab  TYPE TABLE OF line1 WITH EMPTY KEY,
      END OF struc33.

ENDCLASS.



CLASS YCL_TEST_IH01 IMPLEMENTATION.


  METHOD fill_deep_structures.
    "Clear all contents of struc2.
    CLEAR struc22.
    "Fill nested tables in deep structures.
    struc22-struc_nested = VALUE #( comp1 = `aaa`
                                   comp2 = `bbb`
                                   comp3 = `ccc` ).

    struc11-itab = VALUE #(
      ( col1 = 111 col2 = 222 )
      ( col1 = 333 col2 = 444
      ) ).

    struc22-itab = VALUE #(
      ( col2 = 1 col3 = 2 col4 = 3 )
      ( col2 = 4 col3 = 5 col4 = 6 )
      ( col2 = 7 col3 = 8 col4 = 9 )
      ).
    "Fill individual component that is not shared by both structures.
    struc22-comp4 = 999.

    clear struc33.
    struc33 = CORRESPONDING #( struc11 EXCEPT struc_nested ).
    struc33-struc_nested = value #(  comp1 = 'X' comp2 = value #( ( col1 = 1 col2 = 2 ) ) ).
**********************************************************************
"The following examples construct an internal tables by joining an internal table
"and a lookup table and comparing their components.
**********************************************************************
*Types - Structures
**********************************************************************
TYPES:
    BEGIN OF s1,
      character TYPE c LENGTH 1,
      text   TYPE string,
    END OF s1,
**********************************************************************
*Types - tables
**********************************************************************
    it_type         TYPE STANDARD TABLE OF s1 WITH EMPTY KEY,
    lookup_tab_type TYPE HASHED TABLE OF s1 WITH UNIQUE KEY character.
**********************************************************************
*Logic
**********************************************************************
DATA(it1) = VALUE it_type( ( character = 'a' ) ( character = 'b' ) ( character = 'c' ) ( character = 'd' )
                           ( character = 'e' ) ( character = 'f' ) ).
DATA(it1_copy) = it1.

DATA(lookup_tab) = VALUE lookup_tab_type( ( character = 'a' text = `lorem` )
                                           ( character = 'c' text = `ipsum` )
                                           ( character = 'e' text = `dolor` )
                                           ( character = 'f' text = `sit` ) ).

"In the following example assignment, the internal table used for the comparison
"is also the target table.
it1 = CORRESPONDING #( it1 FROM lookup_tab USING character = character ).

*character    TEXT
*a         lorem
*b
*c         ipsum
*d
*e         dolor
*f         sit

"In the following example, the internal table used for the comparison
"is not the target table. Instead, a new table is created inline.
"The pragma suppresses a syntax warning.

DATA(it2) = CORRESPONDING it_type( it1_copy FROM lookup_tab USING character = character ) ##operator.

ASSERT it2 = it1.

"Example assignments to demonstrate the KEY and MAPPING additions
TYPES:
    BEGIN OF s2,
      a TYPE string,
      b TYPE string,
      c TYPE string,
      d TYPE string,
      e TYPE string,
      f TYPE string,
    END OF s2,
    BEGIN OF s3,
      a TYPE string,
      b TYPE string,
      c TYPE string,
      d TYPE string,
      e TYPE string,
      g TYPE string,
    END OF s3,
    BEGIN OF s4,
      h TYPE string,
      i TYPE string,
      j TYPE string,
      k TYPE string,
      l TYPE string,
      m TYPE string,
    END OF s4.
DATA:
    it3          TYPE STANDARD TABLE OF s2,
    it4          TYPE STANDARD TABLE OF s2,
    it5          TYPE STANDARD TABLE OF s2,
    lookup_table TYPE STANDARD TABLE OF s3 WITH NON-UNIQUE SORTED KEY sk COMPONENTS c d,
    it6          TYPE STANDARD TABLE OF s4.

it3 = VALUE #( ( a = `1a`  b = `1b`
                 c = `---` d = `---`
                 e = `---` f = `---` )
               ( a = `2a`  b = `2b`
                 c = `---` d = `---`
                 e = `---` f = `---` )
               ( a = `3a`  b = `3b`
                 c = `---` d = `---`
                 e = `---` f = `---` ) ).

it4 = it3.
it5 = it3.

lookup_table = VALUE #( ( a = `4a` b = `4b`
                          c = `1a` d = `1b`
                          e = `5a` g = `5b` )
                        ( a = `6a` b = `6b`
                          c = `3a` d = `3b`
                          e = `7a` g = `7b` ) ).

"Notes on the example assignment:
"- Internal table used for the comparison is also the target table
"- The lookup table specifies a sorted secondary table key.
"- The key is used after the USING KEY addition.
"- All key components must be specified.
"- Regarding the result:
"  - Only the first and third lines are found in the lookup table.
"  - Therefore, the values of the identically named components in it3
"    are assigned (which is only one component in the example).
"  - The assignment excludes the components c and d of the lookup table,
"    although there are identically named components in it3. The components
"    used in the condition specification are ignored. The other components
"    retain their original values.
"  - In the lookup table, no line is available with the values a = `2a` b = `2b`.
"    Therefore, the result does not include values from the lookup table. The
"    original component values of the line in it3 are used for the result.

it3 = CORRESPONDING #( it3 FROM lookup_table USING KEY sk c = a d = b ).

*A     B     C      D      E      F
*1a    1b    ---    ---    5a     ---
*2a    2b    ---    ---    ---    ---
*3a    3b    ---    ---    7a     ---

"Notes on the example assignment:
"- See above. Here, the MAPPING addition is included. It is used to specify
"  mapping relationships for the assignments. The example specifies a mapping
"  relationship for all available components in the demo tables. In doing so,
"  the default mapping is overridden, and, all previously ignored components
"  are not ignored anymore.
"- As a consequence, all component values in the first and third lines are
"  are affected and assigned values.
"- As above, the second line retains the original values of it4 as there is
"  no line found in the lookup table.

it4 = CORRESPONDING #( it4 FROM lookup_table USING KEY sk c = a d = b MAPPING a = a b = b c = c d = d f = g ).

*A     B     C      D      E      F
*4a    4b    1a     1b     5a     5b
*2a    2b    ---    ---    ---    ---
*6a    6b    3a     3b     7a     7b

"Notes on the example assignment:
"- The target table does not have the same type as it5. But, despite having differently
"  named components, the types are compatible, and an assignment can be performed.
"- As not the same internal table is used for the search in the CORRESPONDING expression and
"  the target, a syntax warning would occur (a temporary copy of it5 must be created) if not
"  hidden by the pragma.

it6 = CORRESPONDING #( it5 FROM lookup_table USING KEY sk c = a d = b ) ##operator.

*H     I     J      K      L      M
*1a    1b    ---    ---    5a     ---
*2a    2b    ---    ---    ---    ---
*3a    3b    ---    ---    7a     ---

"FILTER on conditions based on single values
"Assumption: The component num is of type i.
types: BEGIN OF str_filter,
       num type i,
       desc type string,
       END OF str_filter,
       BEGIN OF str_num,
       num type i,
       end of str_num.
data: lt_num type SORTED TABLE OF str_num WITH NON-UNIQUE key num .
DATA itab1 TYPE SORTED TABLE OF str_filter WITH NON-UNIQUE KEY num.
DATA itab2 TYPE STANDARD TABLE OF str_filter WITH NON-UNIQUE SORTED KEY sec_key COMPONENTS num.
DATA itab3 TYPE HASHED TABLE OF str_filter WITH UNIQUE KEY num.
DATA itab4 TYPE STANDARD TABLE OF str_filter WITH NON-UNIQUE KEY num.

data(ftmp) = filter #( itab1  in itab2 USING KEY sec_key  WHERE num = num ).
*data(ftmp2) = FILTER #( itab4 USING KEY primary_key num where num = 3 ).
itab1 = VALUE #( ( num = 1 ) ( num = 2 ) ( num = 3 ) ( num = 4 )  ).

"The lines meeting the condition are respected.
"Note: The source table must have at least one sorted or hashed key.
"Here, the primary key is used
DATA(f1) = FILTER #( itab1 WHERE num >= 3 ).

"USING KEY primary_key explicitly specified; same as above
DATA(f2) = FILTER #( itab1 USING KEY primary_key WHERE num >= 3 ).

"EXCEPT addition
DATA(f3) = FILTER #( itab1 EXCEPT WHERE num >= 3 ).
DATA(f4) = FILTER #( itab1 EXCEPT USING KEY primary_key WHERE num >= 3 ).

"USING KEY is specified for the source table, including EXCEPT
DATA(f11) = FILTER #( itab2 USING KEY sec_key EXCEPT IN lt_num WHERE num = num ).

  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
********************************************************************** INSERT TO ITAB
    TYPES: BEGIN OF ts_insert1,
             comp1 TYPE c LENGTH 2,
             comp2 TYPE c LENGTH 2,
           END OF ts_insert1,
           tt_insert1 TYPE TABLE OF ts_insert1 WITH EMPTY KEY.
    DATA: it_insert1 TYPE tt_insert1,
          it_insert2 TYPE tt_insert1.
    DATA: str_insert1 TYPE ts_insert1.
    str_insert1-comp1 = 'A2'.
    str_insert1-comp2 = 'B2'.
    INSERT VALUE #( comp1 = 'A1' comp2 = 'B1' ) INTO TABLE it_insert1.
    INSERT str_insert1 INTO TABLE it_insert1. "ITAB에 라인 하나 추가
    INSERT INITIAL LINE INTO TABLE it_insert1. "ITAB에 초기화된 라인 하나 추가
    INSERT INITIAL LINE INTO TABLE it_insert1 REFERENCE INTO DATA(dref_itab).  "ITAB에 초기화된 라인 하나 추가 후 DATA  참조
    INSERT INITIAL LINE INTO TABLE it_insert1 ASSIGNING FIELD-SYMBOL(<fs_itab>). "ITAB에 초기화된 라인 하나 추가 후 필드심볼  참조
    INSERT LINES OF it_insert2 INTO TABLE it_insert1. "ITAB2의 모든 라인들을 ITAB에 추가
    INSERT LINES OF it_insert2 FROM 5 TO 9 INTO TABLE it_insert1. "ITAB2의 특정 라인들을 ITAB에 추가
    INSERT str_insert1 INTO it_insert2 INDEX 1.   "1TAB2의 첫번째 라인에 STRUC 추가.
    INSERT LINES OF it_insert2 INTO it_insert1 INDEX 1. "ITAB의 첫번째 라인에 ITAB2의 모든 라인 추가.
    INSERT LINES OF VALUE tt_insert1( ( comp1 = 'A3' comp2 = 'A4' )  ( comp1 = 'A3' comp2 = 'A4' ) ) INTO TABLE it_insert1.
    INSERT VALUE #( comp1 = 'A3' comp2 = 'A4' ) INTO TABLE it_insert1.
********************************************************************** Creating and Populating Internal Tables Using Constructor Expressions
    TYPES: BEGIN OF ts_contructorEx1,
             comp1 TYPE c LENGTH 2,
             comp2 TYPE c LENGTH 2,
           END OF ts_contructorEx1,
           tt_contructorEx1 TYPE TABLE OF ts_contructorEx1 WITH EMPTY KEY.
    DATA: it_contructorEx1 TYPE tt_contructorEx1,
          it_contructorEx2 TYPE tt_contructorEx1,
          it_contructorEx3 TYPE tt_contructorEx1,
          it_contructorEx4 TYPE tt_contructorEx1,
          it_contructorEx5 TYPE tt_contructorEx1,
          it_contructorEx6 TYPE tt_contructorEx1,
          it_contructorEx7 TYPE tt_contructorEx1,
          it_create        TYPE TABLE FOR CREATE zr_onlineshop_006,
          it_doc           TYPE TABLE OF zonlineshop_006.
    DATA: str_contructorEx1 TYPE ts_contructorEx1.
    str_contructorEx1-comp1 = 'A1'.
    str_contructorEx1-comp2 = 'B1'.
    it_contructorEx1 = VALUE #( ( str_contructorEx1 )
                              ( comp1 = 'a2' comp2 = 'b2'  ) ).
    it_contructorEx1 = VALUE #( BASE it_contructorEx1 ( comp1 = 'a3' comp2 = 'b3'  )
                                                  ( comp1 = 'a4' comp2 = 'b4'  ) ).
    it_contructorEx1 = VALUE #( ( comp1 = 'a5' comp2 = 'b5' )
                              ( comp1 = 'a6' comp2 = 'b6' )
                              "All lines
                              ( LINES OF it_contructorEx2 )
                              "More syntax options
                              ( LINES OF it_contructorEx3 FROM 2 TO 5 )
                              ( LINES OF it_contructorEx4 FROM 3 )
                              ( LINES OF it_contructorEx5 TO 7 )
                              ( LINES OF it_contructorEx6 STEP 2 )
                              ( LINES OF it_contructorEx7 USING KEY primary_key FROM 3 TO 6 ) ).
    TYPES ty_int_tab TYPE TABLE OF i WITH EMPTY KEY.
    DATA(int_table_a) = VALUE ty_int_tab( ( 1 ) ( 2 ) ( 3 ) ( 4 ) ( 5 ) ).
    DATA int_table_b TYPE ty_int_tab.
    int_table_b = VALUE #( FOR wa_b IN int_table_a INDEX INTO lv_index ( wa_b * 2 ) ).
    "Table Content: 2 / 4 / 6 / 8 / 10
    it_doc = CORRESPONDING  #( it_create MAPPING FROM ENTITY ).
**********************************************************************CORRESPONDING Operator and MOVE-CORRESPONDING Statements
    TYPES: BEGIN OF ts_correspond1,
             comp1 TYPE c LENGTH 2,
             comp2 TYPE c LENGTH 2,
             comp3 TYPE c LENGTH 2,
           END OF ts_correspond1,
           BEGIN OF ts_correspond2,
             comp1 TYPE i,
             comp2 TYPE c LENGTH 2,
             comp3 TYPE c LENGTH 1,
           END OF ts_correspond2,
           BEGIN OF ts_correspond3,
             comp_1 TYPE c LENGTH 2,
             comp_2 TYPE c LENGTH 2,
             comp3  TYPE c LENGTH 2,
           END OF ts_correspond3,
           tt_correspond1 TYPE TABLE OF ts_correspond1 WITH EMPTY KEY,
           tt_correspond2 TYPE TABLE OF ts_correspond2 WITH EMPTY KEY,
           tt_correspond3 TYPE TABLE OF ts_correspond3 WITH EMPTY KEY,
           tt_correspond4 TYPE SORTED TABLE  OF ts_correspond1 WITH UNIQUE KEY comp1.
    DATA: it_correspond1 TYPE tt_correspond1,
          it_correspond2 TYPE tt_correspond2,
          it_correspond3 TYPE tt_correspond3,
          it_correspond4 TYPE tt_correspond4,
          it_correspond5 TYPE tt_correspond1,
          it_correspond6 TYPE tt_correspond1,
          it_correspond7 TYPE tt_correspond1,
          it_mappedE06   TYPE RESPONSE  FOR MAPPED EARLY  zr_onlineshop_006,
          it_mappedE07   TYPE RESPONSE  FOR MAPPED EARLY  zi_online_shop_007,
          it_mappedL06   TYPE RESPONSE FOR MAPPED LATE zr_onlineshop_006,
          it_mappedL07   TYPE RESPONSE FOR MAPPED LATE zi_online_shop_007.
    DATA: str_correspond1 TYPE ts_correspond1.
    str_correspond1-comp1 = 'A1'.
    str_correspond1-comp2 = 'B1'.
    it_correspond2 = VALUE #( ( comp1 = 2  comp2 = '22' comp3 = '2' ) ).
    it_correspond1 = CORRESPONDING #( it_correspond2 ).
    CLEAR it_correspond1.
    MOVE-CORRESPONDING it_correspond2 TO it_correspond1.
    it_correspond3 = VALUE #( ( comp_1 = '33' comp_2 = '33' comp3 = '33' ) ).
    it_correspond1 = CORRESPONDING #( BASE ( it_correspond1 ) it_correspond3 MAPPING comp1 = comp_1 comp2 = comp_2 ). "mapping으로 명시하지 않은 필드는  move corresponding의 기본 원칙대로
    it_correspond1 = CORRESPONDING #( BASE ( it_correspond1 ) it_correspond3 MAPPING comp1 = comp_1 comp2 = comp_2 EXCEPT * ). "except * 사용시 mapping으로 명시하지 않은 필드는 corresponding의 기본 원칙과 상관없이 무시된다.
    MOVE-CORRESPONDING it_correspond3 TO it_correspond1 KEEPING TARGET LINES.
    it_correspond4 = VALUE #( ( comp1 = '2' comp2 = '44' ) ( comp1 = '33' comp2 = '33' ) ).
    it_correspond4 = CORRESPONDING #( BASE ( it_correspond4 )  it_correspond1 DISCARDING DUPLICATES MAPPING comp1 = comp1 comp2 = comp2 ).

    TRY.
        it_mappede06-zronlineshop006 = VALUE #( (  %cid = 'CID_1' orderuuid = cl_system_uuid=>create_uuid_x16_static( )  ) ).
*        it_mappedL06-zronlineshop006 = VALUE #( (  %cid = 'CID_1' orderuuid = cl_system_uuid=>create_uuid_x16_static( )  ) ).
        it_mappedl06 = CORRESPONDING #(   it_mappede06 MAPPING zronlineshop006 = zronlineshop006 ).
        it_mappedl06 = CORRESPONDING #(   DEEP    it_mappede06 ).

      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.

    DATA:
      BEGIN OF struc1,
        a TYPE string,
        b TYPE string,
        c TYPE i,
      END OF struc1,
      BEGIN OF struc2,
        a TYPE string,
        b TYPE c LENGTH 1,
        c TYPE i,
      END OF struc2,
      BEGIN OF str_deep1,
        comp TYPE string VALUE `ZZZ`,
        itab LIKE TABLE OF struc1 WITH EMPTY KEY,
      END OF str_deep1,
      BEGIN OF str_deep2,
        comp TYPE string,
        itab LIKE TABLE OF struc2 WITH EMPTY KEY,
      END OF str_deep2.

    str_deep1-itab = VALUE #( ( a = `AAA` b = `BBB` c = 111  ) ).
    DATA(str_deep3) = str_deep2.

    str_deep2 = CORRESPONDING #( DEEP str_deep1 ).

    TRY.
        str_deep3 = CORRESPONDING #( EXACT DEEP str_deep1 ).
      CATCH cx_root INTO FINAL(error).
        out->write( error->get_text( ) ) .
    ENDTRY.
    out->write( str_deep2 ).
    out->write( str_deep3 ).
    fill_deep_structures( ).
*    MOVE-CORRESPONDING struc11 to struc22 EXPANDING NESTED TABLES KEEPING TARGET LINES.
    struc22 = CORRESPONDING #(    DEEP BASE ( struc22 )  struc11   ).


*    itab_nested2 = CORRESPONDING #( DEEP itab_nested1 ).
*
*    itab_nested2 = CORRESPONDING #( DEEP BASE ( itab_nested2 ) itab_nested1 ).
*
*    MOVE-CORRESPONDING itab_nested1 TO itab_nested2 EXPANDING NESTED TABLES.
*
*    MOVE-CORRESPONDING itab_nested1 TO itab_nested2 EXPANDING NESTED TABLES KEEPING TARGET LINES.

  ENDMETHOD.
ENDCLASS.
