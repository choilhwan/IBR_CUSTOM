@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Sales Delivery - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #L
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTSALESDELIVERYTP_2
  as projection on I_PRODUCTSALESDELIVERYTP_2
{
  @Endusertext: {
    Quickinfo: 'Product Number'
  }
  key Product,
  @Endusertext: {
    Quickinfo: 'Sales Organization'
  }
  key ProductSalesOrg,
  @Endusertext: {
    Quickinfo: 'Distribution Channel'
  }
  key ProductDistributionChnl,
  @Endusertext: {
    Quickinfo: 'Minimum order quantity in base unit of measure'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  MinimumOrderQuantity,
  @Endusertext: {
    Quickinfo: 'Delivering Plant'
  }
  SupplyingPlant,
  @Endusertext: {
    Quickinfo: 'Product Pricing Group'
  }
  PriceSpecificationProductGroup,
  @Endusertext: {
    Quickinfo: 'Account Assignment Group for Material'
  }
  AccountDetnProductGroup,
  @Endusertext: {
    Quickinfo: 'Minimum Delivery Quantity in Delivery Note Processing'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  DeliveryNoteProcMinDelivQty,
  @Endusertext: {
    Quickinfo: 'Item Category Group from Material Master'
  }
  ItemCategoryGroup,
  @Endusertext: {
    Quickinfo: 'Unit Of Measure Of Delivery Unit'
  }
  DeliveryQuantityUnit,
  @Endusertext: {
    Quickinfo: 'Delivery unit'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'DeliveryQuantityUnit'
  }
  DeliveryQuantity,
  @Endusertext: {
    Quickinfo: 'Distribution-chain-specific material status'
  }
  ProductSalesStatus,
  @Endusertext: {
    Quickinfo: 'Date from which distr.-chain-spec. material status is valid'
  }
  ProductSalesStatusValidityDate,
  @Endusertext: {
    Quickinfo: 'Sales Unit'
  }
  SalesMeasureUnit,
  @Endusertext: {
    Quickinfo: 'Ind.: Flag material for deletion at distribution chain level'
  }
  IsMarkedForDeletion,
  @Endusertext: {
    Quickinfo: 'Product Group 1'
  }
  FirstSalesSpecProductGroup,
  @Endusertext: {
    Quickinfo: 'Product Group 2'
  }
  SecondSalesSpecProductGroup,
  @Endusertext: {
    Quickinfo: 'Product Group 3'
  }
  ThirdSalesSpecProductGroup,
  @Endusertext: {
    Quickinfo: 'Product Group 4'
  }
  FourthSalesSpecProductGroup,
  @Endusertext: {
    Quickinfo: 'Product Group 5'
  }
  FifthSalesSpecProductGroup,
  @Endusertext: {
    Quickinfo: 'Material statistics group'
  }
  LogisticsStatisticsGroup,
  @Endusertext: {
    Quickinfo: 'Volume rebate group'
  }
  VolumeRebateGroup,
  @Endusertext: {
    Quickinfo: 'Cash Discount Indicator'
  }
  CashDiscountIsDeductible,
  @Endusertext: {
    Quickinfo: 'Commission Group'
  }
  ProductCommissionGroup,
  @Endusertext: {
    Quickinfo: 'Pricing Reference Material'
  }
  PricingReferenceProduct,
  @Endusertext: {
    Quickinfo: 'Rounding Profile'
  }
  RoundingProfile,
  @Endusertext: {
    Quickinfo: 'Variable Sales Unit Not Allowed'
  }
  VariableSalesUnitIsNotAllowed,
  @Endusertext: {
    Quickinfo: 'ID for product attribute 1'
  }
  ProductHasAttributeID01,
  @Endusertext: {
    Quickinfo: 'ID for product attribute 2'
  }
  ProductHasAttributeID02,
  @Endusertext: {
    Quickinfo: 'ID for product attribute 3'
  }
  ProductHasAttributeID03,
  @Endusertext: {
    Quickinfo: 'ID for product attribute 4'
  }
  ProductHasAttributeID04,
  @Endusertext: {
    Quickinfo: 'ID for product attribute 5'
  }
  ProductHasAttributeID05,
  @Endusertext: {
    Quickinfo: 'ID for product attribute 6'
  }
  ProductHasAttributeID06,
  @Endusertext: {
    Quickinfo: 'ID for product attribute 7'
  }
  ProductHasAttributeID07,
  @Endusertext: {
    Quickinfo: 'ID for product attribute 8'
  }
  ProductHasAttributeID08,
  @Endusertext: {
    Quickinfo: 'ID for product attribute 9'
  }
  ProductHasAttributeID09,
  @Endusertext: {
    Quickinfo: 'ID for product attribute 10'
  }
  ProductHasAttributeID10,
  @Endusertext: {
    Quickinfo: 'Relevant for Entitlement Generation'
  }
  ProdIsEntlmntRlvt,
  @Endusertext: {
    Quickinfo: 'Base Unit of Measure'
  }
  BaseUnit,
  @Endusertext: {
    Quickinfo: 'Product Hierarchy'
  }
  ProductHierarchy,
  @Endusertext: {
    Quickinfo: 'External assortment priority'
  }
  ProdExtAssortmentPriority,
  @Endusertext: {
    Quickinfo: 'Assortment grade'
  }
  AssortmentGrade,
  @Endusertext: {
    Quickinfo: 'Listing procedure for store or other assortment categories'
  }
  StoreListingProcedure,
  @Endusertext: {
    Quickinfo: 'Listing procedure for distr. center assortment categories'
  }
  DistrCenterListingProcedure,
  @Endusertext: {
    Quickinfo: 'Date from which listed in the store'
  }
  StoreListingStartDate,
  @Endusertext: {
    Quickinfo: 'Date to which listed in the store'
  }
  StoreListingEndDate,
  @Endusertext: {
    Quickinfo: 'Date from which listed in the distribution center'
  }
  DistrCenterListingStartDate,
  @Endusertext: {
    Quickinfo: 'Date to which listed in the central warehouse/distr. center'
  }
  DistrCenterListingEndDate,
  @Endusertext: {
    Quickinfo: 'Date from which sold in the store'
  }
  StoreSaleStartDate,
  @Endusertext: {
    Quickinfo: 'Date to which sold in the store'
  }
  StoreSaleEndDate,
  @Endusertext: {
    Quickinfo: 'Date from which sold in the distribution center'
  }
  DistrCenterSaleStartDate,
  @Endusertext: {
    Quickinfo: 'Date to which sold in the distribution center'
  }
  DistributionCenterSaleEndDate,
  @Endusertext: {
    Quickinfo: 'Unit of Measure Group'
  }
  ProductUnitGroup,
  @Endusertext: {
    Quickinfo: 'Maximum delivery quantity in store order processing'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  StoreOrderMaxDelivQty,
  @Endusertext: {
    Quickinfo: 'Indicator for price fixing'
  }
  PriceFixingCategory,
  @Endusertext: {
    Quickinfo: 'Competition characterization of a material'
  }
  CompetitionPressureCategory,
  _ProdSalesDeliverySalesTax : redirected to composition child ZC_PRODSLSDELIVERYSALESTAXTP_2,
  _ProdSlsDelivPointOfSale : redirected to composition child ZC_PRODSLSDELIVPOINTOFSALETP_2,
  _Product : redirected to parent ZC_PRODUCTTP_2
  
}
