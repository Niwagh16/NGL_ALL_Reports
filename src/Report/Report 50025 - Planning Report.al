report 50025 "Planning Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Planning Report.rdl';

    dataset
    {
        dataitem("Prod. Order Component"; "Prod. Order Component")
        {
            RequestFilterFields = "Due Date", "Item No.", "Location Code";
            column(ItemNo_ProdOrderComponent; "Prod. Order Component"."Item No.")
            {
            }
            column(ExpectedQuantity_ProdOrderComponent; "Prod. Order Component"."Expected Quantity")
            {
            }
            column(ProdOrderNo_ProdOrderComponent; "Prod. Order Component"."Prod. Order No.")
            {
            }
            column(weekno; weekno)
            {
            }
            column(weekyear; weekyear)
            {
            }
            column(Description_ProdOrderComponent; "Prod. Order Component".Description)
            {
            }
            column(LocationCode_ProdOrderComponent; "Prod. Order Component"."Location Code")
            {
            }
            column(BinCode_ProdOrderComponent; "Prod. Order Component"."Bin Code")
            {
            }
            column(UnitofMeasureCode_ProdOrderComponent; "Prod. Order Component"."Unit of Measure Code")
            {
            }
            column(Inventoryqty; Inventoryqty)
            {
            }

            trigger OnAfterGetRecord();
            begin
                weekno := DATE2DWY("Prod. Order Component"."Due Date", 2);
                weekyear := DATE2DWY("Prod. Order Component"."Due Date", 3);
                /*
                IF weekno = 2 THEN BEGIN
                  MESSAGE(FORMAT("Prod. Order Component"."Due Date"));
                  MESSAGE(FORMAT("Prod. Order Component"."Expected Quantity"));
                END;
                */
                BinContent.RESET;
                BinContent.SETRANGE(BinContent."Item No.", "Prod. Order Component"."Item No.");
                BinContent.SETRANGE(BinContent."Location Code", "Prod. Order Component"."Location Code");
                BinContent.SETRANGE(BinContent."Bin Code", "Prod. Order Component"."Bin Code");
                IF BinContent.FINDFIRST THEN
                    REPEAT
                        BinContent.CALCFIELDS(Quantity);
                        Inventoryqty := BinContent.Quantity;
                    UNTIL BinContent.NEXT = 0;

            end;

            trigger OnPreDataItem();
            begin
                StartDate := "Prod. Order Component".GETFILTER("Prod. Order Component"."Due Date");
                IF StartDate <> '' THEN
                    "Prod. Order Component".SETFILTER("Prod. Order Component"."Due Date", StartDate);
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
        weekno: Integer;
        weekyear: Integer;
        StartDate: Text;
        BinContent: Record "Bin Content";
        Inventoryqty: Decimal;
}

