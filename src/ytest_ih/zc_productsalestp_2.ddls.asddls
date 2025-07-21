@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Sales - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #L
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTSALESTP_2
  as projection on I_PRODUCTSALESTP_2
{
  @Endusertext: {
    Quickinfo: 'Product Number'
  }
  key Product,
  @Endusertext: {
    Quickinfo: 'Cross-Distribution-Chain Material Status'
  }
  SalesStatus,
  @Endusertext: {
    Quickinfo: 'Date from which the X-distr.-chain Product status is valid'
  }
  SalesStatusValidityDate,
  @Endusertext: {
    Quickinfo: 'Transportation Group'
  }
  TransportationGroup,
  @Endusertext: {
    Quickinfo: 'Packaging Material Type'
  }
  PackagingProductType,
  @Endusertext: {
    Quickinfo: 'Allowed packaging weight'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'AllowedPackagingWeightQtyUnit'
  }
  AllowedPackagingWeightQty,
  @Endusertext: {
    Quickinfo: 'Unit of weight (allowed packaging weight)'
  }
  AllowedPackagingWeightQtyUnit,
  @Endusertext: {
    Quickinfo: 'Allowed packaging volume'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'AllowedPackagingVolumeQtyUnit'
  }
  AllowedPackagingVolumeQty,
  @Endusertext: {
    Quickinfo: 'Volume unit (allowed packaging volume)'
  }
  AllowedPackagingVolumeQtyUnit,
  @Endusertext: {
    Quickinfo: 'Maximum level (by volume)'
  }
  MaximumLevelByVolumeInPercent,
  @Endusertext: {
    Quickinfo: 'Excess Weight Tolerance for Handling unit'
  }
  ExcessWeightToleranceValue,
  @Endusertext: {
    Quickinfo: 'Packaging Material is Closed Packaging'
  }
  PackggProductIsClosedPackaging,
  @Endusertext: {
    Quickinfo: 'Stacking factor'
  }
  ProductStackingFactor,
  @Endusertext: {
    Quickinfo: 'Excess Volume Tolerance of the Handling Unit'
  }
  ProdExcessVolumeToleranceValue,
  @Endusertext: {
    Quickinfo: 'Tax classification of the material'
  }
  ProductTaxClassification,
  @Endusertext: {
    Quickinfo: 'Pricing Reference Material'
  }
  PricingReferenceProduct,
  @Endusertext: {
    Quickinfo: 'Loading Group'
  }
  LoadingGroup,
  @Endusertext: {
    Quickinfo: 'Date to which sold in the store'
  }
  StoreSaleEndDate,
  @Endusertext: {
    Quickinfo: 'Date to which sold in the distribution center'
  }
  DistributionCenterSaleEndDate,
  @Endusertext: {
    Quickinfo: 'Date from which sold in the store'
  }
  StoreSaleStartDate,
  @Endusertext: {
    Quickinfo: 'Date from which sold in the distribution center'
  }
  DistrCenterSaleStartDate,
  _Product : redirected to parent ZC_PRODUCTTP_2
  
}
