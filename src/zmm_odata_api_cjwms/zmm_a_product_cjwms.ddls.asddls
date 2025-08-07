@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '[MM] Projection View For ZMM_R_PRODUCT_CJWMS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZMM_A_PRODUCT_CJWMS
  provider contract transactional_query
  as projection on ZMM_R_PRODUCT_CJWMS
{
  key Product,
      ProductExternalID,
      ProductOID,
      ProductType,
      CreationDate,
      CreationTime,
      CreationDateTime,
      CreatedByUser,
      LastChangeDate,
      LastChangedByUser,
      IsMarkedForDeletion,
      ProductGroup,
      BaseUnit,
//      ProductDescKR,
//      ProductDescEN, 
      /* Associations */
      _ProductDesc,
      _ProductGroupText_2,
      _ProductPlantBasic
}
