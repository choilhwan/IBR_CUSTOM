@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'i_purchase order wrapper cds view'
}
@AccessControl.authorizationCheck: #CHECK
define root view entity YMM_C_PURCHASEORDER
  provider contract TRANSACTIONAL_QUERY
  as projection on Y_R_PURCHASEORDER
{
  @Endusertext: {
    Quickinfo: 'Purchase Order Number'
  }
  key PurchaseOrder,
  @Endusertext: {
    Quickinfo: 'Purchasing Document Type'
  }
  PurchaseOrderType,
  @Endusertext: {
    Quickinfo: 'Control indicator for purchasing document type'
  }
  PurchaseOrderSubtype,
  @Endusertext: {
    Quickinfo: 'Status of Purchasing Document'
  }
  PurchasingDocumentOrigin,
  @Endusertext: {
    Quickinfo: 'User of person who created a purchasing document'
  }
  CreatedByUser,
  @Endusertext: {
    Quickinfo: 'Creation Date of Purchasing Document'
  }
  CreationDate,
  @Endusertext: {
    Quickinfo: 'Purchase Order Date'
  }
  PurchaseOrderDate,
  @Endusertext: {
    Quickinfo: 'Language Key'
  }
  Language,
  @Endusertext: {
    Quickinfo: 'Your Reference'
  }
  CorrespncExternalReference,
  @Endusertext: {
    Quickinfo: 'Our Reference'
  }
  CorrespncInternalReference,
  @Endusertext: {
    Quickinfo: 'Purchase Order Deletion Code'
  }
  PurchasingDocumentDeletionCode,
  @Endusertext: {
    Quickinfo: 'Release Not Yet Completely Effected'
  }
  ReleaseIsNotCompleted,
  @Endusertext: {
    Quickinfo: 'Purchase order not yet complete'
  }
  PurchasingCompletenessStatus,
  @Endusertext: {
    Quickinfo: 'Purchasing Document Processing State'
  }
  PurchasingProcessingStatus,
  @Endusertext: {
    Quickinfo: 'Release Status'
  }
  PurgReleaseSequenceStatus,
  @Endusertext: {
    Quickinfo: 'Release Indicator: Purchasing Document'
  }
  ReleaseCode,
  @Endusertext: {
    Quickinfo: 'Company Code'
  }
  CompanyCode,
  @Endusertext: {
    Quickinfo: 'Purchasing Organization'
  }
  PurchasingOrganization,
  @Endusertext: {
    Quickinfo: 'Purchasing Group'
  }
  PurchasingGroup,
  @Endusertext: {
    Quickinfo: 'Supplier'
  }
  Supplier,
  @Endusertext: {
    Quickinfo: 'Address Number'
  }
  ManualSupplierAddressID,
  @Endusertext: {
    Quickinfo: 'Responsible Salesperson at Supplier\'s Office'
  }
  SupplierRespSalesPersonName,
  @Endusertext: {
    Quickinfo: 'Supplier\'s Phone Number'
  }
  SupplierPhoneNumber,
  @Endusertext: {
    Quickinfo: 'Goods Supplier'
  }
  SupplyingSupplier,
  @Endusertext: {
    Quickinfo: 'Supplying (issuing) plant in case of stock transport order'
  }
  SupplyingPlant,
  @Endusertext: {
    Quickinfo: 'Different Invoicing Party'
  }
  InvoicingParty,
  @Endusertext: {
    Quickinfo: 'Customer Number'
  }
  Customer,
  @Endusertext: {
    Quickinfo: 'Quotation Number'
  }
  SupplierQuotationExternalID,
  @Endusertext: {
    Quickinfo: 'Terms of Payment Key'
  }
  PaymentTerms,
  @Endusertext: {
    Quickinfo: 'Cash Discount Days 1'
  }
  CashDiscount1Days,
  @Endusertext: {
    Quickinfo: 'Cash Discount Days 2'
  }
  CashDiscount2Days,
  @Endusertext: {
    Quickinfo: 'Net Payment Terms Period'
  }
  NetPaymentDays,
  @Endusertext: {
    Quickinfo: 'Cash Discount Percentage 1'
  }
  CashDiscount1Percent,
  @Endusertext: {
    Quickinfo: 'Cash Discount Percentage 2'
  }
  CashDiscount2Percent,
  @Endusertext: {
    Quickinfo: 'Down Payment Indicator'
  }
  DownPaymentType,
  @Endusertext: {
    Quickinfo: 'Down Payment Percentage'
  }
  DownPaymentPercentageOfTotAmt,
  @Endusertext: {
    Quickinfo: 'Down Payment Amount in Document Currency'
  }
  @Semantics: {
    Amount.Currencycode: 'DocumentCurrency'
  }
  DownPaymentAmount,
  @Endusertext: {
    Quickinfo: 'Due Date for Down Payment'
  }
  DownPaymentDueDate,
  @Endusertext: {
    Quickinfo: 'Incoterms (Part 1)'
  }
  IncotermsClassification,
  @Endusertext: {
    Quickinfo: 'Incoterms (Part 2)'
  }
  IncotermsTransferLocation,
  @Endusertext: {
    Quickinfo: 'Incoterms Version'
  }
  IncotermsVersion,
  @Endusertext: {
    Quickinfo: 'Incoterms Location 1'
  }
  IncotermsLocation1,
  @Endusertext: {
    Quickinfo: 'Incoterms Location 2'
  }
  IncotermsLocation2,
  @Endusertext: {
    Quickinfo: 'Relevant for Intrastat Reporting'
  }
  IsIntrastatReportingRelevant,
  @Endusertext: {
    Quickinfo: 'Exclude from Intrastat Reporting'
  }
  IsIntrastatReportingExcluded,
  @Endusertext: {
    Quickinfo: 'Number of the Document Condition'
  }
  PricingDocument,
  @Endusertext: {
    Quickinfo: 'Procedure (Pricing, Output Control, Acct. Det., Costing,...)'
  }
  PricingProcedure,
  @Endusertext: {
    Quickinfo: 'Currency Key'
  }
  DocumentCurrency,
  @Endusertext: {
    Quickinfo: 'Start of Validity Period'
  }
  ValidityStartDate,
  @Endusertext: {
    Quickinfo: 'End of Validity Period'
  }
  ValidityEndDate,
  @Endusertext: {
    Quickinfo: 'Exchange Rate'
  }
  ExchangeRate,
  @Endusertext: {
    Quickinfo: 'Indicator for Fixed Exchange Rate'
  }
  ExchangeRateIsFixed,
  @Endusertext: {
    Quickinfo: 'Change Time Stamp'
  }
  LastChangeDateTime,
  @Endusertext: {
    Quickinfo: 'Country/Region for Tax Report'
  }
  TaxReturnCountry,
  @Endusertext: {
    Quickinfo: 'VAT Registration Number'
  }
  VATRegistration,
  @Endusertext: {
    Quickinfo: 'Country/Region of Sales Tax ID Number'
  }
  VATRegistrationCountry,
  @Endusertext: {
    Quickinfo: 'Reason for Cancellation'
  }
  PurgReasonForDocCancellation,
  @Endusertext: {
    Quickinfo: 'Total value at time of release'
  }
  @Semantics: {
    Amount.Currencycode: 'DocumentCurrency'
  }
  PurgReleaseTimeTotalAmount,
  @Endusertext: {
    Quickinfo: 'Product Compliance Supplier Check Status (All Items)'
  }
  PurgAggrgdProdCmplncSuplrSts,
  @Endusertext: {
    Quickinfo: 'Product Marketability Status (All Items)'
  }
  PurgAggrgdProdMarketabilitySts,
  @Endusertext: {
    Quickinfo: 'Safety Data Sheet Status (All Items)'
  }
  PurgAggrgdSftyDataSheetStatus,
  @Endusertext: {
    Quickinfo: 'Dangerous Goods Status (All Items)'
  }
  PurgProdCmplncTotDngrsGoodsSts,
  _PurchaseOrderItem,
  _PurchasingGroup,
  _Supplier
  
}
