report 50017 "Bin Card - Job work2"
{
    // version KAR 1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Bin Card - Job work2.rdl';

    dataset
    {
        dataitem("Warehouse Entry"; "Warehouse Entry")
        {
            DataItemTableView = SORTING("Entry No.");
            RequestFilterFields = "Item No.", "Location Code", "Bin Code", "Registering Date", "Lot No.";
            column(Date; "Warehouse Entry"."Registering Date")
            {
            }
            column(Description; "Warehouse Entry".Description)
            {
            }
            column(DocumentNo; "Warehouse Entry"."Source No.")
            {
            }
            column(OpeningBalance; OpeningBalance)
            {
            }
            column(ReceivedQty; ReceivedQty)
            {
            }
            column(SampleQty; SampleQty)
            {
            }
            column(IssuedQty; IssuedQty)
            {
            }
            column(BalanceQty; BalanceQty)
            {
            }
            column(TempReceivedQty; TempReceivedQty)
            {
            }
            column(LotNo_WarehouseEntry; "Warehouse Entry"."Lot No.")
            {
            }
            column(VendorName; VendorName)
            {
            }
            column(ItemNo; "Warehouse Entry"."Item No.")
            {
            }
            column(ItemDescription; ItemDescription)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(LineDescription; LineDescription)
            {
            }
            column(ReferenceNo; "Warehouse Entry"."Reference No.")
            {
            }
            column(CertificateNo; InspectionDataSheet."Certificate No.")
            {
            }
            column(MFGDate; InspectionDataSheet."Mfg. Date")
            {
            }
            column(ExpiryDate; 'InspectionDataSheet.Expiry_Date')
            {
            }
            column(filters; Filter)
            {
            }
            column(UOM; WarehouseEntry."Unit of Measure Code")
            {
            }
            column(RETDate; InspectionDataSheet."Retest on")
            {
            }
            column(Density1; Density)
            {
            }
            column(CertificateNo1; CertificateNo1)
            {
            }
            column(OpnQty; OpnQty)
            {
            }
            column(CloseQty; CloseQty)
            {
            }
            column(OpeningQty; OpeningQty)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF Item.GET("Item No.") THEN
                    ItemDescription := Item.Description;
                //Add for density   sanjay 09/aug/2016

                CLEAR(ItemUnitofMeasure);
                ItemUnitofMeasure.RESET;
                ItemUnitofMeasure.SETRANGE(ItemUnitofMeasure."Item No.", "Warehouse Entry"."Item No.");
                IF ItemUnitofMeasure.FINDFIRST THEN
                    Density := ''; //ItemUnitofMeasure.DENSITY; //PCPL-Deepak
                                   //MESSAGE(ItemUnitofMeasure.DENSITY);
                                   //Add for density   sanjay 09/aug/2016


                CLEAR(InspectionDataSheet);
                InspectionDataSheet.RESET;
                InspectionDataSheet.SETRANGE("Item No.", "Item No.");
                InspectionDataSheet.SETRANGE("Lot No.", "Lot No.");
                IF InspectionDataSheet.FINDFIRST THEN;

                CLEAR(SampleQty);
                CLEAR(ReceivedQty);
                CLEAR(IssuedQty);
                CLEAR(VendorName);
                CLEAR(LineDescription);

                IF Quantity > 0 THEN BEGIN
                    // SampleQty := InspectionDataSheet."Sample Drawn Quantity"; //0.01;
                    ReceivedQty := Quantity - SampleQty;
                    TempReceivedQty += ReceivedQty;

                    IF Item2.GET("Item No.") THEN
                        LineDescription := Item2.Description;

                    IF PurchRcptHeader.GET("Reference No.") THEN
                        VendorName := PurchRcptHeader."Buy-from Vendor Name";
                END;

                IF Quantity < 0 THEN BEGIN
                    IssuedQty := ABS(Quantity);
                    TempIssuedQty += ABS(IssuedQty);
                END;


                //PCPL_25 11nov21
                IF cnt <> 0 THEN
                    OpeningQty := BalanceQty;
                //PCPL_25 11nov21
                BalanceQty := OpeningBalance + TempReceivedQty - TempIssuedQty;

                //PCPL_25 11nov21
                //MESSAGE(FORMAT(OpeningQty));
                WarehouseEntry.RESET;
                WarehouseEntry.SETRANGE("Item No.", GETFILTER("Item No."));
                WarehouseEntry.SETRANGE("Registering Date", GETRANGEMIN("Registering Date"), GETRANGEMAX("Registering Date"));
                WarehouseEntry.SETRANGE("Bin Code", GETFILTER("Bin Code"));
                WarehouseEntry.SETRANGE("Location Code", GETFILTER("Location Code"));
                WarehouseEntry.SETRANGE("Lot No.", GETFILTER("Lot No."));
                IF WarehouseEntry.FINDSET THEN BEGIN
                    cnt := WarehouseEntry.COUNT;
                END;
                //PCPL_25 11nov21

                //pcpl0024
                InspectionDataSheet1.RESET;
                InspectionDataSheet1.SETRANGE(InspectionDataSheet1."Lot No.", "Warehouse Entry"."Lot No.");
                IF InspectionDataSheet1.FINDLAST THEN
                    CertificateNo1 := InspectionDataSheet1."Certificate No.";
            end;

            trigger OnPreDataItem();
            begin
                CLEAR(OpeningBalance);
                CLEAR(OpnQty);
                WarehouseEntry.RESET;
                WarehouseEntry.SETRANGE("Item No.", GETFILTER("Item No."));
                WarehouseEntry.SETRANGE("Registering Date", 0D, GETRANGEMIN("Registering Date") - 1);
                WarehouseEntry.SETRANGE("Bin Code", GETFILTER("Bin Code"));
                WarehouseEntry.SETRANGE("Location Code", GETFILTER("Location Code"));
                LotNo := GETFILTER("Lot No.");
                IF LotNo <> '' THEN
                    WarehouseEntry.SETRANGE("Lot No.", GETFILTER("Lot No."));      //PCPL-25 1nov21
                IF WarehouseEntry.FINDSET THEN
                    REPEAT
                        OpeningBalance += WarehouseEntry.Quantity;
                        OpnQty += WarehouseEntry.Quantity;    //PCPL-25 1nov21
                    UNTIL WarehouseEntry.NEXT = 0;

                //PCPL-25 1nov21
                CLEAR(CloseQty);
                WarehouseEntry.RESET;
                WarehouseEntry.SETRANGE("Item No.", GETFILTER("Item No."));
                WarehouseEntry.SETRANGE("Registering Date", GETRANGEMIN("Registering Date"), GETRANGEMAX("Registering Date"));
                WarehouseEntry.SETRANGE("Bin Code", GETFILTER("Bin Code"));
                WarehouseEntry.SETRANGE("Location Code", GETFILTER("Location Code"));
                WarehouseEntry.SETRANGE("Lot No.", GETFILTER("Lot No."));
                IF WarehouseEntry.FINDSET THEN
                    REPEAT
                        CloseQty += WarehouseEntry.Quantity;    //PCPL-25 1nov21
                    UNTIL WarehouseEntry.NEXT = 0;
                //PCPL-25 1nov21
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

    trigger OnInitReport();
    begin
        CompanyInfo.GET;
    end;

    trigger OnPreReport();
    begin
        IF "Warehouse Entry".GETFILTER("Item No.") = '' THEN
            ERROR('Please enter item Number');
        IF "Warehouse Entry".GETFILTER("Bin Code") = '' THEN
            ERROR('Please enter item Bin Code');
        IF "Warehouse Entry".GETFILTER("Location Code") = '' THEN
            ERROR('Please enter Location Code');

        Filter := "Warehouse Entry".GETFILTERS;
    end;

    var
        OpeningBalance: Decimal;
        ReceivedQty: Decimal;
        TempReceivedQty: Decimal;
        SampleQty: Decimal;
        IssuedQty: Decimal;
        TempIssuedQty: Decimal;
        BalanceQty: Decimal;
        WarehouseEntry: Record "Warehouse Entry";
        VendorName: Text[50];
        PurchRcptHeader: Record "Purch. Rcpt. Header";
        Item: Record Item;
        ItemDescription: Text[100];
        CompanyInfo: Record "Company Information";
        LineDescription: Text[100];
        Item2: Record Item;
        InspectionDataSheet: Record 50011;
        CertificateNo: Code[50];
        "Filter": Text[1024];
        ItemUnitofMeasure: Record "Item Unit of Measure";
        Density: Text[30];
        InspectionDataSheet1: Record 50022;
        CertificateNo1: Code[50];
        OpnQty: Decimal;
        CloseQty: Decimal;
        OpeningQty: Decimal;
        cnt: Integer;
        LotNo: Text;
}

