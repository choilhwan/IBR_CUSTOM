@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Plant Purchase Tax - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #C, 
  Usagetype.Sizecategory: #L
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTPLANTPURCHASETAXTP_2
  as projection on I_PRODUCTPLANTPURCHASETAXTP_2
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
    Quickinfo: 'Departure Country/Region (from which the goods are sent)'
  }
  key DepartureCountry,
  @Endusertext: {
    Quickinfo: 'Tax indicator for material (Purchasing)'
  }
  ProdPurchaseTaxClassification,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductPlant : redirected to parent ZC_PRODUCTPLANTTP_2
  
}
