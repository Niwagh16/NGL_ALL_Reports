report 50008 "Vendor-Payment Advice NGL"
{
    // version NAVW17.10\KAR 1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Vendor-Payment Advice NGL.rdl';
    CaptionML = ENU = 'Vendor - Payment Receipt',
                ENN = 'Vendor - Payment Receipt';

    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            DataItemTableView = SORTING("Document Type", "Vendor No.", "Posting Date", "Currency Code")
                                WHERE("Document Type" = FILTER(Payment | Refund));
            RequestFilterFields = "Vendor No.", "Posting Date", "Document No.";
            column(TDSAmount; TDSAmount)
            {
            }
            dataitem(PageLoop; Integer)
            {
                DataItemTableView = SORTING(Number)
                                    WHERE(Number = CONST(1));
                column(VendAddr6; VendAddr[6])
                {
                }
                column(VendAddr7; VendAddr[7])
                {
                }
                column(VendAddr8; VendAddr[8])
                {
                }
                column(VendAddr4; VendAddr[4])
                {
                }
                column(VendAddr5; VendAddr[5])
                {
                }
                column(VendAddr3; VendAddr[3])
                {
                }
                column(VendAddr1; VendAddr[1])
                {
                }
                column(VendAddr2; VendAddr[2])
                {
                }
                column(VendNo_VendLedgEntry; "Vendor Ledger Entry"."Vendor No.")
                {
                    IncludeCaption = true;
                }
                column(DocDate_VendLedgEntry; FORMAT("Vendor Ledger Entry"."Document Date", 0, 4))
                {
                }
                column(CompanyAddr1; CompanyAddr[1])
                {
                }
                column(CompanyAddr2; CompanyAddr[2])
                {
                }
                column(CompanyAddr3; CompanyAddr[3])
                {
                }
                column(CompanyAddr4; CompanyAddr[4])
                {
                }
                column(CompanyAddr5; CompanyAddr[5])
                {
                }
                column(CompanyAddr6; CompanyAddr[6])
                {
                }
                column(PhoneNo; CompanyInfo."Phone No.")
                {
                }
                column(HomePage; CompanyInfo."Home Page")
                {
                }
                column(Email; CompanyInfo."E-Mail")
                {
                }
                column(VATRegistrationNo; CompanyInfo."VAT Registration No.")
                {
                }
                column(GiroNo; CompanyInfo."Giro No.")
                {
                }
                column(BankName; CompanyInfo."Bank Name")
                {
                }
                column(BankAccountNo; CompanyInfo."Bank Account No.")
                {
                }
                column(ReportTitle; ReportTitle)
                {
                }
                column(DocNo_VendLedgEntry; "Vendor Ledger Entry"."Document No.")
                {
                }
                column(PymtDiscTitle; PaymentDiscountTitle)
                {
                }
                column(CompanyInfoPhoneNoCaption; CompanyInfoPhoneNoCaptionLbl)
                {
                }
                column(CompanyInfoGiroNoCaption; CompanyInfoGiroNoCaptionLbl)
                {
                }
                column(CompanyInfoBankNameCaption; CompanyInfoBankNameCaptionLbl)
                {
                }
                column(CompanyInfoBankAccNoCaption; CompanyInfoBankAccNoCaptionLbl)
                {
                }
                column(RcptNoCaption; RcptNoCaptionLbl)
                {
                }
                column(CompanyInfoVATRegNoCaption; CompanyInfoVATRegNoCaptionLbl)
                {
                }
                column(PostingDateCaption; PostingDateCaptionLbl)
                {
                }
                column(AmtCaption; AmtCaptionLbl)
                {
                }
                column(PymtAmtSpecCaption; PymtAmtSpecCaptionLbl)
                {
                }
                column(PymtTolInvCurrCaption; PymtTolInvCurrCaptionLbl)
                {
                }
                column(CompanyLogo; CompanyInfo.Picture)
                {
                }
                column(Company_Name; CompanyInfo.Name)
                {
                }
                column(RegisterAddress; CompanyInfo.Address + ', ' + CompanyInfo."Address 2" + ',' + CompanyInfo.City + ',' + CompanyInfo."Post Code" + ',' + CompanyInfo."Country/Region Code")
                {
                }
                dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
                {
                    DataItemLink = "Document No." = FIELD("Document No.");
                    DataItemLinkReference = "Vendor Ledger Entry";
                    column(Cheque_No; "Bank Account Ledger Entry"."Cheque No.")
                    {
                    }
                    column(Cheque_Date; "Bank Account Ledger Entry"."Cheque Date")
                    {
                    }
                    column(Cheque_Amount; "Bank Account Ledger Entry"."Amount (LCY)")
                    {
                    }
                    column(BankAccount_Name; Bank_Name)
                    {
                    }

                    trigger OnAfterGetRecord();
                    var
                        TmpBankAccount: Record "Bank Account";
                    begin
                        IF TmpBankAccount.GET("Bank Account Ledger Entry"."Bank Account No.") THEN
                            Bank_Name := TmpBankAccount."No." + '-' + TmpBankAccount.Name;
                    end;
                }
                dataitem(DetailedVendorLedgEntry1; "Detailed Vendor Ledg. Entry")
                {
                    DataItemLink = "Applied Vend. Ledger Entry No." = FIELD("Entry No.");
                    DataItemLinkReference = "Vendor Ledger Entry";
                    DataItemTableView = SORTING("Applied Vend. Ledger Entry No.", "Entry Type")
                                        WHERE(Unapplied = CONST(false));
                    column(AppliedVLENo_DtldVendLedgEntry; "Applied Vend. Ledger Entry No.")
                    {
                    }
                    dataitem(VendLedgEntry1; "Vendor Ledger Entry")
                    {
                        DataItemLink = "Entry No." = FIELD("Vendor Ledger Entry No.");
                        DataItemLinkReference = DetailedVendorLedgEntry1;
                        DataItemTableView = SORTING("Entry No.");
                        column(PostingDate_VendLedgEntry1; FORMAT("Posting Date"))
                        {
                        }
                        column(DocType_VendLedgEntry1; "Document Type")
                        {
                            IncludeCaption = true;
                        }
                        column(DocNo_VendLedgEntry1; "Document No.")
                        {
                            IncludeCaption = true;
                        }
                        column(Description_VendLedgEntry1; "External Document No.")
                        {
                            IncludeCaption = true;
                        }
                        column(NegShowAmountVendLedgEntry1; -NegShowAmountVendLedgEntry1)
                        {
                        }
                        column(CurrCode_VendLedgEntry1; CurrencyCode("Currency Code"))
                        {
                        }
                        column(NegPmtDiscInvCurrVendLedgEntry1; -NegPmtDiscInvCurrVendLedgEntry1)
                        {
                        }
                        column(NegPmtTolInvCurrVendLedgEntry1; -NegPmtTolInvCurrVendLedgEntry1)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            IF "Entry No." = "Vendor Ledger Entry"."Entry No." THEN
                                CurrReport.SKIP;

                            NegPmtDiscInvCurrVendLedgEntry1 := 0;
                            NegPmtTolInvCurrVendLedgEntry1 := 0;
                            PmtDiscPmtCurr := 0;
                            PmtTolPmtCurr := 0;

                            NegShowAmountVendLedgEntry1 := -DetailedVendorLedgEntry1.Amount;

                            IF "Vendor Ledger Entry"."Currency Code" <> "Currency Code" THEN BEGIN
                                NegPmtDiscInvCurrVendLedgEntry1 := ROUND("Pmt. Disc. Rcd.(LCY)" * "Original Currency Factor");
                                NegPmtTolInvCurrVendLedgEntry1 := ROUND("Pmt. Tolerance (LCY)" * "Original Currency Factor");
                                AppliedAmount :=
                                  ROUND(
                                    -DetailedVendorLedgEntry1.Amount / "Original Currency Factor" * "Original Currency Factor",
                                    Currency."Amount Rounding Precision");
                            END ELSE BEGIN
                                NegPmtDiscInvCurrVendLedgEntry1 := ROUND("Pmt. Disc. Rcd.(LCY)" * "Vendor Ledger Entry"."Original Currency Factor");
                                NegPmtTolInvCurrVendLedgEntry1 := ROUND("Pmt. Tolerance (LCY)" * "Vendor Ledger Entry"."Original Currency Factor");
                                AppliedAmount := -DetailedVendorLedgEntry1.Amount;
                            END;

                            PmtDiscPmtCurr := ROUND("Pmt. Disc. Rcd.(LCY)" * "Vendor Ledger Entry"."Original Currency Factor");

                            PmtTolPmtCurr := ROUND("Pmt. Tolerance (LCY)" * "Vendor Ledger Entry"."Original Currency Factor");

                            RemainingAmount := (RemainingAmount - AppliedAmount) + PmtDiscPmtCurr + PmtTolPmtCurr;
                        end;
                    }
                }
                dataitem(DetailedVendorLedgEntry2; "Detailed Vendor Ledg. Entry")
                {
                    DataItemLink = "Vendor Ledger Entry No." = FIELD("Entry No.");
                    DataItemLinkReference = "Vendor Ledger Entry";
                    DataItemTableView = SORTING("Vendor Ledger Entry No.", "Entry Type", "Posting Date")
                                        WHERE(Unapplied = CONST(false));
                    column(VLENo_DtldVendLedgEntry; "Vendor Ledger Entry No.")
                    {
                    }
                    dataitem(VendLedgEntry2; "Vendor Ledger Entry")
                    {
                        DataItemLink = "Entry No." = field("Applied Vend. Ledger Entry No.");
                        DataItemLinkReference = DetailedVendorLedgEntry2;
                        DataItemTableView = SORTING("Entry No.");
                        column(NegAppliedAmt; -AppliedAmount)
                        {
                        }
                        column(Description_VendLedgEntry2; Description)
                        {
                        }
                        column(DocNo_VendLedgEntry2; "Document No.")
                        {
                        }
                        column(DocType_VendLedgEntry2; "Document Type")
                        {
                        }
                        column(PostingDate_VendLedgEntry2; FORMAT("Posting Date"))
                        {
                        }
                        column(CurrCode_VendLedgEntry2; CurrencyCode("Currency Code"))
                        {
                        }
                        column(NegPmtDiscInvCurrVendLedgEntry2; -NegPmtDiscInvCurrVendLedgEntry1)
                        {
                        }
                        column(NegPmtTolInvCurr1VendLedgEntry2; -NegPmtTolInvCurrVendLedgEntry1)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            IF "Entry No." = "Vendor Ledger Entry"."Entry No." THEN
                                CurrReport.SKIP;

                            NegPmtDiscInvCurrVendLedgEntry1 := 0;
                            NegPmtTolInvCurrVendLedgEntry1 := 0;
                            PmtDiscPmtCurr := 0;
                            PmtTolPmtCurr := 0;

                            NegShowAmountVendLedgEntry1 := DetailedVendorLedgEntry2.Amount;

                            IF "Vendor Ledger Entry"."Currency Code" <> "Currency Code" THEN BEGIN
                                NegPmtDiscInvCurrVendLedgEntry1 := ROUND("Pmt. Disc. Rcd.(LCY)" * "Original Currency Factor");
                                NegPmtTolInvCurrVendLedgEntry1 := ROUND("Pmt. Tolerance (LCY)" * "Original Currency Factor");
                            END ELSE BEGIN
                                NegPmtDiscInvCurrVendLedgEntry1 := ROUND("Pmt. Disc. Rcd.(LCY)" * "Vendor Ledger Entry"."Original Currency Factor");
                                NegPmtTolInvCurrVendLedgEntry1 := ROUND("Pmt. Tolerance (LCY)" * "Vendor Ledger Entry"."Original Currency Factor");
                            END;

                            PmtDiscPmtCurr := ROUND("Pmt. Disc. Rcd.(LCY)" * "Vendor Ledger Entry"."Original Currency Factor");

                            PmtTolPmtCurr := ROUND("Pmt. Tolerance (LCY)" * "Vendor Ledger Entry"."Original Currency Factor");

                            AppliedAmount := DetailedVendorLedgEntry2.Amount;
                            RemainingAmount := (RemainingAmount - AppliedAmount) + PmtDiscPmtCurr + PmtTolPmtCurr;
                        end;
                    }
                }
                dataitem(Total; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        WHERE(Number = CONST(1));
                    column(NegRemainingAmt; -RemainingAmount)
                    {
                    }
                    column(CurrCode_VendLedgEntry; CurrencyCode("Vendor Ledger Entry"."Currency Code"))
                    {
                    }
                    column(NegOriginalAmt_VendLedgEntry; -"Vendor Ledger Entry"."Original Amount")
                    {
                    }
                    column(ExtDocNo_VendLedgEntry; "Vendor Ledger Entry"."External Document No.")
                    {
                    }
                    column(PymtAmtNotAllocatedCaption; PymtAmtNotAllocatedCaptionLbl)
                    {
                    }
                    column(PymtAmtCaption; PymtAmtCaptionLbl)
                    {
                    }
                    column(ExternalDocNoCaption; ExternalDocNoCaptionLbl)
                    {
                    }
                }
            }

            trigger OnAfterGetRecord();
            begin
                Vend.GET("Vendor No.");
                FormatAddr.Vendor(VendAddr, Vend);
                IF NOT Currency.GET("Currency Code") THEN
                    Currency.InitRoundingPrecision;

                IF "Document Type" = "Document Type"::Payment THEN BEGIN
                    ReportTitle := Text004;
                    PaymentDiscountTitle := Text007;
                END ELSE BEGIN
                    ReportTitle := Text003;
                    PaymentDiscountTitle := Text006;
                END;

                CALCFIELDS("Original Amount");
                RemainingAmount := -"Original Amount";


                IF CompanyInfo.GET THEN
                    CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
                //PCPL50
                CLEAR(TDSAmount);
                RecVendLdgrEntry.RESET;
                RecVendLdgrEntry.SETRANGE(RecVendLdgrEntry."Document No.", "Vendor Ledger Entry"."Document No.");
                //RecVendLdgrEntry.SETFILTER(RecVendLdgrEntry."Total TDS Including SHE CESS",'<>%',FORMAT(0.0));
                RecVendLdgrEntry.SETRANGE(RecVendLdgrEntry."Entry No.", "Vendor Ledger Entry"."Entry No.");

                IF RecVendLdgrEntry.FINDFIRST THEN
                    TDSAmount += RecVendLdgrEntry."Total TDS Including SHE CESS";
                // IF TDSAmount = FORMAT(0.0) THEN
                //  TDSAmount := '';
                //PCPL50
                //MESSAGE(FORMAT(TDSAmount));
            end;

            trigger OnPreDataItem();
            begin
                CompanyInfo.GET;
                FormatAddr.Company(CompanyAddr, CompanyInfo);
                GLSetup.GET;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
        label(CurrencyCodeCaption; ENU = 'Currency Code',
                                  ENN = 'Currency Code')
        label(PageCaption; ENU = 'Page',
                          ENN = 'Page')
        label(DocDateCaption; ENU = 'Document Date',
                             ENN = 'Document Date')
        label(EmailCaption; ENU = 'E-Mail',
                           ENN = 'E-Mail')
        label(HomePageCaption; ENU = 'Home Page',
                              ENN = 'Home Page')
    }

    var
        CompanyInfo: Record "Company Information";
        GLSetup: Record "General Ledger Setup";
        Vend: Record Vendor;
        Currency: Record Currency;
        FormatAddr: Codeunit "Format Address";
        ReportTitle: Text[30];
        PaymentDiscountTitle: Text[30];
        CompanyAddr: array[8] of Text[50];
        VendAddr: array[8] of Text[50];
        RemainingAmount: Decimal;
        AppliedAmount: Decimal;
        NegPmtDiscInvCurrVendLedgEntry1: Decimal;
        NegPmtTolInvCurrVendLedgEntry1: Decimal;
        PmtDiscPmtCurr: Decimal;
        Text003: TextConst ENU = 'Payment Receipt', ENN = 'Payment Receipt';
        Text004: TextConst ENU = 'Payment Voucher', ENN = 'Payment Voucher';
        Text006: TextConst ENU = 'Payment Discount Given', ENN = 'Payment Discount Given';
        Text007: TextConst ENU = 'Payment Discount Received', ENN = 'Payment Discount Received';
        PmtTolPmtCurr: Decimal;
        NegShowAmountVendLedgEntry1: Decimal;
        CompanyInfoPhoneNoCaptionLbl: TextConst ENU = 'Phone No.', ENN = 'Phone No.';
        CompanyInfoGiroNoCaptionLbl: TextConst ENU = 'Giro No.', ENN = 'Giro No.';
        CompanyInfoBankNameCaptionLbl: TextConst ENU = 'Bank', ENN = 'Bank';
        CompanyInfoBankAccNoCaptionLbl: TextConst ENU = 'Account No.', ENN = 'Account No.';
        RcptNoCaptionLbl: TextConst ENU = 'Receipt No.', ENN = 'Receipt No.';
        CompanyInfoVATRegNoCaptionLbl: TextConst ENU = 'GST Registration No.', ENN = 'GST Registration No.';
        PostingDateCaptionLbl: TextConst ENU = 'Bill Date', ENN = 'Posting Date';
        AmtCaptionLbl: TextConst ENU = 'Amount', ENN = 'Amount';
        PymtAmtSpecCaptionLbl: TextConst ENU = 'Payment Amount Specification', ENN = 'Payment Amount Specification';
        PymtTolInvCurrCaptionLbl: TextConst ENU = 'Payment Total', ENN = 'Payment Total';
        PymtAmtNotAllocatedCaptionLbl: TextConst ENU = 'Payment Amount Not Allocated', ENN = 'Payment Amount Not Allocated';
        PymtAmtCaptionLbl: TextConst ENU = 'Payment Amount', ENN = 'Payment Amount';
        ExternalDocNoCaptionLbl: TextConst ENU = 'External Document No.', ENN = 'External Document No.';
        Bank_Name: Text[250];
        RegAddress: Label 'Head Office: 2 New Metalage Industrial Premises, Subhash Road, Jogeshwari East, Mumbai-400060';
        TDSNature: Text;
        TDSAmount: Decimal;
        RecVendLdgrEntry: Record "Vendor Ledger Entry";

    local procedure CurrencyCode(SrcCurrCode: Code[10]): Code[10];
    begin
        IF SrcCurrCode = '' THEN
            EXIT(GLSetup."LCY Code");

        EXIT(SrcCurrCode);
    end;
}

