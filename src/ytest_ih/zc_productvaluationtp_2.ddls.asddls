@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Consumption: {
  Dbhints: [ 'USE_HEX_PLAN' ]
}
@Endusertext: {
  Label: 'Product Valuation - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #C, 
  Usagetype.Sizecategory: #XL
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTVALUATIONTP_2
  as projection on I_PRODUCTVALUATIONTP_2
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
    Quickinfo: 'Valuation Class'
  }
  ValuationClass,
  @Endusertext: {
    Quickinfo: 'Material Price Determination: Control'
  }
  PriceDeterminationControl,
  @Endusertext: {
    Quickinfo: 'Standard price'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  StandardPrice,
  @Endusertext: {
    Quickinfo: 'Price unit'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  ProductPriceUnitQuantity,
  @Endusertext: {
    Quickinfo: 'Price Control'
  }
  InventoryValuationProcedure,
  @Endusertext: {
    Quickinfo: 'Moving Average Price/Periodic Unit Price'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  MovingAveragePrice,
  @Endusertext: {
    Quickinfo: 'Valuation Category'
  }
  ValuationCategory,
  @Endusertext: {
    Quickinfo: 'Usage of the Product'
  }
  ProductUsageType,
  @Endusertext: {
    Quickinfo: 'Origin of the Product'
  }
  ProductOriginType,
  @Endusertext: {
    Quickinfo: 'Produced in-house'
  }
  IsProducedInhouse,
  @Endusertext: {
    Quickinfo: 'Deletion flag for all material data of a valuation type'
  }
  IsMarkedForDeletion,
  @Endusertext: {
    Quickinfo: 'Valuation Class for Sales Order Stock'
  }
  ValuationClassSalesOrderStock,
  @Endusertext: {
    Quickinfo: 'Valuation Class for Project Stock'
  }
  ProjectStockValuationClass,
  @Endusertext: {
    Quickinfo: 'Currency Key'
  }
  Currency,
  @Endusertext: {
    Quickinfo: 'Base Unit of Measure'
  }
  BaseUnit,
  @Endusertext: {
    Quickinfo: 'Valuation margin'
  }
  ValuationMarginPercent,
  _Product : redirected to parent ZC_PRODUCTTP_2,
  _ProductValuationAccounting : redirected to composition child ZC_PRODVALUATIONACCOUNTINGTP_2,
  _ProductValuationCosting : redirected to composition child ZC_PRODUCTVALUATIONCOSTINGTP_2,
  _ProductValuationLedgerAccount : redirected to composition child ZC_PRODVALNLEDGERACCOUNTTP_2,
  _ProductValuationLedgerPrices : redirected to composition child ZC_PRODVALNLEDGERPRICESTP_2
  
}
