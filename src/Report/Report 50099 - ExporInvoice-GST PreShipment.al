// report 50099 "ExporInvoice-GST PreShipment"
// {
//     // version PCPL-NS //PCPL/NSW/MIG 09Aug22

//     DefaultLayout = RDLC;
//     RDLCLayout = 'src/ExporInvoice-GST PreShipment.rdl';
//     CaptionML = ENU = 'Sales - Invoice',
//                 ENN = 'Sales - Invoice';
//     Permissions = TableData 7190 = rimd;

//     dataset
//     {
//         dataitem("Sales Header"; "Sales Header")
//         {
//             CalcFields = "Amount to Customer";
//             DataItemTableView = SORTING("No.");
//             RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
//             RequestFilterHeadingML = ENU = 'Posted Sales Invoice',
//                                      ENN = 'Posted Sales Invoice';
//             column(CurrencyCOde; "Sales Header"."Currency Code")
//             {
//             }
//             column(Qrcode; EInvoiceDetail."EINV QR Code")
//             {
//             }
//             column(IRNNO; IRNNO)
//             {
//             }
//             column(NAMECOUNTRY; Country.Name)
//             {
//             }
//             column(TermsOfDelivery; 'INCOTERMS :' + ' ' + "Sales Header".Incoterms)
//             {
//             }
//             column(APYMETN; FORMAT(PaymentMethodCode.Description))
//             {
//             }
//             column(CommissionPayable; "Sales Header"."HAWB No.")
//             {
//             }
//             column(Port; NewPort."Port Name")
//             {
//             }
//             column(PortDischarge; portofDisc)
//             {
//             }
//             column(Name; Customer.Name)
//             {
//             }
//             column(vesselflightno; "Sales Header"."Shipment Method Code")
//             {
//             }
//             column(finaldestination; "Sales Header"."Final Destination")
//             {
//             }
//             column(Countryoforiginofgoods; "Sales Header"."Country of Origin of Goods")
//             {
//             }
//             column(Countryofffinaldestination; "Sales Header"."Country of Final Destination")
//             {
//             }
//             column(DrugLicno; LocationAdd."Drug license No.")
//             {
//             }
//             column(IECCodeno; CompanyInfo."IEC CODE No.")
//             {
//             }
//             column(PANNo; CompanyInfo."P.A.N. No.")
//             {
//             }
//             column(CompanyLogo; CompanyInfo.Picture)
//             {
//             }
//             column(ENDUSe; CompanyInfo."END Use Code")
//             {
//             }
//             column(Name_CompanyInfo; CompanyInfo.Name)
//             {
//             }
//             column(Address_com; CompanyInfo.Address + '' + CompanyInfo."Address 2")
//             {
//             }
//             column(City_CompanyInfo; CompanyInfo.City + ' ' + CompanyInfo."Post Code" + ' ' + CompanyInfo."Fax No." + ' ,' + CompanyInfo."Country/Region Code")
//             {
//             }
//             column(Cinmail; CompanyInfo."Company Registration  No." + ' E-mail : ' + CompanyInfo."E-Mail" + ', Tel: ' + CompanyInfo."Phone No.")
//             {
//             }
//             column(PhoneNo; CompanyInfo."Phone No.")
//             {
//             }
//             column(ShipToAddress9; ShipToAddress[9])
//             {
//             }
//             column(ShiptoCity_SalesInvoiceHeader; "Sales Header"."Ship-to City")
//             {
//             }
//             column(ShipmentMethodCode_SalesHeader; "Sales Header"."Shipment Method Code")
//             {
//             }
//             column(ShipCountryName; ShipCountryName)
//             {
//             }
//             column(CountryRegion_Name; CountryRegion.Name)
//             {
//             }
//             column(LineAmtusd; LineAmtusd)
//             {
//             }
//             column(ExportShipmentType_SalesHeader; "Sales Header"."Export Shipment Type")
//             {
//             }
//             column(No_SalesInvHdr; "No.")
//             {
//             }
//             column(ElectronicReferenceNo_SalesHeader; "Sales Header"."Electronic Reference No.")
//             {
//             }
//             column(LineAmtUSDWord; LineAmtUSDWord[1] + ' ' + LineAmtUSDWord[2])
//             {
//             }
//             column(Incoterms_SalesInvoiceHeader; "Sales Header".Incoterms)
//             {
//             }
//             column(No_SalesInvoiceHeader; "Sales Header"."No.")
//             {
//             }
//             column(PostingDate_SalesInvoiceHeader; "Sales Header"."Posting Date")
//             {
//             }
//             column(TransportMethod_SalesInvoiceHeader; "Sales Header"."Shipment Method Code")
//             {
//             }
//             column(VehicleNo_SalesInvoiceHeader; "Sales Header"."Vehicle No.")
//             {
//             }
//             column(External_Doc_No; "Sales Header"."External Document No.")
//             {
//             }
//             column(PONoNDate; "Sales Header"."Buyer Reference No.")
//             {
//             }
//             column(DateNtimeofRemoval; FORMAT("Sales Header"."Date Sent") + ' ' + FORMAT("Sales Header"."Time of Removal"))
//             {
//             }
//             column(GSTIN; CompanyInfo."GST Registration No.")
//             {
//             }
//             column(IGSTPer; 'IGST @' + FORMAT(IGSTPer) + ' %')
//             {
//             }
//             column(SGSPer; 'SGST @' + FORMAT(SGSTPer) + ' %')
//             {
//             }
//             column(CGSTPer; 'CGST @' + FORMAT(CGSTPer) + ' %')
//             {
//             }
//             column(InvDiscountAmountCaption; InvDiscountAmountCaptionLbl)
//             {
//             }
//             column(VATPercentageCaption; VATPercentageCaptionLbl)
//             {
//             }
//             column(VATAmountCaption; VATAmountCaptionLbl)
//             {
//             }
//             column(VATIdentifierCaption; VATIdentifierCaptionLbl)
//             {
//             }
//             column(TotalCaption; TotalCaptionLbl)
//             {
//             }
//             column(VATBaseCaption; VATBaseCaptionLbl)
//             {
//             }
//             column(PaymentTermsCaption; PaymentTermsCaptionLbl)
//             {
//             }
//             column(LUTNO; "Sales Header"."Form No.")
//             {
//             }
//             column(ShipmentMethodCaption; ShipmentMethodCaptionLbl)
//             {
//             }
//             column(EMailCaption; EMailCaptionLbl)
//             {
//             }
//             column(DocumentDateCaption; DocumentDateCaptionLbl)
//             {
//             }
//             column(DisplayAdditionalFeeNote; DisplayAdditionalFeeNote)
//             {
//             }
//             column(BillToName; BillToCust.Name + ' ' + BillToCust."Name 2")
//             {
//             }
//             column(BillToAddress; "Sales Header"."Bill-to Address")
//             {
//             }
//             column(BilltoAddress_SalesHeader; "Sales Header"."Bill-to Address")
//             {
//             }
//             column(BilltoAddress2_SalesHeader; "Sales Header"."Bill-to Address 2")
//             {
//             }
//             column(BillToAddress2; "Sales Header"."Bill-to Address 2")
//             {
//             }
//             column(BilltoCity_SalesHeader22; "Sales Header"."Bill-to City")
//             {
//             }
//             column(BilltoContact_SalesHeader; "Sales Header"."Bill-to Contact")
//             {
//             }
//             column(BillToCity; "Sales Header"."Bill-to City")
//             {
//             }
//             column(BillToStateCoder; BillToCust."State Code")
//             {
//             }
//             column(BillToStateName; BillToState.Description)
//             {
//             }
//             column(BillToPostCodse; BillToCust."Post Code")
//             {
//             }
//             column(BillToGSTIN; BillToCust."GST Registration No.")
//             {
//             }
//             column(LocToAddress; LocationAdd.Address + ' ' + LocationAdd."Address 2" + ' ' + LocationAdd.City + ' ' + Stateee.Description + ', Tel: ' + LocationAdd."Phone No." + ' ' + LocationAdd."Country/Region Code")
//             {
//             }
//             column(ShipToName; ShipToAddress[1])
//             {
//             }
//             column(ShipToAdds; ShipToAddress[2])
//             {
//             }
//             column(ShipToAdds2; ShipToAddress[3])
//             {
//             }
//             column(ShipToCity; ShipToAddress[4])
//             {
//             }
//             column(ShipToPostCode; ShipToAddress[5])
//             {
//             }
//             column(ShipToState; ShipToAddress[6])
//             {
//             }
//             column(ShipToStateName; ShipToAddress[8])
//             {
//             }
//             column(ShipToGSTIN; ShipToAddress[7])
//             {
//             }
//             column(ShipToName2; ShipToAddress[9])
//             {
//             }
//             column(Grosswt; FORMAT(PackingListPackage."To Package No." * PackingListPackage."Gross Wght. per Case"))
//             {
//             }
//             column(Netwt; FORMAT(PackingListPackage."To Package No." * PackingListPackage."Net Wght. per Case"))
//             {
//             }
//             column(CurrencyCodeVendor_SalesHeader; "Sales Header"."Currency Code Vendor")
//             {
//             }
//             column(VendorAmount_SalesHeader; "Sales Header"."Vendor Amount")
//             {
//             }
//             column(CommPay; CommPay)
//             {
//             }
//             dataitem(CopyLoop; integer)
//             {
//                 DataItemTableView = SORTING(Number);
//                 dataitem(PageLoop; Integer)
//                 {
//                     DataItemTableView = SORTING(Number)
//                                         WHERE(Number = CONST(1));
//                     column(CompanyInfo2Picture; CompanyInfo2.Picture)
//                     {
//                     }
//                     column(CompanyInfo1Picture; CompanyInfo1.Picture)
//                     {
//                     }
//                     column(CompanyInfo3Picture; CompanyInfo3.Picture)
//                     {
//                     }
//                     column(CompanyRegistrationLbl; CompanyRegistrationLbl)
//                     {
//                     }
//                     column(CompanyInfo_GST_RegistrationNo; CompanyInfo."GST Registration No.")
//                     {
//                     }
//                     column(CustomerRegistrationLbl; CustomerRegistrationLbl)
//                     {
//                     }
//                     column(Customer_GST_RegistrationNo; Customer."GST Registration No.")
//                     {
//                     }
//                     column(GSTComponentCode1; GSTComponentCode[1] + ' Amount')
//                     {
//                     }
//                     column(GSTComponentCode2; GSTComponentCode[2] + ' Amount')
//                     {
//                     }
//                     column(GSTComponentCode3; GSTComponentCode[3] + ' Amount')
//                     {
//                     }
//                     column(GSTComponentCode4; GSTComponentCode[4] + 'Amount')
//                     {
//                     }
//                     column(GSTCompAmount1; ABS(GSTCompAmount[1]))
//                     {
//                     }
//                     column(GSTCompAmount2; ABS(GSTCompAmount[2]))
//                     {
//                     }
//                     column(GSTCompAmount3; ABS(GSTCompAmount[3]))
//                     {
//                     }
//                     column(GSTCompAmount4; ABS(GSTCompAmount[4]))
//                     {
//                     }
//                     column(IsGSTApplicable; IsGSTApplicable)
//                     {
//                     }
//                     column(CustAddr1; CustAddr[1])
//                     {
//                     }
//                     column(CompanyAddr1; CompanyAddr[1])
//                     {
//                     }
//                     column(CustAddr2; CustAddr[2])
//                     {
//                     }
//                     column(CompanyAddr2; CompanyAddr[2])
//                     {
//                     }
//                     column(CustAddr3; CustAddr[3])
//                     {
//                     }
//                     column(CompanyAddr3; CompanyAddr[3])
//                     {
//                     }
//                     column(CustAddr4; CustAddr[4])
//                     {
//                     }
//                     column(CompanyAddr4; CompanyAddr[4])
//                     {
//                     }
//                     column(CustAddr5; CustAddr[5])
//                     {
//                     }
//                     column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
//                     {
//                     }
//                     column(CustAddr6; CustAddr[6])
//                     {
//                     }
//                     column(PaymentTermsDescription; PaymentTerms.Description)
//                     {
//                     }
//                     column(ShipmentMethodDescription; ShipmentMethod.Description)
//                     {
//                     }
//                     column(CompanyInfoHomePage; CompanyInfo."Home Page")
//                     {
//                     }
//                     column(CompanyInfoEMail; CompanyInfo."E-Mail")
//                     {
//                     }
//                     column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
//                     {
//                     }
//                     column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
//                     {
//                     }
//                     column(CompanyInfoBankName; CompanyInfo."Bank Name")
//                     {
//                     }
//                     column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
//                     {
//                     }
//                     column(BillToCustNo_SalesInvHdr; "Sales Header"."Bill-to Customer No.")
//                     {
//                     }
//                     column(PostingDate_SalesInvHdr; FORMAT("Sales Header"."Posting Date", 0, 4))
//                     {
//                     }
//                     column(VATNoText; VATNoText)
//                     {
//                     }
//                     column(VATRegNo_SalesInvHdr; "Sales Header"."VAT Registration No.")
//                     {
//                     }
//                     column(DueDate_SalesInvoiceHdr; FORMAT("Sales Header"."Due Date", 0, 4))
//                     {
//                     }
//                     column(SalesPersonText; SalesPersonText)
//                     {
//                     }
//                     column(SalesPurchPersonName; SalesPurchPerson.Name)
//                     {
//                     }
//                     column(ReferenceText; ReferenceText)
//                     {
//                     }
//                     column(YourReference_SalesInvHdr; "Sales Header"."Your Reference")
//                     {
//                     }
//                     column(OrderNoText; OrderNoText)
//                     {
//                     }
//                     column(OrderNo_SalesInvoiceHdr; "Sales Header"."No.")
//                     {
//                     }
//                     column(CustAddr7; CustAddr[7])
//                     {
//                     }
//                     column(CustAddr8; CustAddr[8])
//                     {
//                     }
//                     column(CompanyAddr5; CompanyAddr[5])
//                     {
//                     }
//                     column(CompanyAddr6; CompanyAddr[6])
//                     {
//                     }
//                     column(DocDate_SalesInvHeader; FORMAT("Sales Header"."Document Date", 0, 4))
//                     {
//                     }
//                     column(PricesInclVAT_SalesInvHdr; "Sales Header"."Prices Including VAT")
//                     {
//                     }
//                     column(OutputNo; OutputNo)
//                     {
//                     }
//                     column(PricesInclVATYesNo; FORMAT("Sales Header"."Prices Including VAT"))
//                     {
//                     }
//                     column(PageCaption; PageCaptionCap)
//                     {
//                     }
//                     column(SupplementaryText; SupplementaryText)
//                     {
//                     }
//                     column(PhoneNoCaption; PhoneNoCaptionLbl)
//                     {
//                     }
//                     column(HomePageCaption; HomePageCaptionCap)
//                     {
//                     }
//                     column(VATRegNoCaption; VATRegNoCaptionLbl)
//                     {
//                     }
//                     column(GiroNoCaption; GiroNoCaptionLbl)
//                     {
//                     }
//                     column(BankNameCaption; BankNameCaptionLbl)
//                     {
//                     }
//                     column(BankAccNoCaption; BankAccNoCaptionLbl)
//                     {
//                     }
//                     column(DueDateCaption; DueDateCaptionLbl)
//                     {
//                     }
//                     column(InvoiceNoCaption; InvoiceNoCaptionLbl)
//                     {
//                     }
//                     column(PostingDateCaption; PostingDateCaptionLbl)
//                     {
//                     }
//                     column(PLAEntryNoCaption; PLAEntryNoCaptionLbl)
//                     {
//                     }
//                     column(RG23AEntryNoCaption; RG23AEntryNoCaptionLbl)
//                     {
//                     }
//                     column(RG23CEntryNoCaption; RG23CEntryNoCaptionLbl)
//                     {
//                     }
//                     column(ServiceTaxRegistrationNoCaption; ServiceTaxRegistrationNoLbl)
//                     {
//                     }
//                     column(ServiceTaxRegistrationNo; ServiceTaxRegistrationNo)
//                     {
//                     }
//                     column(BillToCustNo_SalesInvHdrCaption; "Sales Header".FIELDCAPTION("Bill-to Customer No."))
//                     {
//                     }
//                     column(PricesInclVAT_SalesInvHdrCaption; "Sales Header".FIELDCAPTION("Prices Including VAT"))
//                     {
//                     }
//                     dataitem("Sales Line"; "Sales Line")
//                     {
//                         DataItemLink = "Document No." = FIELD("No.");
//                         DataItemLinkReference = "Sales Header";
//                         DataItemTableView = SORTING("Document No.", "Line No.")
//                                             WHERE(Quantity = FILTER(<> 0));
//                         column(TARRIFNO; terrifNo.Description + '(GST AVAILED)')
//                         {
//                         }
//                         column(Lineno; "Sales Line"."Line No.")
//                         {
//                         }
//                         column(AmtWords; AmtWords[1] + ' ' + AmtWords[2])
//                         {
//                         }
//                         column(AmtWordsCGS; 'CGST Amount in Words :' + AmtWordsCGS[1] + '  ' + AmtWordsCGS[2])
//                         {
//                         }
//                         column(AmtWordsSGS; 'SGST Amount in Words :' + AmtWordsSGS[1] + '  ' + AmtWordsSGS[2])
//                         {
//                         }
//                         column(AmtWordsIGS; 'IGST Amount in Words :' + AmtWordsIGS[1] + '  ' + AmtWordsIGS[2])
//                         {
//                         }
//                         column(AmtwordsGSTbase; AmtWordsgstbase[1] + ' ' + AmtWordsgstbase[2])
//                         {
//                         }
//                         column(HSNSACCode_SalesInvoiceLine; "Sales Line"."HSN/SAC Code")
//                         {
//                         }
//                         column(pack; "Sales Line"."Packing Details")
//                         {
//                         }
//                         column(LineAmount_SalesInvLine; ROUND("Line Amount" * decCurrencyFactor, 0.01))
//                         {
//                             AutoFormatType = 1;
//                         }
//                         column(LineAmountUSD; ("Line Amount"))
//                         {
//                         }
//                         column(Desc_SalesInvLine; Description + ' ' + "Description 2")
//                         {
//                         }
//                         column(TotalGSTAmount_SalesInvoiceLine; ROUND("Sales Line"."Total GST Amount" * decCurrencyFactor, 0.01))
//                         {
//                         }
//                         column(No_SalesInvLine; "No.")
//                         {
//                         }
//                         column(Qty_SalesInvLine; Quantity)
//                         {
//                         }
//                         column(UOM_SalesInvoiceLine; "Unit of Measure")
//                         {
//                         }
//                         column(TotalLineAmt; TotalLineAmt)
//                         {
//                         }
//                         column(UnitPrice_SalesInvLine; ROUND("Unit Price" * decCurrencyFactor, 0.01))
//                         {
//                             AutoFormatType = 2;
//                         }
//                         column(UnitPriceUSD; ("Unit Price"))
//                         {
//                         }
//                         column(LineDiscount_SalesInvLine; "Line Discount %")
//                         {
//                         }
//                         column(LineDiscount_SalesInvLineAmount; ROUND("Line Discount Amount" * decCurrencyFactor, 0.01))
//                         {
//                         }
//                         column(PostedShipmentDate; FORMAT(PostedShipmentDate))
//                         {
//                         }
//                         column(SalesLineType; FORMAT("Sales Line".Type))
//                         {
//                         }
//                         column(DirectDebitPLARG_SalesInvLine; "Direct Debit To PLA / RG")
//                         {
//                         }
//                         column(SourceDocNo_SalesInvLine; "Source Document No.")
//                         {
//                         }
//                         column(Supplementary; Supplementary)
//                         {
//                         }
//                         column(InvDiscountAmount; ROUND(-"Inv. Discount Amount" * decCurrencyFactor, 0.01))
//                         {
//                             AutoFormatType = 1;
//                         }
//                         column(TotalSubTotal; TotalSubTotal)
//                         {
//                             AutoFormatExpression = "Sales Header"."Currency Code";
//                             AutoFormatType = 1;
//                         }
//                         column(TotalInvoiceDiscAmount; TotalInvoiceDiscountAmount)
//                         {
//                             AutoFormatExpression = "Sales Header"."Currency Code";
//                             AutoFormatType = 1;
//                         }
//                         column(TotalText; TotalText)
//                         {
//                         }
//                         column(SalesInvoiceLineAmount; ROUND(Amount * decCurrencyFactor, 0.01))
//                         {
//                             AutoFormatType = 1;
//                         }
//                         column(TotalAmount; TotalAmount)
//                         {
//                             AutoFormatExpression = "Sales Header"."Currency Code";
//                             AutoFormatType = 1;
//                         }
//                         column(AmtInclVAT_SalesInvLine; ROUND("Amount To Customer" * decCurrencyFactor, 0.01))
//                         {
//                             AutoFormatType = 1;
//                         }
//                         column(TotalInclVATText; TotalInclVATText)
//                         {
//                         }
//                         column(TotalAmountInclVAT; TotalAmountInclVAT)
//                         {
//                             AutoFormatExpression = "Sales Header"."Currency Code";
//                             AutoFormatType = 1;
//                         }
//                         column(TaxAmount_SalesInvLine; "Tax Amount")
//                         {
//                             AutoFormatType = 1;
//                         }
//                         column(ServiceTaxAmt; ServiceTaxAmt)
//                         {
//                             AutoFormatType = 1;
//                         }
//                         column(ChargesAmount; ChargesAmount)
//                         {
//                             AutoFormatType = 1;
//                         }
//                         column(WordChargesAmount; WordChargesAmount[1])
//                         {
//                         }
//                         column(TotalChargesAmount; TotalChargesAmount)
//                         {
//                         }
//                         column(OtherTaxesAmount; OtherTaxesAmount)
//                         {
//                             AutoFormatType = 1;
//                         }
//                         column(ServiceTaxECessAmt; ServiceTaxECessAmt)
//                         {
//                             AutoFormatType = 1;
//                         }
//                         column(SalesInvLineTotalTDSTCSInclSHECESS; TotalTCSAmount)
//                         {
//                         }
//                         column(AppliedServiceTaxAmt; AppliedServiceTaxAmt)
//                         {
//                             AutoFormatType = 1;
//                         }
//                         column(AppliedServiceTaxECessAmt; AppliedServiceTaxECessAmt)
//                         {
//                             AutoFormatType = 1;
//                         }
//                         column(ServiceTaxSHECessAmt; ServiceTaxSHECessAmt)
//                         {
//                             AutoFormatType = 1;
//                         }
//                         column(AppliedServTaxSHECessAmt; AppliedServiceTaxSHECessAmt)
//                         {
//                             AutoFormatType = 1;
//                         }
//                         column(TotalTaxAmt; TotalTaxAmt)
//                         {
//                         }
//                         column(TotalExciseAmt; TotalExciseAmt)
//                         {
//                         }
//                         column(VATBaseDisc_SalesInvHdr; "Sales Header"."VAT Base Discount %")
//                         {
//                             AutoFormatType = 1;
//                         }
//                         column(TotalPaymentDiscountOnVAT; TotalPaymentDiscountOnVAT)
//                         {
//                             AutoFormatType = 1;
//                         }
//                         column(VATAmtLineVATAmtText; VATAmountLine.VATAmountText)
//                         {
//                         }
//                         column(TotalExclVATText; TotalExclVATText)
//                         {
//                         }
//                         column(TotalAmountVAT; TotalAmountVAT)
//                         {
//                         }
//                         column(LineNo_SalesInvLine; "Line No.")
//                         {
//                         }
//                         column(UnitPriceCaption; UnitPriceCaptionLbl)
//                         {
//                         }
//                         column(DiscountCaption; DiscountCaptionLbl)
//                         {
//                         }
//                         column(AmountCaption; AmountCaptionLbl)
//                         {
//                         }
//                         column(LineDiscountCaption; LineDiscountCaptionLbl)
//                         {
//                         }
//                         column(PostedShipmentDateCaption; PostedShipmentDateCaptionLbl)
//                         {
//                         }
//                         column(SubtotalCaption; SubtotalCaptionLbl)
//                         {
//                         }
//                         column(ExciseAmountCaption; ExciseAmountCaptionLbl)
//                         {
//                         }
//                         column(TaxAmountCaption; TaxAmountCaptionLbl)
//                         {
//                         }
//                         column(ServiceTaxAmountCaption; ServiceTaxAmountCaptionLbl)
//                         {
//                         }
//                         column(ChargesAmountCaption; ChargesAmountCaptionLbl)
//                         {
//                         }
//                         column(OtherTaxesAmountCaption; OtherTaxesAmountCaptionLbl)
//                         {
//                         }
//                         column(ServTaxeCessAmtCaption; ServTaxeCessAmtCaptionLbl)
//                         {
//                         }
//                         column(TCSAmountCaption; TCSAmountCaptionLbl)
//                         {
//                         }
//                         column(SvcTaxAmtAppliedCaption; SvcTaxAmtAppliedCaptionLbl)
//                         {
//                         }
//                         column(SvcTaxeCessAmtAppliedCaption; SvcTaxeCessAmtAppliedCaptionLbl)
//                         {
//                         }
//                         column(ServTaxSHECessAmtCaption; ServTaxSHECessAmtCaptionLbl)
//                         {
//                         }
//                         column(SvcTaxSHECessAmtAppliedCaption; SvcTaxSHECessAmtAppliedCaptionLbl)
//                         {
//                         }
//                         column(PaymentDiscVATCaption; PaymentDiscVATCaptionLbl)
//                         {
//                         }
//                         column(Description_SalesInvLineCaption; FIELDCAPTION(Description))
//                         {
//                         }
//                         column(No_SalesInvoiceLineCaption; FIELDCAPTION("No."))
//                         {
//                         }
//                         column(Quantity_SalesInvoiceLineCaption; FIELDCAPTION(Quantity))
//                         {
//                         }
//                         column(UOM_SalesInvoiceLineCaption; FIELDCAPTION("Unit of Measure"))
//                         {
//                         }
//                         column(DirectDebitPLARG_SalesInvLineCaption; FIELDCAPTION("Direct Debit To PLA / RG"))
//                         {
//                         }
//                         column(ServiceTaxSBCAmt; ServiceTaxSBCAmt)
//                         {
//                         }
//                         column(AppliedServiceTaxSBCAmt; AppliedServiceTaxSBCAmt)
//                         {
//                         }
//                         column(ServTaxSBCAmtCaption; ServTaxSBCAmtCaptionLbl)
//                         {
//                         }
//                         column(SvcTaxSBCAmtAppliedCaption; SvcTaxSBCAmtAppliedCaptionLbl)
//                         {
//                         }
//                         column(KKCessAmt; KKCessAmt)
//                         {
//                         }
//                         column(AppliedKKCessAmt; AppliedKKCessAmt)
//                         {
//                         }
//                         column(KKCessAmtCaption; KKCessAmtCaptionLbl)
//                         {
//                         }
//                         column(KKCessAmtAppliedCaption; KKCessAmtAppliedCaptionLbl)
//                         {
//                         }
//                         column(totCGSTAmt; totCGSTAmt)
//                         {
//                         }
//                         column(totSGSTAmt; totSGSTAmt)
//                         {
//                         }
//                         column(totIGSTAmt; totIGSTAmt)
//                         {
//                         }
//                         column(GSTBaseAmt; GSTBaseAmt)
//                         {
//                         }
//                         column(AmttoCustomer; AmttoCustomer)
//                         {
//                         }
//                         dataitem(DataItem1000000036; Table33001046)
//                         {
//                             DataItemLink = No.=FIELD(Document No.);
//                             column(Marks_PackingListHeader; "Packing List Header".Marks)
//                             {
//                             }
//                             column(decNetWeight; NetWT)
//                             {
//                                 DecimalPlaces = 2 : 5;
//                             }
//                             column(decGrossWeight; GrossWT)
//                             {
//                                 DecimalPlaces = 2 : 5;
//                             }
//                             dataitem(DataItem1000000043; Table33001048)
//                             {
//                                 DataItemLink = Packing List No.=FIELD(No.);
//                                 DataItemTableView = '';
//                                 column(LotNO;"Packing List Package Details"."Lot Number")
//                                 {
//                                 }
//                                 column(Qty;"Packing List Package Details".Quantity)
//                                 {
//                                 }
//                                 column(MFGDATE;"Packing List Package Details"."Manufacturing Date")
//                                 {
//                                 }
//                                 column(EXPDATE;"Packing List Package Details"."Expiry Date")
//                                 {
//                                 }
//                                 column(WeightUOM_PackingListPackageDetails;"Packing List Package Details"."Weight UOM")
//                                 {
//                                 }

//                                 trigger OnAfterGetRecord();
//                                 begin
//                                     /*
//                                     InspectionDataSheet.RESET;
//                                     InspectionDataSheet.SETRANGE(InspectionDataSheet."Lot No.","Item Ledger Entry"."Lot No.");
//                                     IF InspectionDataSheet.FINDFIRST THEN;
//                                     */
//                                     //NetWT += "Packing List Package Details"."Net Wght. per Case"*"Packing List Package Details"."No. Of Packages";
//                                     //GrossWT += "Packing List Package Details"."Gross Wght. per Case"*"Packing List Package Details"."No. Of Packages"

//                                 end;

//                                 trigger OnPreDataItem();
//                                 begin
//                                     "Packing List Package Details".SETRANGE("Packing List Package Details"."Item No.","Sales Line"."No.");
//                                 end;
//                             }

//                             trigger OnAfterGetRecord();
//                             begin
//                                 PackingListPackage.RESET;
//                                 PackingListPackage.SETRANGE(PackingListPackage."Packing List No.","No.");
//                                 IF PackingListPackage.FINDSET THEN REPEAT
//                                   NetWT += PackingListPackage."Net Wght. per Case"*PackingListPackage."No. Of Packages";
//                                   GrossWT += PackingListPackage."Gross Wght. per Case"*PackingListPackage."No. Of Packages" ;
//                                 UNTIL  PackingListPackage.NEXT =0;
//                             end;
//                         }

//                         trigger OnAfterGetRecord();
//                         var
//                             StructureLineDetails : Record "13798";
//                         begin
//                             upusd:="Unit Price"/decCurrencyFactor;
//                             PostedShipmentDate := 0D;
//                             //IF Quantity <> 0 THEN
//                             //  PostedShipmentDate := FindPostedShipmentDate;

//                             IF (Type = Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
//                               "No." := '';

//                             IF ItemPCPL.GET("Sales Line"."No.") THEN;
//                               IF terrifNo.GET(ItemPCPL."Tariff No.") THEN;
//                             VATAmountLine.INIT;
//                             VATAmountLine."VAT Identifier" := "VAT Identifier";
//                             VATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
//                             VATAmountLine."Tax Group Code" := "Tax Group Code";
//                             VATAmountLine."VAT %" := "VAT %";
//                             VATAmountLine."VAT Base" := Amount;
//                             VATAmountLine."Amount Including VAT" := "Amount Including VAT";
//                             VATAmountLine."Line Amount" := "Line Amount";
//                             IF "Allow Invoice Disc." THEN
//                               VATAmountLine."Inv. Disc. Base Amount" := "Line Amount";
//                             VATAmountLine."Invoice Discount Amount" := "Inv. Discount Amount";
//                             VATAmountLine.InsertLine;

//                             IF ItenUOM.GET("Sales Line"."No.") THEN; //PCPL
//                             TotalTCSAmount += "Total TDS/TCS Incl. SHE CESS";
//                             TotalSubTotal += "Line Amount";
//                             TotalInvoiceDiscountAmount -= "Inv. Discount Amount";
//                             TotalAmount += Amount;
//                             TotalAmountVAT += "Amount Including VAT" - Amount;
//                             // TotalAmountInclVAT += "Amount Including VAT";
//                             TotalPaymentDiscountOnVAT += -("Line Amount" - "Inv. Discount Amount" - "Amount Including VAT");
//                             TotalAmountInclVAT += "Amount To Customer";
//                             TotalExciseAmt +=  "Excise Amount";
//                             TotalTaxAmt +=  "Tax Amount";
//                             ServiceTaxAmount += "Service Tax Amount";
//                             ServiceTaxeCessAmount += "Service Tax eCess Amount";
//                             ServiceTaxSHECessAmount += "Service Tax SHE Cess Amount";
//                             ServiceTaxSBCAmount += "Service Tax SBC Amount";
//                             KKCessAmount += "KK Cess Amount";

//                             IF IsGSTApplicable AND (Type <> Type::" ") THEN BEGIN
//                               J := 1;
//                               GSTComponent.RESET;
//                               GSTComponent.SETRANGE("GST Jurisdiction Type","GST Jurisdiction Type");
//                               IF GSTComponent.FINDSET THEN
//                                 REPEAT
//                                   GSTComponentCode[J] := GSTComponent.Code;
//                                   DetailedGSTLedgerEntry.RESET;
//                                   DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type","Document Type","Document No.","Document Line No.");
//                                   DetailedGSTLedgerEntry.SETRANGE("Transaction Type",DetailedGSTLedgerEntry."Transaction Type"::Sales);
//                                   DetailedGSTLedgerEntry.SETRANGE("Document No.","Document No.");
//                                   DetailedGSTLedgerEntry.SETRANGE("Document Line No.","Line No.");
//                                   DetailedGSTLedgerEntry.SETRANGE("GST Component Code",GSTComponentCode[J]);
//                                   IF DetailedGSTLedgerEntry.FINDSET THEN BEGIN
//                                     REPEAT
//                                       GSTCompAmount[J] += DetailedGSTLedgerEntry."GST Amount";
//                                     UNTIL DetailedGSTLedgerEntry.NEXT = 0;
//                                     J += 1;
//                                   END;
//                                 UNTIL GSTComponent.NEXT = 0;
//                             END;

//                             /*StructureLineDetails.RESET;
//                             StructureLineDetails.SETRANGE("Invoice No.","Document No.");
//                             StructureLineDetails.SETRANGE("Item No.","No.");
//                             StructureLineDetails.SETRANGE("Line No.","Line No.");
//                             StructureLineDetails.SETRANGE(Type,StructureLineDetails.Type::Sale);
//                             StructureLineDetails.SETRANGE("Document Type",StructureLineDetails."Document Type"::Invoice);
//                             IF StructureLineDetails.FINDFIRST THEN
//                               REPEAT
//                                 IF NOT StructureLineDetails."Payable to Third Party" THEN BEGIN
//                                   IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Charges THEN
//                                     ChargesAmount := ChargesAmount + ABS(StructureLineDetails.Amount);
//                                   IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Other Taxes" THEN
//                                     OtherTaxesAmount := OtherTaxesAmount + ABS(StructureLineDetails.Amount);
//                                 END;
//                               UNTIL StructureLineDetails.NEXT = 0;
//                              */

//                             //PCPL-25
//                             StructureLineDetails12.RESET;
//                             StructureLineDetails12.SETRANGE("Document No.","Document No.");
//                             StructureLineDetails12.SETRANGE("Item No.","No.");
//                             StructureLineDetails12.SETRANGE("Line No.","Line No.");
//                             StructureLineDetails12.SETRANGE(Type,StructureLineDetails12.Type::Sale);
//                             StructureLineDetails12.SETRANGE("Document Type",StructureLineDetails12."Document Type"::Invoice);
//                             IF StructureLineDetails12.FINDFIRST THEN
//                               REPEAT
//                                 IF NOT StructureLineDetails12."Payable to Third Party" THEN BEGIN
//                                   IF StructureLineDetails12."Tax/Charge Type" = StructureLineDetails12."Tax/Charge Type"::Charges THEN
//                                     ChargesAmount := ChargesAmount + ABS(StructureLineDetails12.Amount);
//                                   IF StructureLineDetails12."Tax/Charge Type" = StructureLineDetails12."Tax/Charge Type"::"Other Taxes" THEN
//                                     OtherTaxesAmount := OtherTaxesAmount + ABS(StructureLineDetails.Amount);
//                                 END;
//                               UNTIL StructureLineDetails12.NEXT = 0;
//                             RCheck.FormatNoText(LineAmtUSDWord,ROUND(LineAmtusd+ChargesAmount),"Sales Header"."Currency Code");
//                             //PCPL-25
//                             TotalChargesAmount += ROUND(ChargesAmount * decCurrencyFactor,0.01);
//                             IF "Sales Header"."Transaction No. Serv. Tax" <> 0 THEN BEGIN
//                               ServiceTaxEntry.RESET;
//                               ServiceTaxEntry.SETRANGE(Type,ServiceTaxEntry.Type::Sale);
//                               ServiceTaxEntry.SETRANGE("Document Type",ServiceTaxEntry."Document Type"::Invoice);
//                               ServiceTaxEntry.SETRANGE("Document No.","Document No.");
//                               IF ServiceTaxEntry.FINDFIRST THEN BEGIN

//                                 IF "Sales Header"."Currency Code" <> '' THEN BEGIN
//                                   ServiceTaxEntry."Service Tax Amount" :=
//                                     ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
//                                     "Sales Header"."Posting Date","Sales Header"."Currency Code",
//                                     ServiceTaxEntry."Service Tax Amount","Sales Header"."Currency Factor"));
//                                   ServiceTaxEntry."eCess Amount" :=
//                                     ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
//                                     "Sales Header"."Posting Date","Sales Header"."Currency Code",
//                                     ServiceTaxEntry."eCess Amount","Sales Header"."Currency Factor"));
//                                   ServiceTaxEntry."SHE Cess Amount" :=
//                                     ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
//                                     "Sales Header"."Posting Date","Sales Header"."Currency Code",
//                                     ServiceTaxEntry."SHE Cess Amount","Sales Header"."Currency Factor"));
//                                   ServiceTaxEntry."Service Tax SBC Amount" :=
//                                     ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
//                                     "Sales Header"."Posting Date","Sales Header"."Currency Code",
//                                     ServiceTaxEntry."Service Tax SBC Amount","Sales Header"."Currency Factor"));
//                                   ServiceTaxEntry."KK Cess Amount" :=
//                                     ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
//                                     "Sales Header"."Posting Date","Sales Header"."Currency Code",
//                                     ServiceTaxEntry."KK Cess Amount","Sales Header"."Currency Factor"));
//                                 END;

//                                 ServiceTaxAmt := ABS(ServiceTaxEntry."Service Tax Amount");
//                                 ServiceTaxECessAmt := ABS(ServiceTaxEntry."eCess Amount");
//                                 ServiceTaxSHECessAmt := ABS(ServiceTaxEntry."SHE Cess Amount");
//                                 ServiceTaxSBCAmt := ABS(ServiceTaxEntry."Service Tax SBC Amount");
//                                 KKCessAmt := ABS(ServiceTaxEntry."KK Cess Amount");
//                                 AppliedServiceTaxAmt := ServiceTaxAmount - ABS(ServiceTaxEntry."Service Tax Amount");
//                                 AppliedServiceTaxECessAmt := ServiceTaxeCessAmount - ABS(ServiceTaxEntry."eCess Amount");
//                                 AppliedServiceTaxSHECessAmt := ServiceTaxSHECessAmount - ABS(ServiceTaxEntry."SHE Cess Amount");
//                                 AppliedServiceTaxSBCAmt := ServiceTaxSBCAmount - ABS(ServiceTaxEntry."Service Tax SBC Amount");
//                                 AppliedKKCessAmt := KKCessAmount - ABS(ServiceTaxEntry."KK Cess Amount");
//                               END ELSE BEGIN
//                                 AppliedServiceTaxAmt := ServiceTaxAmount;
//                                 AppliedServiceTaxECessAmt := ServiceTaxeCessAmount;
//                                 AppliedServiceTaxSHECessAmt := ServiceTaxSHECessAmount;
//                                 AppliedServiceTaxSBCAmt := ServiceTaxSBCAmount;
//                                 AppliedKKCessAmt := KKCessAmount;
//                               END;
//                             END ELSE BEGIN
//                               ServiceTaxAmt := ServiceTaxAmount;
//                               ServiceTaxECessAmt := ServiceTaxeCessAmount;
//                               ServiceTaxSHECessAmt := ServiceTaxSHECessAmount;
//                               ServiceTaxSBCAmt := ServiceTaxSBCAmount;
//                               KKCessAmt := KKCessAmount
//                             END;


//                             CGSTAmt :=0;
//                             SGSTAmt :=0;
//                             IGSTAmt :=0;
//                             CGSTPer :=0;
//                             SGSTPer :=0;
//                             IGSTPer :=0;
//                             recDetailedGSTLedger.RESET;
//                             recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Transaction Type",recDetailedGSTLedger."Transaction Type"::Sales);
//                             recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Document Type",recDetailedGSTLedger."Document Type"::Invoice);
//                             recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Document No.","Document No.");
//                             recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Line No.","Line No.");
//                             recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."GST Component Code",'CGST');
//                             IF recDetailedGSTLedger.FINDSET THEN BEGIN
//                              REPEAT
//                               CGSTAmt += ABS(recDetailedGSTLedger."GST Amount");
//                               CGSTPer := recDetailedGSTLedger."GST %";
//                               totCGSTAmt += ABS(ROUND(recDetailedGSTLedger."GST Amount" * decCurrencyFactor,0.01));
//                              UNTIL recDetailedGSTLedger.NEXT=0;
//                             END;

//                             recDetailedGSTLedger.RESET;
//                             recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Transaction Type",recDetailedGSTLedger."Transaction Type"::Sales);
//                             recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Document Type",recDetailedGSTLedger."Document Type"::Invoice);
//                             recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Document No.","Document No.");
//                             recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Line No.","Line No.");
//                             recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."GST Component Code",'SGST');
//                             IF recDetailedGSTLedger.FINDSET THEN
//                             REPEAT
//                               SGSTAmt += ABS(recDetailedGSTLedger."GST Amount");
//                               SGSTPer := recDetailedGSTLedger."GST %";
//                               totSGSTAmt += ABS(ROUND(recDetailedGSTLedger."GST Amount" * decCurrencyFactor,0.01));
//                             UNTIL recDetailedGSTLedger.NEXT=0;

//                             totIGSTAmt  :=  0;
//                             IGSTAmt :=  0;
//                             IGSTPer := 0;

//                             recDetailedGSTLedger.RESET;
//                             recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Transaction Type",recDetailedGSTLedger."Transaction Type"::Sales);
//                             recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Document Type",recDetailedGSTLedger."Document Type"::Invoice);
//                             recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Document No.","Document No.");
//                             ///recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Line No.","Line No.");
//                             recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."GST Component Code",'IGST');
//                             IF recDetailedGSTLedger.FINDSET THEN
//                             REPEAT
//                              // totIGSTAmt += ABS(recDetailedGSTLedger."GST Amount");
//                               IGSTPer := recDetailedGSTLedger."GST %";
//                               totIGSTAmt += ABS(ROUND(recDetailedGSTLedger."GST Amount" * decCurrencyFactor,0.01));
//                              // MESSAGE(FORMAT(totIGSTAmt));
//                             UNTIL recDetailedGSTLedger.NEXT=0;
//                             //YSR GSTBaseAmt :="GST Base Amount";
//                             //YSR AmttoCustomer := "Amount To Customer";

//                             RCheck.InitTextVariable;
//                             RCheck.FormatNoText(AmtWordsCGS,totCGSTAmt,'');
//                             RCheck.InitTextVariable;
//                             RCheck.FormatNoText(AmtWordsSGS,totSGSTAmt,'');

//                             //RCheck.InitTextVariable;
//                             //RCheck.FormatNoText(AmtWordsSGS,SGSTAmt,'');
//                             //RCheck.InitTextVariable;
//                             //RCheck.FormatNoText(AmtWordsIGS,IGSTAmt,'');
//                             RCheck.InitTextVariable;
//                             RCheck.FormatNoText(AmtWordsIGS,totIGSTAmt,'');

//                             RCheck.InitTextVariable;
//                             RCheck.FormatNoText(WordChargesAmount,TotalChargesAmount,'');
//                             ///AmttoCustomer :=  AmttoCustomer + totIGSTAmt;
//                             ///RCheck.InitTextVariable;
//                             //RCheck.FormatNoText(AmtWords,ROUND(AmttoCustomer),'');

//                             //
//                             intTtlLineNo  := intTtlLineNo + 1;
//                             IF intTtlLineNo = 10 THEN
//                               intTtlLineNo  :=  0;

//                         end;

//                         trigger OnPreDataItem();
//                         begin
//                             VATAmountLine.DELETEALL;
//                             SalesShipmentBuffer.RESET;
//                             SalesShipmentBuffer.DELETEALL;
//                             FirstValueEntryNo := 0;
//                             MoreLines := FIND('+');
//                             WHILE MoreLines AND (Description = '') AND ("No." = '') AND (Quantity = 0) AND (Amount = 0) DO
//                               MoreLines := NEXT(-1) <> 0;
//                             IF NOT MoreLines THEN
//                               CurrReport.BREAK;
//                             SETRANGE("Line No.",0,"Line No.");
//                             CurrReport.CREATETOTALS("Line Amount",Amount,"Amount Including VAT","Inv. Discount Amount","Excise Amount","Tax Amount",
//                               "Service Tax Amount","Service Tax eCess Amount","Amount To Customer","Service Tax SBC Amount");
//                             CurrReport.CREATETOTALS("KK Cess Amount");
//                             CurrReport.CREATETOTALS("Service Tax SHE Cess Amount");
//                             salescount:="Sales Line".COUNT;
//                             TotalChargesAmount :=0;
//                         end;
//                     }
//                     dataitem(DataItem1000000049;Table2000000026)
//                     {
//                         DataItemTableView = SORTING(Number)
//                                             ORDER(Ascending);
//                         column(Numb;Number)
//                         {
//                         }

//                         trigger OnPreDataItem();
//                         begin
//                             SETRANGE(Integer.Number,  0, salescount-10);
//                         end;
//                     }
//                 }

//                 trigger OnAfterGetRecord();
//                 begin
//                     IF Number > 1 THEN BEGIN
//                       CopyText := Text003;
//                       OutputNo += 1;
//                     END;
//                     CurrReport.PAGENO := 1;

//                     TotalSubTotal := 0;
//                     TotalInvoiceDiscountAmount := 0;
//                     TotalAmount := 0;
//                     TotalAmountVAT := 0;
//                     TotalAmountInclVAT := 0;
//                     TotalPaymentDiscountOnVAT := 0;
//                     TotalExciseAmt :=0;
//                     TotalTaxAmt := 0;
//                     ServiceTaxAmount := 0;
//                     ServiceTaxeCessAmount := 0;
//                     ServiceTaxSHECessAmount := 0;
//                     ServiceTaxSBCAmount := 0;
//                     KKCessAmount := 0;
//                     //ysrAmttoCustomer :=0;
//                     OtherTaxesAmount := 0;
//                     ChargesAmount :=0;
//                     AppliedServiceTaxSHECessAmt := 0;
//                     AppliedServiceTaxECessAmt := 0;
//                     AppliedServiceTaxAmt :=0;
//                     AppliedServiceTaxSBCAmt := 0;
//                     AppliedKKCessAmt := 0;
//                     ServiceTaxSHECessAmt :=0;
//                     ServiceTaxECessAmt :=0;
//                     ServiceTaxAmt := 0;
//                     ServiceTaxSBCAmt := 0;
//                     KKCessAmt := 0;
//                     TotalTCSAmount := 0;
//                     //YSR GSTBaseAmt :=0;
//                 end;

//                 trigger OnPostDataItem();
//                 begin
//                     IF NOT CurrReport.PREVIEW THEN
//                     //  SalesInvCountPrinted.RUN("Sales Header");
//                 end;

//                 trigger OnPreDataItem();
//                 begin
//                     NoOfLoops := ABS(NoOfCopies) +1;
//                     IF NoOfLoops <= 0 THEN
//                       NoOfLoops := 1;
//                     CopyText := '';
//                     SETRANGE(Number,1,NoOfLoops);
//                     OutputNo := 1;
//                 end;
//             }

//             trigger OnAfterGetRecord();
//             var
//                 SalesInvLine : Record "113";
//                 Location : Record "14";
//             begin
//                 //PCPL-25 31dec20
//                 SalesInvoiceHeader.RESET;
//                 SalesInvoiceHeader.SETRANGE(SalesInvoiceHeader."Order No.","No.");
//                 IF SalesInvoiceHeader.FINDFIRST THEN BEGIN
//                   EInvoiceDetail.RESET;
//                   EInvoiceDetail.SETRANGE(EInvoiceDetail."Document No.",SalesInvoiceHeader."No.");//"Sales Invoice Header"."No.");
//                   IF EInvoiceDetail.FINDFIRST THEN BEGIN
//                     EInvoiceDetail.CALCFIELDS("EINV QR Code");
//                     IRNNO := EInvoiceDetail."EINV IRN No.";
//                   END;
//                 END;
//                 //PCPL-25 31dec20

//                 //YSR BEGIN
//                 AmttoCustomer := (ROUND("Amount to Customer" * decCurrencyFactor,0.01));
//                 IF recPort.GET("Port of Discharge") THEN
//                   portofDisc := recPort."Port Name";
//                 IF Country.GET("Sales Header"."Country of Final Destination") THEN;
//                 IF PaymentMethodCode.GET("Sales Header"."Payment Method Code") THEN;

//                 IF  "Currency Factor" <>  0 THEN
//                   decCurrencyFactor  :=  1/"Currency Factor"
//                 ELSE
//                   decCurrencyFactor  :=  1;
//                 //YSR END
//                 //PCPL/BRB
//                 IF Shiptoadd.GET("Sell-to Customer No.","Ship-to Code") THEN
//                   IF CountryRegion.GET(Shiptoadd."Country/Region Code") THEN
//                       ShipCountryName := CountryRegion.Name;

//                 IF Customer.GET("Bill-to Customer No.") THEN
//                     IF CountryRegion.GET(Customer."Country/Region Code") THEN
//                     IF NewPort.GET(Port) THEN
//                 IF ShipCountryName='' THEN
//                    ShipCountryName := CountryRegion.Name;
//                 //
//                 //YSR BEGIN
//                 GSTBaseAmt := 0;
//                 SalesLine.RESET;
//                 SalesLine.SETRANGE("Document No.","No.");
//                 SalesLine.SETFILTER(Quantity,'<>%1',0);
//                 IF SalesLine.FINDSET THEN  REPEAT
//                   LineAmtusd += SalesLine."Line Amount";
//                   TotalLineAmt += ROUND(SalesLine."Line Amount"*decCurrencyFactor,0.01);
//                 UNTIL SalesLine.NEXT = 0;
//                 //YSR END
//                 RCheck.InitTextVariable;
//                 RCheck.FormatNoText(AmtWordsgstbase,TotalLineAmt,'');

//                 CompanyInfo.GET;
//                 CompanyInfo.CALCFIELDS(Picture);
//                 CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");
//                 IsGSTApplicable := GSTManagement.IsGSTApplicable(Structure);
//                 Customer.GET("Bill-to Customer No.");
//                 IF RespCenter.GET("Responsibility Center") THEN BEGIN
//                   FormatAddr.RespCenter(CompanyAddr,RespCenter);
//                   CompanyInfo."Phone No." := RespCenter."Phone No.";
//                   CompanyInfo."Fax No." := RespCenter."Fax No.";
//                 END ELSE
//                   FormatAddr.Company(CompanyAddr,CompanyInfo);
//                 DimSetEntry1.SETRANGE("Dimension Set ID","Dimension Set ID");

//                 IF "No." = '' THEN
//                   OrderNoText := ''
//                 ELSE
//                   OrderNoText := FIELDCAPTION("No.");

//                 IF "Salesperson Code" = '' THEN BEGIN
//                   SalesPurchPerson.INIT;
//                   SalesPersonText := '';
//                 END ELSE BEGIN
//                   SalesPurchPerson.GET("Salesperson Code");
//                   SalesPersonText := Text000;
//                 END;
//                 IF "Your Reference" = '' THEN
//                   ReferenceText := ''
//                 ELSE
//                   ReferenceText := FIELDCAPTION("Your Reference");
//                 IF "VAT Registration No." = '' THEN
//                   VATNoText := ''
//                 ELSE
//                   VATNoText := FIELDCAPTION("VAT Registration No.");
//                 IF "Currency Code" = '' THEN BEGIN
//                   GLSetup.TESTFIELD("LCY Code");
//                   TotalText := STRSUBSTNO(Text001,GLSetup."LCY Code");
//                   TotalInclVATText := STRSUBSTNO(Text13700,GLSetup."LCY Code");
//                   TotalExclVATText := STRSUBSTNO(Text13701,GLSetup."LCY Code");
//                 END ELSE BEGIN
//                   TotalText := STRSUBSTNO(Text001,"Currency Code");
//                   TotalInclVATText := STRSUBSTNO(Text13700,"Currency Code");
//                   TotalExclVATText := STRSUBSTNO(Text13701,"Currency Code");
//                 END;
//                 FormatAddr.SalesHeaderBillTo(CustAddr,"Sales Header");
//                 IF NOT Cust.GET("Bill-to Customer No.") THEN
//                   CLEAR(Cust);

//                 IF "Payment Terms Code" = '' THEN
//                   PaymentTerms.INIT
//                 ELSE BEGIN
//                   PaymentTerms.GET("Payment Terms Code");
//                   PaymentTerms.TranslateDescription(PaymentTerms,"Language Code");
//                 END;

//                 IF "Shipment Method Code" = '' THEN
//                   ShipmentMethod.INIT
//                 ELSE BEGIN
//                   ShipmentMethod.GET("Shipment Method Code");
//                   ShipmentMethod.TranslateDescription(ShipmentMethod,"Language Code");
//                 END;
//                 FormatAddr.SalesHeaderShipTo(ShipToAddr,"Sales Header");
//                 ShowShippingAddr := "Sell-to Customer No." <> "Bill-to Customer No.";
//                 FOR i := 1 TO ARRAYLEN(ShipToAddr) DO
//                   IF ShipToAddr[i] <> CustAddr[i] THEN
//                     ShowShippingAddr := TRUE;

//                 //GetLineFeeNoteOnReportHist("No.");
//                 IF LocationAdd.GET("Sales Header"."Location Code") THEN;
//                 IF Stateee.GET(LocationAdd."State Code") THEN;
//                 IF BillToCust.GET("Sales Header"."Bill-to Customer No.") THEN;
//                 IF BillToState.GET(BillToCust."State Code") THEN ;

//                 ShipToPost.RESET;
//                 ShipToPost.SETRANGE(ShipToPost."Customer No.","Sales Header"."Sell-to Customer No.");
//                 ShipToPost.SETRANGE(ShipToPost.Code,"Sales Header"."Ship-to Code");
//                 IF ShipToPost.FINDFIRST THEN BEGIN
//                   IF ShipToState.GET(ShipToPost.State) THEN  ;
//                      ShipToAddress[1] := ShipToPost.Name;
//                      ShipToAddress[2] := ShipToPost.Address;
//                      ShipToAddress[3] := ShipToPost."Address 2";
//                      ShipToAddress[4] := ShipToPost.City;
//                      ShipToAddress[5] := ShipToPost."Post Code";
//                      ShipToAddress[6] := ShipToPost.State;
//                      ShipToAddress[7] := ShipToPost."GST Registration No.";
//                      ShipToAddress[8] :=  ShipToState.Description;
//                      ShipToAddress[9] := ShipToPost."Name 2";
//                 END ELSE
//                 BEGIN
//                    ShipToAddress[1] := BillToCust.Name;
//                    ShipToAddress[2] := BillToCust.Address;
//                    ShipToAddress[3] := BillToCust."Address 2";
//                    ShipToAddress[4] := BillToCust.City;
//                    ShipToAddress[5] := BillToCust."Post Code";
//                    ShipToAddress[6] := BillToCust."State Code";
//                    ShipToAddress[7] := BillToCust."GST Registration No.";
//                    ShipToAddress[8] :=  BillToState.Description;
//                    ShipToAddress[9] := BillToCust."Name 2";
//                 END;

//                 /*
//                 IF LogInteraction THEN
//                   IF NOT CurrReport.PREVIEW THEN BEGIN
//                     IF "Bill-to Contact No." <> '' THEN
//                       SegManagement.LogDocument(
//                         SegManagement.SalesInvoiceInterDocType,"No.",0,0,DATABASE::Contact,"Bill-to Contact No.","Salesperson Code",
//                         "Campaign No.","Posting Description",'')
//                     ELSE
//                       SegManagement.LogDocument(
//                         SegManagement.SalesInvoiceInterDocType,"No.",0,0,DATABASE::Customer,"Bill-to Customer No.","Salesperson Code",
//                         "Campaign No.","Posting Description",'');
//                   END;
//                   */

//                 SupplementaryText := '';
//                 SalesInvLine.SETRANGE("Document No.","No.");
//                 SalesInvLine.SETRANGE(Supplementary, TRUE);
//                 IF SalesInvLine.FINDFIRST THEN
//                   SupplementaryText := Text16500;

//                 IF Location.GET("Location Code") THEN
//                   ServiceTaxRegistrationNo := Location."Service Tax Registration No."
//                 ELSE
//                   ServiceTaxRegistrationNo := CompanyInfo."Service Tax Registration No.";

//                 /*
//                 RCheck.InitTextVariable;
//                 RCheck.FormatNoText(AmtWords,AmttoCustomer,"Sales Invoice Header"."Currency Code");
//                 */

//                 SalesInvLine.SETRANGE("Document No.","No.");
//                 IF SalesInvLine.FINDSET THEN
//                   salescount := SalesInvLine.COUNT;

//                 SalesShipmentLine.RESET;
//                 SalesShipmentLine.SETRANGE(SalesShipmentLine."Order No.","No.");
//                 IF SalesShipmentLine.FINDSET THEN
//                 BEGIN
//                   ItemLedgerEntry.RESET;
//                   ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Document No.",SalesShipmentLine."Document No.");
//                   IF ItemLedgerEntry.FINDFIRST THEN
//                     LotNO:=ItemLedgerEntry."Lot No.";
//                 END;
//                 //YSR BEGIN
//                 GSTBaseAmt := 0;
//                 SalesInvLine.RESET;
//                 SalesInvLine.SETRANGE("Document No.","No.");
//                 SalesInvLine.SETFILTER(Quantity,'<>%1',0);
//                 IF SalesInvLine.FINDSET THEN  REPEAT
//                   GSTBaseAmt += SalesInvLine."GST Base Amount";
//                 UNTIL SalesInvLine.NEXT = 0;
//                 //YSR END

//                 //YSR BEGIN
//                 AmttoCustomer := ROUND(AmttoCustomer * decCurrencyFactor,0.01);
//                 GSTBaseAmt  :=  ROUND(GSTBaseAmt * decCurrencyFactor,0.01);
//                 //tIGSTAmt  :=  ROUND(IGSTAmt * decCurrencyFactor,0.01);
//                 //totIGSTAmt  :=  ROUND(totIGSTAmt * decCurrencyFactor,0.01);
//                 //AmttoCustomer :=  AmttoCustomer + totIGSTAmt;
//                 intTtlLineNo  :=  0;
//                 //YSR END
//                 RCheck.InitTextVariable;
//                 RCheck.FormatNoText(AmtWords,ROUND(AmttoCustomer),'');
//                 RCheck.InitTextVariable;
//                 //RCheck.FormatNoText(LineAmtUSDWord,ROUND(LineAmtusd),"Sales Header"."Currency Code");   //TEmp comment PCPL-25


//                 PackingList.RESET;
//                 PackingList.SETRANGE("SO NO.","Sales Header"."No.");
//                 IF PackingList.FINDFIRST THEN
//                 BEGIN
//                   PackingListPackage.RESET;
//                   PackingListPackage.SETRANGE(PackingListPackage."Packing List No.",PackingList."No.");
//                   IF PackingListPackage.FINDSET THEN;
//                 END;

//                 //PCPL41_20022020_S
//                 CommPay := "Sales Header"."Currency Code Vendor"+ ' '+FORMAT("Sales Header"."Vendor Amount");

//                 IF (CommPay = '') OR ("Sales Header"."Vendor Amount" = 0) THEN
//                 CommPay := 'NA';
//                 //PCPL41_20022020_E

//             end;

//             trigger OnPreDataItem();
//             begin
//                 decCurrencyFactor :=  1;//YSR
//                 AmttoCustomer := 0;     //ysr
//             end;
//         }
//     }

//     requestpage
//     {
//         SaveValues = true;

//         layout
//         {
//             area(content)
//             {
//                 group(Options)
//                 {
//                     CaptionML = ENU='Options',
//                                 ENN='Options';
//                     field(NoOfCopies;NoOfCopies)
//                     {
//                         CaptionML = ENU='No. of Copies',
//                                     ENN='No. of Copies';
//                     }
//                     field(ShowInternalInfo;ShowInternalInfo)
//                     {
//                         CaptionML = ENU='Show Internal Information',
//                                     ENN='Show Internal Information';
//                     }
//                     field(LogInteraction;LogInteraction)
//                     {
//                         CaptionML = ENU='Log Interaction',
//                                     ENN='Log Interaction';
//                         Enabled = LogInteractionEnable;
//                     }
//                     field(DisplayAsmInformation;DisplayAssemblyInformation)
//                     {
//                         CaptionML = ENU='Show Assembly Components',
//                                     ENN='Show Assembly Components';
//                     }
//                     field(DisplayAdditionalFeeNote;DisplayAdditionalFeeNote)
//                     {
//                         CaptionML = ENU='Show Additional Fee Note',
//                                     ENN='Show Additional Fee Note';
//                     }
//                     field("Gross Weight";GrossWT)
//                     {
//                     }
//                     field("Net Weight";NetWT)
//                     {
//                     }
//                 }
//             }
//         }

//         actions
//         {
//         }

//         trigger OnInit();
//         begin
//             LogInteractionEnable := TRUE;
//         end;

//         trigger OnOpenPage();
//         begin
//             InitLogInteraction;
//             LogInteractionEnable := LogInteraction;
//         end;
//     }

//     labels
//     {
//     }

//     trigger OnInitReport();
//     begin
//         GLSetup.GET;
//         CompanyInfo.GET;
//         SalesSetup.GET;
//         CompanyInfo.VerifyAndSetPaymentInfo;
//         CASE SalesSetup."Logo Position on Documents" OF
//           SalesSetup."Logo Position on Documents"::Left:
//             BEGIN
//               CompanyInfo3.GET;
//               CompanyInfo3.CALCFIELDS(Picture);
//             END;
//           SalesSetup."Logo Position on Documents"::Center:
//             BEGIN
//               CompanyInfo1.GET;
//               CompanyInfo1.CALCFIELDS(Picture);
//             END;
//           SalesSetup."Logo Position on Documents"::Right:
//             BEGIN
//               CompanyInfo2.GET;
//               CompanyInfo2.CALCFIELDS(Picture);
//             END;
//         END;
//     end;

//     trigger OnPreReport();
//     begin
//         IF NOT CurrReport.USEREQUESTPAGE THEN
//           InitLogInteraction;
//     end;

//     var
//         Text000 : TextConst ENU='Salesperson',ENN='Salesperson';
//         Text001 : TextConst ENU='Total %1',ENN='Total %1';
//         Text003 : TextConst ENU=' COPY',ENN=' COPY';
//         Text004 : TextConst ENU='Sales - Invoice%1',ENN='Sales - Invoice%1';
//         PageCaptionCap : TextConst ENU='Page %1 of %2',ENN='Page %1 of %2';
//          GLSetup: Record "General Ledger Setup";
//         ShipmentMethod: Record "Shipment Method";
//         PaymentTerms: Record "Payment Terms";
//         SalesPurchPerson: Record "Salesperson/Purchaser";
//         CompanyInfo: Record "Company Information";
//         CompanyInfo1: Record "Company Information";
//         CompanyInfo2: Record "Company Information";
//         CompanyInfo3: Record "Company Information";
//         GSTComponent: Record "GST Component";
//         Customer: Record Customer;
//         DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
//         SalesSetup: Record "Sales & Receivables Setup";
//         Cust: Record Customer;
//         VATAmountLine: Record "VAT Amount Line" temporary;
//         DimSetEntry1: Record "Dimension Set Entry";
//         DimSetEntry2: Record "Dimension Set Entry";
//         RespCenter: Record "Responsibility Center";
//         Language: Record Language;
//         CurrExchRate: Record "Currency Exchange Rate";
//         TempPostedAsmLine: Record "Posted Assembly Line" temporary;
//         //GSTManagement: Codeunit "GST Management";
//         SalesInvCountPrinted: Codeunit "Sales Inv.-Printed";
//         FormatAddr: Codeunit "Format Address";
//         SegManagement: Codeunit SegManagement;
//         SalesShipmentBuffer: Record "Sales Shipment Buffer" temporary;
//         GSTCompAmount : array [20] of Decimal;
//         GSTComponentCode : array [20] of Code[10];
//         PostedShipmentDate : Date;
//         CustAddr : array [8] of Text[80];
//         ShipToAddr : array [8] of Text[80];
//         CompanyAddr : array [8] of Text[80];
//         OrderNoText : Text[80];
//         SalesPersonText : Text[80];
//         VATNoText : Text[80];
//         ReferenceText : Text[80];
//         TotalText : Text[50];
//         TotalExclVATText : Text[50];
//         TotalInclVATText : Text[50];
//         MoreLines : Boolean;
//         NoOfCopies : Integer;
//         NoOfLoops : Integer;
//         CopyText : Text[30];
//         ShowShippingAddr : Boolean;
//         i : Integer;
//         NextEntryNo : Integer;
//         FirstValueEntryNo : Integer;
//         DimText : Text[120];
//         OldDimText : Text[75];
//         ShowInternalInfo : Boolean;
//         Continue : Boolean;
//         LogInteraction : Boolean;
//         VALVATBaseLCY : Decimal;
//         VALVATAmountLCY : Decimal;
//         VALSpecLCYHeader : Text[80];
//         Text007 : TextConst ENU='VAT Amount Specification in ',ENN='VAT Amount Specification in ';
//         Text008 : TextConst ENU='Local Currency',ENN='Local Currency';
//         VALExchRate : Text[50];
//         Text009 : TextConst ENU='Exchange rate: %1/%2',ENN='Exchange rate: %1/%2';
//         CalculatedExchRate : Decimal;
//         Text010 : TextConst ENU='Sales - Prepayment Invoice %1',ENN='Sales - Prepayment Invoice %1';
//         OutputNo : Integer;
//         TotalSubTotal : Decimal;
//         TotalAmount : Decimal;
//         TotalAmountInclVAT : Decimal;
//         TotalAmountVAT : Decimal;
//         TotalInvoiceDiscountAmount : Decimal;
//         TotalPaymentDiscountOnVAT : Decimal;
//         ChargesAmount : Decimal;
//         OtherTaxesAmount : Decimal;
//         Text13700 : TextConst ENU='Total %1 Incl. Taxes',ENN='Total %1 Incl. Taxes';
//         Text13701 : TextConst ENU='Total %1 Excl. Taxes',ENN='Total %1 Excl. Taxes';
//         SupplementaryText : Text[30];
//         Text16500 : TextConst ENU='Supplementary Invoice',ENN='Supplementary Invoice';
//         ServiceTaxEntry : Record "Service Tax Entry";
//         ServiceTaxAmt : Decimal;
//         ServiceTaxECessAmt : Decimal;
//         AppliedServiceTaxAmt : Decimal;
//         AppliedServiceTaxECessAmt : Decimal;
//         ServiceTaxSHECessAmt : Decimal;
//         AppliedServiceTaxSHECessAmt : Decimal;
//         TotalTaxAmt : Decimal;
//         TotalExciseAmt : Decimal;
//         TotalTCSAmount : Decimal;
//         ServiceTaxAmount : Decimal;
//         ServiceTaxeCessAmount : Decimal;
//         ServiceTaxSHECessAmount : Decimal;
//         [InDataSet]
//         LogInteractionEnable : Boolean;
//         DisplayAssemblyInformation : Boolean;
//         PhoneNoCaptionLbl : TextConst ENU='Phone No.',ENN='Phone No.';
//         HomePageCaptionCap : TextConst ENU='Home Page',ENN='Home Page';
//         VATRegNoCaptionLbl : TextConst ENU='VAT Registration No.',ENN='VAT Registration No.';
//         GiroNoCaptionLbl : TextConst ENU='Giro No.',ENN='Giro No.';
//         BankNameCaptionLbl : TextConst ENU='Bank',ENN='Bank';
//         BankAccNoCaptionLbl : TextConst ENU='Account No.',ENN='Account No.';
//         DueDateCaptionLbl : TextConst ENU='Due Date',ENN='Due Date';
//         InvoiceNoCaptionLbl : TextConst ENU='Invoice No.',ENN='Invoice No.';
//         PostingDateCaptionLbl : TextConst ENU='Posting Date',ENN='Posting Date';
//         PLAEntryNoCaptionLbl : TextConst ENU='PLA Entry No.',ENN='PLA Entry No.';
//         RG23AEntryNoCaptionLbl : TextConst ENU='RG23A Entry No.',ENN='RG23A Entry No.';
//         RG23CEntryNoCaptionLbl : TextConst ENU='RG23C Entry No.',ENN='RG23C Entry No.';
//         HeaderDimensionsCaptionLbl : TextConst ENU='Header Dimensions',ENN='Header Dimensions';
//         UnitPriceCaptionLbl : TextConst ENU='Unit Price (INR)',ENN='Unit Price';
//         DiscountCaptionLbl : TextConst ENU='Discount %',ENN='Discount %';
//         AmountCaptionLbl : TextConst ENU='Amount (INR)',ENN='Amount';
//         LineDiscountCaptionLbl : TextConst ENU='Line Discount Amount',ENN='Line Discount Amount';
//         PostedShipmentDateCaptionLbl : TextConst ENU='Posted Shipment Date',ENN='Posted Shipment Date';
//         SubtotalCaptionLbl : TextConst ENU='Subtotal',ENN='Subtotal';
//         ExciseAmountCaptionLbl : TextConst ENU='Excise Amount',ENN='Excise Amount';
//         TaxAmountCaptionLbl : TextConst ENU='Tax Amount',ENN='Tax Amount';
//         ServiceTaxAmountCaptionLbl : TextConst ENU='Service Tax Amount',ENN='Service Tax Amount';
//         ChargesAmountCaptionLbl : TextConst ENU='Charges Amount',ENN='Charges Amount';
//         OtherTaxesAmountCaptionLbl : TextConst ENU='Other Taxes Amount',ENN='Other Taxes Amount';
//         ServTaxeCessAmtCaptionLbl : TextConst ENU='Service Tax eCess Amount',ENN='Service Tax eCess Amount';
//         TCSAmountCaptionLbl : TextConst ENU='TCS Amount',ENN='TCS Amount';
//         SvcTaxAmtAppliedCaptionLbl : TextConst ENU='Svc Tax Amt (Applied)',ENN='Svc Tax Amt (Applied)';
//         SvcTaxeCessAmtAppliedCaptionLbl : TextConst ENU='Svc Tax eCess Amt (Applied)',ENN='Svc Tax eCess Amt (Applied)';
//         ServTaxSHECessAmtCaptionLbl : TextConst ENU='Service Tax SHE Cess Amount',ENN='Service Tax SHE Cess Amount';
//         SvcTaxSHECessAmtAppliedCaptionLbl : TextConst ENU='Svc Tax SHECess Amt(Applied)',ENN='Svc Tax SHECess Amt(Applied)';
//         PaymentDiscVATCaptionLbl : TextConst ENU='Payment Discount on VAT',ENN='Payment Discount on VAT';
//         ShipmentCaptionLbl : TextConst ENU='Shipment',ENN='Shipment';
//         LineDimensionsCaptionLbl : TextConst ENU='Line Dimensions',ENN='Line Dimensions';
//         VATAmountSpecificationCaptionLbl : TextConst ENU='VAT Amount Specification',ENN='VAT Amount Specification';
//         InvDiscBaseAmtCaptionLbl : TextConst ENU='Invoice Discount Base Amount',ENN='Invoice Discount Base Amount';
//         LineAmountCaptionLbl : TextConst ENU='Line Amount',ENN='Line Amount';
//         ShipToAddressCaptionLbl : TextConst ENU='Ship-to Address',ENN='Ship-to Address';
//         ServiceTaxRegistrationNo : Code[20];
//         ServiceTaxRegistrationNoLbl : TextConst ENU='Service Tax Registration No.',ENN='Service Tax Registration No.';
//         InvDiscountAmountCaptionLbl : TextConst ENU='Invoice Discount Amount',ENN='Invoice Discount Amount';
//         VATPercentageCaptionLbl : TextConst ENU='VAT %',ENN='VAT %';
//         VATAmountCaptionLbl : TextConst ENU='VAT Amount',ENN='VAT Amount';
//         VATIdentifierCaptionLbl : TextConst ENU='VAT Identifier',ENN='VAT Identifier';
//         TotalCaptionLbl : TextConst ENU='Total',ENN='Total';
//         VATBaseCaptionLbl : TextConst ENU='VAT Base',ENN='VAT Base';
//         PaymentTermsCaptionLbl : TextConst ENU='Payment Terms',ENN='Payment Terms';
//         ShipmentMethodCaptionLbl : TextConst ENU='Shipment Method',ENN='Shipment Method';
//         EMailCaptionLbl : TextConst ENU='E-Mail',ENN='E-Mail';
//         DocumentDateCaptionLbl : TextConst ENU='Document Date',ENN='Document Date';
//         DisplayAdditionalFeeNote : Boolean;
//         ServTaxSBCAmtCaptionLbl : TextConst ENU='SBC Amount',ENN='SBC Amount';
//         SvcTaxSBCAmtAppliedCaptionLbl : TextConst ENU='SBC Amt (Applied)',ENN='SBC Amt (Applied)';
//         ServiceTaxSBCAmount : Decimal;
//         ServiceTaxSBCAmt : Decimal;
//         AppliedServiceTaxSBCAmt : Decimal;
//         KKCessAmount : Decimal;
//         KKCessAmt : Decimal;
//         AppliedKKCessAmt : Decimal;
//         KKCessAmtCaptionLbl : TextConst ENU='KKC Amount',ENN='KKC Amount';
//         KKCessAmtAppliedCaptionLbl : TextConst ENU='KKC Amt (Applied)',ENN='KKC Amt (Applied)';
//         IsGSTApplicable : Boolean;
//         J : Integer;
//         CompanyRegistrationLbl : TextConst ENU='Company Registration No.',ENN='Company Registration No.';
//         CustomerRegistrationLbl : TextConst ENU='Customer GST Reg No.',ENN='Customer GST Reg No.';
//         CompanyInformation : Record "Company Information";
//         BillToCust : Record Customer;
//         ShipToPost : Record "Ship-to Address";
//         BillToState : Record State;
//         ShipToState : Record State;
//         ShipToAddress : array [10] of Text[100];
//         LocationAdd : Record Location;
//         recDetailedGSTLedger : Record "Detailed GST Entry Buffer";
//         totCGSTAmt : Decimal;
//         totSGSTAmt : Decimal;
//         totIGSTAmt : Decimal;
//         IGSTAmt : Decimal;
//         CGSTAmt : Decimal;
//         SGSTAmt : Decimal;
//         IGSTPer : Decimal;
//         CGSTPer : Decimal;
//         SGSTPer : Decimal;
//         GSTBaseAmt : Decimal;
//         AmttoCustomer : Decimal;
//         RCheck : Report 1401;
//                      AmtWords : array [2] of Text[80];
//                      salescount : Integer;
//                      AmtWordsCGS : array [2] of Text[80];
//                      AmtWordsSGS : array [2] of Text[80];
//                      AmtWordsIGS : array [2] of Text[80];
//                      ItemLedgerEntry : Record "Item Ledger Entry";
//                      SalesShipmentLine : Record "Sales Shipment Line";
//                      LotNO : Code[20];
//                      AmtWordsgstbase : array [2] of Text[80];
//                      Stateee : Record State;
//                      ItenUOM : Record Item;
//                      decCurrencyFactor : Decimal;
//                      intTtlLineNo : Integer;
//                      ItemPCPL : Record Item;
//                      InspectionDataSheet : Record 50011;
//                      upusd : Decimal;
//                      PackingList : Record "33001046";
//                      PackingListPackage : Record "33001048";
//                      Country : Record "Country/Region";
//                      PaymentMethodCode : Record "Payment Method";
//                      GrossWT : Decimal;
//                      NetWT : Decimal;
//                      BankAccount : Code[20];
//                      portofDisc : Text;
//                      terrifNo : Record "Tariff Number";
//                      ShipCountryName : Text[80];
//                      Shiptoadd : Record "Ship-to Address";
//                      CountryRegion : Record "Country/Region";
//                      TotalChargesAmount : Decimal;
//                      WordChargesAmount : array [2] of Text;
//                      NewPort : Record "33001050";
//                      SalesLine : Record "Sales Line";
//                      LineAmtusd : Decimal;
//                      LineAmtUSDWord : array [3] of Text;
//                      TotalLineAmt : Decimal;
//                      CommPay : Text[250];
//                      StructureLineDetails12 : Record "Structure Order Line Details";
//                      EInvoiceDetail : Record 50041;
//                      IRNNO : Text[64];
//                      SalesInvoiceHeader : Record "Sales Invoice Header";

//     procedure InitLogInteraction();
//     begin
//         LogInteraction := SegManagement.FindInteractTmplCode(4) <> '';
//     end;
// }

