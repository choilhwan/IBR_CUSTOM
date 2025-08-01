@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '[MM] PRODUCTS API VIEW'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZMM_A_PRODUCT 
provider contract transactional_query as projection on ZMM_R_PRODUCT
{
    key Product
//    ProductExternalID,
//    ProductOID,
//    ProductType,
//    CreationDate,
//    CreationTime,
//    CreationDateTime,
//    CreatedByUser,
//    LastChangeDate,
//    LastChangedByUser,
//    IsMarkedForDeletion,
//    CrossPlantStatus,
//    CrossPlantStatusValidityDate,
//    ProductOldID,
//    GrossWeight,
//    PurchaseOrderQuantityUnit,
//    SourceOfSupply,
//    WeightUnit,
//    CountryOfOrigin,
//    CompetitorID,
//    ProductGroup,
//    BaseUnit,
//    ItemCategoryGroup,
//    NetWeight,
//    ProductHierarchy,
//    Division,
//    VarblPurOrdUnitIsActive,
//    VolumeUnit,
//    MaterialVolume,
//    SalesStatus,
//    TransportationGroup,
//    SalesStatusValidityDate,
//    AuthorizationGroup,
//    ANPCode,
//    ProductCategory,
//    Brand,
//    ProcurementRule,
//    ValidityStartDate,
//    LowLevelCode,
//    ProdNoInGenProdInPrepackProd,
//    SerialIdentifierAssgmtProfile,
//    SizeOrDimensionText,
//    IndustryStandardName,
//    ProductStandardID,
//    InternationalArticleNumberCat,
//    ProductIsConfigurable,
//    IsBatchManagementRequired,
//    HasEmptiesBOM,
//    ExternalProductGroup,
//    CrossPlantConfigurableProduct,
//    SerialNoExplicitnessLevel,
//    ProductManufacturerNumber,
//    ManufacturerNumber,
//    ManufacturerPartProfile,
//    QltyMgmtInProcmtIsActive,
//    IsApprovedBatchRecordReqd,
//    HandlingIndicator,
//    WarehouseProductGroup,
//    WarehouseStorageCondition,
//    StandardHandlingUnitType,
//    SerialNumberProfile,
//    AdjustmentProfile,
//    PreferredUnitOfMeasure,
//    IsPilferable,
//    IsRelevantForHzdsSubstances,
//    QuarantinePeriod,
//    TimeUnitForQuarantinePeriod,
//    QualityInspectionGroup,
//    HandlingUnitType,
//    HasVariableTareWeight,
//    MaximumPackagingLength,
//    MaximumPackagingWidth,
//    MaximumPackagingHeight,
//    MaximumCapacity,
//    OvercapacityTolerance,
//    UnitForMaxPackagingDimensions,
//    BaseUnitSpecificProductLength,
//    BaseUnitSpecificProductWidth,
//    BaseUnitSpecificProductHeight,
//    ProductMeasurementUnit,
//    ProductValidStartDate,
//    ArticleCategory,
//    ContentUnit,
//    NetContent,
//    ComparisonPriceQuantity,
//    GrossContent,
//    ProductValidEndDate,
//    AssortmentListType,
//    HasTextilePartsWthAnimalOrigin,
//    ProductSeasonUsageCategory,
//    IndustrySector,
//    ChangeNumber,
//    MaterialRevisionLevel,
//    IsActiveEntity,
//    LastChangeDateTime,
//    LastChangeTime,
//    DangerousGoodsIndProfile,
//    ProductUUID,
//    ProdSupChnMgmtUUID22,
//    ProductDocumentChangeNumber,
//    ProductDocumentPageCount,
//    ProductDocumentPageNumber,
//    OwnInventoryManagedProduct,
//    DocumentIsCreatedByCAD,
//    ProductionOrInspectionMemoTxt,
//    ProductionMemoPageFormat,
//    GlobalTradeItemNumberVariant,
//    ProductIsHighlyViscous,
//    TransportIsInBulk,
//    ProdAllocDetnProcedure,
//    ProdEffctyParamValsAreAssigned,
//    ProdIsEnvironmentallyRelevant,
//    LaboratoryOrDesignOffice,
//    PackagingMaterialGroup,
//    ProductIsLocked,
//    DiscountInKindEligibility,
//    SmartFormName,
//    PackingReferenceProduct,
//    BasicMaterial,
//    ProductDocumentNumber,
//    ProductDocumentVersion,
//    ProductDocumentType,
//    ProductDocumentPageFormat,
//    ProductConfiguration,
//    SegmentationStrategy,
//    SegmentationIsRelevant,
//    ProductCompositionIsRelevant,
//    IsChemicalComplianceRelevant,
//    ManufacturerBookPartNumber,
//    LogisticalProductCategory,
//    SalesProduct,
//    ProdCharc1InternalNumber,
//    ProdCharc2InternalNumber,
//    ProdCharc3InternalNumber,
//    ProductCharacteristic1,
//    ProductCharacteristic2,
//    ProductCharacteristic3,
//    MaintenanceStatus,
//    FashionProdInformationField1,
//    FashionProdInformationField2,
//    FashionProdInformationField3
}
