@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Prod Sales delivery Point Of Sale - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #L
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODSLSDELIVPOINTOFSALETP_2
  as projection on I_PRODSLSDELIVPOINTOFSALETP_2
{
  @Endusertext: {
    Quickinfo: 'Material Number'
  }
  key Product,
  @Endusertext: {
    Quickinfo: 'Sales organization in distribution chain, IS-R'
  }
  key ProductSalesOrg,
  @Endusertext: {
    Quickinfo: 'Distribution channel in distribution chain, IS-R'
  }
  key ProductDistributionChnl,
  @Endusertext: {
    Quickinfo: 'Retail plant'
  }
  key Plant,
  @Endusertext: {
    Quickinfo: 'Date from which sold in the store'
  }
  StoreSaleStartDate,
  @Endusertext: {
    Quickinfo: 'Date to which sold in the store'
  }
  StoreSaleEndDate,
  @Endusertext: {
    Quickinfo: 'Distribution-chain-specific material status'
  }
  ProductSalesStatus,
  @Endusertext: {
    Quickinfo: 'Date from which distr.-chain-spec. material status is valid'
  }
  ProductSalesStatusValidityDate,
  @Endusertext: {
    Quickinfo: 'Discount allowed'
  }
  PointOfSalesDiscountIsAllowed,
  @Endusertext: {
    Quickinfo: 'Scales group'
  }
  ScalesGroup,
  @Endusertext: {
    Quickinfo: 'Price required'
  }
  ProdSlsDelivPOSIsPriceRequired,
  @Endusertext: {
    Quickinfo: 'No repeat key'
  }
  ProdSlsDelivRepeatKey,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductSalesDelivery : redirected to parent ZC_PRODUCTSALESDELIVERYTP_2
  
}
