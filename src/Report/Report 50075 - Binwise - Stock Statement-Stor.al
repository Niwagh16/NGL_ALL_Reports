report 50075 "Binwise - Stock Statement-Stor"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Binwise - Stock Statement-Stor.rdl';

    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = SORTING("Gen. Prod. Posting Group");
            RequestFilterFields = "No.", "Date Filter", "Bin Filter", "Gen. Prod. Posting Group";
            column(GenProdPostingGroup_Item; Item."Gen. Prod. Posting Group")
            {
            }
            column(No_Item; Item."No.")
            {
            }
            column(Description_Item; Item.Description)
            {
            }
            column(BaseUnitofMeasure_Item; Item."Base Unit of Measure")
            {
            }
            column(SaleDec; SaleDec)
            {
            }
            column(Decrease; Decrease)
            {
            }
            column(Increase; Increase)
            {
            }
            column(OpeningBalance; OpeningBalance)
            {
            }
            column(ClosingStock; ClosingStock)
            {
            }
            column(QCSample; QCSample)
            {
            }

            trigger OnAfterGetRecord();
            begin
                CLEAR(Decrease);
                CLEAR(Increase);
                CLEAR(SaleDec);
                CLEAR(OpeningBalance);
                CLEAR(ClosingStock);

                WarehouseEntry2.RESET;
                WarehouseEntry2.SETRANGE("Item No.", Item."No.");
                WarehouseEntry2.SETFILTER("Registering Date", '%1..%2', GETRANGEMIN("Date Filter"), GETRANGEMAX("Date Filter"));
                IF GETFILTER("Bin Filter") <> '' THEN
                    WarehouseEntry2.SETFILTER("Bin Code", '%1', GETFILTER("Bin Filter"));
                IF WarehouseEntry2.FINDSET THEN
                    REPEAT
                        //ClosingStock += WarehouseEntry2.Quantity;

                        IF WarehouseEntry2.Quantity > 0 THEN
                            Increase += WarehouseEntry2.Quantity;

                        IF (WarehouseEntry2.Quantity < 0) AND (WarehouseEntry2."Whse. Document Type" <> WarehouseEntry2."Whse. Document Type"::Shipment)
                           OR (WarehouseEntry2."Source Document" <> WarehouseEntry2."Source Document"::"S. Order") THEN
                            Decrease += WarehouseEntry2.Quantity;

                        IF (WarehouseEntry2.Quantity < 0) AND (WarehouseEntry2."Whse. Document Type" = WarehouseEntry2."Whse. Document Type"::Shipment)
                        AND (WarehouseEntry2."Source Document" = WarehouseEntry2."Source Document"::"S. Order") THEN
                            SaleDec += WarehouseEntry2.Quantity;

                        IF (WarehouseEntry2.Quantity < 0) AND (WarehouseEntry2."Whse. Document Type" = WarehouseEntry2."Whse. Document Type"::Shipment)
                        AND (WarehouseEntry2."Source Document" = WarehouseEntry2."Source Document"::"Item Jnl.") THEN
                            QCSample += WarehouseEntry2.Quantity;

                    UNTIL WarehouseEntry2.NEXT = 0;

                CLEAR(OpeningBalance);
                WarehouseEntry.RESET;
                WarehouseEntry.SETRANGE("Item No.", Item."No.");
                WarehouseEntry.SETRANGE("Registering Date", 0D, StartDate - 1);
                IF GETFILTER("Bin Filter") <> '' THEN
                    WarehouseEntry.SETFILTER("Bin Code", '%1', GETFILTER("Bin Filter"));
                IF WarehouseEntry.FINDSET THEN
                    REPEAT
                        OpeningBalance += WarehouseEntry.Quantity;
                    UNTIL WarehouseEntry.NEXT = 0;

                ClosingStock := OpeningBalance + Increase - ABS(Decrease) - ABS(SaleDec);
            end;

            trigger OnPreDataItem();
            begin
                StartDate := GETRANGEMIN("Date Filter");
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
        Increase: Decimal;
        Decrease: Decimal;
        SaleDec: Decimal;
        OpeningBalance: Decimal;
        WarehouseEntry: Record "Warehouse Entry";
        StartDate: Date;
        ClosingStock: Decimal;
        WarehouseEntry2: Record "Warehouse Entry";
        QCSample: Decimal;
        TransferAnx: Decimal;
}

