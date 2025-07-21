@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '[MM] ProductPlant Consumption View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZMM_C_PRODUCTPLANT provider contract transactional_query as projection on ZMM_R_PRODUCTPLANT
{   
    @ObjectModel.foreignKey.association: '_Product'
  key Product,

  @ObjectModel.foreignKey.association: '_Plant'
  key Plant,

  @ObjectModel.foreignKey.association: '_PurchasingGroup'
  PurchasingGroup,
  CountryOfOrigin,
  RegionOfOrigin,

  @ObjectModel.sapObjectNodeTypeReference:'StorageLocation'
  ProductionInvtryManagedLoc,

  @ObjectModel : {
    foreignKey.association: '_ProductStatus'
  }
  @ObjectModel.sapObjectNodeTypeReference:'ProductProfileCode'
  ProfileCode,

  ProfileValidityStartDate,
  AvailabilityCheckType,

  @ObjectModel:{
    foreignKey.association: '_FiscalYearVariant'
  }
  FiscalYearVariant,

  @ObjectModel:{
    foreignKey.association: '_PeriodType'
  }
  @ObjectModel.sapObjectNodeTypeReference:'ProductConsumptionPeriodType'
  PeriodType,

  ProfitCenter,
  GoodsReceiptDuration,
  MaintenanceStatusName,
  IsMarkedForDeletion,

  @ObjectModel.foreignKey.association: '_MRPType'
  @ObjectModel.sapObjectNodeTypeReference:'MRPType'
  MRPType,

  @ObjectModel.foreignKey.association: '_MRPController'
  @ObjectModel.sapObjectNodeTypeReference:'MRPController'
  MRPResponsible,

  @ObjectModel.sapObjectNodeTypeReference:'ProdConsumptionValueCategory'
  ABCIndicator,

  @Semantics.quantity.unitOfMeasure: 'BaseUnit'
  MinimumLotSizeQuantity,

  @Semantics.quantity.unitOfMeasure: 'BaseUnit'
  MaximumLotSizeQuantity,

  @Semantics.quantity.unitOfMeasure: 'BaseUnit'
  FixedLotSizeQuantity,

  ConsumptionTaxCtrlCode,
  IsCoProduct,

  @Consumption.valueHelpDefinition: [
    { entity:  { name:    'I_ProductStdVH',
                 element: 'Product' }
    }]
  @ObjectModel:{
    foreignKey.association: '_ConfigurableProduct'
  }
  ConfigurableProduct,

  @ObjectModel:{
    foreignKey.association: '_StockDeterminationGroup'
  }
  StockDeterminationGroup,

  HasPostToInspectionStock,
  IsBatchManagementRequired,
  SerialNumberProfile,
  IsNegativeStockAllowed,

  HasConsignmentCtrl,
  IsPurgAcrossPurgGroup,
  IsInternalBatchManaged,
  ProductCFOPCategory,
  ProductIsExciseTaxRelevant,
  UnderDelivToleranceLimit,
  OverDelivToleranceLimit,

  @ObjectModel.sapObjectNodeTypeReference:'ProcurementType'
  ProcurementType,
  SpecialProcurementType,
  ProductionSchedulingProfile,
  ProductionSupervisor,

  @Semantics.quantity.unitOfMeasure: 'BaseUnit'
  SafetyStockQuantity,

  @ObjectModel.foreignKey.association: '_GoodsIssueUnit'
  GoodsIssueUnit,

  SourceOfSupplyCategory,

  ConsumptionReferenceProduct,
  ConsumptionReferencePlant,
  ConsumptionRefUsageEndDate,
  ConsumptionQtyMultiplier,
  ProductUnitGroup,


  DistrCntrDistributionProfile,

  GoodIssueProcessingDays,
  PlannedDeliveryDurationInDays,
  ProductIsCriticalPrt,

  @ObjectModel.sapObjectNodeTypeReference:'ProductLogisticsHandlingGroup'
  ProductLogisticsHandlingGroup,


  MaterialFreightGroup,

  OriginalBatchReferenceMaterial,
  OriglBatchManagementIsRequired,
  ProductConfiguration,

  @Semantics.quantity.unitOfMeasure: 'ProductControlTemperatureUnit'
  ProductMinControlTemperature,

  @Semantics.quantity.unitOfMeasure: 'ProductControlTemperatureUnit'
  ProductMaxControlTemperature,

  @ObjectModel.foreignKey.association: '_ProdControlTemperatureUnit'
  ProductControlTemperatureUnit,

  ValuationCategory,
  @Semantics.unitOfMeasure: true
  BaseUnit,

  
  ItemUniqueIdentifierIsRelevant,
  ItemUniqueIdentifierType,
  
  ExtAllocOfItmUnqIdtIsRelevant,

  YY1_TransferDate_PLT,
  YY1_TransferStatus_PLT,

  CreatedByUser,
  CreationDateTime,
  LastChangedByUser,
  LastChangeDateTime,

  /* Associations */
  _ABCIndicator,
  _ABCIndicatorDesc,
  _CFOPDesc,
  _ConfigurableProduct,
  _ConfigurableProductName,
  _CountryOfOriginText,
  _DistributionProfile,
  _DistributionProfileText,
  _FiscalYearVariant,
  _FiscalYearVariantDescription,
  _GoodsIssueUnit,
  _GoodsMovementQuantity,
  _MaterialLotSizingProcedure,
  _MaterialStock,
  _MRPController,
  _MRPType,
  _PeriodType,
  _PeriodTypeText,
  _Plant,
  _PlantESPP,
  _PlantProcurement,
  _PlantQualityMgmt,
  _PlantSales,
  _ProdControlTemperatureUnit,
  _ProdCtrlTemperatureUnitText,
  _ProdPlantInternationalTrade,
  _Product,
  _ProductCFOPCategory,
  _ProductFreightGroup,
  _ProductFreightGroupText,
  _ProductPlantCosting,
  _ProductPlantForecast,
  _ProductStatus,
  _ProductStatusText,
  _ProductStorageLocation,
  _PurchasingGroup,
  _RegionText,
  _Site,
  _SourceOfSupplyCategory,
  _Stock,
  _StockDeterminationGroup,
  _StockDeterminationGroupT,
  _Text,
  _UnitOfMeasureText
}
