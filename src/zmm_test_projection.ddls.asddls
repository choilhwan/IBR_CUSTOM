@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'test'
@Metadata.ignorePropagatedAnnotations: true
define view entity zmm_test_projection provider contract transactional_query as projection on I_ProductPlantTP_2
{
    key Product,
    key Plant
}
