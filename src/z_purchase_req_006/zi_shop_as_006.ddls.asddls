@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for online shop'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_SHOP_AS_006 as select from zshop_as_006
{
    key order_uuid as OrderUuid,
    purchasereqn as Purchasereqn,
    purinforecord as Purinforecord,
    purorder as Purorder
}
