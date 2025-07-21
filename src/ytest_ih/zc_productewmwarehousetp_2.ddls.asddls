@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product EWM Warehouse - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #C, 
  Usagetype.Sizecategory: #L
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTEWMWAREHOUSETP_2
  as projection on I_PRODUCTEWMWAREHOUSETP_2
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
    Quickinfo: 'Base Unit of Measure'
  }
  BaseUnit,
  @Endusertext: {
    Quickinfo: 'Process Block Profile'
  }
  EWMProductProcessBlockProfile,
  @Endusertext: {
    Quickinfo: 'Control Indicator for Process Type Determination'
  }
  EWMProcessTypeControlCode,
  @Endusertext: {
    Quickinfo: 'Product Load Category'
  }
  EWMProductLoadCategory,
  @Endusertext: {
    Quickinfo: 'Staging Area and Door Determination Group'
  }
  EWMStggAreaDeterminationGroup,
  @Endusertext: {
    Quickinfo: 'Consumption-Relevant for VAS'
  }
  EWMIsCnsmpnRlvtForValAddedSrvc,
  @Endusertext: {
    Quickinfo: 'Required Minimum Shelf Life'
  }
  RequiredMinShelfLife,
  @Endusertext: {
    Quickinfo: 'Putaway Control'
  }
  EWMPtwyControlStrategy,
  @Endusertext: {
    Quickinfo: 'Storage Section Indicator'
  }
  EWMStorageSectionMethod,
  @Endusertext: {
    Quickinfo: 'Storage Bin Type'
  }
  EWMStorageBinType,
  @Endusertext: {
    Quickinfo: 'Bulk Storage'
  }
  EWMBulkStorageMethod,
  @Endusertext: {
    Quickinfo: 'Stock Removal Control'
  }
  EWMStockRemovalControlStrategy,
  @Endusertext: {
    Quickinfo: 'Stock Determination Group'
  }
  EWMStockDeterminationGroup,
  @Endusertext: {
    Quickinfo: 'Relevance for Two-Step Picking'
  }
  EWMProdTwoStepPickingRelevant,
  @Endusertext: {
    Quickinfo: 'Demand Quantity'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  EWMSltgRequirementQuantity,
  @Endusertext: {
    Quickinfo: 'Number of Sales Order Items'
  }
  EWMSltgNumberOfSalesOrderItems,
  @Endusertext: {
    Quickinfo: 'Recommended Storage Quantity'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  EWMSltgRecmddStorageQuantity,
  @Endusertext: {
    Quickinfo: 'Weight Indicator'
  }
  EWMSlottingWeightSizeCode,
  @Endusertext: {
    Quickinfo: 'Volume Indicator'
  }
  EWMSlottingVolumeSizeCode,
  @Endusertext: {
    Quickinfo: 'Length Indicator'
  }
  EWMSlottingLengthSizeCode,
  @Endusertext: {
    Quickinfo: 'Width Indicator'
  }
  EWMSlottingWidthSizeCode,
  @Endusertext: {
    Quickinfo: 'Height Indicator'
  }
  EWMSlottingHeightSizeCode,
  @Endusertext: {
    Quickinfo: 'Cycle Counting Indicator'
  }
  EWMPhysInventoryCountingCycle,
  @Endusertext: {
    Quickinfo: 'Backflush Withdrawal for Product'
  }
  EWMProdBackflushWthdrwlMethod,
  @Endusertext: {
    Quickinfo: 'Type of Quantity Correlation for Kits'
  }
  EWMKitQuantityCorrelation,
  @Endusertext: {
    Quickinfo: 'Merchandise Distribution - Adjustment Profile'
  }
  EWMQuantityAdjustmentProfile,
  @Endusertext: {
    Quickinfo: 'Quantity Classification for Merchandise Distr. Quant. Adj.'
  }
  EWMMrchdsDistrQtyClassfctn,
  @Endusertext: {
    Quickinfo: 'Preferred Alternative UoM for Warehouse Operations'
  }
  EWMPreferredUnit,
  @Endusertext: {
    Quickinfo: 'Quality Inspection Group'
  }
  EWMQualityInspectionGroup,
  _BusinessPartner,
  _Product : redirected to parent ZC_PRODUCTTP_2,
  _ProductEWMStorageType : redirected to composition child ZC_PRODUCTEWMSTORAGETYPETP_2
  
}
