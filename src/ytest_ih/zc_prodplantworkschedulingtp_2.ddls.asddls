@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Plant Work Scheduling - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #XL
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODPLANTWORKSCHEDULINGTP_2
  as projection on I_PRODPLANTWORKSCHEDULINGTP_2
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
    Quickinfo: 'Base quantity'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  ProductBaseQuantity,
  @Endusertext: {
    Quickinfo: 'Indicator: Unlimited Overdelivery Allowed'
  }
  UnlimitedOverDelivIsAllowed,
  @Endusertext: {
    Quickinfo: 'Overdelivery Tolerance Limit'
  }
  OverDeliveryTolerancePercent,
  @Endusertext: {
    Quickinfo: 'Underdelivery Tolerance Limit'
  }
  UnderDeliveryTolerancePercent,
  @Endusertext: {
    Quickinfo: 'Storage Location'
  }
  ProductionInvtryManagedLoc,
  @Endusertext: {
    Quickinfo: 'Determination of batch entry in the production/process order'
  }
  ProductionOrderBatchCode,
  @Endusertext: {
    Quickinfo: 'Indicator: withdrawal of stock from production bin'
  }
  ProdIsWithdrawnFrmProdnBin,
  @Endusertext: {
    Quickinfo: 'Group of Materials for Transition Matrix'
  }
  TransitionMatrixProductsGroup,
  @Endusertext: {
    Quickinfo: 'Overall profile for order change management'
  }
  OrderChangeManagementProfile,
  @Endusertext: {
    Quickinfo: 'Indicator: Backflush'
  }
  ProductComponentBackflushCode,
  @Endusertext: {
    Quickinfo: 'Setup and teardown time'
  }
  SetupAndTeardownTime,
  @Endusertext: {
    Quickinfo: 'Production Scheduling Profile'
  }
  ProductionSchedulingProfile,
  @Endusertext: {
    Quickinfo: 'Interoperation time'
  }
  TransitionTime,
  @Endusertext: {
    Quickinfo: 'Processing time'
  }
  ProcessingTimeInDays,
  @Endusertext: {
    Quickinfo: 'Production Supervisor'
  }
  ProductionSupervisor,
  @Endusertext: {
    Quickinfo: 'Production unit'
  }
  ProductProductionQuantityUnit,
  @Endusertext: {
    Quickinfo: 'Base Unit of Measure'
  }
  BaseUnit,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductPlant : redirected to parent ZC_PRODUCTPLANTTP_2
  
}
