@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Unit of Measure EAN - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #L
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTUNITOFMEASUREEANTP_2
  as projection on I_PRODUCTUNITOFMEASUREEANTP_2
{
  @Endusertext: {
    Quickinfo: 'Material Number'
  }
  key Product,
  @Endusertext: {
    Quickinfo: 'Unit of Measure for Display'
  }
  key AlternativeUnit,
  @Endusertext: {
    Quickinfo: 'Consecutive Number'
  }
  key ConsecutiveNumber,
  @Endusertext: {
    Quickinfo: 'International Article Number (EAN/UPC)'
  }
  ProductStandardID,
  @Endusertext: {
    Quickinfo: 'Category of Global Trade Item Number (GTIN)'
  }
  InternationalArticleNumberCat,
  @Endusertext: {
    Quickinfo: 'Indicator: Main EAN'
  }
  IsMainGlobalTradeItemNumber,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductUnitOfMeasure : redirected to parent ZC_PRODUCTUNITOFMEASURETP_2
  
}
