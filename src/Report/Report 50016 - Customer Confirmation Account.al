report 50016 "Customer Confirmation Account"
{
    // version KAR 1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Customer Confirmation Account.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = SORTING("No.")
                                ORDER(Ascending);
            RequestFilterFields = "No.", "Search Name", "Customer Posting Group", "Date Filter", "Global Dimension 1 Filter", "Global Dimension 2 Filter";
            column(HO_Address; Address2)
            {
            }
            column(CustNo; Customer."No.")
            {
            }
            column(Name; Customer.Name)
            {
            }
            column(PostingGroup; Customer."Customer Posting Group")
            {
            }
            column(Addr1; Customer.Address)
            {
            }
            column(Addr2; Customer."Address 2")
            {
            }
            column(City; Customer.City)
            {
            }
            column(Post; Customer."Post Code")
            {
            }
            column(OpeningBal; StartBalanceLCY)
            {
            }
            column(NetAmt; Customer."Net Change (LCY)")
            {
            }
            column(CustDateFilters; CustDateFilter)
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(CompanyPANNo; PANNO)
            {
            }
            column(ConfirmationAccount1; ConfirmationAccount)
            {
            }
            column(Current_Date; TODAY)
            {
            }
            column(Country_Region; Customer."Country/Region Code")
            {
            }
            column(Customer_PAN; Customer."P.A.N. No.")
            {
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                CalcFields = "Debit Amount", "Credit Amount";
                DataItemLink = "Customer No." = FIELD("No."),
                               "Posting Date" = FIELD("Date Filter"),
                               "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                               "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                               "Date Filter" = FIELD("Date Filter");
                DataItemTableView = SORTING("Customer No.", "Posting Date")
                                    ORDER(Ascending);
                column(PostingDate; "Cust. Ledger Entry"."Posting Date")
                {
                }
                column(DocNo; "Cust. Ledger Entry"."Document No.")
                {
                }
                column(Desc; "Cust. Ledger Entry".Description)
                {
                }
                column(Dim1; "Cust. Ledger Entry"."Global Dimension 1 Code")
                {
                }
                column(ExtDocNo; "Cust. Ledger Entry"."External Document No.")
                {
                }
                column(CustBalLCY; CustBalanceLCY)
                {
                }
                column(ShowCheck; ShowChek)
                {
                }
                column(CheckNo; Checkno)
                {
                }
                column(GLACNameDet; test1)
                {
                }
                column(TDSAmt; Tds)
                {
                }
                column(TDSAmt1; Tds1)
                {
                }
                column(ShowNar; ShowNarr)
                {
                }
                column(DbAmt; "Cust. Ledger Entry"."Debit Amount (LCY)")
                {
                }
                column(CrAmt; "Cust. Ledger Entry"."Credit Amount (LCY)")
                {
                }
                column(TotalBalance; TotBal)
                {
                }
                column(BalAcNo; "Cust. Ledger Entry"."Bal. Account No.")
                {
                }
                column(Amt; "Cust. Ledger Entry"."Amount (LCY)")
                {
                }

                trigger OnAfterGetRecord();
                begin

                    IF Customer.GET("Cust. Ledger Entry"."Customer No.") THEN
                        CustName := Customer.Name;
                    CALCFIELDS(Amount, "Remaining Amount", "Amount (LCY)", "Remaining Amt. (LCY)");

                    CustLedgEntryExists := TRUE;
                    IF PrintAmountsInLCY THEN BEGIN
                        CustAmount := "Amount (LCY)";
                        CustRemainAmount := "Remaining Amt. (LCY)";
                        CustCurrencyCode := '';
                    END ELSE BEGIN
                        CustAmount := Amount;
                        CustRemainAmount := "Remaining Amount";
                        CustCurrencyCode := "Currency Code";
                    END;
                    CustBalanceLCY := CustBalanceLCY + "Amount (LCY)";
                    IF ("Document Type" = "Document Type"::Payment) OR ("Document Type" = "Document Type"::Refund) THEN
                        CustEntryDueDate := 0D
                    ELSE
                        CustEntryDueDate := "Due Date";

                    IF NOT CustLedgEntryExists AND ((StartBalanceLCY = 0) OR NOT PrintAllHavingBal) THEN BEGIN
                        StartBalanceLCY := 0;
                        CurrReport.SKIP;
                    END;


                    BankAccouLedgerEntry.RESET;
                    BankAccouLedgerEntry.SETRANGE(BankAccouLedgerEntry."Document No.", "Cust. Ledger Entry"."Document No.");
                    IF BankAccouLedgerEntry.FINDFIRST THEN
                        Checkno := BankAccouLedgerEntry."Cheque No."
                    ELSE
                        Checkno := '';

                    //mariyappan
                    GLEntry.RESET;
                    GLEntry.SETRANGE(GLEntry."G/L Account No.", '1506210', '1506260');
                    GLEntry.SETRANGE(GLEntry."Document No.", "Cust. Ledger Entry"."Document No.");
                    IF GLEntry.FINDFIRST THEN
                        Tds := GLEntry.Amount
                    ELSE
                        Tds := 0;

                    Tds1 := -1 * Tds;
                    //GLEntry


                    test1 := '';
                    IF ("Cust. Ledger Entry"."Bal. Account No." <> '') OR ("Cust. Ledger Entry"."Bal. Account Type" =
                    "Cust. Ledger Entry"."Bal. Account Type"::"G/L Account") THEN
                        glaccount1.RESET;
                    glaccount1.SETRANGE(glaccount1."No.", "Cust. Ledger Entry"."Bal. Account No.");
                    IF glaccount1.FINDFIRST THEN
                        test1 := glaccount1.Name;


                    IF ("Cust. Ledger Entry"."Bal. Account No." <> '') OR ("Cust. Ledger Entry"."Bal. Account Type" =
                    "Cust. Ledger Entry"."Bal. Account Type"::"Bank Account") THEN
                        BankAccount.RESET;
                    BankAccount.SETRANGE(BankAccount."No.", "Cust. Ledger Entry"."Bal. Account No.");
                    IF BankAccount.FINDFIRST THEN
                        test1 := BankAccount.Name;

                    TotBal := TotBal + "Cust. Ledger Entry"."Amount (LCY)";
                end;

                trigger OnPreDataItem();
                begin

                    CustLedgEntryExists := FALSE;
                    CurrReport.CREATETOTALS(CustAmount, "Amount (LCY)");
                    CurrReport.CREATETOTALS("Cust. Ledger Entry"."Debit Amount", "Cust. Ledger Entry"."Credit Amount");
                end;
            }

            trigger OnAfterGetRecord();
            begin

                StartBalanceLCY := 0;
                IF CustDateFilter <> '' THEN
                    IF GETRANGEMIN("Date Filter") <> 0D THEN BEGIN
                        SETRANGE("Date Filter", 0D, GETRANGEMIN("Date Filter") - 1);
                        CALCFIELDS("Net Change (LCY)");
                        StartBalanceLCY := "Net Change (LCY)";
                        SETFILTER("Date Filter", CustDateFilter);
                    END;

                CurrReport.PRINTONLYIFDETAIL := NOT (PrintAllHavingBal AND (StartBalanceLCY <> 0));
                CustBalanceLCY := StartBalanceLCY;

                TotBal := TotBal + StartBalanceLCY;
            end;

            trigger OnPreDataItem();
            begin
                CurrReport.NEWPAGEPERRECORD := PrintOnlyOnePerPage;
                CurrReport.CREATETOTALS("Cust. Ledger Entry"."Amount (LCY)", StartBalanceLCY);
                CurrReport.CREATETOTALS("Cust. Ledger Entry"."Debit Amount", "Cust. Ledger Entry"."Credit Amount");
                CurrReport.CREATETOTALS(BalDebit, BalCredit);

                IF CompanyInfo.GET THEN
                    CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(ShowChek; ShowChek)
                {
                    Caption = 'Show Cheque Information';
                }
                field(ShowNarr; ShowNarr)
                {
                    Caption = 'Show Narration';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport();
    begin
        TotBal := 0;
        CustFilter := Customer.GETFILTERS;
        CustDateFilter := Customer.GETFILTER("Date Filter");
    end;

    var
        PrintAmountsInLCY: Boolean;
        PrintOnlyOnePerPage: Boolean;
        PrintAllHavingBal: Boolean;
        CustFilter: Text[250];
        CustDateFilter: Text[30];
        AmountCaption: Text[30];
        RemainingAmtCaption: Text[30];
        CustAmount: Decimal;
        CustRemainAmount: Decimal;
        CustBalanceLCY: Decimal;
        CustCurrencyCode: Code[10];
        CustEntryDueDate: Date;
        StartBalanceLCY: Decimal;
        CustLedgEntryExists: Boolean;
        CustWise: Boolean;
        ZoneWise: Boolean;
        CustName: Text[80];
        text1: Text[30];
        text2: Text[30];
        CustpostGroup: Record "Customer Posting Group";
        Description: Text[80];
        BalDebit: Decimal;
        BalCredit: Decimal;
        CustAddress: Text[250];
        BalAcName: Text[100];
        GLAccounts: Record "G/L Account";
        DimensionValue: Record "Dimension Value";
        DIM: Text[50];
        ShowNarr: Boolean;
        PostedNarration: Record "Posted Narration";
        Narration: Text[250];
        BankAccouLedgerEntry: Record "Bank Account Ledger Entry";
        Checkno: Text[30];
        ShowChek: Boolean;
        BankAccount: Record "Bank Account";
        BalAcType: Text[100];
        glaccount1: Record "G/L Account";
        test1: Text[100];
        GLEntry: Record "G/L Entry";
        Tds: Decimal;
        Tds1: Decimal;
        TotBal: Decimal;
        CompanyInfo: Record "Company Information";
        ConfirmationAccount: Label 'Given below is the details of your Accounts as standing in my/our Books of Accounts for the above mentioned period.Kindly return 3 copies stating your I.T. Permanent A/c No., duly signed and sealed, in confirmation of the same. Please note that if no replay is received from you within a fortnight, it will be assumed that you have accepted the balance shown below.';
        Address2: Label 'Head Office: 301, E-Square, Subhash Road, Vile Parle (East), Mumbai- 400 057, India.';
        PANNO: Label 'AACN4805H';
}

