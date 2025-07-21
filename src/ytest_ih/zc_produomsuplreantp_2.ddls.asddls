@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Supplier EAN - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #L
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUOMSUPLREANTP_2
  as projection on I_PRODUOMSUPLREANTP_2
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
    Quickinfo: 'Account Number of Supplier'
  }
  key Supplier,
  @Endusertext: {
    Quickinfo: 'Consecutive Number'
  }
  key ConsecutiveNumber,
  @Endusertext: {
    Quickinfo: 'International Article Number (EAN/UPC)'
  }
  GlobalTradeItemNumber,
  @Endusertext: {
    Quickinfo: 'Indicator: Main EAN of the vendor'
  }
  SuplrGTINIsMain,
  @Endusertext: {
    Quickinfo: 'Material Number Used by Supplier'
  }
  SupplierProduct,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductUnitOfMeasure : redirected to parent ZC_PRODUCTUNITOFMEASURETP_2
  
}
