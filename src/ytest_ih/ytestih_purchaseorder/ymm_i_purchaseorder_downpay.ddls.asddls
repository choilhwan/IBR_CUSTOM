@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'YMM_I_PURCHASEORDER_DOWNPAY test'
@Metadata.ignorePropagatedAnnotations: true
define root view entity YMM_I_PURCHASEORDER_DOWNPAY as select from Y_R_PURCHASEORDER
{
    key PurchaseOrder,
    PurchaseOrderType,
    PurchaseOrderSubtype,
    PurchasingDocumentOrigin,
    CreatedByUser,
    CreationDate,
    PurchaseOrderDate,
    Language,
    CorrespncExternalReference,
    CorrespncInternalReference,
    PurchasingDocumentDeletionCode,
    ReleaseIsNotCompleted,
    PurchasingCompletenessStatus,
    PurchasingProcessingStatus,
    PurgReleaseSequenceStatus,
    ReleaseCode,
    CompanyCode,
    PurchasingOrganization,
    PurchasingGroup,
    Supplier,
    ManualSupplierAddressID,
    SupplierRespSalesPersonName,
    SupplierPhoneNumber,
    SupplyingSupplier,
    SupplyingPlant,
    InvoicingParty,
    Customer,
    SupplierQuotationExternalID,
    PaymentTerms,
    CashDiscount1Days,
    CashDiscount2Days,
    NetPaymentDays,
    CashDiscount1Percent,
    CashDiscount2Percent,
    DownPaymentType,
    DownPaymentPercentageOfTotAmt,
    @Semantics.amount.currencyCode: 'DocumentCurrency'
    DownPaymentAmount,
    DownPaymentDueDate,
    IncotermsClassification,
    IncotermsTransferLocation,
    IncotermsVersion,
    IncotermsLocation1,
    IncotermsLocation2,
    IsIntrastatReportingRelevant,
    IsIntrastatReportingExcluded,
    PricingDocument,
    PricingProcedure,
    DocumentCurrency,
    ValidityStartDate,
    ValidityEndDate,
    ExchangeRate,
    ExchangeRateIsFixed,
    LastChangeDateTime,
    TaxReturnCountry,
    VATRegistration,
    VATRegistrationCountry,
    PurgReasonForDocCancellation,
    @Semantics.amount.currencyCode: 'DocumentCurrency'
    PurgReleaseTimeTotalAmount,
    PurgAggrgdProdCmplncSuplrSts,
    PurgAggrgdProdMarketabilitySts,
    PurgAggrgdSftyDataSheetStatus,
    PurgProdCmplncTotDngrsGoodsSts,
    /* Associations */
    _PurchaseOrderItem,
    _PurchasingGroup,
    _Supplier
} 
where
PurchasingProcessingStatus <> '04' and
PurchasingProcessingStatus <> '05' and
PurchasingProcessingStatus <> '08' and
PurchasingProcessingStatus <> '11' and
PurchasingProcessingStatus <> '12' and
PurchasingProcessingStatus <> '13' and
PurchasingProcessingStatus <> '26' and
PurchasingProcessingStatus <> '14' 

