@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Plant Sales - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #XL
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTPLANTSALESTP_2
  as projection on I_PRODUCTPLANTSALESTP_2
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
    Quickinfo: 'Loading Group'
  }
  LoadingGroup,
  @Endusertext: {
    Quickinfo: 'Base quantity for capacity planning in shipping'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  CapPlanningQuantityInBaseUoM,
  @Endusertext: {
    Quickinfo: 'Shipping processing time'
  }
  ProdShipgProcgDurationInDays,
  @Endusertext: {
    Quickinfo: 'Shipping setup time'
  }
  WrkCentersShipgSetupTimeInDays,
  @Endusertext: {
    Quickinfo: 'Replacement part'
  }
  ReplacementPartType,
  @Endusertext: {
    Quickinfo: 'Checking Group for Availability Check'
  }
  AvailabilityCheckType,
  @Endusertext: {
    Quickinfo: 'Base Unit of Measure'
  }
  BaseUnit,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductPlant : redirected to parent ZC_PRODUCTPLANTTP_2
  
}
