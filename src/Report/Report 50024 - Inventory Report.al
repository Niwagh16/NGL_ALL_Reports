report 50024 "Inventory Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Inventory Report.rdl';

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            column(ItemNo_ItemLedgerEntry; "Item Ledger Entry"."Item No.")
            {
            }
            column(PostingDate_ItemLedgerEntry; "Item Ledger Entry"."Posting Date")
            {
            }
            column(Description_ItemLedgerEntry; "Item Ledger Entry".Description)
            {
            }
            column(LocationCode_ItemLedgerEntry; "Item Ledger Entry"."Location Code")
            {
            }
            column(LotNo_ItemLedgerEntry; "Item Ledger Entry"."Lot No.")
            {
            }
            column(UnitofMeasureCode_ItemLedgerEntry; "Item Ledger Entry"."Unit of Measure Code")
            {
            }
            column(desc; desc)
            {
            }
            column(uom; uom)
            {
            }
            column(PosQty; PosQty)
            {
            }
            column(NegQty; NegQty)
            {
            }
            column(NegValue; NegValue)
            {
            }
            column(PosValue; PosValue)
            {
            }
            column(NegRate; NegRate)
            {
            }
            column(PosRate; PosRate)
            {
            }
            column(OpenValue; OpenValue)
            {
            }
            column(OpenRate; OpenRate)
            {
            }
            column(OpenQty; OpenQty)
            {
            }
            column(Inwrate; Inwrate)
            {
            }
            column(InwQty; InwQty)
            {
            }
            column(InwValue; InwValue)
            {
            }
            column(QtyoutW; QtyoutW)
            {
            }
            column(rateoutW; rateoutW)
            {
            }
            column(valueoutW; valueoutW)
            {
            }
            column(CloseQty; CloseQty)
            {
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(PosValue);
                CLEAR(NegValue);
                CLEAR(NegQty);
                CLEAR(PosQty);
                CLEAR(InwQty);
                CLEAR(InwValue);
                CLEAR(Inwrate);
                CLEAR(PosRate);
                CLEAR(OpenRate);
                CLEAR(OpenQty);
                CLEAR(OpenValue);
                CLEAR(QtyoutW);
                CLEAR(rateoutW);
                CLEAR(valueoutW);
                CLEAR(NegRate);
                "Item Ledger Entry".CALCFIELDS("Item Ledger Entry"."Cost Amount (Actual)");
                RecItem.RESET;
                RecItem.SETRANGE(RecItem."No.", "Item Ledger Entry"."Item No.");
                IF RecItem.FINDFIRST THEN BEGIN
                    desc := RecItem.Description;
                    uom := RecItem."Base Unit of Measure";
                    RecItem.CALCFIELDS(RecItem.Inventory);
                    IF (RecItem.Inventory = 0) OR (RecItem."Inventory Value Zero" = TRUE) OR (RecItem."Inventory Posting Group" = 'BY-PRODUCT')
                     OR (RecItem."Inventory Posting Group" = 'RECOVERED') THEN
                        CurrReport.SKIP;
                END;

                IF LotNo <> "Item Ledger Entry"."Lot No." THEN BEGIN
                    LotNo := "Item Ledger Entry"."Lot No.";
                    ILE.RESET;
                    ILE.SETCURRENTKEY("Item No.", "Posting Date", "Lot No.");
                    ILE.SETRANGE(ILE."Item No.", "Item Ledger Entry"."Item No.");
                    ILE.SETRANGE(ILE."Lot No.", "Item Ledger Entry"."Lot No.");
                    ILE.SETRANGE(ILE."Posting Date", 0D, StartDate - 1);
                    IF ILE.FINDFIRST THEN BEGIN
                        REPEAT
                            ILE.CALCFIELDS(ILE."Cost Amount (Actual)");
                            OpenQty += ILE.Quantity;
                            OpenValue += ILE."Cost Amount (Actual)";

                        UNTIL ILE.NEXT = 0;
                    END;
                    //END;
                    ILE.RESET;
                    ILE.SETCURRENTKEY("Item No.", "Posting Date", "Lot No.");
                    ILE.SETRANGE(ILE."Item No.", "Item Ledger Entry"."Item No.");
                    ILE.SETRANGE(ILE."Lot No.", "Item Ledger Entry"."Lot No.");
                    ILE.SETRANGE(ILE."Posting Date", StartDate, EndDate);
                    IF ILE.FINDSET THEN
                        REPEAT
                            IF (ILE."Document Type" = ILE."Document Type"::"Transfer Shipment") OR (ILE."Document Type" = ILE."Document Type"::"Sales Shipment")
                          OR (ILE."Document Type" = ILE."Document Type"::"Purchase Return Shipment") OR (ILE."Entry Type" = ILE."Entry Type"::Consumption)
                          THEN BEGIN
                                ILE.CALCFIELDS(ILE."Cost Amount (Actual)");
                                QtyoutW += ILE.Quantity;
                                valueoutW += ILE."Cost Amount (Actual)";
                            END;
                        UNTIL ILE.NEXT = 0;
                    IF "Item Ledger Entry"."Entry Type" = "Item Ledger Entry"."Entry Type"::"Negative Adjmt." THEN BEGIN
                        NegValue += ("Item Ledger Entry"."Cost Amount (Actual)");
                        NegQty += ("Item Ledger Entry".Quantity);
                    END;

                END;


                IF OpenQty <> 0 THEN
                    OpenRate := OpenValue / OpenQty;

                IF QtyoutW <> 0 THEN
                    rateoutW := valueoutW / QtyoutW;

                CloseQty += "Item Ledger Entry".Quantity;
                IF "Item Ledger Entry"."Entry Type" = "Item Ledger Entry"."Entry Type"::"Positive Adjmt." THEN BEGIN
                    PosValue += ("Item Ledger Entry"."Cost Amount (Actual)");
                    PosQty += ("Item Ledger Entry".Quantity);
                END;

                // IF "Item Ledger Entry"."Entry Type"="Item Ledger Entry"."Entry Type"::"Negative Adjmt." THEN BEGIN
                //  NegValue += ("Item Ledger Entry"."Cost Amount (Actual)");
                //  NegQty += ("Item Ledger Entry".Quantity);
                // END;

                IF ("Item Ledger Entry"."Document Type" = "Item Ledger Entry"."Document Type"::"Purchase Receipt") OR ("Item Ledger Entry"."Document Type" = "Item Ledger Entry"."Document Type"::"Transfer Receipt")
                  OR ("Item Ledger Entry"."Document Type" = "Item Ledger Entry"."Document Type"::"Sales Return Receipt") OR ("Item Ledger Entry"."Entry Type" = "Item Ledger Entry"."Entry Type"::Output)
                  THEN BEGIN
                    InwQty += "Item Ledger Entry".Quantity;
                    InwValue += "Item Ledger Entry"."Cost Amount (Actual)";
                END;

                // IF ("Item Ledger Entry"."Document Type"="Item Ledger Entry"."Document Type"::"Transfer Shipment") OR ("Item Ledger Entry"."Document Type"="Item Ledger Entry"."Document Type"::"Sales Shipment")
                //  OR ("Item Ledger Entry"."Document Type"="Item Ledger Entry"."Document Type"::"Purchase Return Shipment") OR ("Item Ledger Entry"."Entry Type"="Item Ledger Entry"."Entry Type"::Consumption)
                //  THEN BEGIN
                //  QtyoutW+= ABS("Item Ledger Entry".Quantity);
                //  valueoutW+= ABS("Item Ledger Entry"."Cost Amount (Actual)");
                // END;

                //MESSAGE(FORMAT(QtyoutW));
                IF (NegQty <> 0) AND (NegValue <> 0) THEN
                    NegRate := NegValue / NegQty;
                IF (PosQty <> 0) AND (PosValue <> 0) THEN
                    PosRate := PosValue / PosQty;
                IF InwQty <> 0 THEN
                    Inwrate := InwValue / InwQty;
                // IF QtyoutW <>0 THEN
                //  rateoutW += valueoutW/QtyoutW;
            end;

            trigger OnPreDataItem();
            begin
                IF (StartDate <> 0D) AND (EndDate <> 0D) THEN
                    "Item Ledger Entry".SETRANGE("Item Ledger Entry"."Posting Date", StartDate, EndDate);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(General)
                {
                    field("Start Date"; StartDate)
                    {
                    }
                    field("End Date"; EndDate)
                    {
                    }
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

    var
        InwQty: Decimal;
        Inwrate: Decimal;
        InwValue: Decimal;
        RecItem: Record Item;
        desctext: Integer;
        desc: Text;
        uom: Code[20];
        StartDate: Date;
        EndDate: Date;
        OpenQty: Decimal;
        OpenRate: Decimal;
        OpenValue: Decimal;
        QtyoutW: Decimal;
        rateoutW: Decimal;
        valueoutW: Decimal;
        PosQty: Decimal;
        PosRate: Decimal;
        PosValue: Decimal;
        NegQty: Decimal;
        NegRate: Decimal;
        NegValue: Decimal;
        ValueENtry: Record "Value Entry";
        ItemNo: Code[10];
        ILE: Record "Item Ledger Entry";
        VLE: Record "Value Entry";
        lot: Code[20];
        LotNo: Text;
        qty: Decimal;
        ItemNo1: Code[10];
        CloseQty: Decimal;
}

