@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Product Plant Supply Planning - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #B, 
  Usagetype.Sizecategory: #XL
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODPLANTSUPPLYPLANNINGTP_2
  as projection on I_PRODPLANTSUPPLYPLANNINGTP_2
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
    Quickinfo: 'Fixed lot size'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  FixedLotSizeQuantity,
  @Endusertext: {
    Quickinfo: 'Maximum Lot Size'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  MaximumLotSizeQuantity,
  @Endusertext: {
    Quickinfo: 'Minimum Lot Size'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  MinimumLotSizeQuantity,
  @Endusertext: {
    Quickinfo: 'Rounding value for purchase order quantity'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  LotSizeRoundingQuantity,
  @Endusertext: {
    Quickinfo: 'Lot Sizing Procedure in Materials Planning'
  }
  LotSizingProcedure,
  @Endusertext: {
    Quickinfo: 'MRP Type'
  }
  MRPType,
  @Endusertext: {
    Quickinfo: 'MRP Controller'
  }
  MRPResponsible,
  @Endusertext: {
    Quickinfo: 'Safety Stock'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  SafetyStockQuantity,
  @Endusertext: {
    Quickinfo: 'Minimum Safety Stock'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  MinimumSafetyStockQuantity,
  @Endusertext: {
    Quickinfo: 'Planning time fence'
  }
  PlanningTimeFence,
  @Endusertext: {
    Quickinfo: 'ABC Indicator'
  }
  ConsumptionValueCategory,
  @Endusertext: {
    Quickinfo: 'Maximum Stock Level'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  MaximumStockQuantity,
  @Endusertext: {
    Quickinfo: 'Reorder Point'
  }
  @Semantics: {
    Quantity.Unitofmeasure: 'BaseUnit'
  }
  ReorderThresholdQuantity,
  @Endusertext: {
    Quickinfo: 'Planned Delivery Time in Days'
  }
  PlannedDeliveryDurationInDays,
  @Endusertext: {
    Quickinfo: 'Safety Time (in Workdays)'
  }
  SafetySupplyDurationInDays,
  @Endusertext: {
    Quickinfo: 'Planning Strategy Group'
  }
  PlanningStrategyGroup,
  @Endusertext: {
    Quickinfo: 'Total replenishment lead time (in workdays)'
  }
  TotalReplenishmentLeadTime,
  @Endusertext: {
    Quickinfo: 'Procurement Type'
  }
  ProcurementType,
  @Endusertext: {
    Quickinfo: 'Special Procurement Type'
  }
  ProcurementSubType,
  @Endusertext: {
    Quickinfo: 'Assembly scrap in percent'
  }
  AssemblyScrapPercent,
  @Endusertext: {
    Quickinfo: 'Checking Group for Availability Check'
  }
  AvailabilityCheckType,
  @Endusertext: {
    Quickinfo: 'Goods receipt processing time in days'
  }
  GoodsReceiptDuration,
  @Endusertext: {
    Quickinfo: 'Planning Cycle'
  }
  PlanAndOrderDayDetermination,
  @Endusertext: {
    Quickinfo: 'Rounding Profile'
  }
  RoundingProfile,
  @Endusertext: {
    Quickinfo: 'Default Storage Location for External Procurement'
  }
  DfltStorageLocationExtProcmt,
  @Endusertext: {
    Quickinfo: 'MRP Group'
  }
  MRPGroup,
  @Endusertext: {
    Quickinfo: 'Lot-Size-Independent Costs'
  }
  @Semantics: {
    Amount.Currencycode: 'Currency'
  }
  LotSizeIndependentCosts,
  @Endusertext: {
    Quickinfo: 'Takt time'
  }
  RqmtQtyRcptTaktTmeInWrkgDays,
  @Endusertext: {
    Quickinfo: 'Planning Calendar'
  }
  MRPPlanningCalendar,
  @Endusertext: {
    Quickinfo: 'Range-of-Coverage Profile'
  }
  RangeOfCvrgPrflCode,
  @Endusertext: {
    Quickinfo: 'Safety Time Indicator (with or Without Safety Time)'
  }
  ProductSafetyTimeMRPRelevance,
  @Endusertext: {
    Quickinfo: 'Period Profile for Safety Time'
  }
  SafetyTimePeriodProfile,
  @Endusertext: {
    Quickinfo: 'MRP relevancy for dependent requirements'
  }
  DependentRqmtMRPRelevance,
  @Endusertext: {
    Quickinfo: 'Service level'
  }
  ProductServiceLevelInPercent,
  @Endusertext: {
    Quickinfo: 'In-house production time'
  }
  ProdInhProdnDurationInWorkDays,
  @Endusertext: {
    Quickinfo: 'Mixed MRP indicator'
  }
  MRPAvailabilityType,
  @Endusertext: {
    Quickinfo: 'Indicator for Cross-Project Material'
  }
  CrossProjectProduct,
  @Endusertext: {
    Quickinfo: 'Storage Costs Percentage Code'
  }
  StorageCostsPercentageCode,
  @Endusertext: {
    Quickinfo: 'Follow-Up Material'
  }
  FollowUpProduct,
  @Endusertext: {
    Quickinfo: 'Repetitive Manufacturing Enabled'
  }
  RepetitiveManufacturingIsAllwd,
  @Endusertext: {
    Quickinfo: 'Indicator for Individual and Collective Requirements'
  }
  DependentRequirementsType,
  @Endusertext: {
    Quickinfo: 'Indicator: Bulk Material'
  }
  ProductIsBulkComponent,
  @Endusertext: {
    Quickinfo: 'Repetitive Manufacturing Profile'
  }
  RepetitiveManufacturingProfile,
  @Endusertext: {
    Quickinfo: 'Consumption Period: Backward'
  }
  BackwardCnsmpnPeriodInWorkDays,
  @Endusertext: {
    Quickinfo: 'Consumption period: Forward'
  }
  FwdConsumptionPeriodInWorkDays,
  @Endusertext: {
    Quickinfo: 'Consumption mode'
  }
  ProdRqmtsConsumptionMode,
  @Endusertext: {
    Quickinfo: 'Splitting Indicator'
  }
  ProdFcstRequirementsSplitCode,
  @Endusertext: {
    Quickinfo: 'Effective-Out Date'
  }
  EffectiveOutDate,
  @Endusertext: {
    Quickinfo: 'Scheduling Profile for Floats'
  }
  SchedulingFloatProfile,
  @Endusertext: {
    Quickinfo: 'Component Scrap in Percent'
  }
  ComponentScrapInPercent,
  @Endusertext: {
    Quickinfo: 'Discontinuation indicator'
  }
  ProductDiscontinuationCode,
  @Endusertext: {
    Quickinfo: 'Indicator for Requirements Grouping'
  }
  ProductRequirementsGrouping,
  @Endusertext: {
    Quickinfo: 'Storage Location'
  }
  ProductionInvtryManagedLoc,
  @Endusertext: {
    Quickinfo: 'Indicator: Backflush'
  }
  ProductComponentBackflushCode,
  @Endusertext: {
    Quickinfo: 'Proposed Supply Area in Material Master Record'
  }
  ProposedProductSupplyArea,
  @Endusertext: {
    Quickinfo: 'MRP Safety Stock Method'
  }
  MRPSafetyStockMethod,
  @Endusertext: {
    Quickinfo: 'JIT Production Confirmation Profile'
  }
  JITProdnConfProfile,
  @Endusertext: {
    Quickinfo: 'Action Control: Planned Order Processing'
  }
  PlannedOrderActionControl,
  @Endusertext: {
    Quickinfo: 'Currency Key'
  }
  Currency,
  @Endusertext: {
    Quickinfo: 'Base Unit of Measure'
  }
  BaseUnit,
  @Endusertext: {
    Quickinfo: 'Material: MRP profile'
  }
  MRPProfile,
  @Endusertext: {
    Quickinfo: 'Planning Calendar'
  }
  ProdnPlngAndControlCalendar,
  @Endusertext: {
    Quickinfo: 'Goods Issue Processing Time in Days'
  }
  GoodIssueProcessingDays,
  @Endusertext: {
    Quickinfo: 'Consignment Control'
  }
  ConsignmentControl,
  @Endusertext: {
    Quickinfo: 'Unit of Measure Group'
  }
  ProductUnitGroup,
  @Endusertext: {
    Quickinfo: 'Availability Check Horizon'
  }
  ATPCheckHorizonInDays,
  @Endusertext: {
    Quickinfo: 'Calendar for Validating Availability Check Horizon'
  }
  ATPCheckHorizonFactoryCalendar,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductPlant : redirected to parent ZC_PRODUCTPLANTTP_2
  
}
