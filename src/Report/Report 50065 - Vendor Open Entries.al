report 50065 "Vendor Open Entries"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Vendor Open Entries.rdl';

    dataset
    {
        dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
        {
            DataItemTableView = SORTING("Vendor No.", "Posting Date", "Currency Code")
                                ORDER(Ascending)
                                WHERE(Open = CONST(true));
            RequestFilterFields = "Entry No.";
            column(VendorNo_VendorLedgerEntry; "Vendor Ledger Entry"."Vendor No.")
            {
            }
            column(PostingDate_VendorLedgerEntry; "Vendor Ledger Entry"."Posting Date")
            {
            }
            column(RemainingAmount_VendorLedgerEntry; "Vendor Ledger Entry"."Remaining Amount")
            {
            }
            column(EntryNo_VendorLedgerEntry; "Vendor Ledger Entry"."Entry No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IsPos := FALSE;
                Isneg := FALSE;
                "Vendor Ledger Entry".CALCFIELDS("Remaining Amount");
                IF "Vendor Ledger Entry"."Remaining Amount" > 0 THEN BEGIN
                    VendEntry.RESET;
                    VendEntry.SETCURRENTKEY("Vendor No.");
                    VendEntry.SETRANGE("Vendor No.", "Vendor Ledger Entry"."Vendor No.");
                    VendEntry.SETRANGE(Open, TRUE);
                    IF VendEntry.FINDSET THEN
                        REPEAT
                            VendEntry.CALCFIELDS("Remaining Amount");
                            IF VendEntry."Remaining Amount" < 0 THEN
                                IsPos := TRUE;
                        UNTIL VendEntry.NEXT = 0;

                END ELSE
                    IF "Vendor Ledger Entry"."Remaining Amount" < 0 THEN BEGIN
                        VendEntry.RESET;
                        VendEntry.SETCURRENTKEY("Vendor No.");
                        VendEntry.SETRANGE("Vendor No.", "Vendor Ledger Entry"."Vendor No.");
                        VendEntry.SETRANGE(Open, TRUE);
                        IF VendEntry.FINDSET THEN
                            REPEAT
                                VendEntry.CALCFIELDS("Remaining Amount");
                                IF VendEntry."Remaining Amount" > 0 THEN
                                    Isneg := TRUE;
                            UNTIL VendEntry.NEXT = 0;

                    END;
                IF NOT IsPos THEN BEGIN
                    IF NOT Isneg THEN
                        CurrReport.SKIP;
                END;
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
    }

    var
        VendEntry: Record "Vendor Ledger Entry";
        IsPos: Boolean;
        VendNo: Code[20];
        Isneg: Boolean;
}

