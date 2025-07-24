*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_local_event_consumption DEFINITION INHERITING FROM cl_abap_behavior_event_handler.

  PRIVATE SECTION.
    METHODS consume_event_1 FOR ENTITY EVENT importing_parameter_1 FOR product~created.
    METHODS consume_event_2 FOR ENTITY EVENT importing_parameter_2 FOR product~changed.
...ENDCLASS.

CLASS lcl_local_event_consumption IMPLEMENTATION.
  METHOD consume_event_1.
    CHECK importing_parameter_1 IS NOT INITIAL.
    LOOP AT importing_parameter_1 INTO DATA(created_instance).
*      " Example for processing of table content
*      some_mail_api=>send_mail(
*          recipient    = created_instance-recipient
*          message_body = |The instance { created_instance-id } was created|
*        ).

    ENDLOOP.
  ... ENDMETHOD.

  METHOD consume_event_2.
    CHECK importing_parameter_2 IS NOT INITIAL.


    READ ENTITIES OF i_producttp_2 IN LOCAL MODE
    ENTITY product
    FIELDS ( product ProductOldID  ) with value #( for product in importing_parameter_2 ( %key-Product = product-Product ) )
    RESULT data(result)
    REPORTED data(reported)
    FAILED data(failed).

  ... ENDMETHOD.
ENDCLASS.
