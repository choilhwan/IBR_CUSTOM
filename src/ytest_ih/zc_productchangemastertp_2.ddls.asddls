@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Change Master - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #L
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTCHANGEMASTERTP_2
  as projection on I_PRODUCTCHANGEMASTERTP_2
{
  @Endusertext: {
    Quickinfo: 'Material Number'
  }
  key Product,
  @Endusertext: {
    Quickinfo: 'Change Number'
  }
  key ChangeNumber,
  @Endusertext: {
    Quickinfo: 'Revision Level without Conversion Exit'
  }
  RevisionLevel,
  _Product : redirected to parent ZC_PRODUCTTP_2
  
}
