@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Plant Storage - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #XL
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTPLANTSTORAGETP_2
  as projection on I_PRODUCTPLANTSTORAGETP_2
{
  @Endusertext: {
    Quickinfo: 'Product Number'
  }
  key Product,
  @Endusertext: {
    Quickinfo: 'Plant'
  }
  key Plant,
  @Endusertext: {
    Quickinfo: 'Physical Inventory Indicator for Cycle Counting'
  }
  PhysInventoryForCycleCounting,
  @Endusertext: {
    Quickinfo: 'Maximum Storage Period'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'ProdMaximumStoragePeriodUnit'
  }
  MaximumStoragePeriod,
  @Endusertext: {
    Quickinfo: 'Unit for maximum storage period'
  }
  ProdMaximumStoragePeriodUnit,
  @Endusertext: {
    Quickinfo: 'CC indicator is fixed'
  }
  CycleCountingIndicatorIsFixed,
  @Endusertext: {
    Quickinfo: 'IS-R service level'
  }
  ProvisioningServiceLevel,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductPlant : redirected to parent ZC_PRODUCTPLANTTP_2
  
}
