@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '[MM] 구매오더 선금 처리 - CDS data model'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZMM_I_PURORD_DOWNPAY
  as select from I_PurchaseOrderAPI01
  association [1]    to I_SupplierPurchasingOrg as _SupplierPurchasingOrg  on  $projection.PurchasingOrganization = _SupplierPurchasingOrg.PurchasingOrganization
                                                                           and $projection.Supplier               = _SupplierPurchasingOrg.Supplier
  association [0..1] to ZMM_I_DownpayUpdated_VH as _DownPaymentUpdatedText on  $projection.DownPaymentUpdated = _DownPaymentUpdatedText.Code
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
      @Consumption.valueHelpDefinition: [{ entity:{ name:'I_CompanyCodeStdVH', element: 'CompanyCode' } }]
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
      DownPaymentPercentageOfTotAmt,                                        //구매오더 헤더 선금비율
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
//      _DownPaymentUpdatedText.Text as DownPaymentUpcodeText,
      /* Custom Field  */
      _SupplierPurchasingOrg.YY1_DownpaymentFlag_spo    as PurorgDownpaymentFlag,
      _SupplierPurchasingOrg.YY1_DownPaymentPercent_spo as PurorgDownPaymenPercent,              //공급업체 선금비율
      
      
      case DownPaymentPercentageOfTotAmt
        when $projection.PurorgDownPaymenPercent then 'C'
        else 'N'
      end as DownPaymentUpdated,
      
//      YY1_DownPaymentUpdated_PDH                        as DownPaymentUpdated,                  //선금업데이트여부
      _DownPaymentUpdatedText,
      /* Associations */
      _PurchaseOrderItem,
      _PurchasingGroup,
      _Supplier

}
where
  _SupplierPurchasingOrg.YY1_DownpaymentFlag_spo = 'X'
