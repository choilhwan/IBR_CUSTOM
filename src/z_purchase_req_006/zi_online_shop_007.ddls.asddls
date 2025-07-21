@EndUserText.label: 'Data model for online shop'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZI_ONLINE_SHOP_007 as select from zonlineshop_007
  association [1..1] to ZI_SHOP_AS_006 as _purchase_req      on $projection.Order_Uuid = _purchase_req     .OrderUuid
 {
  key order_uuid as Order_Uuid,
   order_id as Order_Id,
   ordereditem as Ordereditem,
   deliverydate as Deliverydate,
   creationdate as Creationdate,
   
   //association
   _purchase_req     
 }
