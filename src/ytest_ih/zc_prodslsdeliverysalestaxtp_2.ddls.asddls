@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Sales Delivery Sales Tax - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #C, 
  Usagetype.Sizecategory: #L
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODSLSDELIVERYSALESTAXTP_2
  as projection on I_PRODSLSDELIVERYSALESTAXTP_2
{
  @Endusertext: {
    Quickinfo: 'Product Number'
  }
  key Product,
  @Endusertext: {
    Quickinfo: 'Departure Country/Region (from which the goods are sent)'
  }
  key Country,
  @Endusertext: {
    Quickinfo: 'Tax Condition Type (Sales Tax, Value-Added Tax,...)'
  }
  key ProductSalesTaxCategory,
  @Endusertext: {
    Quickinfo: 'Sales Organization'
  }
  key ProductSalesOrg,
  @Endusertext: {
    Quickinfo: 'Distribution Channel'
  }
  key ProductDistributionChnl,
  ProductTaxClassification,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductSalesDelivery : redirected to parent ZC_PRODUCTSALESDELIVERYTP_2
  
}
