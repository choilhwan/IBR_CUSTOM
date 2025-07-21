@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Quality Management - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #L
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRDUCTQUALITYMANAGEMENTTP_2
  as projection on I_PRODUCTQUALITYMANAGEMENTTP_2
{
  @Endusertext: {
    Quickinfo: 'Product Number'
  }
  key Product,
  @Endusertext: {
    Quickinfo: 'QM in Procurement Is Active'
  }
  QltyMgmtInProcmtIsActive,
  @Endusertext: {
    Quickinfo: 'Catalog Profile'
  }
  CatalogProfile,
  _Product : redirected to parent ZC_PRODUCTTP_2
  
}
