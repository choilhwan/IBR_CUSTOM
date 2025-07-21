@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Unit of Measure - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #A, 
  Usagetype.Sizecategory: #L
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTUNITOFMEASURETP_2
  as projection on I_PRODUCTUNITOFMEASURETP_2
{
  @Endusertext: {
    Quickinfo: 'Product Number'
  }
  key Product,
  @Endusertext: {
    Quickinfo: 'Alternative Unit of Measure for Stockkeeping Unit'
  }
  key AlternativeUnit,
  @Endusertext: {
    Quickinfo: 'Numerator for Conversion to Base Units of Measure'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  QuantityNumerator,
  @Endusertext: {
    Quickinfo: 'Denominator for conversion to base units of measure'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'AlternativeUnit'
  }
  QuantityDenominator,
  @Endusertext: {
    Quickinfo: 'Volume'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'VolumeUnit'
  }
  ProductVolume,
  @Endusertext: {
    Quickinfo: 'Volume Unit'
  }
  VolumeUnit,
  @Endusertext: {
    Quickinfo: 'Gross Weight'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'WeightUnit'
  }
  GrossWeight,
  @Endusertext: {
    Quickinfo: 'Unit of Weight'
  }
  WeightUnit,
  @Endusertext: {
    Quickinfo: 'International Article Number (EAN/UPC)'
  }
  GlobalTradeItemNumber,
  @Endusertext: {
    Quickinfo: 'Category of Global Trade Item Number (GTIN)'
  }
  GlobalTradeItemNumberCategory,
  @Endusertext: {
    Quickinfo: 'Length'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'ProductMeasurementUnit'
  }
  UnitSpecificProductLength,
  @Endusertext: {
    Quickinfo: 'Width'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'ProductMeasurementUnit'
  }
  UnitSpecificProductWidth,
  @Endusertext: {
    Quickinfo: 'Height'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'ProductMeasurementUnit'
  }
  UnitSpecificProductHeight,
  @Endusertext: {
    Quickinfo: 'Unit of Dimension for Length/Width/Height'
  }
  ProductMeasurementUnit,
  @Endusertext: {
    Quickinfo: 'Lower-Level Unit of Measure in a Packing Hierarchy'
  }
  LowerLevelPackagingUnit,
  @Endusertext: {
    Quickinfo: 'Maximum Stacking Factor'
  }
  MaximumStackingFactor,
  @Endusertext: {
    Quickinfo: 'Capacity Usage'
  }
  CapacityUsage,
  @Endusertext: {
    Quickinfo: 'Base Unit of Measure'
  }
  BaseUnit,
  _Product : redirected to parent ZC_PRODUCTTP_2,
  _ProductUnitOfMeasureEAN : redirected to composition child ZC_PRODUCTUNITOFMEASUREEANTP_2,
  _ProdUoMSuplrEAN : redirected to composition child ZC_PRODUOMSUPLREANTP_2
  
}
