interface ZIF_001_HANDLER
  public .


  methods HANDLE_PRODUCT_CHANGED_V1
    importing
      !IO_EVENT type ref to ZIF_PRODUCT_CHANGED_V1
    raising
      /IWXBE/CX_EXCEPTION .
  methods HANDLE_PRODUCT_CREATED_V1
    importing
      !IO_EVENT type ref to ZIF_PRODUCT_CREATED_V1
    raising
      /IWXBE/CX_EXCEPTION .
endinterface.
