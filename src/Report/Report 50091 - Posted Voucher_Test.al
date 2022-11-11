report 50091 "Posted Voucher_Test"
{
    // version NAVIN7.10

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Posted Voucher_Test.rdl';
    CaptionML = ENU = 'Posted Voucher',
                ENN = 'Posted Voucher';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = SORTING("Document No.", "Posting Date", Amount)
                                ORDER(Descending);
            RequestFilterFields = "Posting Date", "Document No.";
            column(VoucherSourceDesc; SourceDesc + ' Voucher')
            {
            }
            column(DocumentNo_GLEntry; "Document No.")
            {
            }
            column(PostingDateFormatted; 'Date: ' + FORMAT("Posting Date"))
            {
            }
            column(CompanyInformationAddress; CompanyInformation.Address + ' ' + CompanyInformation."Address 2" + '  ' + CompanyInformation.City)
            {
            }
            column(CompanyInformationName; CompanyInformation.Name)
            {
            }
            column(CreditAmount_GLEntry; "Credit Amount")
            {
            }
            column(DebitAmount_GLEntry; "Debit Amount")
            {
            }
            column(DrText; DrText)
            {
            }
            column(GLAccName; GLAccName)
            {
            }
            column(CrText; CrText)
            {
            }
            column(DebitAmountTotal; DebitAmountTotal)
            {
            }
            column(CreditAmountTotal; CreditAmountTotal)
            {
            }
            column(ChequeDetail; 'Cheque No: ' + ChequeNo + '  Dated: ' + FORMAT(ChequeDate))
            {
            }
            column(ChequeNo; ChequeNo)
            {
            }
            column(ChequeDate; ChequeDate)
            {
            }
            column(RsNumberText1NumberText2; 'Rs. ' + NumberText[1] + ' ' + NumberText[2])
            {
            }
            column(EntryNo_GLEntry; "Entry No.")
            {
            }
            column(PostingDate_GLEntry; "Posting Date")
            {
            }
            column(TransactionNo_GLEntry; "Transaction No.")
            {
            }
            column(VoucherNoCaption; VoucherNoCaptionLbl)
            {
            }
            column(CreditAmountCaption; CreditAmountCaptionLbl)
            {
            }
            column(DebitAmountCaption; DebitAmountCaptionLbl)
            {
            }
            column(ParticularsCaption; ParticularsCaptionLbl)
            {
            }
            column(AmountInWordsCaption; AmountInWordsCaptionLbl)
            {
            }
            column(UserName; "G/L Entry"."User ID")
            {
            }
            column(PreparedByCaption; PreparedByCaptionLbl)
            {
            }
            column(CheckedByCaption; CheckedByCaptionLbl)
            {
            }
            column(ApprovedByCaption; ApprovedByCaptionLbl)
            {
            }
            dataitem(VendLedgerEntry; "Vendor Ledger Entry")
            {
                DataItemLink = "Posting Date" = FIELD("Posting Date"),
                               "Document No." = FIELD("Document No.");
                DataItemTableView = SORTING("Entry No.")
                                    ORDER(Ascending)
                                    WHERE("Document Type" = CONST(Payment));
                dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
                {
                    DataItemLink = "Closed by Entry No." = FIELD("Entry No.");
                    DataItemTableView = SORTING("Entry No.")
                                        ORDER(Ascending)
                                        WHERE("Document Type" = FILTER(Invoice));
                    column(EntryNo_VendorLedgerEntry; "Vendor Ledger Entry"."Entry No.")
                    {
                    }
                    column(DocumentNo_VendorLedgerEntry; "Vendor Ledger Entry"."Document No." + ' ' + VendorLedgerEntry."External Document No.")
                    {
                    }
                    column(Extdocno_vendorledentry; VendorLedgerEntry."External Document No.")
                    {
                    }
                    column(Amount_VendorLedgerEntry; "Vendor Ledger Entry".Amount)
                    {
                    }
                }

                trigger OnAfterGetRecord();
                begin
                    //PCPL-BRB
                    VendorLedgerEntry.RESET;
                    VendorLedgerEntry.SETRANGE("Document Type", VendorLedgerEntry."Document Type"::Invoice);
                    VendorLedgerEntry.SETRANGE("Entry No.", "Vendor Ledger Entry"."Closed by Entry No.");
                    IF VendorLedgerEntry.FINDSET THEN
                        REPEAT

                        UNTIL VendorLedgerEntry.NEXT = 0;
                    //PCPL-BRB-17 May 2019
                end;
            }
            dataitem(LineNarration; "Posted Narration")
            {
                DataItemLink = "Transaction No." = FIELD("Transaction No."),
                               "Entry No." = FIELD("Entry No.");
                DataItemTableView = SORTING("Entry No.", "Transaction No.", "Line No.");
                column(Narration_LineNarration; Narration)
                {
                }
                column(PrintLineNarration; PrintLineNarration)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    IF PrintLineNarration THEN BEGIN
                        PageLoop := PageLoop - 1;
                        LinesPrinted := LinesPrinted + 1;
                    END;
                end;
            }
            dataitem(Integer; Integer)
            {
                DataItemTableView = SORTING(Number);
                column(IntegerOccurcesCaption; IntegerOccurcesCaptionLbl)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    PageLoop := PageLoop - 1;
                end;

                trigger OnPreDataItem();
                begin
                    GLEntry.SETCURRENTKEY("Document No.", "Posting Date", Amount);
                    GLEntry.ASCENDING(FALSE);
                    GLEntry.SETRANGE("Posting Date", "G/L Entry"."Posting Date");
                    GLEntry.SETRANGE("Document No.", "G/L Entry"."Document No.");
                    GLEntry.FINDLAST;
                    IF NOT (GLEntry."Entry No." = "G/L Entry"."Entry No.") THEN
                        CurrReport.BREAK;

                    SETRANGE(Number, 1, PageLoop)
                end;
            }
            dataitem(PostedNarration1; "Posted Narration")
            {
                DataItemLink = "Transaction No." = FIELD("Transaction No.");
                DataItemTableView = SORTING("Entry No.", "Transaction No.", "Line No.")
                                    WHERE("Entry No." = FILTER(0));
                column(Narration_PostedNarration1; Narration)
                {
                }
                column(NarrationCaption; NarrationCaptionLbl)
                {
                }

                trigger OnPreDataItem();
                begin
                    GLEntry.SETCURRENTKEY("Document No.", "Posting Date", Amount);
                    GLEntry.ASCENDING(FALSE);
                    GLEntry.SETRANGE("Posting Date", "G/L Entry"."Posting Date");
                    GLEntry.SETRANGE("Document No.", "G/L Entry"."Document No.");
                    GLEntry.FINDLAST;
                    IF NOT (GLEntry."Entry No." = "G/L Entry"."Entry No.") THEN
                        CurrReport.BREAK;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                GLAccName := FindGLAccName("Source Type", "Entry No.", "Source No.", "G/L Account No.");
                IF Amount < 0 THEN BEGIN
                    CrText := 'To';
                    DrText := '';
                END ELSE BEGIN
                    CrText := '';
                    DrText := 'Dr';
                END;

                SourceDesc := '';
                IF "Source Code" <> '' THEN BEGIN
                    SourceCode.GET("Source Code");
                    SourceDesc := SourceCode.Description;
                END;

                PageLoop := PageLoop - 1;
                LinesPrinted := LinesPrinted + 1;

                ChequeNo := '';
                ChequeDate := 0D;
                IF ("Source No." <> '') AND ("Source Type" = "Source Type"::"Bank Account") THEN BEGIN
                    IF BankAccLedgEntry.GET("Entry No.") THEN BEGIN
                        ChequeNo := BankAccLedgEntry."Cheque No.";
                        ChequeDate := BankAccLedgEntry."Cheque Date";
                    END;
                END;

                IF (ChequeNo <> '') AND (ChequeDate <> 0D) THEN BEGIN
                    PageLoop := PageLoop - 1;
                    LinesPrinted := LinesPrinted + 1;
                END;
                IF PostingDate <> "Posting Date" THEN BEGIN
                    PostingDate := "Posting Date";
                    TotalDebitAmt := 0;
                END;
                IF DocumentNo <> "Document No." THEN BEGIN
                    DocumentNo := "Document No.";
                    TotalDebitAmt := 0;
                END;

                IF PostingDate = "Posting Date" THEN BEGIN
                    InitTextVariable;
                    TotalDebitAmt += "Debit Amount";
                    FormatNoText(NumberText, ABS(TotalDebitAmt), '');
                    PageLoop := NUMLines;
                    LinesPrinted := 0;
                END;
                IF (PrePostingDate <> "Posting Date") OR (PreDocumentNo <> "Document No.") THEN BEGIN
                    DebitAmountTotal := 0;
                    CreditAmountTotal := 0;
                    PrePostingDate := "Posting Date";
                    PreDocumentNo := "Document No.";
                END;

                DebitAmountTotal := DebitAmountTotal + "Debit Amount";
                CreditAmountTotal := CreditAmountTotal + "Credit Amount";
            end;

            trigger OnPreDataItem();
            begin
                NUMLines := 13;
                PageLoop := NUMLines;
                LinesPrinted := 0;
                DebitAmountTotal := 0;
                CreditAmountTotal := 0;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    CaptionML = ENU = 'Options',
                                ENN = 'Options';
                    field(PrintLineNarration; PrintLineNarration)
                    {
                        CaptionML = ENU = 'PrintLineNarration',
                                    ENN = 'PrintLineNarration';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit();
        begin
            PrintLineNarration := TRUE;
        end;
    }

    labels
    {
    }

    trigger OnPreReport();
    begin
        CompanyInformation.GET;
    end;

    var
        CompanyInformation: Record "Company Information";
        SourceCode: Record "Source Code";
        GLEntry: Record "G/L Entry";
        BankAccLedgEntry: Record "Bank Account Ledger Entry";
        GLAccName: Text[50];
        SourceDesc: Text[50];
        CrText: Text[2];
        DrText: Text[2];
        NumberText: array[2] of Text[80];
        PageLoop: Integer;
        LinesPrinted: Integer;
        NUMLines: Integer;
        ChequeNo: Code[50];
        ChequeDate: Date;
        Text16526: TextConst ENU = 'ZERO', ENN = 'ZERO';
        Text16527: TextConst ENU = 'HUNDRED', ENN = 'HUNDRED';
        Text16528: TextConst ENU = 'AND', ENN = 'AND';
        Text16529: TextConst ENU = '%1 results in a written number that is too long.', ENN = '%1 results in a written number that is too long.';
        Text16532: TextConst ENU = 'ONE', ENN = 'ONE';
        Text16533: TextConst ENU = 'TWO', ENN = 'TWO';
        Text16534: TextConst ENU = 'THREE', ENN = 'THREE';
        Text16535: TextConst ENU = 'FOUR', ENN = 'FOUR';
        Text16536: TextConst ENU = 'FIVE', ENN = 'FIVE';
        Text16537: TextConst ENU = 'SIX', ENN = 'SIX';
        Text16538: TextConst ENU = 'SEVEN', ENN = 'SEVEN';
        Text16539: TextConst ENU = 'EIGHT', ENN = 'EIGHT';
        Text16540: TextConst ENU = 'NINE', ENN = 'NINE';
        Text16541: TextConst ENU = 'TEN', ENN = 'TEN';
        Text16542: TextConst ENU = 'ELEVEN', ENN = 'ELEVEN';
        Text16543: TextConst ENU = 'TWELVE', ENN = 'TWELVE';
        Text16544: TextConst ENU = 'THIRTEEN', ENN = 'THIRTEEN';
        Text16545: TextConst ENU = 'FOURTEEN', ENN = 'FOURTEEN';
        Text16546: TextConst ENU = 'FIFTEEN', ENN = 'FIFTEEN';
        Text16547: TextConst ENU = 'SIXTEEN', ENN = 'SIXTEEN';
        Text16548: TextConst ENU = 'SEVENTEEN', ENN = 'SEVENTEEN';
        Text16549: TextConst ENU = 'EIGHTEEN', ENN = 'EIGHTEEN';
        Text16550: TextConst ENU = 'NINETEEN', ENN = 'NINETEEN';
        Text16551: TextConst ENU = 'TWENTY', ENN = 'TWENTY';
        Text16552: TextConst ENU = 'THIRTY', ENN = 'THIRTY';
        Text16553: TextConst ENU = 'FORTY', ENN = 'FORTY';
        Text16554: TextConst ENU = 'FIFTY', ENN = 'FIFTY';
        Text16555: TextConst ENU = 'SIXTY', ENN = 'SIXTY';
        Text16556: TextConst ENU = 'SEVENTY', ENN = 'SEVENTY';
        Text16557: TextConst ENU = 'EIGHTY', ENN = 'EIGHTY';
        Text16558: TextConst ENU = 'NINETY', ENN = 'NINETY';
        Text16559: TextConst ENU = 'THOUSAND', ENN = 'THOUSAND';
        Text16560: TextConst ENU = 'MILLION', ENN = 'MILLION';
        Text16561: TextConst ENU = 'BILLION', ENN = 'BILLION';
        Text16562: TextConst ENU = 'LAKH', ENN = 'LAKH';
        Text16563: TextConst ENU = 'CRORE', ENN = 'CRORE';
        OnesText: array[20] of Text[30];
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        PrintLineNarration: Boolean;
        PostingDate: Date;
        TotalDebitAmt: Decimal;
        DocumentNo: Code[20];
        DebitAmountTotal: Decimal;
        CreditAmountTotal: Decimal;
        PrePostingDate: Date;
        PreDocumentNo: Code[50];
        VoucherNoCaptionLbl: TextConst ENU = 'Voucher No. :', ENN = 'Voucher No. :';
        CreditAmountCaptionLbl: TextConst ENU = 'Credit Amount', ENN = 'Credit Amount';
        DebitAmountCaptionLbl: TextConst ENU = 'Debit Amount', ENN = 'Debit Amount';
        ParticularsCaptionLbl: TextConst ENU = 'Particulars', ENN = 'Particulars';
        AmountInWordsCaptionLbl: TextConst ENU = 'Amount (in words):', ENN = 'Amount (in words):';
        PreparedByCaptionLbl: TextConst ENU = 'Prepared by:', ENN = 'Prepared by:';
        CheckedByCaptionLbl: TextConst ENU = 'Checked by:', ENN = 'Checked by:';
        ApprovedByCaptionLbl: TextConst ENU = 'Approved by:', ENN = 'Approved by:';
        IntegerOccurcesCaptionLbl: TextConst ENU = 'IntegerOccurces', ENN = 'IntegerOccurces';
        NarrationCaptionLbl: TextConst ENU = 'Narration :', ENN = 'Narration :';
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        VendorLdgerNo: Text;

    procedure FindGLAccName("Source Type": Option " ",Customer,Vendor,"Bank Account","Fixed Asset"; "Entry No.": Integer; "Source No.": Code[20]; "G/L Account No.": Code[20]): Text[50];
    var
        AccName: Text[50];
        VendLedgerEntry: Record "Vendor Ledger Entry";
        Vend: Record Vendor;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        Cust: Record Customer;
        BankLedgerEntry: Record "Bank Account Ledger Entry";
        Bank: Record "Bank Account";
        FALedgerEntry: Record "FA Ledger Entry";
        FA: Record "Fixed Asset";
        GLAccount: Record "G/L Account";
    begin
        IF "Source Type" = "Source Type"::Vendor THEN
            IF VendLedgerEntry.GET("Entry No.") THEN BEGIN
                Vend.GET("Source No.");
                AccName := Vend.Name;
            END ELSE BEGIN
                GLAccount.GET("G/L Account No.");
                AccName := GLAccount.Name;
            END
        ELSE
            IF "Source Type" = "Source Type"::Customer THEN
                IF CustLedgerEntry.GET("Entry No.") THEN BEGIN
                    Cust.GET("Source No.");
                    AccName := Cust.Name;
                END ELSE BEGIN
                    GLAccount.GET("G/L Account No.");
                    AccName := GLAccount.Name;
                END
            ELSE
                IF "Source Type" = "Source Type"::"Bank Account" THEN
                    IF BankLedgerEntry.GET("Entry No.") THEN BEGIN
                        Bank.GET("Source No.");
                        AccName := Bank.Name;
                    END ELSE BEGIN
                        GLAccount.GET("G/L Account No.");
                        AccName := GLAccount.Name;
                    END
                ELSE BEGIN
                    GLAccount.GET("G/L Account No.");
                    AccName := GLAccount.Name;
                END;

        IF "Source Type" = "Source Type"::" " THEN BEGIN
            GLAccount.GET("G/L Account No.");
            AccName := GLAccount.Name;
        END;

        EXIT(AccName);
    end;

    procedure FormatNoText(var NoText: array[2] of Text[80]; No: Decimal; CurrencyCode: Code[10]);
    var
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
        Currency: Record Currency;
        TensDec: Integer;
        OnesDec: Integer;
    begin
        CLEAR(NoText);
        NoTextIndex := 1;
        NoText[1] := '';

        IF No < 1 THEN
            AddToNoText(NoText, NoTextIndex, PrintExponent, Text16526)
        ELSE BEGIN
            FOR Exponent := 4 DOWNTO 1 DO BEGIN
                PrintExponent := FALSE;
                IF No > 99999 THEN BEGIN
                    Ones := No DIV (POWER(100, Exponent - 1) * 10);
                    Hundreds := 0;
                END ELSE BEGIN
                    Ones := No DIV POWER(1000, Exponent - 1);
                    Hundreds := Ones DIV 100;
                END;
                Tens := (Ones MOD 100) DIV 10;
                Ones := Ones MOD 10;
                IF Hundreds > 0 THEN BEGIN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, Text16527);
                END;
                IF Tens >= 2 THEN BEGIN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                    IF Ones > 0 THEN
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                END ELSE
                    IF (Tens * 10 + Ones) > 0 THEN
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                IF PrintExponent AND (Exponent > 1) THEN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
                IF No > 99999 THEN
                    No := No - (Hundreds * 100 + Tens * 10 + Ones) * POWER(100, Exponent - 1) * 10
                ELSE
                    No := No - (Hundreds * 100 + Tens * 10 + Ones) * POWER(1000, Exponent - 1);
            END;
        END;

        IF CurrencyCode <> '' THEN BEGIN
            Currency.GET(CurrencyCode);
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' ' + ''/*Currency."Currency Numeric Description"*/);
        END ELSE
            AddToNoText(NoText, NoTextIndex, PrintExponent, 'RUPEES');

        AddToNoText(NoText, NoTextIndex, PrintExponent, Text16528);

        TensDec := ((No * 100) MOD 100) DIV 10;
        OnesDec := (No * 100) MOD 10;
        IF TensDec >= 2 THEN BEGIN
            AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[TensDec]);
            IF OnesDec > 0 THEN
                AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[OnesDec]);
        END ELSE
            IF (TensDec * 10 + OnesDec) > 0 THEN
                AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[TensDec * 10 + OnesDec])
            ELSE
                AddToNoText(NoText, NoTextIndex, PrintExponent, Text16526);
        IF (CurrencyCode <> '') THEN
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' ' + ''/* Currency."Currency Decimal Description"*/ + ' ONLY')
        ELSE
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' PAISA ONLY');
    end;

    local procedure AddToNoText(var NoText: array[2] of Text[80]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30]);
    begin
        PrintExponent := TRUE;

        WHILE STRLEN(NoText[NoTextIndex] + ' ' + AddText) > MAXSTRLEN(NoText[1]) DO BEGIN
            NoTextIndex := NoTextIndex + 1;
            IF NoTextIndex > ARRAYLEN(NoText) THEN
                ERROR(Text16529, AddText);
        END;

        NoText[NoTextIndex] := DELCHR(NoText[NoTextIndex] + ' ' + AddText, '<');
    end;

    procedure InitTextVariable();
    begin
        OnesText[1] := Text16532;
        OnesText[2] := Text16533;
        OnesText[3] := Text16534;
        OnesText[4] := Text16535;
        OnesText[5] := Text16536;
        OnesText[6] := Text16537;
        OnesText[7] := Text16538;
        OnesText[8] := Text16539;
        OnesText[9] := Text16540;
        OnesText[10] := Text16541;
        OnesText[11] := Text16542;
        OnesText[12] := Text16543;
        OnesText[13] := Text16544;
        OnesText[14] := Text16545;
        OnesText[15] := Text16546;
        OnesText[16] := Text16547;
        OnesText[17] := Text16548;
        OnesText[18] := Text16549;
        OnesText[19] := Text16550;

        TensText[1] := '';
        TensText[2] := Text16551;
        TensText[3] := Text16552;
        TensText[4] := Text16553;
        TensText[5] := Text16554;
        TensText[6] := Text16555;
        TensText[7] := Text16556;
        TensText[8] := Text16557;
        TensText[9] := Text16558;

        ExponentText[1] := '';
        ExponentText[2] := Text16559;
        ExponentText[3] := Text16562;
        ExponentText[4] := Text16563;
    end;
}

