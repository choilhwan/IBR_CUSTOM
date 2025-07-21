@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Valuation Ledger Account - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #C, 
  Usagetype.Sizecategory: #XL
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODVALNLEDGERACCOUNTTP_2
  as projection on I_PRODVALNLEDGERACCOUNTTP_2
{
  @Endusertext: {
    Quickinfo: 'Product Number'
  }
  key Product,
  @Endusertext: {
    Quickinfo: 'Valuation Area'
  }
  key ValuationArea,
  @Endusertext: {
    Quickinfo: 'Valuation Type'
  }
  key ValuationType,
  @Endusertext: {
    Quickinfo: 'External Currency Type and Valuation View'
  }
  key CurrencyRole,
  @Endusertext: {
    Quickinfo: 'Ledger in General Ledger Accounting'
  }
  key Ledger,
  @Endusertext: {
    Quickinfo: 'Price control indicator'
  }
  ProductPriceControl,
  @Endusertext: {
    Quickinfo: 'Price unit'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  ProductPriceUnitQuantity,
  @Endusertext: {
    Quickinfo: 'Currency Key'
  }
  Currency,
  @Endusertext: {
    Quickinfo: 'Periodic Unit Price'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  MovingAveragePrice,
  @Endusertext: {
    Quickinfo: 'Standard Price'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  StandardPrice,
  @Consumption: {
    Hidden: true
  }
  @Endusertext: {
    Quickinfo: 'Company Code'
  }
  CompanyCode,
  @Endusertext: {
    Quickinfo: 'Base Unit of Measure'
  }
  BaseUnit,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductValuation : redirected to parent ZC_PRODUCTVALUATIONTP_2
  
}
