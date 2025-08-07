@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '[MM] 구매오더 선금 처리 - Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZMM_C_PURORD_DOWNPAY
  provider contract transactional_query
  as projection on ZMM_I_PURORD_DOWNPAY

{
      @EndUserText: {
      quickInfo: 'Purchase Order Number'
      }

      @Consumption.valueHelpDefinition: [
           { entity:  { name:    'ZMM_I_PURORD_DOWNPAY',
                        element: 'PurchaseOrder' }
           }]
      //  @Consumption.valueHelpDefinition: [{entity.element: 'PurchaseOrder', entity.name: 'I_PurchaseOrderAPI01' }]
  key PurchaseOrder,
      @EndUserText: {
        quickInfo: 'Purchasing Document Type'
      }
      PurchaseOrderType,
      @EndUserText: {
        quickInfo: 'Control indicator for purchasing document type'
      }
      PurchaseOrderSubtype,
      @EndUserText: {
        quickInfo: 'Status of Purchasing Document'
      }
      PurchasingDocumentOrigin,
      @EndUserText: {
        quickInfo: 'User of person who created a purchasing document'
      }
      CreatedByUser,
      @EndUserText: {
        quickInfo: 'Creation Date of Purchasing Document'
      }
      CreationDate,
      @EndUserText: {
        quickInfo: 'Purchase Order Date'
      }
      PurchaseOrderDate,
      @EndUserText: {
        quickInfo: 'Language Key'
      }
      Language,
      @EndUserText: {
        quickInfo: 'Your Reference'
      }
      CorrespncExternalReference,
      @EndUserText: {
        quickInfo: 'Our Reference'
      }
      CorrespncInternalReference,
      @EndUserText: {
        quickInfo: 'Purchase Order Deletion Code'
      }
      PurchasingDocumentDeletionCode,
      @EndUserText: {
        quickInfo: 'Release Not Yet Completely Effected'
      }
      ReleaseIsNotCompleted,
      @EndUserText: {
        quickInfo: 'Purchase order not yet complete'
      }
      PurchasingCompletenessStatus,
      @EndUserText: {
        quickInfo: 'Purchasing Document Processing State'
      }
      PurchasingProcessingStatus,
      @EndUserText: {
        quickInfo: 'Release Status'
      }
      PurgReleaseSequenceStatus,
      @EndUserText: {
        quickInfo: 'Release Indicator: Purchasing Document'
      }
      ReleaseCode,
      @EndUserText: {
        quickInfo: 'Company Code'
      }
      @Consumption.valueHelpDefinition: [{ entity:{ name:'I_CompanyCodeStdVH', element: 'CompanyCode' } }]
      CompanyCode,
      @EndUserText: {
        quickInfo: 'Purchasing Organization'
      }
      PurchasingOrganization,
      @EndUserText: {
        quickInfo: 'Purchasing Group'
      }
      PurchasingGroup,
      @EndUserText: {
        quickInfo: 'Supplier'
      }
      @Consumption.valueHelpDefinition: [
           { entity:  { name:    'I_SUPPLIER_VH',
                        element: 'Supplier' }
           }]

      Supplier,
      @EndUserText: {
        quickInfo: 'Address Number'
      }
      ManualSupplierAddressID,
      @EndUserText: {
        quickInfo: 'Responsible Salesperson at Supplier\'s Office'
      }
      SupplierRespSalesPersonName,
      @EndUserText: {
        quickInfo: 'Supplier\'s Phone Number'
      }
      SupplierPhoneNumber,
      @EndUserText: {
        quickInfo: 'Goods Supplier'
      }
      SupplyingSupplier,
      @EndUserText: {
        quickInfo: 'Supplying (issuing) plant in case of stock transport order'
      }
      SupplyingPlant,
      @EndUserText: {
        quickInfo: 'Different Invoicing Party'
      }
      InvoicingParty,
      @EndUserText: {
        quickInfo: 'Customer Number'
      }
      Customer,
      @EndUserText: {
        quickInfo: 'Quotation Number'
      }
      SupplierQuotationExternalID,
      @EndUserText: {
        quickInfo: 'Terms of Payment Key'
      }
      PaymentTerms,
      @EndUserText: {
        quickInfo: 'Cash Discount Days 1'
      }
      CashDiscount1Days,
      @EndUserText: {
        quickInfo: 'Cash Discount Days 2'
      }
      CashDiscount2Days,
      @EndUserText: {
        quickInfo: 'Net Payment Terms Period'
      }
      NetPaymentDays,
      @EndUserText: {
        quickInfo: 'Cash Discount Percentage 1'
      }
      CashDiscount1Percent,
      @EndUserText: {
        quickInfo: 'Cash Discount Percentage 2'
      }
      CashDiscount2Percent,
      @EndUserText: {
        quickInfo: 'Down Payment Indicator'
      }
      DownPaymentType,
      @EndUserText: {
        quickInfo: 'Down Payment Percentage'
      }
      DownPaymentPercentageOfTotAmt,
      @EndUserText: {
        quickInfo: 'Down Payment Amount in Document Currency'
      }
      @Semantics: {
        amount.currencyCode: 'DocumentCurrency'
      }
      DownPaymentAmount,
      @EndUserText: {
        quickInfo: 'Due Date for Down Payment'
      }
      DownPaymentDueDate,
      @EndUserText: {
        quickInfo: 'Incoterms (Part 1)'
      }
      IncotermsClassification,
      @EndUserText: {
        quickInfo: 'Incoterms (Part 2)'
      }
      IncotermsTransferLocation,
      @EndUserText: {
        quickInfo: 'Incoterms Version'
      }
      IncotermsVersion,
      @EndUserText: {
        quickInfo: 'Incoterms Location 1'
      }
      IncotermsLocation1,
      @EndUserText: {
        quickInfo: 'Incoterms Location 2'
      }
      IncotermsLocation2,
      @EndUserText: {
        quickInfo: 'Relevant for Intrastat Reporting'
      }
      IsIntrastatReportingRelevant,
      @EndUserText: {
        quickInfo: 'Exclude from Intrastat Reporting'
      }
      IsIntrastatReportingExcluded,
      @EndUserText: {
        quickInfo: 'Number of the Document Condition'
      }
      PricingDocument,
      @EndUserText: {
        quickInfo: 'Procedure (Pricing, Output Control, Acct. Det., Costing,...)'
      }
      PricingProcedure,
      @EndUserText: {
        quickInfo: 'Currency Key'
      }
      DocumentCurrency,
      @EndUserText: {
        quickInfo: 'Start of Validity Period'
      }
      ValidityStartDate,
      @EndUserText: {
        quickInfo: 'End of Validity Period'
      }
      ValidityEndDate,
      @EndUserText: {
        quickInfo: 'Exchange Rate'
      }
      ExchangeRate,
      @EndUserText: {
        quickInfo: 'Indicator for Fixed Exchange Rate'
      }
      ExchangeRateIsFixed,
      @EndUserText: {
        quickInfo: 'Change Time Stamp'
      }
      LastChangeDateTime,
      @EndUserText: {
        quickInfo: 'Country/Region for Tax Report'
      }
      TaxReturnCountry,
      @EndUserText: {
        quickInfo: 'VAT Registration Number'
      }
      VATRegistration,
      @EndUserText: {
        quickInfo: 'Country/Region of Sales Tax ID Number'
      }
      VATRegistrationCountry,
      @EndUserText: {
        quickInfo: 'Reason for Cancellation'
      }
      PurgReasonForDocCancellation,
      @EndUserText: {
        quickInfo: 'Total value at time of release'
      }
      @Semantics: {
        amount.currencyCode: 'DocumentCurrency'
      }
      PurgReleaseTimeTotalAmount,
      @EndUserText: {
        quickInfo: 'Product Compliance Supplier Check Status (All Items)'
      }
      PurgAggrgdProdCmplncSuplrSts,
      @EndUserText: {
        quickInfo: 'Product Marketability Status (All Items)'
      }
      PurgAggrgdProdMarketabilitySts,
      @EndUserText: {
        quickInfo: 'Safety Data Sheet Status (All Items)'
      }
      PurgAggrgdSftyDataSheetStatus,
      @EndUserText: {
        quickInfo: 'Dangerous Goods Status (All Items)'
      }
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZMM_I_DownpayUpdated_VH', element: 'Code' } }]
      //  @ObjectModel.text.association: '_DownPaymentUpdatedText'
      //  @ObjectModel.text.element: ['_DownPaymentUpdatedText.Text']
      DownPaymentUpdated,
      PurgProdCmplncTotDngrsGoodsSts,
      _PurchaseOrderItem,
      _PurchasingGroup,
      _Supplier,
      _DownPaymentUpdatedText

}
