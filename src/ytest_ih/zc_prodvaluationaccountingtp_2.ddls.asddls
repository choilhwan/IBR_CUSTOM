@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Valuation Accounting - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #C, 
  Usagetype.Sizecategory: #XL
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODVALUATIONACCOUNTINGTP_2
  as projection on I_PRODVALUATIONACCOUNTINGTP_2
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
    Quickinfo: 'Valuation price based on commercial law: level 1'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  CommercialPrice1InCoCodeCrcy,
  @Endusertext: {
    Quickinfo: 'Valuation price based on commercial law: level 2'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  CommercialPrice2InCoCodeCrcy,
  @Endusertext: {
    Quickinfo: 'Valuation price based on commercial law: level 3'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  CommercialPrice3InCoCodeCrcy,
  @Endusertext: {
    Quickinfo: 'Lowest value: devaluation indicator'
  }
  DevaluationYearCount,
  @Endusertext: {
    Quickinfo: 'Future Price'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  FuturePrice,
  @Endusertext: {
    Quickinfo: 'Date as of which the price is valid'
  }
  FuturePriceValidityStartDate,
  @Endusertext: {
    Quickinfo: 'Pool number for LIFO valuation'
  }
  LIFOValuationPoolNumber,
  @Endusertext: {
    Quickinfo: 'Valuation price based on tax law: level 1'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  TaxPricel1InCoCodeCrcy,
  @Endusertext: {
    Quickinfo: 'Valuation price based on tax law: level 2'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  TaxPrice2InCoCodeCrcy,
  @Endusertext: {
    Quickinfo: 'Valuation price based on tax law: level 3'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  TaxPrice3InCoCodeCrcy,
  @Endusertext: {
    Quickinfo: 'Price unit for valuation prices based on tax/commercial law'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  TaxBasedPricesPriceUnitQty,
  @Endusertext: {
    Quickinfo: 'Data element for domain BOOLE: TRUE (=\'X\') and FALSE (=\' \')'
  }
  IsLIFOAndFIFORelevant,
  @Endusertext: {
    Quickinfo: 'Currency Key'
  }
  Currency,
  @Endusertext: {
    Quickinfo: 'Base Unit of Measure'
  }
  BaseUnit,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductValuation : redirected to parent ZC_PRODUCTVALUATIONTP_2
  
}
