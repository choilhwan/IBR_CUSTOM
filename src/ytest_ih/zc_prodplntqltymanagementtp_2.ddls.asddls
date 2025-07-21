@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Plant Quality Management - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #XL
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODPLNTQLTYMANAGEMENTTP_2
  as projection on I_PRODPLNTQLTYMANAGEMENTTP_2
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
    Quickinfo: 'Control Key for Quality Management in Procurement'
  }
  ProdQltyManagementControlKey,
  @Endusertext: {
    Quickinfo: 'Has Post to Inspection Stock'
  }
  HasPostToInspectionStock,
  @Endusertext: {
    Quickinfo: 'Documentation required indicator'
  }
  InspLotDocumentationIsRequired,
  @Endusertext: {
    Quickinfo: 'Target QM System for Supplier'
  }
  QualityMgmtSystemForSupplier,
  @Endusertext: {
    Quickinfo: 'Interval Until Next Recurring Inspection'
  }
  RecrrgInspIntervalTimeInDays,
  @Endusertext: {
    Quickinfo: 'Certificate Type'
  }
  ProductQualityCertificateType,
  @Endusertext: {
    Quickinfo: 'Material Authorization Group for Activities in QM'
  }
  ProdQualityAuthorizationGroup,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductPlant : redirected to parent ZC_PRODUCTPLANTTP_2
  
}
