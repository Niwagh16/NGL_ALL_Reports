report 50043 "Inventory Movement - Before1 o"
{
    // version NAVW17.10,KAR1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Inventory Movement - Before1 o.rdl';
    CaptionML = ENU = 'Inventory Movement',
                ENN = 'Inventory Movement';

    dataset
    {
        dataitem("Item Journal Batch"; "Item Journal Batch")
        {
            DataItemTableView = SORTING("Journal Template Name", Name);
            RequestFilterFields = "Journal Template Name", Name;
            column(JournalTempName_ItemJournalBatch; "Journal Template Name")
            {
            }
            column(Name_ItemJournalBatch; Name)
            {
            }
            column(InventoryMovementCaption; InventoryMovementCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(JournalTempNameFieldCaption; "Item Journal Line".FIELDCAPTION("Journal Template Name"))
            {
            }
            column(JournalBatchNameFieldCaption; "Item Journal Line".FIELDCAPTION("Journal Batch Name"))
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
            dataitem("Item Journal Line"; "Item Journal Line")
            {
                DataItemLink = "Journal Template Name" = FIELD("Journal Template Name"),
                               "Journal Batch Name" = FIELD(Name);
                column(JournalTempName_ItemJournalLine; "Journal Template Name")
                {
                }
                column(JournalBatchName_ItemJournalLine; "Journal Batch Name")
                {
                }
                column(ActivityType; ActivityType)
                {
                    OptionCaptionML = ENU = ' ,Put-away,Pick,Movement', ENN = ' ,Put-away,Pick,Movement';
                }
                column(ItemJnlLineActTypeShowOutput; ActivityType <> ActivityType::" ")
                {
                }
                column(ItemJournalLineTableCaption; TABLECAPTION + ': ' + ItemJnlLineFilter)
                {
                }
                column(ItemJnlLineFilter; ItemJnlLineFilter)
                {
                }
                column(ItemJnlLineHeader1ShowOutput; ItemJnlTemplate.Type IN [ItemJnlTemplate.Type::Item, ItemJnlTemplate.Type::Consumption, ItemJnlTemplate.Type::Output, ItemJnlTemplate.Type::"Prod. Order"])
                {
                }
                column(ItemJnlLineHeader2ShowOutput; ItemJnlTemplate.Type = ItemJnlTemplate.Type::Transfer)
                {
                }
                column(UOM_ItemJournalLine; "Unit of Measure Code")
                {
                }
                column(Qty_ItemJournalLine; Quantity)
                {
                }
                column(BinCode_ItemJournalLine; "Bin Code")
                {
                }
                column(LocationCode_ItemJournalLine; "Location Code")
                {
                }
                column(VariantCode_ItemJournalLine; "Variant Code")
                {
                }
                column(Description_ItemJournalLine; Description)
                {
                }
                column(ItemNo_ItemJournalLine; "Item No.")
                {
                }
                column(PostingDate_ItemJournalLine; FORMAT("Posting Date"))
                {
                }
                column(EntryType_ItemJournalLine; "Entry Type")
                {
                }
                column(QuantityBase_ItemJournalLine; "Quantity (Base)")
                {
                }
                column(QuantityFormat; Quantity)
                {
                }
                column(NewBinCode_ItemJournalLine; "New Bin Code")
                {
                }
                column(NewLocationCode_ItemJournalLine; "New Location Code")
                {
                }
                column(QuantityBaseFormat; "Quantity (Base)")
                {
                }
                column(ActivityTypeCaption; ActivityTypeCaptionLbl)
                {
                }
                column(UOMFieldCaption; FIELDCAPTION("Unit of Measure Code"))
                {
                }
                column(QtyFieldCaption; FIELDCAPTION(Quantity))
                {
                }
                column(BinCodeFieldCaption; FIELDCAPTION("Bin Code"))
                {
                }
                column(LocationCodeFieldCaption; FIELDCAPTION("Location Code"))
                {
                }
                column(VariantCodeFieldCaption; FIELDCAPTION("Variant Code"))
                {
                }
                column(DescriptionFieldCaption; FIELDCAPTION(Description))
                {
                }
                column(ItemNoFieldCaption; FIELDCAPTION("Item No."))
                {
                }
                column(PostingDateCaption; PostingDateCaptionLbl)
                {
                }
                column(EntryTypeFieldCaption; FIELDCAPTION("Entry Type"))
                {
                }
                column(QuantityBaseFieldCaption; FIELDCAPTION("Quantity (Base)"))
                {
                }
                column(NewBinCodeFieldCaption; FIELDCAPTION("New Bin Code"))
                {
                }
                column(NewLocationCodeFieldCaption; FIELDCAPTION("New Location Code"))
                {
                }
                dataitem("Reservation Entry"; "Reservation Entry")
                {
                    DataItemLink = "Source ID" = FIELD("Journal Template Name"),
                                   "Source Batch Name" = FIELD("Journal Batch Name"),
                                   "Item No." = FIELD("Item No."),
                                   "Source Ref. No." = FIELD("Line No.");
                    column(Reserv_Entry_LotNo; "Reservation Entry"."Lot No.")
                    {
                    }
                    column(Reserv_Enry_qty; ABS("Reservation Entry".Quantity))
                    {
                    }
                    column(Certificate_No; Certificate_No)
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin
                        Certificate_No := '';
                        RecInspectionDataSheet.RESET;
                        RecInspectionDataSheet.SETRANGE(RecInspectionDataSheet."Item No.", "Reservation Entry"."Item No.");
                        RecInspectionDataSheet.SETRANGE(RecInspectionDataSheet."Lot No.", "Reservation Entry"."Lot No.");
                        IF RecInspectionDataSheet.FINDFIRST THEN
                            Certificate_No := RecInspectionDataSheet."Certificate No.";
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    /*
                    IF ("Entry Type" IN ["Entry Type"::"Positive Adjmt.","Entry Type"::Purchase,"Entry Type"::Output]) AND
                       (Quantity > 0) AND
                       (ActivityType IN [ActivityType::Pick,ActivityType::Movement])
                    THEN
                      CurrReport.SKIP;
                    
                    IF ("Entry Type" IN ["Entry Type"::"Negative Adjmt.","Entry Type"::Sale,"Entry Type"::Consumption]) AND
                       (Quantity < 0) AND
                       (ActivityType IN [ActivityType::Pick,ActivityType::Movement])
                    THEN
                      CurrReport.SKIP;
                    
                    IF ("Entry Type" IN ["Entry Type"::"Positive Adjmt.","Entry Type"::Purchase,"Entry Type"::Output]) AND
                       (Quantity < 0) AND
                       (ActivityType IN [ActivityType::"Put-away",ActivityType::Movement])
                    THEN
                      CurrReport.SKIP;
                    
                    IF ("Entry Type" IN ["Entry Type"::"Negative Adjmt.","Entry Type"::Sale,"Entry Type"::Consumption]) AND
                       (Quantity > 0) AND
                       (ActivityType IN [ActivityType::"Put-away",ActivityType::Movement])
                    THEN
                      CurrReport.SKIP;
                    
                    IF ("Entry Type" <> "Entry Type"::Transfer) AND
                       (ActivityType = ActivityType::Movement)
                    THEN
                      CurrReport.SKIP;
                    
                    */

                end;

                trigger OnPreDataItem();
                begin
                    ItemJnlTemplate.GET("Item Journal Batch"."Journal Template Name");
                end;
            }

            trigger OnAfterGetRecord();
            begin
                CurrReport.PAGENO := 1;
            end;

            trigger OnPreDataItem();
            begin
                /*
                
                IF "Item Journal Batch"."Journal Template Name" = '' THEN
                    ERROR(ERR_JT);
                
                IF "Item Journal Batch".Name = '' THEN
                    ERROR(ERR_JB);
                */

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
        IF "Item Journal Batch".GETFILTER("Item Journal Batch"."Journal Template Name") = '' THEN
            ERROR(ERR_JT);

        IF "Item Journal Batch".GETFILTER("Item Journal Batch".Name) = '' THEN
            ERROR(ERR_JB);
    end;

    var
        ItemJnlTemplate: Record "Item Journal Template";
        ItemJnlLineFilter: Text;
        ActivityType: Option " ","Put-away",Pick,Movement;
        InventoryMovementCaptionLbl: TextConst ENU = 'Inventory Movement', ENN = 'Inventory Movement';
        PageCaptionLbl: TextConst ENU = 'Page', ENN = 'Page';
        ActivityTypeCaptionLbl: TextConst ENU = 'Activity Type', ENN = 'Activity Type';
        PostingDateCaptionLbl: TextConst ENU = 'Posting Date', ENN = 'Posting Date';
        ERR_JT: Label 'Please Select Journal Template Name';
        ERR_JB: Label 'Please Enter Batch Name';
        Certificate_No: Code[20];
        RecInspectionDataSheet: Record "Inspection Data Sheet";

    procedure InitializeRequest(NewActivityType: Option);
    begin
        //ActivityType := NewActivityType;
    end;
}

