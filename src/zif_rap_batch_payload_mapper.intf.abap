INTERFACE zif_rap_batch_payload_mapper
  PUBLIC .
  METHODS map_keys_to_payloads
  IMPORTING
    i_keys TYPE  any
  RETURNING
  VALUE(r_payload) TYPE REF TO DATA .

ENDINTERFACE.
