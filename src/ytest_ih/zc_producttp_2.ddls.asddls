@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: 'Product - TP'
}
@ObjectModel: {
  modelingPattern: #TRANSACTIONAL_INTERFACE, 
  representativeKey: 'Product', 
  supportedCapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  usageType.dataClass: #MASTER, 
  usageType.serviceQuality: #A, 
  usageType.sizeCategory: #L
}
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_PRODUCTTP_2
  provider contract transactional_query
  as projection on I_ProductTP_2
{
  @EndUserText: {
    quickInfo: 'Product Number'
  }
  key Product,
  @EndUserText: {
    quickInfo: 'Product Type'
  }
  ProductType as  ProductType_2,
  @EndUserText: {
    quickInfo: 'Created On'
  }
  CreationDate,
  @EndUserText: {
    quickInfo: 'Time of Creation'
  }
  CreationTime,
  @EndUserText: {
    quickInfo: 'Product Created On'
  }
  CreationDateTime,
  @EndUserText: {
    quickInfo: 'Name of Person Responsible for Creating the Object'
  }
  CreatedByUser,
  @EndUserText: {
    quickInfo: 'Date of Last Change'
  }
  LastChangeDate,
  @EndUserText: {
    quickInfo: 'Name of Person Who Changed Object'
  }
  LastChangedByUser,
  @EndUserText: {
    quickInfo: 'Deletion Indicator'
  }
  IsMarkedForDeletion,
  @EndUserText: {
    quickInfo: 'Cross-Plant Product Status'
  }
  CrossPlantStatus,
  @EndUserText: {
    quickInfo: 'Date from which the cross-plant material status is valid'
  }
  CrossPlantStatusValidityDate,
  @EndUserText: {
    quickInfo: 'Old Product Number'
  }
  ProductOldID,
  @EndUserText: {
    quickInfo: 'Gross Weight'
  }
  @Semantics: {
    quantity.unitOfMeasure: 'WeightUnit'
  }
  GrossWeight,
  @EndUserText: {
    quickInfo: 'Unit of Weight'
  }
  WeightUnit,
  @EndUserText: {
    quickInfo: 'Product Group'
  }
  ProductGroup,
  @EndUserText: {
    quickInfo: 'Base Unit of Measure'
  }
  BaseUnit,
  @EndUserText: {
    quickInfo: 'General item category group'
  }
  ItemCategoryGroup,
  @EndUserText: {
    quickInfo: 'Net Weight'
  }
  @Semantics: {
    quantity.unitOfMeasure: 'WeightUnit'
  }
  NetWeight,
  @EndUserText: {
    quickInfo: 'Division'
  }
  Division,
  @EndUserText: {
    quickInfo: 'Volume Unit'
  }
  VolumeUnit,
  @EndUserText: {
    quickInfo: 'Volume'
  }
  @Semantics: {
    quantity.unitOfMeasure: 'VolumeUnit'
  }
  ProductVolume,
  @EndUserText: {
    quickInfo: 'Authorization Group'
  }
  AuthorizationGroup,
  @EndUserText: {
    quickInfo: 'ANP Code'
  }
  ANPCode,
  @EndUserText: {
    quickInfo: 'Size/dimensions'
  }
  SizeOrDimensionText,
  @EndUserText: {
    quickInfo: 'Industry Standard Description (such as ANSI or ISO)'
  }
  IndustryStandardName,
  @EndUserText: {
    quickInfo: 'Global Trade Item Number (EAN/UPC/GTIN)'
  }
  ProductStandardID,
  @EndUserText: {
    quickInfo: 'Category of International Article Number (EAN)'
  }
  InternationalArticleNumberCat,
  @EndUserText: {
    quickInfo: 'Product is Configurable'
  }
  ProductIsConfigurable,
  @EndUserText: {
    quickInfo: 'Batch Management Requirement Indicator'
  }
  IsBatchManagementRequired,
  @EndUserText: {
    quickInfo: 'External Product Group'
  }
  ExternalProductGroup,
  @EndUserText: {
    quickInfo: 'Cross-Plant Configurable Product'
  }
  CrossPlantConfigurableProduct,
  @EndUserText: {
    quickInfo: 'Level of Explicitness for Serial Number'
  }
  SerialNoExplicitnessLevel,
  @EndUserText: {
    quickInfo: 'Approved Batch Record Required'
  }
  IsApprovedBatchRecordReqd,
  @EndUserText: {
    quickInfo: 'Handling Indicator'
  }
  HandlingIndicator,
  @EndUserText: {
    quickInfo: 'Warehouse Material Group'
  }
  WarehouseProductGroup,
  @EndUserText: {
    quickInfo: 'Warehouse Storage Condition'
  }
  WarehouseStorageCondition,
  @EndUserText: {
    quickInfo: 'Standard HU Type'
  }
  StandardHandlingUnitType,
  @EndUserText: {
    quickInfo: 'Serial Number Profile'
  }
  SerialNumberProfile,
  @EndUserText: {
    quickInfo: 'Pilferable'
  }
  IsPilferable,
  @EndUserText: {
    quickInfo: 'Relevant for Hazardous Substances'
  }
  IsRelevantForHzdsSubstances,
  @EndUserText: {
    quickInfo: 'Quarantine Period'
  }
  @Semantics: {
    quantity.unitOfMeasure: 'TimeUnitForQuarantinePeriod'
  }
  QuarantinePeriod,
  @EndUserText: {
    quickInfo: 'Time Unit for Quarantine Period'
  }
  TimeUnitForQuarantinePeriod,
  @EndUserText: {
    quickInfo: 'Quality Inspection Group'
  }
  QualityInspectionGroup,
  @EndUserText: {
    quickInfo: 'Handling Unit Type'
  }
  HandlingUnitType,
  @EndUserText: {
    quickInfo: 'Variable Tare Weight'
  }
  HasVariableTareWeight,
  @EndUserText: {
    quickInfo: 'Maximum Packing Length of Packaging Material'
  }
  @Semantics: {
    quantity.unitOfMeasure: 'UnitForMaxPackagingDimensions'
  }
  MaximumPackagingLength,
  @EndUserText: {
    quickInfo: 'Maximum Packing Width of Packaging Material'
  }
  @Semantics: {
    quantity.unitOfMeasure: 'UnitForMaxPackagingDimensions'
  }
  MaximumPackagingWidth,
  @EndUserText: {
    quickInfo: 'Maximum Packing Height of Packaging Material'
  }
  @Semantics: {
    quantity.unitOfMeasure: 'UnitForMaxPackagingDimensions'
  }
  MaximumPackagingHeight,
  @EndUserText: {
    quickInfo: 'Maximum Allowed Capacity of Packaging Material'
  }
  MaximumCapacity,
  @EndUserText: {
    quickInfo: 'Overcapacity Tolerance of the Handling Unit'
  }
  OvercapacityTolerance,
  @EndUserText: {
    quickInfo: 'Unit of Measure for Maximum Packing Length/Width/Height'
  }
  UnitForMaxPackagingDimensions,
  @EndUserText: {
    quickInfo: 'Length'
  }
  @Semantics: {
    quantity.unitOfMeasure: 'ProductMeasurementUnit'
  }
  BaseUnitSpecificProductLength,
  @EndUserText: {
    quickInfo: 'Width'
  }
  @Semantics: {
    quantity.unitOfMeasure: 'ProductMeasurementUnit'
  }
  BaseUnitSpecificProductWidth,
  @EndUserText: {
    quickInfo: 'Height'
  }
  @Semantics: {
    quantity.unitOfMeasure: 'ProductMeasurementUnit'
  }
  BaseUnitSpecificProductHeight,
  @EndUserText: {
    quickInfo: 'Unit of Dimension for Length/Width/Height'
  }
  ProductMeasurementUnit,
  @EndUserText: {
    quickInfo: 'Product Category'
  }
  ArticleCategory,
  @EndUserText: {
    quickInfo: 'Industry'
  }
  IndustrySector,
  @EndUserText: {
    quickInfo: 'Change Time Stamp'
  }
  LastChangeDateTime,
  @EndUserText: {
    quickInfo: 'Time of Last Change'
  }
  LastChangeTime,
  @EndUserText: {
    quickInfo: 'Dangerous Goods Indicator Profile'
  }
  DangerousGoodsIndProfile,
  @EndUserText: {
    quickInfo: 'Document change number (without document management system)'
  }
  ProductDocumentChangeNumber,
  @EndUserText: {
    quickInfo: 'Number Of Sheets (without Document Management system)'
  }
  ProductDocumentPageCount,
  @EndUserText: {
    quickInfo: 'Page Number of document (without Document Management system)'
  }
  ProductDocumentPageNumber,
  @EndUserText: {
    quickInfo: 'CAD Indicator'
  }
  DocumentIsCreatedByCAD,
  @EndUserText: {
    quickInfo: 'Production/inspection memo'
  }
  ProductionOrInspectionMemoTxt,
  @EndUserText: {
    quickInfo: 'Page Format of Production Memo'
  }
  ProductionMemoPageFormat,
  @EndUserText: {
    quickInfo: 'Indicator: Highly Viscous'
  }
  ProductIsHighlyViscous,
  @EndUserText: {
    quickInfo: 'Indicator: In Bulk/Liquid'
  }
  TransportIsInBulk,
  @EndUserText: {
    quickInfo: 'Assign effectivity parameter values/ override change numbers'
  }
  ProdEffctyParamValsAreAssigned,
  @EndUserText: {
    quickInfo: 'Environmentally Relevant'
  }
  ProdIsEnvironmentallyRelevant,
  @EndUserText: {
    quickInfo: 'Laboratory/Design Office'
  }
  LaboratoryOrDesignOffice,
  @EndUserText: {
    quickInfo: 'Material Group: Packaging Materials'
  }
  PackagingProductGroup,
  @EndUserText: {
    quickInfo: 'Reference Material for Materials Packed in Same Way'
  }
  PackingReferenceProduct,
  @EndUserText: {
    quickInfo: 'Basic Material'
  }
  BasicProduct,
  @EndUserText: {
    quickInfo: 'Document number (without document management system)'
  }
  ProductDocumentNumber,
  @EndUserText: {
    quickInfo: 'Document version (without Document Management system)'
  }
  ProductDocumentVersion,
  @EndUserText: {
    quickInfo: 'Document type (without Document Management system)'
  }
  ProductDocumentType,
  @EndUserText: {
    quickInfo: 'Page Format of Document (without Document Management system)'
  }
  ProductDocumentPageFormat,
  @EndUserText: {
    quickInfo: 'Chemical Compliance Relevance Indicator'
  }
  ProdChmlCmplncRelevanceCode,
  @EndUserText: {
    quickInfo: 'Material qualifies for discount in kind'
  }
  DiscountInKindEligibility,
  @EndUserText: {
    quickInfo: 'Competitor'
  }
  ProdCompetitorCustomerNumber,
  @EndUserText: {
    quickInfo: 'Product Hierarchy'
  }
  ProductHierarchy,
  @EndUserText: {
    quickInfo: 'Product allocation determination procedure'
  }
  ProdAllocDetnProcedure,
  @EndUserText: {
    quickInfo: 'Country/Region of Origin of Product'
  }
  CountryOfOrigin,
  @EndUserText: {
    quickInfo: 'Brand'
  }
  RetailArticleBrand,
  @EndUserText: {
    quickInfo: 'Valid-From Date'
  }
  ProductValidStartDate,
  @EndUserText: {
    quickInfo: 'Content unit'
  }
  ContentUnit,
  @EndUserText: {
    quickInfo: 'Net Contents'
  }
  @Semantics: {
    quantity.unitOfMeasure: 'ContentUnit'
  }
  ProductNetContentQuantity,
  @EndUserText: {
    quickInfo: 'Gross contents'
  }
  @Semantics: {
    quantity.unitOfMeasure: 'ContentUnit'
  }
  ProductGrossContentQuantity,
  @EndUserText: {
    quickInfo: 'Deletion date'
  }
  ProductValidEndDate,
  @EndUserText: {
    quickInfo: 'Assortment List Type'
  }
  AssortmentListType,
  @EndUserText: {
    quickInfo: 'Indicator: Contains Non-Textile Parts of Animal Origin'
  }
  TextilePartsIsWithAnimalOrigin,
  @EndUserText: {
    quickInfo: 'Indicator: Use of Season'
  }
  ProductSeasonUsageCategory,
  @EndUserText: {
    quickInfo: 'Empties Bill of Material'
  }
  BillOfMaterialIsForEmpties,
  @EndUserText: {
    quickInfo: 'Service agreement for a retail material'
  }
  ServiceAgreement,
  @EndUserText: {
    quickInfo: 'ABC Indicator'
  }
  ConsumptionValueCategory,
  @EndUserText: {
    quickInfo: 'Unit of Issue'
  }
  GoodsIssueUnit,
  @EndUserText: {
    quickInfo: 'Region of Origin of Material (Non-Preferential Origin)'
  }
  RegionOfOrigin,
  @EndUserText: {
    quickInfo: 'Valuation Class'
  }
  ValuationClass,
  @EndUserText: {
    quickInfo: 'Sales Unit'
  }
  SalesUnit,
  @EndUserText: {
    quickInfo: 'Manufacturer Part Number'
  }
  ProductManufacturerNumber,
  @EndUserText: {
    quickInfo: 'Number of a Manufacturer'
  }
  ManufacturerNumber,
  @EndUserText: {
    quickInfo: 'Mfr Part Profile'
  }
  ManufacturerPartProfile,
  @EndUserText: {
    quickInfo: 'Number of firm\'s own (internal) inventory-managed material'
  }
  OwnInventoryManagedProduct,
  @Consumption: {
    hidden: true
  }
  _ProductGroup_2,
  @Consumption: {
    hidden: true
  }
  _ProductType,
  _ProductChangeMaster : redirected to composition child ZC_PRODUCTCHANGEMASTERTP_2,
  _ProductDescription : redirected to composition child ZC_PRODUCTDESCRIPTIONTP_2,
  _ProductEWMWarehouse : redirected to composition child ZC_PRODUCTEWMWAREHOUSETP_2,
  _ProductPlant : redirected to composition child ZC_PRODUCTPLANTTP_2,
  _ProductProcurement : redirected to composition child ZC_PRODUCTPROCUREMENTTP_2,
  _ProductQualityManagement : redirected to composition child ZC_PRDUCTQUALITYMANAGEMENTTP_2,
  _ProductSales : redirected to composition child ZC_PRODUCTSALESTP_2,
  _ProductSalesDelivery : redirected to composition child ZC_PRODUCTSALESDELIVERYTP_2,
  _ProductStorage : redirected to composition child ZC_PRODUCTSTORAGETP_2,
  _ProductUnitOfMeasure : redirected to composition child ZC_PRODUCTUNITOFMEASURETP_2,
  _ProductValuation : redirected to composition child ZC_PRODUCTVALUATIONTP_2
  
}
