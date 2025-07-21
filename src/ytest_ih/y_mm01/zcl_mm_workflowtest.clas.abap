CLASS zcl_mm_workflowtest DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_MM_WORKFLOWTEST IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA(api_instance) = cl_swf_cpwf_api_factory_a4c=>get_api_instance( ).
*  data lv_type type swf_cpwf_handle  .
        DATA(lv_uuid) = cl_system_uuid=>create_uuid_c32_static( ).
        api_instance->get_user_task_instances( iv_cpwf_handle = lv_uuid ).
      CATCH cx_root INTO DATA(cx).
      out->write( cx->get_text( ) ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
