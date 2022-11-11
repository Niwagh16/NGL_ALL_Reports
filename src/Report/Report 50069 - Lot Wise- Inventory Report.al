report 50069 "Lot Wise- Inventory Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Lot Wise- Inventory Report.rdl';

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
            column(UOM; "Warehouse Entry"."Unit of Measure Code")
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
            column(LocationCode_WarehouseEntry; "Warehouse Entry"."Location Code")
            {
            }
            column(CertificateNo; CertificateNo)
            {
            }
            column(ExternallotNo; 0) //ItemLedgerEntry."External Lot No.") //PCPL-Deepak
            {
            }

            trigger OnAfterGetRecord();
            begin
                //Location filter for user view data    (Start)

                IF "Warehouse Entry".GETFILTER("Location Code") <> '' THEN BEGIN
                    _usersetup.RESET;
                    _usersetup.SETRANGE("User ID", USERID);
                    IF _usersetup.FINDFIRST THEN BEGIN
                        // IF _usersetup."Location Code" <> '' THEN
                        //  "Warehouse Entry".SETFILTER("Location Code",_usersetup."Location Code");
                    END;
                END;
                //MESSAGE("Warehouse Entry".GETFILTER("Location Code"));
                //location filter for user view data (END)



                RecItem.RESET;
                RecItem.SETFILTER(RecItem."No.", "Warehouse Entry"."Item No.");
                IF RecItem.FIND('-') THEN
                    ItemDescription := RecItem.Description;

                ItemLedgerEntry.RESET;
                ItemLedgerEntry.SETRANGE("Item No.", "Warehouse Entry"."Item No.");
                ItemLedgerEntry.SETRANGE("Lot No.", "Warehouse Entry"."Lot No.");
                //ItemLedgerEntry.SETRANGE("Location Code","Warehouse Entry"."Location Code");
                ItemLedgerEntry.SETFILTER("Remaining Quantity", '<>%1', 0);
                IF ItemLedgerEntry.FINDFIRST THEN BEGIN
                    //   ItemLedgerEntry.CALCFIELDS("External Lot No.","Certificate No");
                    //   CertificateNo := ItemLedgerEntry."Certificate No"; //PCPL-Deepak
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
        ItemDescription: Text[150];
        RecItem: Record Item;
        _usersetup: Record "User Setup";
        ItemLedgerEntry: Record "Item Ledger Entry";
        CertificateNo: Text;
}

