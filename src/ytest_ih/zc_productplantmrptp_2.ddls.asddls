@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Plant MRP - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #C, 
  Usagetype.Sizecategory: #L
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODUCTPLANTMRPTP_2
  as projection on I_PRODUCTPLANTMRPTP_2
{
  @Endusertext: {
    Quickinfo: 'Material Number'
  }
  key Product,
  @Endusertext: {
    Quickinfo: 'MRP Area'
  }
  key MRPArea,
  @Endusertext: {
    Quickinfo: 'MRP Area: Plant'
  }
  key Plant,
  @Endusertext: {
    Quickinfo: 'MRP Type'
  }
  MRPType,
  @Endusertext: {
    Quickinfo: 'MRP Controller'
  }
  MRPResponsible,
  @Endusertext: {
    Quickinfo: 'MRP Group'
  }
  MRPGroup,
  @Endusertext: {
    Quickinfo: 'Reorder Point'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  ReorderThresholdQuantity,
  @Endusertext: {
    Quickinfo: 'Planning Cycle'
  }
  PlanAndOrderDayDetermination,
  @Endusertext: {
    Quickinfo: 'Planning time fence'
  }
  PlanningTimeFence,
  @Endusertext: {
    Quickinfo: 'Lot Sizing Procedure in Materials Planning'
  }
  LotSizingProcedure,
  @Endusertext: {
    Quickinfo: 'Rounding Profile'
  }
  RoundingProfile,
  @Endusertext: {
    Quickinfo: 'Rounding value for purchase order quantity'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  LotSizeRoundingQuantity,
  @Endusertext: {
    Quickinfo: 'Minimum Lot Size'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  MinimumLotSizeQuantity,
  @Endusertext: {
    Quickinfo: 'Maximum Lot Size'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  MaximumLotSizeQuantity,
  @Endusertext: {
    Quickinfo: 'Maximum Stock Level'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  MaximumStockQuantity,
  @Endusertext: {
    Quickinfo: 'Assembly scrap in percent'
  }
  AssemblyScrapPercent,
  @Endusertext: {
    Quickinfo: 'Special Procurement Type'
  }
  ProcurementSubType,
  @Endusertext: {
    Quickinfo: 'Storage Location'
  }
  ProductionInvtryManagedLoc,
  @Endusertext: {
    Quickinfo: 'Default Storage Location for External Procurement'
  }
  DfltStorageLocationExtProcmt,
  @Endusertext: {
    Quickinfo: 'Planning Calendar'
  }
  MRPPlanningCalendar,
  @Endusertext: {
    Quickinfo: 'Safety Stock'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  SafetyStockQuantity,
  @Endusertext: {
    Quickinfo: 'Range-of-Coverage Profile'
  }
  RangeOfCvrgPrflCode,
  @Endusertext: {
    Quickinfo: 'Safety Time (in Workdays)'
  }
  SafetySupplyDurationInDays,
  @Endusertext: {
    Quickinfo: 'Fixed lot size'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  FixedLotSizeQuantity,
  @Endusertext: {
    Quickinfo: 'Lot-Size-Independent Costs'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  LotSizeIndependentCosts,
  @Endusertext: {
    Quickinfo: 'Storage Costs Percentage Code'
  }
  StorageCostsPercentageCode,
  @Endusertext: {
    Quickinfo: 'Service level'
  }
  ProductServiceLevelInPercent,
  @Endusertext: {
    Quickinfo: 'Deletion Indicator'
  }
  IsMarkedForDeletion,
  @Endusertext: {
    Quickinfo: 'Period Profile for Safety Time'
  }
  SafetyTimePeriodProfile,
  @Endusertext: {
    Quickinfo: 'MRP relevancy for dependent requirements'
  }
  DependentRqmtMRPRelevance,
  @Endusertext: {
    Quickinfo: 'Safety Time Indicator (with or Without Safety Time)'
  }
  ProductSafetyTimeMRPRelevance,
  @Endusertext: {
    Quickinfo: 'Planned Delivery Time in Days'
  }
  PlannedDeliveryDurationInDays,
  @Endusertext: {
    Quickinfo: 'Consider Planned Delivery Time of the MRP Area'
  }
  IsPlannedDeliveryTime,
  @Endusertext: {
    Quickinfo: 'Takt time'
  }
  RqmtQtyRcptTaktTmeInWrkgDays,
  @Endusertext: {
    Quickinfo: 'MRP Safety Stock Method'
  }
  MRPSafetyStockMethod,
  @Endusertext: {
    Quickinfo: 'Currency Key'
  }
  Currency,
  @Endusertext: {
    Quickinfo: 'Base Unit of Measure'
  }
  BaseUnit,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductPlant : redirected to parent ZC_PRODUCTPLANTTP_2
  
}
