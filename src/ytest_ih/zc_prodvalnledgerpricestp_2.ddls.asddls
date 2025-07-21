@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Valuation Ledger Prices - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #C, 
  Usagetype.Sizecategory: #XL
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODVALNLEDGERPRICESTP_2
  as projection on I_PRODVALNLEDGERPRICESTP_2
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
    Quickinfo: 'Future Price'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  FuturePrice,
  @Endusertext: {
    Quickinfo: 'Valid From'
  }
  FuturePriceValidityStartDate,
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
