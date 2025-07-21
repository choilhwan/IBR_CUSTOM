@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Plant Costing - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #XL
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTPLANTCOSTINGTP_2
  as projection on I_PRODUCTPLANTCOSTINGTP_2
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
    Quickinfo: 'Co-Product'
  }
  IsCoProduct,
  @Endusertext: {
    Quickinfo: 'Lot Size for Product Costing'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  CostingLotSize,
  @Endusertext: {
    Quickinfo: 'Key for Task List Group'
  }
  TaskListGroup,
  @Endusertext: {
    Quickinfo: 'Task List Type'
  }
  TaskListType,
  @Endusertext: {
    Quickinfo: 'Special Procurement Type for Costing'
  }
  CostingSpecialProcurementType,
  @Endusertext: {
    Quickinfo: 'Alternative BOM'
  }
  SourceBOMAlternative,
  @Endusertext: {
    Quickinfo: 'BOM Usage'
  }
  ProductBOMUsage,
  @Endusertext: {
    Quickinfo: 'Do Not Cost'
  }
  ProductIsCostingRelevant,
  @Endusertext: {
    Quickinfo: 'Group Counter'
  }
  TaskListGroupCounter,
  @Endusertext: {
    Quickinfo: 'Variance Key'
  }
  VarianceKey,
  @Endusertext: {
    Quickinfo: 'Production Version To Be Costed'
  }
  CostingProductionVersion,
  @Endusertext: {
    Quickinfo: 'Fixed-Price Co-Product'
  }
  IsFixedPriceCoProduct,
  @Endusertext: {
    Quickinfo: 'Base Unit of Measure'
  }
  BaseUnit,
  _BaseUnitOfMeasure,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductPlant : redirected to parent ZC_PRODUCTPLANTTP_2
  
}
