@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_ONLINESHOP_006
  as select from zonlineshop_006
  association [1..1] to ZI_SHOP_AS_006            as _purchase_req     on  $projection.OrderUuid = _purchase_req.OrderUuid
{
  key order_uuid as OrderUuid,
  order_id as OrderId,
  ordereditem as Ordereditem,
  deliverydate as Deliverydate,
  creationdate as Creationdate,
  @Semantics.user.createdBy: true
  creation_user as CreationUser,
  @Semantics.user.lastChangedBy: true
  change_user as ChangeUser,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_lastchange as LocalLastchange,
  @Semantics.systemDateTime.lastChangedAt: true
  lastchange as Lastchange,
  creationtimestamp as creationtimestamp,
  _purchase_req
  
}
