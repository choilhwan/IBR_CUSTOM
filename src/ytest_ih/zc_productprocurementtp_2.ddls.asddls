@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Procurement - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #L
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTPROCUREMENTTP_2
  as projection on I_PRODUCTPROCUREMENTTP_2
{
  @Endusertext: {
    Quickinfo: 'Product Number'
  }
  key Product,
  @Endusertext: {
    Quickinfo: 'Purchase Order Unit of Measure'
  }
  PurchaseOrderQuantityUnit,
  @Endusertext: {
    Quickinfo: 'Variable Purchase Order Unit Active'
  }
  VarblPurOrdUnitStatus,
  @Endusertext: {
    Quickinfo: 'Purchasing Value Key'
  }
  PurchasingAcknProfile,
  @Endusertext: {
    Quickinfo: 'Source of Supply'
  }
  SourceOfSupplyCategory,
  @Endusertext: {
    Quickinfo: 'Procurement rule'
  }
  ProcurementRule,
  @Endusertext: {
    Quickinfo: 'Purchasing Group'
  }
  PurchasingGroup,
  @Endusertext: {
    Quickinfo: 'Date to which listed in the store'
  }
  StoreListingEndDate,
  @Endusertext: {
    Quickinfo: 'Date to which listed in the central warehouse/distr. center'
  }
  DistrCenterListingEndDate,
  @Endusertext: {
    Quickinfo: 'Date from which listed in the store'
  }
  StoreListingStartDate,
  @Endusertext: {
    Quickinfo: 'Date from which listed in the distribution center'
  }
  DistrCenterListingStartDate,
  @Endusertext: {
    Quickinfo: 'Listing procedure for store or other assortment categories'
  }
  StoreListingProcedure,
  @Endusertext: {
    Quickinfo: 'Listing procedure for distr. center assortment categories'
  }
  DistrCenterListingProcedure,
  @Endusertext: {
    Quickinfo: 'External assortment priority'
  }
  ProdExtAssortmentPriority,
  @Endusertext: {
    Quickinfo: 'Assortment grade'
  }
  AssortmentGrade,
  _Product : redirected to parent ZC_PRODUCTTP_2
  
}
