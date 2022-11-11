report 50015 "Vendor Confirmation Account"
{
    // version KAR 1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Vendor Confirmation Account.rdl';

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            CalcFields = "Net Change (LCY)";
            RequestFilterFields = "No.", "Date Filter";
            column(HO_Address; Address2)
            {
            }
            column(VendorNo; Vendor."No.")
            {
            }
            column(VendorName; Vendor.Name)
            {
            }
            column(VendorAddress; Vendor.Address + ',' + Vendor."Address 2" + ',' + Vendor.City + ',' + Vendor."Post Code" + ',' + Vendor."Country/Region Code")
            {
            }
            column(VendorCity; Vendor.City)
            {
            }
            column(PostingGroup; Vendor."Vendor Posting Group")
            {
            }
            column(StartBalance; StartBalanceLCY)
            {
            }
            column(PrintAll; PrintAllHavingBal)
            {
            }
            column(VendDateFilter; VendDateFilter)
            {
            }
            column(PrintOnly; PrintOnlyOnePerPage)
            {
            }
            column(NetChange; Vendor."Net Change (LCY)")
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(Company_name; CompanyInfo.Name)
            {
            }
            column(ConfirmationAccount1; ConfirmationAccount)
            {
            }
            column(VendorPANNo; Vendor."P.A.N. No.")
            {
            }
            column(CompanyPANNo; PANNO)
            {
            }
            column(Current_Date; TODAY)
            {
            }
            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                CalcFields = "Debit Amount", "Credit Amount";
                DataItemLink = "Vendor No." = FIELD("No."),
                               "Date Filter" = FIELD("Date Filter"),
                               "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                               "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                               "Posting Date" = FIELD("Date Filter");
                DataItemTableView = SORTING("Entry No.")
                                    ORDER(Ascending);
                column(PostingDate; "Vendor Ledger Entry"."Posting Date")
                {
                }
                column(DocNo; "Vendor Ledger Entry"."Document No.")
                {
                }
                column(SBU; "Vendor Ledger Entry"."Global Dimension 1 Code")
                {
                }
                column(Desc; "Vendor Ledger Entry".Description)
                {
                }
                column(TDS; "Vendor Ledger Entry"."Total TDS Including SHE CESS")
                {
                }
                column(DbAmt; "Vendor Ledger Entry"."Debit Amount (LCY)")
                {
                }
                column(CrAmt; "Vendor Ledger Entry"."Credit Amount (LCY)")
                {
                }
                column(InvNo; InvoiceNo)
                {
                }
                column(ExtDocNo; "Vendor Ledger Entry"."External Document No.")
                {
                }
                column(Amt; "Vendor Ledger Entry".Amount)
                {
                }
                column(TotalBalance; TotalBal)
                {
                }
                column(Check_No; Checkno)
                {
                }
                column(BalACNo; "Vendor Ledger Entry"."Bal. Account No.")
                {
                }
                column(GLACName; test1)
                {
                }
                column(CheckBool; ShowCheckNo)
                {
                }
                column(ShowNar; ShowNarration)
                {
                }
                column(Amtt; Amtt)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    PIH.RESET;
                    PIH.SETRANGE(PIH."No.", "Vendor Ledger Entry"."Document No.");
                    IF PIH.FINDFIRST THEN
                        InvoiceNo := PIH."Vendor Invoice No.";

                    TotalBal := TotalBal + "Vendor Ledger Entry".Amount;

                    CALCFIELDS(Amount, "Remaining Amount", "Amount (LCY)", "Remaining Amt. (LCY)");

                    VendLedgEntryExists := TRUE;
                    IF PrintAmountsInLCY THEN BEGIN
                        VendAmount := "Amount (LCY)";
                        VendRemainAmount := "Remaining Amt. (LCY)";
                        VendCurrencyCode := '';
                    END ELSE BEGIN
                        VendAmount := Amount;
                        VendRemainAmount := "Remaining Amount";
                        VendCurrencyCode := "Currency Code";
                    END;
                    VendBalanceLCY := VendBalanceLCY + "Amount (LCY)";
                    IF ("Document Type" = "Document Type"::Payment) OR ("Document Type" = "Document Type"::Refund) THEN
                        VendEntryDueDate := 0D
                    ELSE
                        VendEntryDueDate := "Due Date";
                    IF NOT VendLedgEntryExists AND ((StartBalanceLCY = 0) OR NOT PrintAllHavingBal) THEN BEGIN
                        StartBalanceLCY := 0;
                        CurrReport.SKIP;
                    END;



                    BankAccouLedgerEntry.RESET;
                    BankAccouLedgerEntry.SETRANGE(BankAccouLedgerEntry."Document No.", "Vendor Ledger Entry"."Document No.");
                    IF BankAccouLedgerEntry.FINDFIRST THEN
                        Checkno := BankAccouLedgerEntry."Cheque No."
                    ELSE
                        Checkno := '';

                    test1 := '';
                    IF ("Vendor Ledger Entry"."Bal. Account No." <> '') OR ("Vendor Ledger Entry"."Bal. Account Type" =
                    "Vendor Ledger Entry"."Bal. Account Type"::"G/L Account") THEN
                        glaccount1.RESET;
                    //glaccount1.SETRANGE("Cust. Ledger Entry"."Bal. Account Type",'G/L Account');
                    glaccount1.SETRANGE(glaccount1."No.", "Vendor Ledger Entry"."Bal. Account No.");
                    IF glaccount1.FINDFIRST THEN
                        test1 := glaccount1.Name;


                    IF ("Vendor Ledger Entry"."Bal. Account No." <> '') OR ("Vendor Ledger Entry"."Bal. Account Type" =
                    "Vendor Ledger Entry"."Bal. Account Type"::"Bank Account") THEN
                        BankAccount.RESET;
                    BankAccount.SETRANGE(BankAccount."No.", "Vendor Ledger Entry"."Bal. Account No.");
                    IF BankAccount.FINDFIRST THEN
                        test1 := BankAccount.Name;
                    //mariyappan
                    purinvoicehead.RESET;
                    purinvoicehead.SETRANGE(purinvoicehead."No.", "Vendor Ledger Entry"."Document No.");
                    IF purinvoicehead.FINDFIRST THEN
                        InvoiceNo := purinvoicehead."Vendor Invoice No."
                    ELSE
                        InvoiceNo := '';

                    Amtt += "Vendor Ledger Entry".Amount;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                StartBalanceLCY := 0;
                //StartCreditBalance:=0;
                //StartDebitBalance:=0;
                IF (Vendor."Approval Date" = 0D) AND (Vendor."Approval Date 2" = 0D) THEN BEGIN
                    IF VendDateFilter <> '' THEN
                        IF GETRANGEMIN("Date Filter") <> 0D THEN BEGIN
                            SETRANGE("Date Filter", 0D, GETRANGEMIN("Date Filter") - 1);
                            CALCFIELDS("Net Change (LCY)");
                            StartBalanceLCY := -"Net Change (LCY)";
                            SETFILTER("Date Filter", VendDateFilter);
                        END;
                    CurrReport.PRINTONLYIFDETAIL := NOT (PrintAllHavingBal AND (StartBalanceLCY <> 0));
                    VendBalanceLCY := StartBalanceLCY;

                    //Mariyappan
                    "Vendor Ledger Entry".RESET;
                    "Vendor Ledger Entry".SETCURRENTKEY("Vendor No.", "Posting Date");
                    "Vendor Ledger Entry".SETRANGE("Vendor Ledger Entry"."Vendor No.", Vendor."No.");
                    "Vendor Ledger Entry".SETFILTER("Vendor Ledger Entry"."Posting Date", '%1..%2', 0D, NORMALDATE(GETRANGEMIN(Vendor."Date Filter") - 1));
                    "Vendor Ledger Entry".CALCSUMS("Vendor Ledger Entry"."Total TDS Including SHE CESS");
                    opentds := "Vendor Ledger Entry"."Total TDS Including SHE CESS";
                END
                //PCPL-25
                ELSE BEGIN
                    IF (Vendor."Approval Date" <> 0D) AND (Vendor."Approval Date 2" <> 0D) THEN
                        IF (Vendor."Approval Date" <> 0D) AND (Vendor."Approval Date 2" <> 0D) THEN BEGIN
                            SETRANGE("Date Filter", 0D, Vendor."Approval Date" - 1);
                            CALCFIELDS("Net Change (LCY)");
                            StartBalanceLCY := -"Net Change (LCY)";
                            SETRANGE("Date Filter", Vendor."Approval Date", Vendor."Approval Date 2");
                        END;
                    CurrReport.PRINTONLYIFDETAIL := NOT (PrintAllHavingBal AND (StartBalanceLCY <> 0));
                    VendBalanceLCY := StartBalanceLCY;
                    "Vendor Ledger Entry".RESET;
                    "Vendor Ledger Entry".SETCURRENTKEY("Vendor No.", "Posting Date");
                    "Vendor Ledger Entry".SETRANGE("Vendor Ledger Entry"."Vendor No.", Vendor."No.");
                    "Vendor Ledger Entry".SETFILTER("Vendor Ledger Entry"."Posting Date", '%1..%2', 0D, NORMALDATE(Vendor."Approval Date" - 1));
                    "Vendor Ledger Entry".CALCSUMS("Vendor Ledger Entry"."Total TDS Including SHE CESS");
                    opentds := "Vendor Ledger Entry"."Total TDS Including SHE CESS";
                END;
                //PCPL-25
                TotalBal := TotalBal + StartBalanceLCY;
            end;

            trigger OnPreDataItem();
            begin
                CurrReport.NEWPAGEPERRECORD := PrintOnlyOnePerPage;
                CurrReport.CREATETOTALS("Vendor Ledger Entry"."Amount (LCY)", StartBalanceLCY);
                CurrReport.CREATETOTALS("Vendor Ledger Entry"."Credit Amount (LCY)", "Vendor Ledger Entry"."Debit Amount (LCY)");

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
                field(ShowCheckNo; ShowCheckNo)
                {
                    Caption = 'Show Check No And  Balance Account No';
                    Visible = false;
                }
                field(ShowNarration; ShowNarration)
                {
                    Caption = 'Show Narration';
                    Visible = false;
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
        TotalBal := 0;
        VendFilter := Vendor.GETFILTERS;
        VendDateFilter := Vendor.GETFILTER("Date Filter");
    end;

    var
        PIH: Record "Purch. Inv. Header";
        InvoiceNo: Text;
        PrintOnlyOnePerPage: Boolean;
        StartBalanceLCY: Decimal;
        VendDateFilter: Text[100];
        PrintAllHavingBal: Boolean;
        VendBalanceLCY: Decimal;
        VendFilter: Text[250];
        VendLedgEntryExists: Boolean;
        PrintAmountsInLCY: Boolean;
        VendAmount: Decimal;
        VendRemainAmount: Decimal;
        VendCurrencyCode: Code[10];
        VendEntryDueDate: Date;
        BankAccouLedgerEntry: Record "Bank Account Ledger Entry";
        Checkno: Code[20];
        test1: Text;
        glaccount1: Record "G/L Account";
        BankAccount: Record "Bank Account";
        purinvoicehead: Record "Purch. Inv. Header";
        opentds: Decimal;
        TotalBal: Decimal;
        CompanyInfo: Record "Company Information";
        ShowCheckNo: Boolean;
        ShowNarration: Boolean;
        ConfirmationAccount: Label 'Given below is the details of your Accounts as standing in my/our Books of Accounts for the above mentioned period.Kindly return 3 copies stating your I.T. Permanent A/c No., duly signed and sealed, in confirmation of the same. Please note that if no replay is received from you within a fortnight, it will be assumed that you have accepted the balance shown below.';
        Address2: Label 'Head Office: 301, E-Square, Subhash Road, Vile Parle (East),Mumbai- 400 057, India.  ';
        PANNO: Label 'AACN4805H';
        Amtt: Decimal;
}

