@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_ONLINESHOP_006
  provider contract transactional_query
  as projection on ZR_ONLINESHOP_006
{
  key OrderUuid,
  OrderId,
  Ordereditem,
  Deliverydate,
  Creationdate,
  CreationUser, //Created By    
  ChangeUser, //Changed By
  LocalLastchange, //Changed On
  Lastchange, //Changed On   
  creationtimestamp
}
