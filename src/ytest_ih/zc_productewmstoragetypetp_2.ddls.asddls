@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product EWM Storage Type - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #C, 
  Usagetype.Sizecategory: #XL
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTEWMSTORAGETYPETP_2
  as projection on I_PRODUCTEWMSTORAGETYPETP_2
{
  @Endusertext: {
    Quickinfo: 'Product Number'
  }
  key Product,
  @Endusertext: {
    Quickinfo: 'Warehouse Number/Warehouse Complex'
  }
  key EWMWarehouse,
  @Endusertext: {
    Quickinfo: 'Business Partner Number'
  }
  key EntitledToDisposeParty,
  @Endusertext: {
    Quickinfo: 'Storage Type'
  }
  key EWMStorageType,
  @Endusertext: {
    Quickinfo: 'Internal Number (UID) for Product'
  }
  @Semantics: {
    Uuid: true
  }
  ProductInternalUUID,
  @Endusertext: {
    Quickinfo: 'Supply Chain Unit GUID'
  }
  SupplyChainUnitUUID,
  @Endusertext: {
    Quickinfo: 'Party Entitled to Dispose (GUID)'
  }
  EWMPartyEntitledToDisposeUUID,
  @Endusertext: {
    Quickinfo: 'Storage Section Indicator'
  }
  EWMStorageSectionMethod,
  @Endusertext: {
    Quickinfo: 'Storage Bin Type'
  }
  EWMStorageBinType,
  @Endusertext: {
    Quickinfo: 'Maximum No. of Bins'
  }
  EWMMaximumNumberOfBins,
  @Endusertext: {
    Quickinfo: 'Maximum Quantity'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'EWMMaxStorQuantityBaseUnit'
  }
  EWMMaximumStorageQuantity,
  @Endusertext: {
    Quickinfo: 'Base Unit of Measure'
  }
  EWMMaxStorQuantityBaseUnit,
  @Endusertext: {
    Quickinfo: 'Display Unit of Measure for Maximum Quantity'
  }
  EWMMaxStorQuantityDisplayUnit,
  @Endusertext: {
    Quickinfo: 'Minimum Quantity'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'EWMMinStorQuantityBaseUnit'
  }
  EWMMinimumStorageQuantity,
  @Endusertext: {
    Quickinfo: 'Base Unit of Measure'
  }
  EWMMinStorQuantityBaseUnit,
  @Endusertext: {
    Quickinfo: 'Display Unit of Measure for Minimum Quantity'
  }
  EWMMinStorQuantityDisplayUnit,
  @Endusertext: {
    Quickinfo: 'Minimum Replenishment Quantity'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'EWMMinReplnmtQtyBaseUnit'
  }
  EWMMinReplnmtQuantity,
  @Endusertext: {
    Quickinfo: 'Base Unit of Measure'
  }
  EWMMinReplnmtQtyBaseUnit,
  @Endusertext: {
    Quickinfo: 'Display Unit of Measure for Replenishment Quantity'
  }
  EWMMinReplnmtQtyDisplayUnit,
  @Endusertext: {
    Quickinfo: 'Minimum Quantity as Percentage of Maximum Quantity'
  }
  EWMMinStorQtyOfMaxStorQtyInPct,
  @Endusertext: {
    Quickinfo: 'Putaway Threshold Addition (in Percent of Storage Bin)'
  }
  EWMSpltPtwyThresholdInPercent,
  @Endusertext: {
    Quickinfo: 'Split During Putaway'
  }
  EWMProdIsSplitOnPtwy,
  @Endusertext: {
    Quickinfo: 'Skip During Putaway'
  }
  EWMProdIsSkippedOnPtwy,
  @Endusertext: {
    Quickinfo: 'No Replenishment'
  }
  EWMHasNoReplenishment,
  @Endusertext: {
    Quickinfo: 'Sort Rule for Empty Storage Bin Search'
  }
  EWMStorageBinSearchRule,
  @Endusertext: {
    Quickinfo: 'Quantity Classification in Warehouse'
  }
  EWMProdQuantityClassification,
  @Endusertext: {
    Quickinfo: 'Putaway Quantity Classification'
  }
  EWMProdPtwyQtyClassification,
  @Endusertext: {
    Quickinfo: 'Putaway Sequence'
  }
  EWMPtwySequence,
  _BusinessPartner,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductEWMWarehouse : redirected to parent ZC_PRODUCTEWMWAREHOUSETP_2
  
}
