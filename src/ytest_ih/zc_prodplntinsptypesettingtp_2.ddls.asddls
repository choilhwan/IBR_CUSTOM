@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Inspection Type Settings - TP'
}
@Objectmodel: {
  Modelingpattern: #TRANSACTIONAL_INTERFACE, 
  Supportedcapabilities: [ #TRANSACTIONAL_PROVIDER ], 
  Usagetype.Dataclass: #MASTER, 
  Usagetype.Servicequality: #C, 
  Usagetype.Sizecategory: #XL
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_PRODPLNTINSPTYPESETTINGTP_2
  as projection on I_PRODPLNTINSPTYPESETTINGTP_2
{
  @Endusertext: {
    Quickinfo: 'Inspection Type'
  }
  key InspectionLotType,
  @Endusertext: {
    Quickinfo: 'Material Number'
  }
  key Product,
  @Endusertext: {
    Quickinfo: 'Plant'
  }
  key Plant,
  @Endusertext: {
    Quickinfo: 'Inspection with Task List'
  }
  InspLotIsTaskListRequired,
  @Endusertext: {
    Quickinfo: 'Inspect with Material Specification'
  }
  InspLotHasMaterialSpec,
  @Endusertext: {
    Quickinfo: 'Inspection Specifications from Configuration'
  }
  InspLotHasConfignSpecification,
  @Endusertext: {
    Quickinfo: 'Inspection Specifications from Batch Determination'
  }
  InspLotHasBatchCharc,
  @Endusertext: {
    Quickinfo: 'Automatic Specification Assignment'
  }
  InspLotHasAutomSpecAssgmt,
  @Endusertext: {
    Quickinfo: 'Inspect by Characteristics'
  }
  InspLotHasCharc,
  @Endusertext: {
    Quickinfo: 'Post to Inspection Stock'
  }
  HasPostToInspectionStock,
  @Endusertext: {
    Quickinfo: 'Automatic Usage Decision Planned'
  }
  InspLotIsAutomUsgeDcsnPossible,
  @Endusertext: {
    Quickinfo: 'Sampling Procedure'
  }
  SamplingProcedure,
  @Endusertext: {
    Quickinfo: 'Dynamic Modification Rule'
  }
  InspLotDynamicRule,
  @Endusertext: {
    Quickinfo: 'Inspection Percentage'
  }
  InspLotSampleQuantityInPercent,
  @Endusertext: {
    Quickinfo: '100% Inspection'
  }
  InspectionLotIsFullInspection,
  @Endusertext: {
    Quickinfo: 'Skips Allowed'
  }
  InspLotSkipIsAllowed,
  @Endusertext: {
    Quickinfo: 'Enter Sample Manually'
  }
  InspLotHasManualSampleSize,
  @Endusertext: {
    Quickinfo: 'Trigger Sample Calculation Manually'
  }
  InspLotIsSmplCalcMnlTriggered,
  @Endusertext: {
    Quickinfo: 'Serial Numbers Possible for Inspection Lot'
  }
  InspLotIsSerialNmbrPossible,
  @Endusertext: {
    Quickinfo: 'Average Inspection Duration'
  }
  InspLotDurationInDays,
  @Endusertext: {
    Quickinfo: 'Control of Inspection Lot Creation (Lot Summary)'
  }
  InspLotSummaryControl,
  @Endusertext: {
    Quickinfo: 'Procedure for Calculating Quality Score'
  }
  InspQualityScoreProcedure,
  @Endusertext: {
    Quickinfo: 'Allowed Share of Scrap (Percent) in Inspection Lot'
  }
  InspLotAcceptedScrapRatioInPct,
  @Endusertext: {
    Quickinfo: 'Record Appraisal Costs in Individual QM Order'
  }
  InspectionLotHasAppraisalCosts,
  @Endusertext: {
    Quickinfo: 'Order Number for Recording Appraisal Costs'
  }
  QualityCostCollector,
  @Endusertext: {
    Quickinfo: 'Inspection Type - Material Combination Is Active'
  }
  ProdInspTypeSettingIsActive,
  @Endusertext: {
    Quickinfo: 'Preferred Inspection Type'
  }
  InspTypeIsPrfrd,
  @Endusertext: {
    Quickinfo: 'Inspection for Handling Unit'
  }
  InspLotHasHandlingUnit,
  @Endusertext: {
    Quickinfo: 'Indicator: Multiple Specifications'
  }
  InspLotHasMultipleSpec,
  @Endusertext: {
    Quickinfo: 'Inspection Lot Summary (Warehouse-Managed Stock)'
  }
  InspLotOfEWMSummaryControl,
  _Product : redirected to ZC_PRODUCTTP_2,
  _ProductPlant : redirected to parent ZC_PRODUCTPLANTTP_2
  
}
