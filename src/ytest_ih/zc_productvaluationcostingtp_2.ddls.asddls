@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Valuation Costing - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #C, 
  Usagetype.Sizecategory: #XL
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTVALUATIONCOSTINGTP_2
  as projection on I_PRODUCTVALUATIONCOSTINGTP_2
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
    Quickinfo: 'Material Is Costed with Quantity Structure'
  }
  ProductIsCostedWithQtyStruc,
  @Endusertext: {
    Quickinfo: 'Material-related origin'
  }
  IsMaterialRelatedOrigin,
  @Endusertext: {
    Quickinfo: 'Origin Group as Subdivision of Cost Element'
  }
  CostOriginGroup,
  @Endusertext: {
    Quickinfo: 'Costing Overhead Group'
  }
  CostingOverheadGroup,
  @Endusertext: {
    Quickinfo: 'Future Planned Price 1'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  PlannedPrice1InCoCodeCrcy,
  @Endusertext: {
    Quickinfo: 'Future Planned Price 2'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  PlannedPrice2InCoCodeCrcy,
  @Endusertext: {
    Quickinfo: 'Future Planned Price 3'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  PlannedPrice3InCoCodeCrcy,
  @Endusertext: {
    Quickinfo: 'Date from Which Future Planned Price 1 Is Valid'
  }
  FuturePlndPrice1ValdtyDate,
  @Endusertext: {
    Quickinfo: 'Date from Which Future Planned Price 2 Is Valid'
  }
  FuturePlndPrice2ValdtyDate,
  @Endusertext: {
    Quickinfo: 'Date from Which Future Planned Price 3 Is Valid'
  }
  FuturePlndPrice3ValdtyDate,
  @Endusertext: {
    Quickinfo: 'Currency Key'
  }
  Currency,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductValuation : redirected to parent ZC_PRODUCTVALUATIONTP_2
  
}
