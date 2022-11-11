report 50090 "Datewise Inventory summary-mth"
{
    // version Sanjay 18/06/2015

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Datewise Inventory summary-mth.rdl';

    dataset
    {
        dataitem("Warehouse Entry"; "Warehouse Entry")
        {
            DataItemTableView = SORTING("Entry No.");
            RequestFilterFields = "Item No.";
            column(ItemNo; "Warehouse Entry"."Item No.")
            {
            }
            column(Description; "Warehouse Entry".Description)
            {
            }
            column(BinCode; "Warehouse Entry"."Bin Code")
            {
            }
            column(LotNo; "Warehouse Entry"."Lot No.")
            {
            }
            column(Quantity; "Warehouse Entry".Quantity)
            {
            }
            column(Posting_Date; "Warehouse Entry"."Registering Date")
            {
                AutoFormatType = 0;
            }
            column(ItemDescription; ItemDescription)
            {
            }
            column(Source_Material; "Warehouse Entry"."Source Code")
            {
            }
            column(Source_No; "Warehouse Entry"."Source No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
                RecItem.RESET;
                RecItem.SETFILTER(RecItem."No.", "Warehouse Entry"."Item No.");
                IF RecItem.FIND('-') THEN
                    ItemDescription := RecItem.Description;


                //Location filter for user view data    (Start)

                IF "Warehouse Entry".GETFILTER("Location Code") <> '' THEN BEGIN
                    _usersetup.RESET;
                    _usersetup.SETRANGE("User ID", USERID);
                    IF _usersetup.FINDFIRST THEN BEGIN
                        IF _usersetup."Location Code" <> '' THEN
                            "Warehouse Entry".SETFILTER("Location Code", _usersetup."Location Code");
                    END;
                END;
                //MESSAGE("Warehouse Entry".GETFILTER("Location Code"));
                //location filter for user view data (END)
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

    trigger OnPreReport();
    begin
        IF (StartDate = 0D) AND (EndDate = 0D) THEN
            EndDate := WORKDATE;

        IF StartDate IN [0D, 00000101D] THEN
            StartDateText := ''
        ELSE
            StartDateText := FORMAT(StartDate - 1);

        ItemFilter := RecItem.GETFILTERS;
    end;

    var
        ItemDescription: Text[150];
        RecItem: Record Item;
        RecItemledger: Record "Item Ledger Entry";
        COA_No: Text;
        StartDate: Date;
        EndDate: Date;
        ShowExpected: Boolean;
        ItemFilter: Text;
        StartDateText: Text[10];
        ValueOfInvoicedQty: Decimal;
        ValueOfQtyOnHand: Decimal;
        ValueOfInvIncreases: Decimal;
        ValueOfRcdIncreases: Decimal;
        CostOfInvDecreases: Decimal;
        CostOfShipDecreases: Decimal;
        InvCostPostedToGL: Decimal;
        CostPostedToGL: Decimal;
        InvoicedQty: Decimal;
        QtyOnHand: Decimal;
        InvIncreases: Decimal;
        RcdIncreases: Decimal;
        InvDecreases: Decimal;
        ShipDecreases: Decimal;
        ExpCostPostedToGL: Decimal;
        _usersetup: Record "User Setup";
}

