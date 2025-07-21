@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Plant - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #L
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTPLANTTP_2
  as projection on I_PRODUCTPLANTTP_2
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
    Quickinfo: 'Plant-Specific Material Status'
  }
  ProfileCode,
  @Endusertext: {
    Quickinfo: 'Date from Which the Plant-Specific Material Status Is Valid'
  }
  ProfileValidityStartDate,
  @Endusertext: {
    Quickinfo: 'Fiscal Year Variant'
  }
  FiscalYearVariant,
  @Endusertext: {
    Quickinfo: 'Period Indicator'
  }
  PeriodType,
  @Endusertext: {
    Quickinfo: 'Profit Center'
  }
  ProfitCenter,
  @Endusertext: {
    Quickinfo: 'Flag Material for Deletion at Plant Level'
  }
  IsMarkedForDeletion,
  @Endusertext: {
    Quickinfo: 'Configurable Material'
  }
  ConfigurableProduct,
  @Endusertext: {
    Quickinfo: 'Stock determination group'
  }
  StockDeterminationGroup,
  @Endusertext: {
    Quickinfo: 'Batch Management Requirement Indicator for Plant'
  }
  IsBatchManagementRequired,
  @Endusertext: {
    Quickinfo: 'Serial Number Profile'
  }
  SerialNumberProfile,
  @Endusertext: {
    Quickinfo: 'Negative stocks allowed in plant'
  }
  IsNegativeStockAllowed,
  @Endusertext: {
    Quickinfo: 'Material CFOP category'
  }
  ProductCFOPCategory,
  @Endusertext: {
    Quickinfo: 'Excise Tax Relevance Indicator'
  }
  ProductIsExciseTaxRelevant,
  @Endusertext: {
    Quickinfo: 'Unit of Issue'
  }
  GoodsIssueUnit,
  @Endusertext: {
    Quickinfo: 'Distribution profile of material in plant'
  }
  DistrCntrDistributionProfile,
  @Endusertext: {
    Quickinfo: 'Indicator: Critical part'
  }
  ProductIsCriticalPrt,
  @Endusertext: {
    Quickinfo: 'Logistics handling group for workload calculation'
  }
  ProductLogisticsHandlingGroup,
  @Endusertext: {
    Quickinfo: 'Material Freight Group'
  }
  ProductFreightGroup,
  @Endusertext: {
    Quickinfo: 'Reference Material for Original Batches'
  }
  OriginalBatchReferenceProduct,
  @Endusertext: {
    Quickinfo: 'Minimum Temperature'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'ProductControlTemperatureUnit'
  }
  ProductMinControlTemperature,
  @Endusertext: {
    Quickinfo: 'Maximum Temperature'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'ProductControlTemperatureUnit'
  }
  ProductMaxControlTemperature,
  @Endusertext: {
    Quickinfo: 'Unit of Measure of Temperature'
  }
  ProductControlTemperatureUnit,
  @Endusertext: {
    Quickinfo: 'Base Unit of Measure'
  }
  BaseUnit,
  _ProdPlantInternationalTrade : redirected to composition child ZC_PRODPLNTINTLTRADETP_2,
  _Product : redirected to parent ZC_PRODUCTTP_2,
  _ProductPlantCosting : redirected to composition child ZC_PRODUCTPLANTCOSTINGTP_2,
  _ProductPlantForecast : redirected to composition child ZC_PRODUCTPLANTFORECASTTP_2,
  _ProductPlantInspTypeSetting : redirected to composition child ZC_PRODPLNTINSPTYPESETTINGTP_2,
  _ProductPlantMRP : redirected to composition child ZC_PRODUCTPLANTMRPTP_2,
  _ProductPlantPlanning : redirected to composition child ZC_PRODUCTPLANTPLANNINGTP_2,
  _ProductPlantProcurement : redirected to composition child ZC_PRODUCTPLANTPROCUREMENTTP_2,
  _ProductPlantPurchaseTax : redirected to composition child ZC_PRODUCTPLANTPURCHASETAXTP_2,
  _ProductPlantQualityManagement : redirected to composition child ZC_PRODPLNTQLTYMANAGEMENTTP_2,
  _ProductPlantSales : redirected to composition child ZC_PRODUCTPLANTSALESTP_2,
  _ProductPlantStorage : redirected to composition child ZC_PRODUCTPLANTSTORAGETP_2,
  _ProductPlantStorageLocation : redirected to composition child ZC_PRDPLANTSTORAGELOCATIONTP_2,
  _ProductPlantSupplyPlanning : redirected to composition child ZC_PRODPLANTSUPPLYPLANNINGTP_2,
  _ProductPlantWorkScheduling : redirected to composition child ZC_PRODPLANTWORKSCHEDULINGTP_2
  
}
