@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Plant Procurement - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #XL
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTPLANTPROCUREMENTTP_2
  as projection on I_PRODUCTPLANTPROCUREMENTTP_2
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
    Quickinfo: 'Indicator: "automatic purchase order allowed"'
  }
  IsAutoPurOrdCreationAllowed,
  @Endusertext: {
    Quickinfo: 'Indicator: Source list requirement'
  }
  IsSourceListRequired,
  @Endusertext: {
    Quickinfo: 'JIT Delivery Schedules'
  }
  JustInTimeDeliveryScheduleCode,
  @Endusertext: {
    Quickinfo: 'Purchasing Group'
  }
  PurchasingGroup,
  @Endusertext: {
    Quickinfo: 'Source of Supply'
  }
  SourceOfSupplyCategory,
  @Endusertext: {
    Quickinfo: 'Purchasing Across Purchasing Group'
  }
  PurgIsAcrossPurchasingGroup,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductPlant : redirected to parent ZC_PRODUCTPLANTTP_2
  
}
