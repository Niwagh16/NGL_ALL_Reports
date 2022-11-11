report 50018 "Inventory Movement - After"
{
    // version NAVW17.10,KAR1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Inventory Movement - After.rdl';
    CaptionML = ENU = 'Inventory Movement',
                ENN = 'Inventory Movement';

    dataset
    {
        dataitem("Warehouse Entry"; "Warehouse Entry")
        {
            DataItemTableView = SORTING("Entry No.")
                                ORDER(Ascending)
                                WHERE("Entry Type" = CONST(Movement),
                                      "Source Document" = CONST("Reclass. Jnl."),
                                      "Source Code" = CONST('RECLASSJNL'));
            RequestFilterFields = "Registering Date";
            column(InventoryMovementCaption; InventoryMovementCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(CompanyName; COMPANYNAME)
            {
            }
            column(TodayFormatted; FORMAT(TODAY, 0, 4))
            {
            }
            column(Time; TIME)
            {
            }
            column(BinCode; "Warehouse Entry"."Bin Code")
            {
            }
            column(ItemNo; "Warehouse Entry"."Item No.")
            {
            }
            column(Batch_No; "Warehouse Entry"."Lot No.")
            {
            }
            column(Certificate_No; Certificate_No)
            {
            }
            column(Old_BinCode; OldBinCode)
            {
            }
            column(Old_LocCode; OldLocCode)
            {
            }
            column(Qty; "Warehouse Entry".Quantity)
            {
            }
            column(Item_Desc; ItemDesc)
            {
            }
            column(Loc_Code; "Warehouse Entry"."Location Code")
            {
            }
            column(Filter_Date; FilterDate)
            {
            }
            column(Transfer_No; "Warehouse Entry"."Reference No.")
            {
            }

            trigger OnAfterGetRecord();
            begin

                CurrReport.PAGENO := 1;
                ItemDesc := '';
                IF RecItem.GET("Item No.") THEN
                    ItemDesc := RecItem.Description;

                Certificate_No := '';
                RecInspectionDataSheet.RESET;
                RecInspectionDataSheet.SETRANGE(RecInspectionDataSheet."Item No.", "Item No.");
                RecInspectionDataSheet.SETRANGE(RecInspectionDataSheet."Lot No.", "Lot No.");
                RecInspectionDataSheet.SETRANGE("Location Code", "Location Code");  //PCPL_YSR
                RecInspectionDataSheet.SETFILTER("Certificate No.", '<>%1', '');  //PCPL_YSR
                IF RecInspectionDataSheet.FINDLAST THEN
                    Certificate_No := RecInspectionDataSheet."Certificate No.";

                IF "Warehouse Entry".Quantity < 0 THEN BEGIN
                    OldBinCode := "Warehouse Entry"."Bin Code";
                    OldLocCode := "Location Code";
                END;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

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
        FilterDate := "Warehouse Entry".GETFILTER("Warehouse Entry"."Registering Date");

        IF "Warehouse Entry".GETFILTER("Warehouse Entry"."Registering Date") = '' THEN
            ERROR('Please Enter Stock issue Date');
        IF "Warehouse Entry".GETFILTER("Reference No.") = '' THEN
            ERROR('Please enter Batch No.');

        IF "Warehouse Entry".GETFILTER("Location Code") = '' THEN
            ERROR('Please enter Location Code');

        Filter := "Warehouse Entry".GETFILTERS;
    end;

    var
        InventoryMovementCaptionLbl: TextConst ENU = 'Inventory Movement', ENN = 'Inventory Movement';
        PageCaptionLbl: TextConst ENU = 'Page', ENN = 'Page';
        ActivityTypeCaptionLbl: TextConst ENU = 'Activity Type', ENN = 'Activity Type';
        PostingDateCaptionLbl: TextConst ENU = 'Posting Date', ENN = 'Posting Date';
        ERR_JT: Label 'Please Select Journal Template Name';
        ERR_JB: Label 'Please Enter Batch Name';
        RecWareHouseEntry: Record "Warehouse Entry";
        RecItem: Record Item;
        ItemDesc: Text[60];
        Certificate_No: Code[50];
        RecInspectionDataSheet: Record 50022;
        OldBinCode: Code[20];
        OldLocCode: Code[10];
        FilterDate: Text[30];
        "Filter": Text[1024];

    procedure InitializeRequest(NewActivityType: Option);
    begin
    end;
}

