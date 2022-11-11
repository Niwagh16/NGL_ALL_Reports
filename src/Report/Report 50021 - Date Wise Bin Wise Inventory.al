report 50021 "Date Wise/ Bin Wise Inventory"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Date Wise Bin Wise Inventory.rdl';

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
            column(BatchNo_Used; "Warehouse Entry"."Source No.")
            {
            }

            trigger OnAfterGetRecord();
            begin
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


                RecItem.RESET;
                RecItem.SETFILTER(RecItem."No.", "Warehouse Entry"."Item No.");
                IF RecItem.FIND('-') THEN
                    ItemDescription := RecItem.Description;
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
        ItemDescription: Text[150];
        RecItem: Record Item;
        _usersetup: Record "User Setup";
}

