@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Plant Planning - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #M
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTPLANTPLANNINGTP_2
  as projection on I_PRODUCTPLANTPLANNINGTP_2
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
    Quickinfo: 'Name of the product group'
  }
  PlanningMaterial,
  @Endusertext: {
    Quickinfo: 'Plant'
  }
  PlanningPlant,
  @Endusertext: {
    Quickinfo: 'Conversion factor: quantities'
  }
  ProdPlntPlngMatlConversionFctr,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductPlant : redirected to parent ZC_PRODUCTPLANTTP_2
  
}
