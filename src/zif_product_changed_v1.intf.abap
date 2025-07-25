interface ZIF_PRODUCT_CHANGED_V1
  public .


  interfaces /IWXBE/IF_CONSUMER_EVENT .

  aliases GET_ARRIVAL_TIMESTAMP
    for /IWXBE/IF_CONSUMER_EVENT~get_arrival_timestamp .
  aliases GET_CLOUD_EVENT_ID
    for /IWXBE/IF_CONSUMER_EVENT~get_cloud_event_id .
  aliases GET_CLOUD_EVENT_ID_AS_STRING
    for /IWXBE/IF_CONSUMER_EVENT~get_cloud_event_id_as_string .
  aliases GET_CLOUD_EVENT_SOURCE
    for /IWXBE/IF_CONSUMER_EVENT~get_cloud_event_source .
  aliases GET_CLOUD_EVENT_SUBJECT
    for /IWXBE/IF_CONSUMER_EVENT~get_cloud_event_subject .
  aliases GET_CLOUD_EVENT_TIMESTAMP
    for /IWXBE/IF_CONSUMER_EVENT~get_cloud_event_timestamp .
  aliases GET_CLOUD_EVENT_TYPE
    for /IWXBE/IF_CONSUMER_EVENT~get_cloud_event_type .

  types:
    TY_S_PRODUCT_CHANGED_V1 TYPE STRUCTURE FOR HIERARCHY Z_Product_Changed_v1 .

  methods GET_BUSINESS_DATA
    returning
      value(RS_BUSINESS_DATA) type ty_s_product_changed_v1
    raising
      /IWXBE/CX_EXCEPTION .
endinterface.
