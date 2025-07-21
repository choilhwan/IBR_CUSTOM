@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Plant International Trade - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #XL
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODPLNTINTLTRADETP_2
  as projection on I_PRODPLNTINTLTRADETP_2
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
    Quickinfo: 'Country/Region of Origin of Product'
  }
  CountryOfOrigin,
  @Endusertext: {
    Quickinfo: 'Region of Origin'
  }
  RegionOfOrigin,
  @Endusertext: {
    Quickinfo: 'Control code for consumption taxes in foreign trade'
  }
  ConsumptionTaxCtrlCode,
  @Endusertext: {
    Quickinfo: 'Material Group for Intrastat'
  }
  ExportAndImportProductGroup,
  @Endusertext: {
    Quickinfo: 'CAS number for pharmaceutical products in foreign trade'
  }
  ProductCASNumber,
  @Endusertext: {
    Quickinfo: 'Production statistics: PRODCOM number for foreign trade'
  }
  ProdIntlTradeClassification,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductPlant : redirected to parent ZC_PRODUCTPLANTTP_2
  
}
