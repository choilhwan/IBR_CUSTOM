@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Plant Storage Location - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #XL
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRDPLANTSTORAGELOCATIONTP_2
  as projection on I_PRODPLANTSTORAGELOCATIONTP_2
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
    Quickinfo: 'Storage Location'
  }
  key StorageLocation,
  @Endusertext: {
    Quickinfo: 'Storage Bin'
  }
  WarehouseStorageBin,
  @Endusertext: {
    Quickinfo: 'Flag Material for Deletion at Storage Location Level'
  }
  IsMarkedForDeletion,
  @Endusertext: {
    Quickinfo: 'Picking area for lean WM'
  }
  LeanWrhsManagementPickingArea,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductPlant : redirected to parent ZC_PRODUCTPLANTTP_2
  
}
