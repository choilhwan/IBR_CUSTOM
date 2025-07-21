@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Storage - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #L
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTSTORAGETP_2
  as projection on I_PRODUCTSTORAGETP_2
{
  @Endusertext: {
    Quickinfo: 'Product Number'
  }
  key Product,
  @Endusertext: {
    Quickinfo: 'Storage conditions'
  }
  StorageConditions,
  @Endusertext: {
    Quickinfo: 'Temperature conditions indicator'
  }
  ProdTemperatureConditionCode,
  @Endusertext: {
    Quickinfo: 'Hazardous material number'
  }
  HazardousProduct,
  @Endusertext: {
    Quickinfo: 'Quantity: Number of GR/GI slips to be printed'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  NmbrOfGROrGISlipsToPrintQty,
  @Endusertext: {
    Quickinfo: 'Label type'
  }
  LabelType,
  @Endusertext: {
    Quickinfo: 'Label form'
  }
  LabelForm,
  @Endusertext: {
    Quickinfo: 'Minimum Remaining Shelf Life'
  }
  MinRemainingShelfLife,
  @Endusertext: {
    Quickinfo: 'Expiration Date'
  }
  ProductExpirationDateType,
  @Endusertext: {
    Quickinfo: 'Container requirements'
  }
  StorageBinInstruction,
  @Endusertext: {
    Quickinfo: 'Period Indicator for Shelf Life Expiration Date'
  }
  ShelfLifeExpirationDatePeriod,
  @Endusertext: {
    Quickinfo: 'Rounding rule for calculation of SLED'
  }
  ShelfLifeExprtnDateRndngRule,
  @Endusertext: {
    Quickinfo: 'Storage Percentage'
  }
  TotalShelfLifeStoragePercent,
  @Endusertext: {
    Quickinfo: 'Total shelf life'
  }
  TotalShelfLife,
  @Endusertext: {
    Quickinfo: 'Base Unit of Measure'
  }
  BaseUnit,
  _Product : redirected to parent ZC_PRODUCTTP_2
  
}
