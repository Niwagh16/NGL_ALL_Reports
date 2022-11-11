report 50000 "ExporInvoice-PostShipment"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\ExporInvoice-PostShipment.rdl';
    CaptionML = ENU = 'Sales - Invoice',
                ENN = 'Sales - Invoice';
    Permissions = TableData 7190 = rimd;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            //CalcFields = "Amount to Customer";
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeadingML = ENU = 'Posted Sales Invoice',
                                     ENN = 'Posted Sales Invoice';
            column(CurrencyCode; "Sales Invoice Header"."Currency Code")
            {
            }
            column(MfgFate12old; MfgFate12)
            {
            }
            column(ExpDate12old; ExpDate12)
            {
            }
            column(Comm1; Comments[1])
            {
            }
            column(Comm2; Comments[2])
            {
            }
            column(Comm3; Comments[3])
            {
            }
            column(Comm4; Comments[4])
            {
            }
            column(Comm5; Comments[5])
            {
            }
            column(NET; TotalNet)
            {
            }
            column(GROSS; TotalGross)
            {
            }
            column(bankname; BankAccount.Name + ': ' + BankAccount.Address + ' ' + BankAccount."Address 2" + BankAccount.City + '-' + BankAccount."Post Code" + ' ' + BankAccount."Country/Region Code" + ' ' + 'A/c No.' + BankAccount."Bank Account No." + ', ' + 'Swift Code:' + BankAccount."SWIFT Code")
            {
            }
            column(bankaccountno; 'Account No :-' + FORMAT(BankAccount."Bank Account No."))
            {
            }
            column(bankadd; BankAccount."correspondence Bank")
            {
            }
            column(bankaddfrocurrency; bankadd)
            {
            }
            column(swiftcode; 'SWIFT Code: ' + FORMAT(BankAccount."SWIFT Code"))
            {
            }
            column(BillOfLadingNoNDate; '')// PostedExportTerms."Bill of Lading No." + ' ' + FORMAT(PostedExportTerms."Bill of Lading Date")) //PCPL/MIG/01Aug22
            {
            }
            column(ShippingBIllNo; '')//PostedExportTerms."Bill of Exchange No." + '  ' + FORMAT(PostedExportTerms."Bill of Exchange Date")) //PCPL/MIG/01Aug22
            {
            }
            column(Packspec; NoOfPack)
            {
            }
            column(NAMECOUNTRY; Country.Name)
            {
            }
            column(TermsOfDelivery; 'INCOTERMS :' + ' ' + "Sales Invoice Header".Incoterms)
            {
            }
            column(Incoterms_SalesInvoiceHeader; "Sales Invoice Header".Incoterms)
            {
            }
            column(APYMETN; FORMAT(PaymentMethodCode.Description))
            {
            }
            column(ShipmentMethodCode_SalesInvoiceHeader; "Sales Invoice Header"."Shipment Method Code")
            {
            }
            column(ShipCountryName; ShipCountryName)
            {
            }
            column(CountryRegion_Name; CountryRegion.Name)
            {
            }
            column(ElectronicReferenceNo_SalesInvoiceHeader; "Sales Invoice Header"."Electronic Reference No.")
            {
            }
            column(Corresp; Corresp)
            {
            }
            column(Corresp1; Corresp1)
            {
            }
            column(Port; '')// Port) //PCPL/MIG/01Aug22
            {
            }
            column(PortName; '')//portrec1."Port Name") //PCPL/MIG/01Aug22
            {
            }
            column(PortDischarge; '')//portrec."Port Name") //PCPL/MIG/01Aug22
            {
            }
            column(Name; PackMark)
            {
            }
            column(MarkName; '')//PackingList.Marks) Packing List Header
            {
            }
            column(weightUOM; '')// PackingListPackage."Weight UOM") Packing List Header
            {
            }
            column(vesselflightno; '')//"Sales Invoice Header"."Vessel/Flight No.")  //PCPL/MIG/01Aug22
            {
            }
            column(finaldestination; '')//"Sales Invoice Header"."Final Destination") //PCPL/MIG/01Aug22
            {
            }
            column(Countryoforiginofgoods; '')// "Sales Invoice Header"."Country of Origin of Goods") //PCPL/MIG/01Aug22
            {
            }
            column(Countryofffinaldestination; '')//"Sales Invoice Header"."Country of Final Destination") //PCPL/MIG/01Aug22
            {
            }
            column(DrugLicno; LocationAdd."Drug license No.")
            {
            }
            column(IECCodeno; CompanyInfo."IEC CODE No.")
            {
            }
            column(PANNo; CompanyInfo."P.A.N. No.")
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(ENDUSe; CompanyInfo."END Use Code")
            {
            }
            column(Name_CompanyInfo; CompanyInfo.Name)
            {
            }
            column(Address_com; CompanyInfo.Address + '' + CompanyInfo."Address 2")
            {
            }
            column(City_CompanyInfo; CompanyInfo.City + ' ' + CompanyInfo."Post Code" + ' ' + CompanyInfo."Fax No." + ' ,' + CompanyInfo."Country/Region Code")
            {
            }
            column(Cinmail; ''/*CompanyInfo."Company Registration  No." */+ ', E-mail : ' + CompanyInfo."E-Mail" + ', Tel: ' + CompanyInfo."Phone No.") //PCPL/MIG/01Aug22
            {
            }
            column(ShiptoCity_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to City")
            {
            }
            column(No_SalesInvHdr; "No.")
            {
            }
            column(No_SalesInvoiceHeader; "Sales Invoice Header"."No.")
            {
            }
            column(PostingDate_SalesInvoiceHeader; "Sales Invoice Header"."Posting Date")
            {
            }
            column(TransportMethod_SalesInvoiceHeader; "Sales Invoice Header"."Shipment Method Code")
            {
            }
            column(VehicleNo_SalesInvoiceHeader; "Sales Invoice Header"."Vehicle No.")
            {
            }
            column(External_Doc_No; "Sales Invoice Header"."External Document No.")
            {
            }
            column(PONoNDate; "Sales Invoice Header"."Buyer Reference No.1")
            {
            }
            column(DateNtimeofRemoval; FORMAT("Sales Invoice Header"."Date Sent") + ' ' + FORMAT("Sales Invoice Header"."Time of Removal"))
            {
            }
            column(GSTIN; CompanyInfo."GST Registration No.")
            {
            }
            column(IGSTPer; 'IGST @' + FORMAT(IGSTPer) + ' %')
            {
            }
            column(SGSPer; 'SGST @' + FORMAT(SGSTPer) + ' %')
            {
            }
            column(CGSTPer; 'CGST @' + FORMAT(CGSTPer) + ' %')
            {
            }
            column(InvDiscountAmountCaption; InvDiscountAmountCaptionLbl)
            {
            }
            column(VATPercentageCaption; VATPercentageCaptionLbl)
            {
            }
            column(VATAmountCaption; VATAmountCaptionLbl)
            {
            }
            column(VATIdentifierCaption; VATIdentifierCaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(VATBaseCaption; VATBaseCaptionLbl)
            {
            }
            column(PaymentTermsCaption; PaymentTermsCaptionLbl)
            {
            }
            column(LUTNO; '')//"Sales Invoice Header"."Form No.") //PCPL/MIG/01Aug22
            {
            }
            column(ShipmentMethodCaption; ShipmentMethodCaptionLbl)
            {
            }
            column(EMailCaption; EMailCaptionLbl)
            {
            }
            column(DocumentDateCaption; DocumentDateCaptionLbl)
            {
            }
            column(DisplayAdditionalFeeNote; DisplayAdditionalFeeNote)
            {
            }
            column(BillToName; BillToCust.Name)
            {
            }
            column(BillToName2; BillToCust."Name 2")
            {
            }
            column(BillToAddress; BillToCust.Address)
            {
            }
            column(BillToAddress2; BillToCust."Address 2")
            {
            }
            column(BillToCity; BillToCust.City)
            {
            }
            column(BillToStateCoder; BillToCust."State Code")
            {
            }
            column(BillToStateName; BillToState.Description)
            {
            }
            column(BillToPostCodse; BillToCust."Post Code")
            {
            }
            column(BillToGSTIN; BillToCust."GST Registration No.")
            {
            }
            column(LocToAddress; LocationAdd.Address + ' ' + LocationAdd."Address 2" + ' ' + LocationAdd.City + ' ' + Stateee.Description + ', Tel: ' + LocationAdd."Phone No.")
            {
            }
            column(ShipToName; ShipToAddress[1])
            {
            }
            column(ShipToAdds; ShipToAddress[2])
            {
            }
            column(ShipToAdds2; ShipToAddress[3])
            {
            }
            column(ShipToCity; ShipToAddress[4])
            {
            }
            column(ShipToPostCode; ShipToAddress[5])
            {
            }
            column(ShipToState; ShipToAddress[6])
            {
            }
            column(ShipToStateName; ShipToAddress[8])
            {
            }
            column(ShipToName2; ShipToAddress[9])
            {
            }
            column(ShipToGSTIN; ShipToAddress[7])
            {
            }
            column(Grosswt; TotalGross)
            {
            }
            column(Netwt; TotalNet)
            {
            }
            dataitem(CopyLoop; integer)
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfo3Picture; CompanyInfo3.Picture)
                    {
                    }
                    column(DocumentCaptionCopyText; STRSUBSTNO(DocumentCaption, CopyText))
                    {
                    }
                    column(CompanyRegistrationLbl; CompanyRegistrationLbl)
                    {
                    }
                    column(CompanyInfo_GST_RegistrationNo; CompanyInfo."GST Registration No.")
                    {
                    }
                    column(CustomerRegistrationLbl; CustomerRegistrationLbl)
                    {
                    }
                    column(Customer_GST_RegistrationNo; Customer."GST Registration No.")
                    {
                    }
                    column(GSTComponentCode1; GSTComponentCode[1] + ' Amount')
                    {
                    }
                    column(GSTComponentCode2; GSTComponentCode[2] + ' Amount')
                    {
                    }
                    column(GSTComponentCode3; GSTComponentCode[3] + ' Amount')
                    {
                    }
                    column(GSTComponentCode4; GSTComponentCode[4] + 'Amount')
                    {
                    }
                    column(GSTCompAmount1; ABS(GSTCompAmount[1]))
                    {
                    }
                    column(GSTCompAmount2; ABS(GSTCompAmount[2]))
                    {
                    }
                    column(GSTCompAmount3; ABS(GSTCompAmount[3]))
                    {
                    }
                    column(GSTCompAmount4; ABS(GSTCompAmount[4]))
                    {
                    }
                    column(IsGSTApplicable; IsGSTApplicable)
                    {
                    }
                    column(CustAddr1; CustAddr[1])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(CustAddr2; CustAddr[2])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(CustAddr3; CustAddr[3])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(CustAddr4; CustAddr[4])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(CustAddr5; CustAddr[5])
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(CustAddr6; CustAddr[6])
                    {
                    }
                    column(PaymentTermsDescription; PaymentTerms.Description)
                    {
                    }
                    column(ShipmentMethodDescription; ShipmentMethod.Description)
                    {
                    }
                    column(CompanyInfoHomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(CompanyInfoEMail; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(BillToCustNo_SalesInvHdr; "Sales Invoice Header"."Bill-to Customer No.")
                    {
                    }
                    column(PostingDate_SalesInvHdr; FORMAT("Sales Invoice Header"."Posting Date", 0, 4))
                    {
                    }
                    column(VATNoText; VATNoText)
                    {
                    }
                    column(VATRegNo_SalesInvHdr; "Sales Invoice Header"."VAT Registration No.")
                    {
                    }
                    column(DueDate_SalesInvoiceHdr; FORMAT("Sales Invoice Header"."Due Date", 0, 4))
                    {
                    }
                    column(SalesPersonText; SalesPersonText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(YourReference_SalesInvHdr; "Sales Invoice Header"."Your Reference")
                    {
                    }
                    column(OrderNoText; OrderNoText)
                    {
                    }
                    column(OrderNo_SalesInvoiceHdr; "Sales Invoice Header"."Order No.")
                    {
                    }
                    column(CustAddr7; CustAddr[7])
                    {
                    }
                    column(CustAddr8; CustAddr[8])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(DocDate_SalesInvHeader; FORMAT("Sales Invoice Header"."Document Date", 0, 4))
                    {
                    }
                    column(PricesInclVAT_SalesInvHdr; "Sales Invoice Header"."Prices Including VAT")
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PricesInclVATYesNo; FORMAT("Sales Invoice Header"."Prices Including VAT"))
                    {
                    }
                    column(PageCaption; PageCaptionCap)
                    {
                    }
                    column(PLAEntryNo_SalesInvHdr; '')//"Sales Invoice Header"."PLA Entry No.") //PCPL/MIG/01Aug22
                    {
                    }
                    column(SupplementaryText; SupplementaryText)
                    {
                    }
                    column(RG23AEntryNo_SalesInvHdr; '')// "Sales Invoice Header"."RG 23 A Entry No.") //PCPL/MIG/01Aug22
                    {
                    }
                    column(RG23CEntryNo_SalesInvHdr; '')//"Sales Invoice Header"."RG 23 C Entry No.") //PCPL/MIG/01Aug22
                    {
                    }
                    column(PhoneNoCaption; PhoneNoCaptionLbl)
                    {
                    }
                    column(HomePageCaption; HomePageCaptionCap)
                    {
                    }
                    column(VATRegNoCaption; VATRegNoCaptionLbl)
                    {
                    }
                    column(GiroNoCaption; GiroNoCaptionLbl)
                    {
                    }
                    column(BankNameCaption; BankNameCaptionLbl)
                    {
                    }
                    column(BankAccNoCaption; BankAccNoCaptionLbl)
                    {
                    }
                    column(DueDateCaption; DueDateCaptionLbl)
                    {
                    }
                    column(InvoiceNoCaption; InvoiceNoCaptionLbl)
                    {
                    }
                    column(PostingDateCaption; PostingDateCaptionLbl)
                    {
                    }
                    column(PLAEntryNoCaption; PLAEntryNoCaptionLbl)
                    {
                    }
                    column(RG23AEntryNoCaption; RG23AEntryNoCaptionLbl)
                    {
                    }
                    column(RG23CEntryNoCaption; RG23CEntryNoCaptionLbl)
                    {
                    }
                    column(ServiceTaxRegistrationNoCaption; ServiceTaxRegistrationNoLbl)
                    {
                    }
                    column(ServiceTaxRegistrationNo; ServiceTaxRegistrationNo)
                    {
                    }
                    column(BillToCustNo_SalesInvHdrCaption; "Sales Invoice Header".FIELDCAPTION("Bill-to Customer No."))
                    {
                    }
                    column(PricesInclVAT_SalesInvHdrCaption; "Sales Invoice Header".FIELDCAPTION("Prices Including VAT"))
                    {
                    }
                    dataitem("Sales Invoice Line"; "Sales Invoice Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemTableView = SORTING("Document No.", "Line No.") WHERE(Quantity = FILTER(<> 0));
                        column(ExtenstedText; ExtenstedText)
                        {
                        }
                        column(TARRIFNO; terrifNo.Description + '(GST AVAILED)')
                        {
                        }
                        column(TotalChargesAmount; TotalChargesAmount)
                        {
                        }
                        column(Lineno; "Sales Invoice Line"."Line No.")
                        {
                        }
                        column(WordChargesAmount; WordChargesAmount[1])
                        {
                        }
                        column(AmtWords; AmtWords[1])
                        {
                        }
                        column(AmtWordsCGS; 'CGST Amount in Words :' + AmtWordsCGS[1])
                        {
                        }
                        column(AmtWordsSGS; 'SGST Amount in Words :' + AmtWordsSGS[1])
                        {
                        }
                        column(AmtWordsIGS; 'IGST Amount in Words :' + AmtWordsIGS[1])
                        {
                        }
                        column(AmtwordsGSTbase; AmtWordsgstbase[1])
                        {
                        }
                        column(HSNSACCode_SalesInvoiceLine; "Sales Invoice Line"."HSN/SAC Code")
                        {
                        }
                        column(pack; '')//"Sales Invoice Line"."Packing Details") //PCPL/MIG/01Aug22
                        {
                        }
                        column(LineAmount_SalesInvLine; ROUND("Line Amount" * decCurrencyFactor, 0.01))
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(LineAmountUSD; ("Line Amount"))
                        {
                        }
                        column(Desc_SalesInvLine; Description + ' ' + "Description 2")
                        {
                        }
                        column(TotalGSTAmount_SalesInvoiceLine; 0)//ROUND("Sales Invoice Line"."Total GST Amount" * decCurrencyFactor, 0.01)) //PCPL/MIG/01Aug22
                        {
                        }
                        column(No_SalesInvLine; "No.")
                        {
                        }
                        column(Qty_SalesInvLine; Quantity)
                        {
                        }
                        column(UOM_SalesInvoiceLine; "Unit of Measure")
                        {
                        }
                        column(UnitPrice_SalesInvLine; ROUND("Unit Price" * decCurrencyFactor, 0.01))
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(UnitPriceUSD; ("Unit Price"))
                        {
                        }
                        column(LineDiscount_SalesInvLine; "Line Discount %")
                        {
                        }
                        column(LineDiscount_SalesInvLineAmount; ROUND("Line Discount Amount" * decCurrencyFactor, 0.01))
                        {
                        }
                        column(PostedShipmentDate; FORMAT(PostedShipmentDate))
                        {
                        }
                        column(SalesLineType; FORMAT("Sales Invoice Line".Type))
                        {
                        }
                        column(DirectDebitPLARG_SalesInvLine; '')//"Direct Debit To PLA / RG") //PCPL/MIG/01Aug22
                        {
                        }
                        column(SourceDocNo_SalesInvLine; '')//"Source Document No.") //PCPL/MIG/01Aug22
                        {
                        }
                        column(Supplementary; '')//Supplementary)  //PCPL/MIG/01Aug22
                        {
                        }
                        column(InvDiscountAmount; ROUND(-"Inv. Discount Amount" * decCurrencyFactor, 0.01))
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(TotalSubTotal; TotalSubTotal)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInvoiceDiscAmount; TotalInvoiceDiscountAmount)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalText; TotalText)
                        {
                        }
                        column(SalesInvoiceLineAmount; ROUND(Amount * decCurrencyFactor, 0.01))
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(TotalAmount; TotalAmount)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AmtInclVAT_SalesInvLine; 0)//ROUND("Amount To Customer" * decCurrencyFactor, 0.01)) //PCPL/MIG/01Aug22
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(TotalInclVATText; TotalInclVATText)
                        {
                        }
                        column(TotalAmountInclVAT; TotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TaxAmount_SalesInvLine; 0)//"Tax Amount") //PCPL/MIG/01Aug22
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(ServiceTaxAmt; ServiceTaxAmt)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(ChargesAmount; ChargesAmount)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(OtherTaxesAmount; OtherTaxesAmount)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(ServiceTaxECessAmt; ServiceTaxECessAmt)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(SalesInvLineTotalTDSTCSInclSHECESS; TotalTCSAmount)
                        {
                        }
                        column(AppliedServiceTaxAmt; AppliedServiceTaxAmt)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(AppliedServiceTaxECessAmt; AppliedServiceTaxECessAmt)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(ServiceTaxSHECessAmt; ServiceTaxSHECessAmt)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(AppliedServTaxSHECessAmt; AppliedServiceTaxSHECessAmt)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(TotalTaxAmt; TotalTaxAmt)
                        {
                        }
                        column(TotalExciseAmt; TotalExciseAmt)
                        {
                        }
                        column(VATBaseDisc_SalesInvHdr; "Sales Invoice Header"."VAT Base Discount %")
                        {
                            AutoFormatType = 1;
                        }
                        column(TotalPaymentDiscountOnVAT; TotalPaymentDiscountOnVAT)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmtText; VATAmountLine.VATAmountText)
                        {
                        }
                        column(TotalExclVATText; TotalExclVATText)
                        {
                        }
                        column(TotalAmountVAT; TotalAmountVAT)
                        {
                        }
                        column(LineNo_SalesInvLine; "Line No.")
                        {
                        }
                        column(UnitPriceCaption; UnitPriceCaptionLbl)
                        {
                        }
                        column(DiscountCaption; DiscountCaptionLbl)
                        {
                        }
                        column(AmountCaption; AmountCaptionLbl)
                        {
                        }
                        column(LineDiscountCaption; LineDiscountCaptionLbl)
                        {
                        }
                        column(PostedShipmentDateCaption; PostedShipmentDateCaptionLbl)
                        {
                        }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        {
                        }
                        column(ExciseAmountCaption; ExciseAmountCaptionLbl)
                        {
                        }
                        column(TaxAmountCaption; TaxAmountCaptionLbl)
                        {
                        }
                        column(ServiceTaxAmountCaption; ServiceTaxAmountCaptionLbl)
                        {
                        }
                        column(ChargesAmountCaption; ChargesAmountCaptionLbl)
                        {
                        }
                        column(OtherTaxesAmountCaption; OtherTaxesAmountCaptionLbl)
                        {
                        }
                        column(ServTaxeCessAmtCaption; ServTaxeCessAmtCaptionLbl)
                        {
                        }
                        column(TCSAmountCaption; TCSAmountCaptionLbl)
                        {
                        }
                        column(SvcTaxAmtAppliedCaption; SvcTaxAmtAppliedCaptionLbl)
                        {
                        }
                        column(SvcTaxeCessAmtAppliedCaption; SvcTaxeCessAmtAppliedCaptionLbl)
                        {
                        }
                        column(ServTaxSHECessAmtCaption; ServTaxSHECessAmtCaptionLbl)
                        {
                        }
                        column(SvcTaxSHECessAmtAppliedCaption; SvcTaxSHECessAmtAppliedCaptionLbl)
                        {
                        }
                        column(PaymentDiscVATCaption; PaymentDiscVATCaptionLbl)
                        {
                        }
                        column(Description_SalesInvLineCaption; FIELDCAPTION(Description))
                        {
                        }
                        column(No_SalesInvoiceLineCaption; FIELDCAPTION("No."))
                        {
                        }
                        column(Quantity_SalesInvoiceLineCaption; FIELDCAPTION(Quantity))
                        {
                        }
                        column(UOM_SalesInvoiceLineCaption; FIELDCAPTION("Unit of Measure"))
                        {
                        }
                        column(DirectDebitPLARG_SalesInvLineCaption; '')//FIELDCAPTION("Direct Debit To PLA / RG")) //PCPL/MIG/01Aug22
                        {
                        }
                        column(ServiceTaxSBCAmt; ServiceTaxSBCAmt)
                        {
                        }
                        column(AppliedServiceTaxSBCAmt; AppliedServiceTaxSBCAmt)
                        {
                        }
                        column(ServTaxSBCAmtCaption; ServTaxSBCAmtCaptionLbl)
                        {
                        }
                        column(SvcTaxSBCAmtAppliedCaption; SvcTaxSBCAmtAppliedCaptionLbl)
                        {
                        }
                        column(KKCessAmt; KKCessAmt)
                        {
                        }
                        column(AppliedKKCessAmt; AppliedKKCessAmt)
                        {
                        }
                        column(KKCessAmtCaption; KKCessAmtCaptionLbl)
                        {
                        }
                        column(KKCessAmtAppliedCaption; KKCessAmtAppliedCaptionLbl)
                        {
                        }
                        column(totCGSTAmt; totCGSTAmt)
                        {
                        }
                        column(totSGSTAmt; totSGSTAmt)
                        {
                        }
                        column(totIGSTAmt; totIGSTAmt)
                        {
                        }
                        column(GSTBaseAmt; GSTBaseAmt)
                        {
                        }
                        column(AmttoCustomer; AmttoCustomer)
                        {
                        }
                        dataitem("Value Entry"; "Value Entry")
                        {
                            DataItemLink = "Document No." = FIELD("Document No."),
                                           "Document Line No." = FIELD("Line No.");
                            dataitem("Item Ledger Entry"; "Item Ledger Entry")
                            {
                                DataItemLink = "Entry No." = FIELD("Item Ledger Entry No.");
                                //DataItemTableView = '';
                                column(LotNO; "Item Ledger Entry"."Lot No.")
                                {
                                }
                                column(Qty; FORMAT("Item Ledger Entry".Quantity) + FORMAT(ItenUOM."Base Unit of Measure"))
                                {
                                }
                                column(MFGDATE; Today) //InspectionDataSheet."Mfg. Date") //PCPL-Deepak
                                {
                                }
                                column(ExpDate12; ExpDate12)
                                {
                                }
                                column(MfgFate12; MfgFate12)
                                {
                                }
                                column(EXPDATE; TODAY) //InspectionDataSheet."EXP Date") //PCPL-Deepak
                                {
                                }

                                trigger OnAfterGetRecord();
                                begin
                                    /* InspectionDataSheet.RESET;
                                     InspectionDataSheet.SETRANGE(InspectionDataSheet."Lot No.", "Item Ledger Entry"."Lot No.");
                                     IF InspectionDataSheet.FINDFIRST THEN;

                                     //PCPL-25
                                     PackingListPackage.RESET;
                                     PackingListPackage.SETRANGE(PackingListPackage."Lot Number", "Item Ledger Entry"."Lot No.");
                                     PackingListPackage.SETRANGE(PackingListPackage."Item No.", "Item Ledger Entry"."Item No.");
                                     IF PackingListPackage.FINDFIRST THEN BEGIN
                                         MfgFate12 := PackingListPackage."Manufacturing Date";
                                         ExpDate12 := PackingListPackage."Expiry Date";
                                     END;
                                     //PCP-25 */ //PCPL-Deepak
                                end;
                            }
                        }

                        trigger OnAfterGetRecord();
                        var
                        //StructureLineDetails: Record "13798";
                        begin
                            upusd := "Unit Price" / decCurrencyFactor;
                            PostedShipmentDate := 0D;
                            vTotalCount += 1;
                            CommInt := 0;
                            SalesCommentLine.RESET;
                            SalesCommentLine.SETRANGE(SalesCommentLine."No.", "Sales Invoice Line"."Document No.");
                            SalesCommentLine.SETRANGE(SalesCommentLine."Document Line No.", "Sales Invoice Line"."Line No.");
                            IF SalesCommentLine.FINDSET THEN
                                REPEAT
                                    CommInt := CommInt + 1;
                                    Comments[CommInt] := SalesCommentLine.Comment;
                                UNTIL SalesCommentLine.NEXT = 0;

                            IF Quantity <> 0 THEN
                                PostedShipmentDate := FindPostedShipmentDate;

                            IF (Type = Type::"G/L Account") AND (NOT ShowInternalInfo) THEN
                                "No." := '';

                            IF ItemPCPL.GET("Sales Invoice Line"."No.") THEN;
                            IF terrifNo.GET(ItemPCPL."Tariff No.") THEN;

                            VATAmountLine.INIT;
                            VATAmountLine."VAT Identifier" := "VAT Identifier";
                            VATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
                            VATAmountLine."Tax Group Code" := "Tax Group Code";
                            VATAmountLine."VAT %" := "VAT %";
                            VATAmountLine."VAT Base" := Amount;
                            VATAmountLine."Amount Including VAT" := "Amount Including VAT";
                            VATAmountLine."Line Amount" := "Line Amount";
                            IF "Allow Invoice Disc." THEN
                                VATAmountLine."Inv. Disc. Base Amount" := "Line Amount";
                            VATAmountLine."Invoice Discount Amount" := "Inv. Discount Amount";
                            VATAmountLine.InsertLine;

                            IF ItenUOM.GET("Sales Invoice Line"."No.") THEN; //PCPL
                                                                             // TotalTCSAmount += "Total TDS/TCS Incl. SHE CESS"; //PCPL-Deepak

                            TotalInvoiceDiscountAmount -= "Inv. Discount Amount";
                            TotalAmount += Amount;
                            TotalAmountVAT += "Amount Including VAT" - Amount;
                            // TotalAmountInclVAT += "Amount Including VAT";
                            TotalPaymentDiscountOnVAT += -("Line Amount" - "Inv. Discount Amount" - "Amount Including VAT");
                            /*  TotalAmountInclVAT += "Amount To Customer";
                              TotalExciseAmt += "Excise Amount";
                              TotalTaxAmt += "Tax Amount";
                              ServiceTaxAmount += "Service Tax Amount";
                              ServiceTaxeCessAmount += "Service Tax eCess Amount";
                              ServiceTaxSHECessAmount += "Service Tax SHE Cess Amount";
                              ServiceTaxSBCAmount += "Service Tax SBC Amount";
                              KKCessAmount += "KK Cess Amount";*/ //PCPL_Deepak

                            IF IsGSTApplicable AND (Type <> Type::" ") THEN BEGIN
                                J := 1;
                                /*   GSTComponent.RESET;
                                   GSTComponent.SETRANGE("GST Jurisdiction Type", "GST Jurisdiction Type");
                                   IF GSTComponent.FINDSET THEN
                                       REPEAT
                                           GSTComponentCode[J] := GSTComponent.Code;
                                           DetailedGSTLedgerEntry.RESET;
                                           DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type", "Document Type", "Document No.", "Document Line No.");
                                           DetailedGSTLedgerEntry.SETRANGE("Transaction Type", DetailedGSTLedgerEntry."Transaction Type"::Sales);
                                           DetailedGSTLedgerEntry.SETRANGE("Document No.", "Document No.");
                                           DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Line No.");
                                           DetailedGSTLedgerEntry.SETRANGE("GST Component Code", GSTComponentCode[J]);
                                           IF DetailedGSTLedgerEntry.FINDSET THEN BEGIN
                                               REPEAT
                                                   GSTCompAmount[J] += DetailedGSTLedgerEntry."GST Amount";
                                               UNTIL DetailedGSTLedgerEntry.NEXT = 0;
                                               J += 1;
                                           END;
                                       UNTIL GSTComponent.NEXT = 0; */ //PCPL-Deepak/Migration
                            END;

                            /*
                            StructureLineDetails.RESET;
                            StructureLineDetails.SETRANGE(Type,StructureLineDetails.Type::Sale);
                            StructureLineDetails.SETRANGE("Document Type",StructureLineDetails."Document Type"::Invoice);
                            StructureLineDetails.SETRANGE("Invoice No.","Document No.");
                            StructureLineDetails.SETRANGE("Item No.","No.");
                            StructureLineDetails.SETRANGE("Line No.","Line No.");
                            IF StructureLineDetails.FIND('-') THEN
                              REPEAT
                                IF NOT StructureLineDetails."Payable to Third Party" THEN BEGIN
                                  IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Charges THEN
                                    ChargesAmount := ChargesAmount + ABS(StructureLineDetails.Amount);
                                  IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::"Other Taxes" THEN
                                    OtherTaxesAmount := OtherTaxesAmount + ABS(StructureLineDetails.Amount);
                                END;
                              UNTIL StructureLineDetails.NEXT = 0;
                            */
                            //PCPL-25

                            /*StructureLineDetails12.RESET;
                            StructureLineDetails12.SETRANGE("Document No.", "Document No.");
                            StructureLineDetails12.SETRANGE("Item No.", "No.");
                            StructureLineDetails12.SETRANGE("Line No.", "Line No.");
                            StructureLineDetails12.SETRANGE(Type, StructureLineDetails12.Type::Sale);
                            StructureLineDetails12.SETRANGE("Document Type", StructureLineDetails12."Document Type"::Invoice);
                            IF StructureLineDetails12.FINDFIRST THEN
                                REPEAT
                                    IF NOT StructureLineDetails12."Payable to Third Party" THEN BEGIN
                                        IF StructureLineDetails12."Tax/Charge Type" = StructureLineDetails12."Tax/Charge Type"::Charges THEN
                                            ChargesAmount := ChargesAmount + ABS(StructureLineDetails12.Amount);
                                        IF StructureLineDetails12."Tax/Charge Type" = StructureLineDetails12."Tax/Charge Type"::"Other Taxes" THEN
                                            OtherTaxesAmount := OtherTaxesAmount + ABS(StructureLineDetails.Amount);
                                    END;
                                UNTIL StructureLineDetails12.NEXT = 0;*/
                            //PCPL-25

                            //TotalChargesAmount += ROUND(ChargesAmount * decCurrencyFactor,0.01);
                            TotalChargesAmount += ChargesAmount;
                            /* IF "Sales Invoice Header"."Transaction No. Serv. Tax" <> 0 THEN BEGIN
                                 ServiceTaxEntry.RESET;
                                 ServiceTaxEntry.SETRANGE(Type, ServiceTaxEntry.Type::Sale);
                                 ServiceTaxEntry.SETRANGE("Document Type", ServiceTaxEntry."Document Type"::Invoice);
                                 ServiceTaxEntry.SETRANGE("Document No.", "Document No.");
                                 IF ServiceTaxEntry.FINDFIRST THEN BEGIN

                                     IF "Sales Invoice Header"."Currency Code" <> '' THEN BEGIN
                                         ServiceTaxEntry."Service Tax Amount" :=
                                           ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
                                           "Sales Invoice Header"."Posting Date", "Sales Invoice Header"."Currency Code",
                                           ServiceTaxEntry."Service Tax Amount", "Sales Invoice Header"."Currency Factor"));
                                         ServiceTaxEntry."eCess Amount" :=
                                           ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
                                           "Sales Invoice Header"."Posting Date", "Sales Invoice Header"."Currency Code",
                                           ServiceTaxEntry."eCess Amount", "Sales Invoice Header"."Currency Factor"));
                                         ServiceTaxEntry."SHE Cess Amount" :=
                                           ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
                                           "Sales Invoice Header"."Posting Date", "Sales Invoice Header"."Currency Code",
                                           ServiceTaxEntry."SHE Cess Amount", "Sales Invoice Header"."Currency Factor"));
                                         ServiceTaxEntry."Service Tax SBC Amount" :=
                                           ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
                                           "Sales Invoice Header"."Posting Date", "Sales Invoice Header"."Currency Code",
                                           ServiceTaxEntry."Service Tax SBC Amount", "Sales Invoice Header"."Currency Factor"));
                                         ServiceTaxEntry."KK Cess Amount" :=
                                           ROUND(CurrExchRate.ExchangeAmtLCYToFCY(
                                           "Sales Invoice Header"."Posting Date", "Sales Invoice Header"."Currency Code",
                                           ServiceTaxEntry."KK Cess Amount", "Sales Invoice Header"."Currency Factor"));
                                     END;

                                     ServiceTaxAmt := ABS(ServiceTaxEntry."Service Tax Amount");
                                     ServiceTaxECessAmt := ABS(ServiceTaxEntry."eCess Amount");
                                     ServiceTaxSHECessAmt := ABS(ServiceTaxEntry."SHE Cess Amount");
                                     ServiceTaxSBCAmt := ABS(ServiceTaxEntry."Service Tax SBC Amount");
                                     KKCessAmt := ABS(ServiceTaxEntry."KK Cess Amount");
                                     AppliedServiceTaxAmt := ServiceTaxAmount - ABS(ServiceTaxEntry."Service Tax Amount");
                                     AppliedServiceTaxECessAmt := ServiceTaxeCessAmount - ABS(ServiceTaxEntry."eCess Amount");
                                     AppliedServiceTaxSHECessAmt := ServiceTaxSHECessAmount - ABS(ServiceTaxEntry."SHE Cess Amount");
                                     AppliedServiceTaxSBCAmt := ServiceTaxSBCAmount - ABS(ServiceTaxEntry."Service Tax SBC Amount");
                                     AppliedKKCessAmt := KKCessAmount - ABS(ServiceTaxEntry."KK Cess Amount");
                                 END ELSE BEGIN
                                     AppliedServiceTaxAmt := ServiceTaxAmount;
                                     AppliedServiceTaxECessAmt := ServiceTaxeCessAmount;
                                     AppliedServiceTaxSHECessAmt := ServiceTaxSHECessAmount;
                                     AppliedServiceTaxSBCAmt := ServiceTaxSBCAmount;
                                     AppliedKKCessAmt := KKCessAmount;
                                 END;
                             END ELSE BEGIN
                                 ServiceTaxAmt := ServiceTaxAmount;
                                 ServiceTaxECessAmt := ServiceTaxeCessAmount;
                                 ServiceTaxSHECessAmt := ServiceTaxSHECessAmount;
                                 ServiceTaxSBCAmt := ServiceTaxSBCAmount;
                                 KKCessAmt := KKCessAmount
                             END;*/
                            RCheck.InitTextVariable;
                            //RCheck.FormatNoText(AmtWords,ROUND(TotalSubTotal),"Sales Invoice Header"."Currency Code");    //Temp comment
                            RCheck.FormatNoText(AmtWords, ROUND(TotalSubTotal + ChargesAmount), "Sales Invoice Header"."Currency Code");  //PCPL-25


                            CGSTAmt := 0;
                            SGSTAmt := 0;
                            IGSTAmt := 0;
                            CGSTPer := 0;
                            SGSTPer := 0;
                            IGSTPer := 0;
                            recDetailedGSTLedger.RESET;
                            recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Transaction Type", recDetailedGSTLedger."Transaction Type"::Sales);
                            recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Document Type", recDetailedGSTLedger."Document Type"::Invoice);
                            recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Document No.", "Document No.");
                            recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Document Line No.", "Line No.");
                            recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."GST Component Code", 'CGST');
                            IF recDetailedGSTLedger.FINDSET THEN BEGIN
                                REPEAT
                                    CGSTAmt += ABS(recDetailedGSTLedger."GST Amount");
                                    CGSTPer := recDetailedGSTLedger."GST %";
                                    totCGSTAmt += ABS(recDetailedGSTLedger."GST Amount");
                                UNTIL recDetailedGSTLedger.NEXT = 0;
                            END;

                            recDetailedGSTLedger.RESET;
                            recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Transaction Type", recDetailedGSTLedger."Transaction Type"::Sales);
                            recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Document Type", recDetailedGSTLedger."Document Type"::Invoice);
                            recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Document No.", "Document No.");
                            recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Document Line No.", "Line No.");
                            recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."GST Component Code", 'SGST');
                            IF recDetailedGSTLedger.FINDSET THEN
                                REPEAT
                                    SGSTAmt += ABS(recDetailedGSTLedger."GST Amount");
                                    SGSTPer := recDetailedGSTLedger."GST %";
                                    totSGSTAmt += ABS(recDetailedGSTLedger."GST Amount");
                                UNTIL recDetailedGSTLedger.NEXT = 0;

                            totIGSTAmt := 0;
                            IGSTAmt := 0;
                            IGSTPer := 0;

                            recDetailedGSTLedger.RESET;
                            recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Transaction Type", recDetailedGSTLedger."Transaction Type"::Sales);
                            recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Document Type", recDetailedGSTLedger."Document Type"::Invoice);
                            recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Document No.", "Document No.");
                            //YSR recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."Document Line No.","Line No.");
                            recDetailedGSTLedger.SETRANGE(recDetailedGSTLedger."GST Component Code", 'IGST');
                            IF recDetailedGSTLedger.FINDSET THEN
                                REPEAT
                                    IGSTAmt += ABS(recDetailedGSTLedger."GST Amount");
                                    IGSTPer := recDetailedGSTLedger."GST %";
                                    totIGSTAmt += ABS(recDetailedGSTLedger."GST Amount");
                                UNTIL recDetailedGSTLedger.NEXT = 0;
                            //YSR GSTBaseAmt :="GST Base Amount";
                            //YSR AmttoCustomer := "Amount To Customer";

                            RCheck.InitTextVariable;
                            RCheck.FormatNoText(AmtWordsgstbase, GSTBaseAmt, '');
                            RCheck.InitTextVariable;
                            RCheck.FormatNoText(AmtWordsCGS, CGSTAmt, '');
                            RCheck.InitTextVariable;
                            RCheck.FormatNoText(AmtWordsSGS, SGSTAmt, '');
                            RCheck.InitTextVariable;
                            RCheck.FormatNoText(AmtWordsIGS, IGSTAmt, '');
                            RCheck.InitTextVariable;
                            RCheck.FormatNoText(WordChargesAmount, TotalChargesAmount, "Sales Invoice Header"."Currency Code");

                            //
                            intTtlLineNo := intTtlLineNo + 1;
                            IF intTtlLineNo = 10 THEN
                                intTtlLineNo := 0;
                            //pcpl0024 04 june 2019
                            IF ExtendedLinePrint = TRUE THEN BEGIN
                                CLEAR(ExtenstedText);
                                RecextendedLine.RESET;
                                RecextendedLine.SETRANGE(RecextendedLine."No.", "Sales Invoice Line"."No.");
                                IF RecextendedLine.FINDSET THEN BEGIN
                                    REPEAT
                                        ExtenstedText += RecextendedLine.Text + ' ';
                                    UNTIL RecextendedLine.NEXT = 0;
                                END;
                            END;
                            //pcpl0024 04 june 2019

                        end;

                        trigger OnPreDataItem();
                        begin
                            VATAmountLine.DELETEALL;
                            SalesShipmentBuffer.RESET;
                            SalesShipmentBuffer.DELETEALL;
                            FirstValueEntryNo := 0;
                            MoreLines := FIND('+');
                            WHILE MoreLines AND (Description = '') AND ("No." = '') AND (Quantity = 0) AND (Amount = 0) DO
                                MoreLines := NEXT(-1) <> 0;
                            IF NOT MoreLines THEN
                                CurrReport.BREAK;
                            SETRANGE("Line No.", 0, "Line No.");
                            /*CurrReport.CREATETOTALS("Line Amount", Amount, "Amount Including VAT", "Inv. Discount Amount", "Excise Amount", "Tax Amount",
                              "Service Tax Amount", "Service Tax eCess Amount", "Amount To Customer", "Service Tax SBC Amount");
                            CurrReport.CREATETOTALS("KK Cess Amount");
                            CurrReport.CREATETOTALS("Service Tax SHE Cess Amount");*/ //PCPL-Deepak
                            salescount := "Sales Invoice Line".COUNT;
                            vTotalCount := 0;
                        end;
                    }
                    dataitem(Integer; Integer)
                    {
                        DataItemTableView = SORTING(Number)
                                            ORDER(Ascending);
                        column(Output; Number)
                        {
                        }

                        trigger OnPreDataItem();
                        begin
                            SETRANGE(Number, 1, 10 - vTotalCount);
                        end;
                    }
                }

                trigger OnAfterGetRecord();
                begin
                    IF Number > 1 THEN BEGIN
                        CopyText := Text003;
                        OutputNo += 1;
                    END;
                    CurrReport.PAGENO := 1;


                    TotalInvoiceDiscountAmount := 0;
                    TotalAmount := 0;
                    TotalAmountVAT := 0;
                    TotalAmountInclVAT := 0;
                    TotalPaymentDiscountOnVAT := 0;
                    TotalExciseAmt := 0;
                    TotalTaxAmt := 0;
                    ServiceTaxAmount := 0;
                    ServiceTaxeCessAmount := 0;
                    ServiceTaxSHECessAmount := 0;
                    ServiceTaxSBCAmount := 0;
                    KKCessAmount := 0;
                    //ysrAmttoCustomer :=0;
                    OtherTaxesAmount := 0;
                    ChargesAmount := 0;
                    AppliedServiceTaxSHECessAmt := 0;
                    AppliedServiceTaxECessAmt := 0;
                    AppliedServiceTaxAmt := 0;
                    AppliedServiceTaxSBCAmt := 0;
                    AppliedKKCessAmt := 0;
                    ServiceTaxSHECessAmt := 0;
                    ServiceTaxECessAmt := 0;
                    ServiceTaxAmt := 0;
                    ServiceTaxSBCAmt := 0;
                    KKCessAmt := 0;
                    TotalTCSAmount := 0;
                    //YSR GSTBaseAmt :=0;
                end;

                trigger OnPostDataItem();
                begin
                    IF NOT CurrReport.PREVIEW THEN //PCPL/NSW/MIG 09Aug22
                        SalesInvCountPrinted.RUN("Sales Invoice Header"); //PCPL/NSW/MIG 09Aug22
                end;

                trigger OnPreDataItem();
                begin
                    NoOfLoops := ABS(NoOfCopies) + 1;
                    IF NoOfLoops <= 0 THEN
                        NoOfLoops := 1;
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord();
            var
                SalesInvLine: Record "Sales Invoice Line";
                Location: Record Location;
            begin
                /*
                CommInt:=0;
                SalesCommentLine.RESET;
                SalesCommentLine.SETRANGE(SalesCommentLine."No.","Sales Invoice Header"."No.");
                IF SalesCommentLine.FINDSET THEN REPEAT
                  CommInt:= CommInt+1;
                  Comments[CommInt]:=SalesCommentLine.Comment;
                UNTIL SalesCommentLine.NEXT=0;
                  */
                //PCPL/BRB
                IF Shiptoadd.GET("Sales Invoice Header"."Ship-to Post Code", "Sales Invoice Header"."Ship-to City") THEN
                    IF CountryRegion.GET(Shiptoadd."Country/Region Code") THEN
                        ShipCountryName := CountryRegion.Name;
                IF ShipCountryName = '' THEN BEGIN
                    IF Ship_Address.GET("Sales Invoice Header"."Sell-to Customer No.", "Sales Invoice Header"."Ship-to Code") THEN
                        IF CountryRegion.GET(Ship_Address."Country/Region Code") THEN
                            ShipCountryName := CountryRegion.Name;
                END;

                //PCPL-0041-START-17012020
                IF "Sales Invoice Header"."Ship-to Code" = '' THEN BEGIN
                    IF CountryRegion.GET("Sales Invoice Header"."Ship-to Country/Region Code") THEN
                        ShipCountryName := CountryRegion.Name;
                END;
                //PCPL-0041-END-17012020

                IF Customer.GET("Bill-to Customer No.") THEN
                    IF CountryRegion.GET(Customer."Country/Region Code") THEN
                        // IF portrec.GET("Sales Invoice Header"."Port of Discharge") THEN; //PCPL-Deepak
                        //IF portrec1.GET("Sales Invoice Header".Port) THEN; PCPL-Deepak
                        //YSR BEGIN
                        AmttoCustomer := 0; // "Amount to Customer"; //PCPK-Deepak/Migration
                //IF Country.GET("Sales Invoice Header"."Country of Final Destination") THEN; //PCPL-Deepak
                IF PaymentMethodCode.GET("Sales Invoice Header"."Payment Method Code") THEN;

                IF "Currency Factor" <> 0 THEN
                    decCurrencyFactor := 1 / "Currency Factor"
                ELSE
                    decCurrencyFactor := 1;
                //YSR END
                /* PostedExportTerms.RESET;
                 PostedExportTerms.SETRANGE(PostedExportTerms."Invoice No.", "Sales Invoice Header"."No.");
                 IF PostedExportTerms.FINDFIRST THEN;

                 IF BankAccount.GET("Sales Invoice Header"."Bank Account") THEN;
                 //PCPL-25
                 CLEAR(bankadd);
                 IF "Sales Invoice Header"."Currency Code" = 'EURO' THEN
                     bankadd := BankAccount."Correspondence Bank For Euro"
                 ELSE
                     bankadd := BankAccount."correspondence Bank";*/ //PCPL-Deepak
                                                                     //PCPL-25


                SalesInvLine.RESET;
                SalesInvLine.SETRANGE("Document No.", "No.");
                SalesInvLine.SETFILTER(Quantity, '<>%1', 0);
                IF SalesInvLine.FINDSET THEN
                    REPEAT
                        TotalSubTotal += SalesInvLine."Line Amount";
                    UNTIL SalesInvLine.NEXT = 0;

                CompanyInfo.GET;
                CompanyInfo.CALCFIELDS(Picture);
                CurrReport.LANGUAGE := 1;// Language.GetLanguageID("Language Code"); PCPL/NSW/07 04Nov22
                //IsGSTApplicable := GSTManagement.IsGSTApplicable(Structure);
                Customer.GET("Bill-to Customer No.");
                IF RespCenter.GET("Responsibility Center") THEN BEGIN
                    FormatAddr.RespCenter(CompanyAddr, RespCenter); //PCPL/NSW/MIG 09Aug22
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                END ELSE
                    FormatAddr.Company(CompanyAddr, CompanyInfo); //PCPL/NSW/MIG 09Aug22
                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");
                //PCPl/BRB
                /*IF BankAccount."correspondence Bank" <> '' THEN BEGIN
                    Strpos_ := STRPOS(BankAccount."correspondence Bank", '2)');
                    Corresp := COPYSTR(BankAccount."correspondence Bank", Strpos_);
                    Corresp1 := COPYSTR(BankAccount."correspondence Bank", 1, Strpos_ - 1);
                END;*/ //PCPL-Deepak
                       //PCPL/BRB
                IF "Order No." = '' THEN
                    OrderNoText := ''
                ELSE
                    OrderNoText := FIELDCAPTION("Order No.");

                IF "Salesperson Code" = '' THEN BEGIN
                    SalesPurchPerson.INIT;
                    SalesPersonText := '';
                END ELSE BEGIN
                    SalesPurchPerson.GET("Salesperson Code");
                    SalesPersonText := Text000;
                END;
                IF "Your Reference" = '' THEN
                    ReferenceText := ''
                ELSE
                    ReferenceText := FIELDCAPTION("Your Reference");
                IF "VAT Registration No." = '' THEN
                    VATNoText := ''
                ELSE
                    VATNoText := FIELDCAPTION("VAT Registration No.");
                IF "Currency Code" = '' THEN BEGIN
                    GLSetup.TESTFIELD("LCY Code");
                    TotalText := STRSUBSTNO(Text001, GLSetup."LCY Code");
                    TotalInclVATText := STRSUBSTNO(Text13700, GLSetup."LCY Code");
                    TotalExclVATText := STRSUBSTNO(Text13701, GLSetup."LCY Code");
                END ELSE BEGIN
                    TotalText := STRSUBSTNO(Text001, "Currency Code");
                    TotalInclVATText := STRSUBSTNO(Text13700, "Currency Code");
                    TotalExclVATText := STRSUBSTNO(Text13701, "Currency Code");
                END;
                FormatAddr.SalesInvBillTo(CustAddr, "Sales Invoice Header"); //PCPL/NSW/MIG 09Aug22
                IF NOT Cust.GET("Bill-to Customer No.") THEN
                    CLEAR(Cust);

                IF "Payment Terms Code" = '' THEN
                    PaymentTerms.INIT
                ELSE BEGIN
                    PaymentTerms.GET("Payment Terms Code");
                    PaymentTerms.TranslateDescription(PaymentTerms, "Language Code");
                END;

                IF "Shipment Method Code" = '' THEN
                    ShipmentMethod.INIT
                ELSE BEGIN
                    ShipmentMethod.GET("Shipment Method Code");
                    ShipmentMethod.TranslateDescription(ShipmentMethod, "Language Code");
                END;
                //FormatAddr.SalesInvShipTo(ShipToAddr, "Sales Invoice Header");  //PCPL-Deepak
                ShowShippingAddr := "Sell-to Customer No." <> "Bill-to Customer No.";
                FOR i := 1 TO ARRAYLEN(ShipToAddr) DO
                    IF ShipToAddr[i] <> CustAddr[i] THEN
                        ShowShippingAddr := TRUE;

                GetLineFeeNoteOnReportHist("No.");
                IF LocationAdd.GET("Sales Invoice Header"."Location Code") THEN;
                IF Stateee.GET(LocationAdd."State Code") THEN;
                IF BillToCust.GET("Sales Invoice Header"."Bill-to Customer No.") THEN;
                IF BillToState.GET(BillToCust."State Code") THEN;

                ShipToPost.RESET;
                ShipToPost.SETRANGE(ShipToPost."Customer No.", "Sales Invoice Header"."Sell-to Customer No.");
                ShipToPost.SETRANGE(ShipToPost.Code, "Sales Invoice Header"."Ship-to Code");
                IF ShipToPost.FINDFIRST THEN BEGIN
                    IF ShipToState.GET(ShipToPost.State) THEN;
                    ShipToAddress[1] := ShipToPost.Name;
                    ShipToAddress[2] := ShipToPost.Address;
                    ShipToAddress[3] := ShipToPost."Address 2";
                    ShipToAddress[4] := ShipToPost.City;
                    ShipToAddress[5] := ShipToPost."Post Code";
                    ShipToAddress[6] := ShipToPost.State;
                    ShipToAddress[7] := ShipToPost."GST Registration No.";
                    ShipToAddress[8] := ShipToState.Description;
                    ShipToAddress[9] := ShipToPost."Name 2";   //PCPL-25
                END ELSE BEGIN
                    ShipToAddress[1] := BillToCust.Name;
                    ShipToAddress[2] := BillToCust.Address;
                    ShipToAddress[3] := BillToCust."Address 2";
                    ShipToAddress[4] := BillToCust.City;
                    ShipToAddress[5] := BillToCust."Post Code";
                    ShipToAddress[6] := BillToCust."State Code";
                    ShipToAddress[7] := BillToCust."GST Registration No.";
                    ShipToAddress[8] := BillToState.Description;
                    ShipToAddress[9] := BillToCust."Name 2";   //PCPL-25
                END;

                /*
                IF LogInteraction THEN
                  IF NOT CurrReport.PREVIEW THEN BEGIN
                    IF "Bill-to Contact No." <> '' THEN
                      SegManagement.LogDocument(
                        SegManagement.SalesInvoiceInterDocType,"No.",0,0,DATABASE::Contact,"Bill-to Contact No.","Salesperson Code",
                        "Campaign No.","Posting Description",'')
                    ELSE
                      SegManagement.LogDocument(
                        SegManagement.SalesInvoiceInterDocType,"No.",0,0,DATABASE::Customer,"Bill-to Customer No.","Salesperson Code",
                        "Campaign No.","Posting Description",'');
                  END;
                  */

                SupplementaryText := '';
                SalesInvLine.SETRANGE("Document No.", "No.");
                //SalesInvLine.SETRANGE(Supplementary, TRUE); //PCPL-Deepak
                IF SalesInvLine.FINDFIRST THEN
                    SupplementaryText := Text16500;

                /*IF Location.GET("Location Code") THEN
                    ServiceTaxRegistrationNo := Location."Service Tax Registration No."
                ELSE
                    ServiceTaxRegistrationNo := CompanyInfo."Service Tax Registration No."; */ //PCPL-Deepak


                SalesInvLine.SETRANGE("Document No.", "No.");
                IF SalesInvLine.FINDSET THEN
                    salescount := SalesInvLine.COUNT;

                SalesShipmentLine.RESET;
                SalesShipmentLine.SETRANGE(SalesShipmentLine."Order No.", "Order No.");
                IF SalesShipmentLine.FINDSET THEN BEGIN
                    ItemLedgerEntry.RESET;
                    ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Document No.", SalesShipmentLine."Document No.");
                    IF ItemLedgerEntry.FINDFIRST THEN
                        LotNO := ItemLedgerEntry."Lot No.";
                END;
                //YSR BEGIN
                GSTBaseAmt := 0;
                SalesInvLine.RESET;
                SalesInvLine.SETRANGE("Document No.", "No.");
                SalesInvLine.SETFILTER(Quantity, '<>%1', 0);
                IF SalesInvLine.FINDSET THEN
                    REPEAT
                        GSTBaseAmt += 0;//SalesInvLine."GST Base Amount"; //pcpl/deEpak/mig
                    UNTIL SalesInvLine.NEXT = 0;
                //YSR END

                //YSR BEGIN
                IF decCurrencyFactor <> 1 THEN
                    AmttoCustomer := ROUND(AmttoCustomer, 0.01)
                ELSE
                    AmttoCustomer := ROUND(AmttoCustomer * decCurrencyFactor, 0.01);
                GSTBaseAmt := ROUND(GSTBaseAmt * decCurrencyFactor, 0.01);
                //tIGSTAmt  :=  ROUND(IGSTAmt * decCurrencyFactor,0.01);
                //totIGSTAmt  :=  ROUND(totIGSTAmt * decCurrencyFactor,0.01);
                AmttoCustomer := AmttoCustomer + totIGSTAmt;
                intTtlLineNo := 0;
                //YSR END
                //PCPL

                /*PackingList.RESET;
                PackingList.SETRANGE("SO NO.", "Sales Invoice Header"."Order No.");
                IF PackingList.FINDLAST THEN BEGIN
                    PackMark := PackingList.Marks;
                    PackingListPackage.RESET;
                    PackingListPackage.SETRANGE(PackingListPackage."Packing List No.", PackingList."No.");
                    IF PackingListPackage.FINDSET THEN
                        REPEAT
                            TotalGross += (PackingListPackage."No. Of Packages" * PackingListPackage."Gross Wght. per Case");
                            TotalNet += (PackingListPackage."No. Of Packages" * PackingListPackage."Net Wght. per Case");
                        UNTIL PackingListPackage.NEXT = 0;
                END;*/ //PCPL-Deepak
                       /*
                       //PCPL-25
                       PackingList.RESET;
                       PackingList.SETRANGE(PackingList."SO NO.","Sales Invoice Header"."Order No.");
                       IF PackingList.FINDFIRST THEN BEGIN
                         PackingListPackage.RESET;
                         PackingListPackage.SETRANGE(PackingListPackage."Packing List No.",PackingList."No.");
                         IF PackingListPackage.FINDSET THEN BEGIN
                           MfgFate12 := PackingListPackage."Manufacturing Date";
                           ExpDate12 := PackingListPackage."Expiry Date";
                         END;
                       END;
                       //PCPL-25
                       */

            end;
            // end; //PCPL/NSW/MIG 09Aug22

            trigger OnPreDataItem();
            begin
                decCurrencyFactor := 1;//YSR
                AmttoCustomer := 0;     //ysr
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    CaptionML = ENU = 'Options',
                                ENN = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        CaptionML = ENU = 'No. of Copies',
                                    ENN = 'No. of Copies';
                        Visible = false;
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        CaptionML = ENU = 'Show Internal Information',
                                    ENN = 'Show Internal Information';
                        Visible = false;
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        CaptionML = ENU = 'Log Interaction',
                                    ENN = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        Visible = false;
                    }
                    field(DisplayAsmInformation; DisplayAssemblyInformation)
                    {
                        CaptionML = ENU = 'Show Assembly Components',
                                    ENN = 'Show Assembly Components';
                        Visible = false;
                    }
                    field(DisplayAdditionalFeeNote; DisplayAdditionalFeeNote)
                    {
                        CaptionML = ENU = 'Show Additional Fee Note',
                                    ENN = 'Show Additional Fee Note';
                        Visible = false;
                    }
                    field("Packing Specification"; NoOfPack)
                    {
                        Visible = false;
                    }
                    field("Net Weight"; NetWT)
                    {
                    }
                    field("Gross Weight"; GrossWT)
                    {
                    }
                    field(ExtendedLinePrint; ExtendedLinePrint)
                    {
                        Caption = 'Extended Line Print';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit();
        begin
            LogInteractionEnable := TRUE;
        end;

        trigger OnOpenPage();
        begin
            InitLogInteraction;
            LogInteractionEnable := LogInteraction;
            ExtendedLinePrint := FALSE;//pcpl0024
        end;
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
        GLSetup.GET;
        CompanyInfo.GET;
        SalesSetup.GET;
        CompanyInfo.VerifyAndSetPaymentInfo;
        CASE SalesSetup."Logo Position on Documents" OF
            SalesSetup."Logo Position on Documents"::Left:
                BEGIN
                    CompanyInfo3.GET;
                    CompanyInfo3.CALCFIELDS(Picture);
                END;
            SalesSetup."Logo Position on Documents"::Center:
                BEGIN
                    CompanyInfo1.GET;
                    CompanyInfo1.CALCFIELDS(Picture);
                END;
            SalesSetup."Logo Position on Documents"::Right:
                BEGIN
                    CompanyInfo2.GET;
                    CompanyInfo2.CALCFIELDS(Picture);
                END;
        END;
    end;

    trigger OnPreReport();
    begin
        IF NOT CurrReport.USEREQUESTPAGE THEN
            InitLogInteraction;
    end;

    var
        Text000: TextConst ENU = 'Salesperson', ENN = 'Salesperson';
        Text001: TextConst ENU = 'Total %1', ENN = 'Total %1';
        Text003: TextConst ENU = ' COPY', ENN = ' COPY';
        Text004: TextConst ENU = 'Sales - Invoice%1', ENN = 'Sales - Invoice%1';
        PageCaptionCap: TextConst ENU = 'Page %1 of %2', ENN = 'Page %1 of %2';
        GLSetup: Record "General Ledger Setup";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        //GSTComponent: Record "GST Component";
        Customer: Record Customer;
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        SalesSetup: Record "Sales & Receivables Setup";
        Cust: Record Customer;
        VATAmountLine: Record "VAT Amount Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        RespCenter: Record "Responsibility Center";
        Language: Record Language;
        CurrExchRate: Record "Currency Exchange Rate";
        TempPostedAsmLine: Record "Posted Assembly Line" temporary;
        //GSTManagement: Codeunit "16401;
        SalesInvCountPrinted: Codeunit "Sales Inv.-Printed";
        FormatAddr: Codeunit "Format Address";
        SegManagement: Codeunit 5051;
        SalesShipmentBuffer: Record "Sales Shipment Buffer" temporary;
        Ship_Address: Record "Ship-to Address";
        GSTCompAmount: array[20] of Decimal;
        GSTComponentCode: array[20] of Code[10];
        PostedShipmentDate: Date;
        CustAddr: array[8] of Text[80];
        ShipToAddr: array[8] of Text[80];
        CompanyAddr: array[8] of Text[80];
        OrderNoText: Text[80];
        SalesPersonText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        ShowShippingAddr: Boolean;
        i: Integer;
        NextEntryNo: Integer;
        FirstValueEntryNo: Integer;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        Text007: TextConst ENU = 'VAT Amount Specification in ', ENN = 'VAT Amount Specification in ';
        Text008: TextConst ENU = 'Local Currency', ENN = 'Local Currency';
        VALExchRate: Text[50];
        Text009: TextConst ENU = 'Exchange rate: %1/%2', ENN = 'Exchange rate: %1/%2';
        CalculatedExchRate: Decimal;
        Text010: TextConst ENU = 'Sales - Prepayment Invoice %1', ENN = 'Sales - Prepayment Invoice %1';
        OutputNo: Integer;
        TotalSubTotal: Decimal;
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        TotalAmountVAT: Decimal;
        TotalInvoiceDiscountAmount: Decimal;
        TotalPaymentDiscountOnVAT: Decimal;
        ChargesAmount: Decimal;
        OtherTaxesAmount: Decimal;
        Text13700: TextConst ENU = 'Total %1 Incl. Taxes', ENN = 'Total %1 Incl. Taxes';
        Text13701: TextConst ENU = 'Total %1 Excl. Taxes', ENN = 'Total %1 Excl. Taxes';
        SupplementaryText: Text[30];
        Text16500: TextConst ENU = 'Supplementary Invoice', ENN = 'Supplementary Invoice';
        ///ServiceTaxEntry: Record "16473";
        ServiceTaxAmt: Decimal;
        ServiceTaxECessAmt: Decimal;
        AppliedServiceTaxAmt: Decimal;
        AppliedServiceTaxECessAmt: Decimal;
        ServiceTaxSHECessAmt: Decimal;
        AppliedServiceTaxSHECessAmt: Decimal;
        TotalTaxAmt: Decimal;
        TotalExciseAmt: Decimal;
        TotalTCSAmount: Decimal;
        ServiceTaxAmount: Decimal;
        ServiceTaxeCessAmount: Decimal;
        ServiceTaxSHECessAmount: Decimal;
        [InDataSet]
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        PhoneNoCaptionLbl: TextConst ENU = 'Phone No.', ENN = 'Phone No.';
        HomePageCaptionCap: TextConst ENU = 'Home Page', ENN = 'Home Page';
        VATRegNoCaptionLbl: TextConst ENU = 'VAT Registration No.', ENN = 'VAT Registration No.';
        GiroNoCaptionLbl: TextConst ENU = 'Giro No.', ENN = 'Giro No.';
        BankNameCaptionLbl: TextConst ENU = 'Bank', ENN = 'Bank';
        BankAccNoCaptionLbl: TextConst ENU = 'Account No.', ENN = 'Account No.';
        DueDateCaptionLbl: TextConst ENU = 'Due Date', ENN = 'Due Date';
        InvoiceNoCaptionLbl: TextConst ENU = 'Invoice No.', ENN = 'Invoice No.';
        PostingDateCaptionLbl: TextConst ENU = 'Posting Date', ENN = 'Posting Date';
        PLAEntryNoCaptionLbl: TextConst ENU = 'PLA Entry No.', ENN = 'PLA Entry No.';
        RG23AEntryNoCaptionLbl: TextConst ENU = 'RG23A Entry No.', ENN = 'RG23A Entry No.';
        RG23CEntryNoCaptionLbl: TextConst ENU = 'RG23C Entry No.', ENN = 'RG23C Entry No.';
        HeaderDimensionsCaptionLbl: TextConst ENU = 'Header Dimensions', ENN = 'Header Dimensions';
        UnitPriceCaptionLbl: TextConst ENU = 'Unit Price (INR)', ENN = 'Unit Price';
        DiscountCaptionLbl: TextConst ENU = 'Discount %', ENN = 'Discount %';
        AmountCaptionLbl: TextConst ENU = 'Amount (INR)', ENN = 'Amount';
        LineDiscountCaptionLbl: TextConst ENU = 'Line Discount Amount', ENN = 'Line Discount Amount';
        PostedShipmentDateCaptionLbl: TextConst ENU = 'Posted Shipment Date', ENN = 'Posted Shipment Date';
        SubtotalCaptionLbl: TextConst ENU = 'Subtotal', ENN = 'Subtotal';
        ExciseAmountCaptionLbl: TextConst ENU = 'Excise Amount', ENN = 'Excise Amount';
        TaxAmountCaptionLbl: TextConst ENU = 'Tax Amount', ENN = 'Tax Amount';
        ServiceTaxAmountCaptionLbl: TextConst ENU = 'Service Tax Amount', ENN = 'Service Tax Amount';
        ChargesAmountCaptionLbl: TextConst ENU = 'Charges Amount', ENN = 'Charges Amount';
        OtherTaxesAmountCaptionLbl: TextConst ENU = 'Other Taxes Amount', ENN = 'Other Taxes Amount';
        ServTaxeCessAmtCaptionLbl: TextConst ENU = 'Service Tax eCess Amount', ENN = 'Service Tax eCess Amount';
        TCSAmountCaptionLbl: TextConst ENU = 'TCS Amount', ENN = 'TCS Amount';
        SvcTaxAmtAppliedCaptionLbl: TextConst ENU = 'Svc Tax Amt (Applied)', ENN = 'Svc Tax Amt (Applied)';
        SvcTaxeCessAmtAppliedCaptionLbl: TextConst ENU = 'Svc Tax eCess Amt (Applied)', ENN = 'Svc Tax eCess Amt (Applied)';
        ServTaxSHECessAmtCaptionLbl: TextConst ENU = 'Service Tax SHE Cess Amount', ENN = 'Service Tax SHE Cess Amount';
        SvcTaxSHECessAmtAppliedCaptionLbl: TextConst ENU = 'Svc Tax SHECess Amt(Applied)', ENN = 'Svc Tax SHECess Amt(Applied)';
        PaymentDiscVATCaptionLbl: TextConst ENU = 'Payment Discount on VAT', ENN = 'Payment Discount on VAT';
        ShipmentCaptionLbl: TextConst ENU = 'Shipment', ENN = 'Shipment';
        LineDimensionsCaptionLbl: TextConst ENU = 'Line Dimensions', ENN = 'Line Dimensions';
        VATAmountSpecificationCaptionLbl: TextConst ENU = 'VAT Amount Specification', ENN = 'VAT Amount Specification';
        InvDiscBaseAmtCaptionLbl: TextConst ENU = 'Invoice Discount Base Amount', ENN = 'Invoice Discount Base Amount';
        LineAmountCaptionLbl: TextConst ENU = 'Line Amount', ENN = 'Line Amount';
        ShipToAddressCaptionLbl: TextConst ENU = 'Ship-to Address', ENN = 'Ship-to Address';
        ServiceTaxRegistrationNo: Code[20];
        ServiceTaxRegistrationNoLbl: TextConst ENU = 'Service Tax Registration No.', ENN = 'Service Tax Registration No.';
        InvDiscountAmountCaptionLbl: TextConst ENU = 'Invoice Discount Amount', ENN = 'Invoice Discount Amount';
        VATPercentageCaptionLbl: TextConst ENU = 'VAT %', ENN = 'VAT %';
        VATAmountCaptionLbl: TextConst ENU = 'VAT Amount', ENN = 'VAT Amount';
        VATIdentifierCaptionLbl: TextConst ENU = 'VAT Identifier', ENN = 'VAT Identifier';
        TotalCaptionLbl: TextConst ENU = 'Total', ENN = 'Total';
        VATBaseCaptionLbl: TextConst ENU = 'VAT Base', ENN = 'VAT Base';
        PaymentTermsCaptionLbl: TextConst ENU = 'Payment Terms', ENN = 'Payment Terms';
        ShipmentMethodCaptionLbl: TextConst ENU = 'Shipment Method', ENN = 'Shipment Method';
        EMailCaptionLbl: TextConst ENU = 'E-Mail', ENN = 'E-Mail';
        DocumentDateCaptionLbl: TextConst ENU = 'Document Date', ENN = 'Document Date';
        DisplayAdditionalFeeNote: Boolean;
        ServTaxSBCAmtCaptionLbl: TextConst ENU = 'SBC Amount', ENN = 'SBC Amount';
        SvcTaxSBCAmtAppliedCaptionLbl: TextConst ENU = 'SBC Amt (Applied)', ENN = 'SBC Amt (Applied)';
        ServiceTaxSBCAmount: Decimal;
        ServiceTaxSBCAmt: Decimal;
        AppliedServiceTaxSBCAmt: Decimal;
        KKCessAmount: Decimal;
        KKCessAmt: Decimal;
        AppliedKKCessAmt: Decimal;
        KKCessAmtCaptionLbl: TextConst ENU = 'KKC Amount', ENN = 'KKC Amount';
        KKCessAmtAppliedCaptionLbl: TextConst ENU = 'KKC Amt (Applied)', ENN = 'KKC Amt (Applied)';
        IsGSTApplicable: Boolean;
        J: Integer;
        CompanyRegistrationLbl: TextConst ENU = 'Company Registration No.', ENN = 'Company Registration No.';
        CustomerRegistrationLbl: TextConst ENU = 'Customer GST Reg No.', ENN = 'Customer GST Reg No.';
        CompanyInformation: Record "Company Information";
        BillToCust: Record Customer;
        ShipToPost: Record "Ship-to Address";
        BillToState: Record State;
        ShipToState: Record State;
        ShipToAddress: array[9] of Text[100];
        LocationAdd: Record Location;
        recDetailedGSTLedger: Record "Detailed GST Ledger Entry";
        totCGSTAmt: Decimal;
        totSGSTAmt: Decimal;
        totIGSTAmt: Decimal;
        IGSTAmt: Decimal;
        CGSTAmt: Decimal;
        SGSTAmt: Decimal;
        IGSTPer: Decimal;
        CGSTPer: Decimal;
        SGSTPer: Decimal;
        GSTBaseAmt: Decimal;
        AmttoCustomer: Decimal;
        RCheck: Report 1401;
        AmtWords: array[2] of Text[80];
        salescount: Integer;
        AmtWordsCGS: array[2] of Text[80];
        AmtWordsSGS: array[2] of Text[80];
        AmtWordsIGS: array[2] of Text[80];
        ItemLedgerEntry: Record "Item Ledger Entry";
        SalesShipmentLine: Record "Sales Shipment Line";
        LotNO: Code[20];
        AmtWordsgstbase: array[2] of Text[80];
        Stateee: Record State;
        ItenUOM: Record Item;
        decCurrencyFactor: Decimal;
        intTtlLineNo: Integer;
        ItemPCPL: Record Item;
        //InspectionDataSheet: Record "50022"; //PCPL-Deepak/Migration
        upusd: Decimal;
        //PackingList: Record "33001046"; //PCPL-Deepak/Migration
        //PackingListPackage: Record "33001048"; //PCPL-Deepak/Migration
        Country: Record "Country/Region";
        PaymentMethodCode: Record "Payment Method";
        NoOfPack: Text;
        //PostedExportTerms: Record "33001041"; //PCPL-Deepak/Migration
        GrossWT: Decimal;
        NetWT: Decimal;
        BankAccount: Record "Bank Account";
        //portrec: Record "33001050"; //PCPL-Deepak/Migration
        //portrec1: Record "33001050"; //PCPL-Deepak/Migration
        Comments: array[35] of Text;
        SalesCommentLine: Record "Sales Comment Line";
        CommInt: Integer;
        PackMark: Text;
        vTotalCount: Integer;
        terrifNo: Record "Tariff Number";
        TotalGross: Decimal;
        TotalNet: Decimal;
        ShipCountryName: Text;
        Shiptoadd: Record "Post Code";
        CountryRegion: Record "Country/Region";
        TotalChargesAmount: Decimal;
        WordChargesAmount: array[2] of Text;
        SalesInvLine: Record "Sales Invoice Line";
        Corresp: Text;
        Corresp1: Text;
        Strpos_: Integer;
        ExtendedLinePrint: Boolean;
        RecextendedLine: Record "Extended Text Line";
        ExtenstedText: Text[1024];
        MfgFate12: Date;
        ExpDate12: Date;
        bankadd: Text;
    //StructureLineDetails12: Record "13795";

    procedure InitLogInteraction();
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(4) <> '';
    end;

    procedure FindPostedShipmentDate(): Date;
    var
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesShipmentBuffer2: Record "Sales Shipment Buffer" temporary;
    begin
        NextEntryNo := 1;
        IF "Sales Invoice Line"."Shipment No." <> '' THEN
            IF SalesShipmentHeader.GET("Sales Invoice Line"."Shipment No.") THEN
                EXIT(SalesShipmentHeader."Posting Date");

        IF "Sales Invoice Header"."Order No." = '' THEN
            EXIT("Sales Invoice Header"."Posting Date");

        CASE "Sales Invoice Line".Type OF
            "Sales Invoice Line".Type::Item:
                GenerateBufferFromValueEntry("Sales Invoice Line");
            "Sales Invoice Line".Type::"G/L Account", "Sales Invoice Line".Type::Resource,
          "Sales Invoice Line".Type::"Charge (Item)", "Sales Invoice Line".Type::"Fixed Asset":
                // GenerateBufferFromShipment("Sales Invoice Line");
                //"Sales Invoice Line".Type::" ":
                EXIT(0D);
        END;

        SalesShipmentBuffer.RESET;
        SalesShipmentBuffer.SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
        SalesShipmentBuffer.SETRANGE("Line No.", "Sales Invoice Line"."Line No.");
        IF SalesShipmentBuffer.FIND('-') THEN BEGIN
            SalesShipmentBuffer2 := SalesShipmentBuffer;
            IF SalesShipmentBuffer.NEXT = 0 THEN BEGIN
                SalesShipmentBuffer.GET(
                  SalesShipmentBuffer2."Document No.", SalesShipmentBuffer2."Line No.", SalesShipmentBuffer2."Entry No.");
                SalesShipmentBuffer.DELETE;
                EXIT(SalesShipmentBuffer2."Posting Date");
            END;
            SalesShipmentBuffer.CALCSUMS(Quantity);
            IF SalesShipmentBuffer.Quantity <> "Sales Invoice Line".Quantity THEN BEGIN
                SalesShipmentBuffer.DELETEALL;
                EXIT("Sales Invoice Header"."Posting Date");
            END;
        END ELSE
            EXIT("Sales Invoice Header"."Posting Date");
    end;

    procedure GenerateBufferFromValueEntry(SalesInvoiceLine2: Record 113);
    var
        ValueEntry: Record "Value Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := SalesInvoiceLine2."Quantity (Base)";
        ValueEntry.SETCURRENTKEY("Document No.");
        ValueEntry.SETRANGE("Document No.", SalesInvoiceLine2."Document No.");
        ValueEntry.SETRANGE("Posting Date", "Sales Invoice Header"."Posting Date");
        ValueEntry.SETRANGE("Item Charge No.", '');
        ValueEntry.SETFILTER("Entry No.", '%1..', FirstValueEntryNo);
        IF ValueEntry.FIND('-') THEN
            REPEAT
                IF ItemLedgerEntry.GET(ValueEntry."Item Ledger Entry No.") THEN BEGIN
                    IF SalesInvoiceLine2."Qty. per Unit of Measure" <> 0 THEN
                        Quantity := ValueEntry."Invoiced Quantity" / SalesInvoiceLine2."Qty. per Unit of Measure"
                    ELSE
                        Quantity := ValueEntry."Invoiced Quantity";
                    AddBufferEntry(
                      SalesInvoiceLine2,
                      -Quantity,
                      ItemLedgerEntry."Posting Date");
                    TotalQuantity := TotalQuantity + ValueEntry."Invoiced Quantity";
                END;
                FirstValueEntryNo := ValueEntry."Entry No." + 1;
            UNTIL (ValueEntry.NEXT = 0) OR (TotalQuantity = 0);
    end;

    procedure GenerateBufferFromShipment(SalesInvoiceLine: Record "Sales Shipment Line");
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInvoiceLine2: Record "Sales Invoice Line";
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesShipmentLine: Record "Sales Shipment Line";
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := 0;
        SalesInvoiceHeader.SETCURRENTKEY("Order No.");
        SalesInvoiceHeader.SETFILTER("No.", '..%1', "Sales Invoice Header"."No.");
        SalesInvoiceHeader.SETRANGE("Order No.", "Sales Invoice Header"."Order No.");
        IF SalesInvoiceHeader.FIND('-') THEN
            REPEAT
                SalesInvoiceLine2.SETRANGE("Document No.", SalesInvoiceHeader."No.");
                SalesInvoiceLine2.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
                SalesInvoiceLine2.SETRANGE(Type, SalesInvoiceLine.Type);
                SalesInvoiceLine2.SETRANGE("No.", SalesInvoiceLine."No.");
                SalesInvoiceLine2.SETRANGE("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
                IF SalesInvoiceLine2.FIND('-') THEN
                    REPEAT
                        TotalQuantity := TotalQuantity + SalesInvoiceLine2.Quantity;
                    UNTIL SalesInvoiceLine2.NEXT = 0;
            UNTIL SalesInvoiceHeader.NEXT = 0;

        SalesShipmentLine.SETCURRENTKEY("Order No.", "Order Line No.");
        SalesShipmentLine.SETRANGE("Order No.", "Sales Invoice Header"."Order No.");
        SalesShipmentLine.SETRANGE("Order Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentLine.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentLine.SETRANGE(Type, SalesInvoiceLine.Type);
        SalesShipmentLine.SETRANGE("No.", SalesInvoiceLine."No.");
        SalesShipmentLine.SETRANGE("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
        SalesShipmentLine.SETFILTER(Quantity, '<>%1', 0);

        IF SalesShipmentLine.FIND('-') THEN
            REPEAT
                IF "Sales Invoice Header"."Get Shipment Used" THEN
                    CorrectShipment(SalesShipmentLine);
                IF ABS(SalesShipmentLine.Quantity) <= ABS(TotalQuantity - SalesInvoiceLine.Quantity) THEN
                    TotalQuantity := TotalQuantity - SalesShipmentLine.Quantity
                ELSE BEGIN
                    IF ABS(SalesShipmentLine.Quantity) > ABS(TotalQuantity) THEN
                        SalesShipmentLine.Quantity := TotalQuantity;
                    Quantity :=
                      SalesShipmentLine.Quantity - (TotalQuantity - SalesInvoiceLine.Quantity);

                    TotalQuantity := TotalQuantity - SalesShipmentLine.Quantity;
                    SalesInvoiceLine.Quantity := SalesInvoiceLine.Quantity - Quantity;

                    // IF SalesShipmentHeader.GET(SalesShipmentLine."Document No.") THEN
                    //     AddBufferEntry(
                    //       SalesInvoiceLine,
                    //       Quantity,
                    //       SalesShipmentHeader."Posting Date");
                END;
            UNTIL (SalesShipmentLine.NEXT = 0) OR (TotalQuantity = 0);
    end;

    procedure CorrectShipment(var SalesShipmentLine: Record "Sales Shipment Line");
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
    begin
        SalesInvoiceLine.SETCURRENTKEY("Shipment No.", "Shipment Line No.");
        SalesInvoiceLine.SETRANGE("Shipment No.", SalesShipmentLine."Document No.");
        SalesInvoiceLine.SETRANGE("Shipment Line No.", SalesShipmentLine."Line No.");
        IF SalesInvoiceLine.FIND('-') THEN
            REPEAT
                SalesShipmentLine.Quantity := SalesShipmentLine.Quantity - SalesInvoiceLine.Quantity;
            UNTIL SalesInvoiceLine.NEXT = 0;
    end;

    procedure AddBufferEntry(SalesInvoiceLine: Record "Sales Invoice Line"; QtyOnShipment: Decimal; PostingDate: Date);
    begin
        SalesShipmentBuffer.SETRANGE("Document No.", SalesInvoiceLine."Document No.");
        SalesShipmentBuffer.SETRANGE("Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentBuffer.SETRANGE("Posting Date", PostingDate);
        IF SalesShipmentBuffer.FIND('-') THEN BEGIN
            SalesShipmentBuffer.Quantity := SalesShipmentBuffer.Quantity + QtyOnShipment;
            SalesShipmentBuffer.MODIFY;
            EXIT;
        END;

        WITH SalesShipmentBuffer DO BEGIN
            "Document No." := SalesInvoiceLine."Document No.";
            "Line No." := SalesInvoiceLine."Line No.";
            "Entry No." := NextEntryNo;
            Type := SalesInvoiceLine.Type;
            "No." := SalesInvoiceLine."No.";
            Quantity := QtyOnShipment;
            "Posting Date" := PostingDate;
            INSERT;
            NextEntryNo := NextEntryNo + 1
        END;
    end;

    local procedure DocumentCaption(): Text[250];
    begin
        IF "Sales Invoice Header"."Prepayment Invoice" THEN
            EXIT(Text010);
        EXIT(Text004);
    end;

    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean; DisplayAsmInfo: Boolean);
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        LogInteraction := NewLogInteraction;
        DisplayAssemblyInformation := DisplayAsmInfo;
    end;

    // procedure CollectAsmInformation();
    // var
    //     ValueEntry: Record "Value Entry";
    //     ItemLedgerEntry: Record "Item Ledger Entry";
    //     PostedAsmHeader: Record "Posted Assembly Header";
    //     PostedAsmLine: Record "Posted Assembly Line";
    //     SalesShipmentLine: Record "Posted Assembly Line";
    // begin
    //     TempPostedAsmLine.DELETEALL;
    //     IF "Sales Invoice Line".Type <> "Sales Invoice Line".Type::Item THEN
    //         EXIT;
    //     WITH ValueEntry DO BEGIN
    //         SETCURRENTKEY("Document No.");
    //         SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
    //         SETRANGE("Document Type", "Document Type"::"Sales Invoice");
    //         SETRANGE("Document Line No.", "Sales Invoice Line"."Line No.");
    //         SETRANGE(Adjustment, FALSE);
    //         IF NOT FINDSET THEN
    //             EXIT;
    //     END;
    //     REPEAT
    //         IF ItemLedgerEntry.GET(ValueEntry."Item Ledger Entry No.") THEN
    //             IF ItemLedgerEntry."Document Type" = ItemLedgerEntry."Document Type"::"Sales Shipment" THEN BEGIN
    //                 SalesShipmentLine.GET(ItemLedgerEntry."Document No.", ItemLedgerEntry."Document Line No.");
    //                 //IF SalesShipmentLine.AsmToShipmentExists(PostedAsmHeader) THEN BEGIN //PCPL-Deepak
    //                 PostedAsmLine.SETRANGE("Document No.", PostedAsmHeader."No.");
    //                 IF PostedAsmLine.FINDSET THEN
    //                     REPEAT
    //                         TreatAsmLineBuffer(PostedAsmLine);
    //                     UNTIL PostedAsmLine.NEXT = 0;
    //             END;
    //             END;
    //     UNTIL ValueEntry.NEXT = 0;
    // end;

    procedure TreatAsmLineBuffer(PostedAsmLine: Record "Posted Assembly Line");
    begin
        CLEAR(TempPostedAsmLine);
        TempPostedAsmLine.SETRANGE(Type, PostedAsmLine.Type);
        TempPostedAsmLine.SETRANGE("No.", PostedAsmLine."No.");
        TempPostedAsmLine.SETRANGE("Variant Code", PostedAsmLine."Variant Code");
        TempPostedAsmLine.SETRANGE(Description, PostedAsmLine.Description);
        TempPostedAsmLine.SETRANGE("Unit of Measure Code", PostedAsmLine."Unit of Measure Code");
        IF TempPostedAsmLine.FINDFIRST THEN BEGIN
            TempPostedAsmLine.Quantity += PostedAsmLine.Quantity;
            TempPostedAsmLine.MODIFY;
        END ELSE BEGIN
            CLEAR(TempPostedAsmLine);
            TempPostedAsmLine := PostedAsmLine;
            TempPostedAsmLine.INSERT;
        END;
    end;

    procedure GetUOMText(UOMCode: Code[10]): Text[10];
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        IF NOT UnitOfMeasure.GET(UOMCode) THEN
            EXIT(UOMCode);
        EXIT(UnitOfMeasure.Description);
    end;

    procedure BlanksForIndent(): Text[10];
    begin
        EXIT(PADSTR('', 2, ' '));
    end;

    local procedure GetLineFeeNoteOnReportHist(SalesInvoiceHeaderNo: Code[20]);
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
        Customer: Record Customer;
    begin
        //TempLineFeeNoteOnReportHist.DELETEALL;
        CustLedgerEntry.SETRANGE("Document Type", CustLedgerEntry."Document Type"::Invoice);
        CustLedgerEntry.SETRANGE("Document No.", SalesInvoiceHeaderNo);
        IF NOT CustLedgerEntry.FINDFIRST THEN
            EXIT;

        IF NOT Customer.GET(CustLedgerEntry."Customer No.") THEN
            EXIT;
        /*
        LineFeeNoteOnReportHist.SETRANGE("Cust. Ledger Entry No",CustLedgerEntry."Entry No.");
        LineFeeNoteOnReportHist.SETRANGE("Language Code",Customer."Language Code");
        IF LineFeeNoteOnReportHist.FINDSET THEN BEGIN
          REPEAT
            TempLineFeeNoteOnReportHist.INIT;
            TempLineFeeNoteOnReportHist.COPY(LineFeeNoteOnReportHist);
            TempLineFeeNoteOnReportHist.INSERT;
          UNTIL LineFeeNoteOnReportHist.NEXT = 0;
        END ELSE BEGIN
          LineFeeNoteOnReportHist.SETRANGE("Language Code",Language.GetUserLanguage);
          IF LineFeeNoteOnReportHist.FINDSET THEN
            REPEAT
              TempLineFeeNoteOnReportHist.INIT;
              TempLineFeeNoteOnReportHist.COPY(LineFeeNoteOnReportHist);
              TempLineFeeNoteOnReportHist.INSERT;
            UNTIL LineFeeNoteOnReportHist.NEXT = 0;
        END;
         */

    end;
}

