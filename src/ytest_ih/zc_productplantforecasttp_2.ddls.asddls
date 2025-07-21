@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Plant Forecast - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #XL
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTPLANTFORECASTTP_2
  as projection on I_PRODUCTPLANTFORECASTTP_2
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
    Quickinfo: 'To date of the material to be copied for consumption'
  }
  ConsumptionRefUsageEndDate,
  @Endusertext: {
    Quickinfo: 'Multiplier for reference material for consumption'
  }
  CnsmpnQuantityMultiplierValue,
  @Endusertext: {
    Quickinfo: 'Reference material for consumption'
  }
  ConsumptionReferenceProduct,
  @Endusertext: {
    Quickinfo: 'Reference plant for consumption'
  }
  ConsumptionReferencePlant,
  @Endusertext: {
    Quickinfo: 'Indicator: take correction factors into account'
  }
  CorrectionFactorIsRequired,
  @Endusertext: {
    Quickinfo: 'Reset Forecast Model Automatically'
  }
  ForecastModelIsReset,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductPlant : redirected to parent ZC_PRODUCTPLANTTP_2
  
}
