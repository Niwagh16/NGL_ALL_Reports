report 50037 "Analytical Report For RM1"
{
    // version RSPL/QC/V3/001

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Analytical Report For RM1.rdl';

    dataset
    {
        dataitem("Posted Inspection"; "Posted Inspection")
        {
            column(TickMark; TickMark)
            {
            }
            column(FromName; FromName)
            {
            }
            column(PurchUOM; PurchUOM)
            {
            }
            column(No_InspectionDataSheet; "No.")
            {
            }
            column(BaseUOM; RecItem."Base Unit of Measure")
            {
            }
            column(PurchOrderQuantity_PostedInspection; "Posted Inspection"."Purch. Order Quantity")
            {
            }
            column(GRNQuantity_PostedInspection; "Posted Inspection"."GRN Quantity")
            {
            }
            column(Company_picture; CompanyInfo.Picture)
            {
            }
            column(location_name; loca.Name)
            {
            }
            column(loca_address; loca.Address + ' ' + loca."Address 2" + ' ' + loca.City)
            {
            }
            column(DocumentType_InspectionDataSheet; "Document Type")
            {
            }
            column(DocumentNo_InspectionDataSheet; "Document No.")
            {
            }
            column(PostingDate_InspectionDataSheet; "Posting Date")
            {
            }
            column(externallot; "External Lot No.")
            {
            }
            column(ReportName; ReportName)
            {
            }
            column(Quantity_InspectionDataSheet; Quantity)
            {
            }
            column(RefID_InspectionDataSheet; "Ref ID")
            {
            }
            column(DocumentDate_InspectionDataSheet; "Document Date")
            {
            }
            column(ProdOrderDate_InspectionDataSheet; "Prod. Order Date")
            {
            }
            column(SampleDrawnQuantity_PostedInspection; "Posted Inspection"."Sample Drawn Quantity")
            {
            }
            column(LotNo_InspectionDataSheet; "Lot No.")
            {
            }
            column(PurchOrderQuantity_InspectionDataSheet; "Purch. Order Quantity")
            {
            }
            column(VendorNo_InspectionDataSheet; "Vendor No.")
            {
            }
            column(VendorName_InspectionDataSheet; "Vendor Name")
            {
            }
            column(puruom; "Unit of Messure")
            {
            }
            column(UnitofMessure_PostedInspection; "Posted Inspection"."Unit of Messure")
            {
            }
            column(TransferReceiptNo_InspectionDataSheet; "Transfer Receipt No.")
            {
            }
            column(UnitsPerparcel; PostedTransferReceiptLine."Units per Parcel")
            {
            }
            column(ItemNo_InspectionDataSheet; "Item No.")
            {
            }
            column(ItemDescription_InspectionDataSheet; "Item Description")
            {
            }
            column(ItemDescription2_InspectionDataSheet; "Item Description 2")
            {
            }
            column(PostingDate_TransferReceiptHeader; TransReceiptHeader."Posting Date")
            {
            }
            column(ExternalLotNo_ItemledgerEntry; ItemledgerEntry."External Lot No.")
            {
            }
            column(TransferfromName; SupplierName)
            {
            }
            column(UnitofMessure_InspectionDataSheet; "Unit of Messure")
            {
            }
            column(ItemTracking_InspectionDataSheet; "Item Tracking")
            {
            }
            column(Remarks_InspectionDataSheet; Remarks)
            {
            }
            column(CertificateNo_InspectionDataSheet; "Certificate No.")
            {
            }
            column(VarManName; VarManName)
            {
            }
            column(GRNNo_InspectionDataSheet; "GRN No.")
            {
            }
            column(GRNDate_InspectionDataSheet; "GRN Date")
            {
            }
            column(GRNDate_InspectionDataSheet2; "GRN Date")
            {
            }
            column(GRNQuantity_InspectionDataSheet; "GRN Quantity")
            {
            }
            column(ProdOrderQuantity_InspectionDataSheet; "Prod. Order Quantity")
            {
            }
            column(BeforeGRN_InspectionDataSheet; "Before GRN")
            {
            }
            column(Approval_InspectionDataSheet; Approval)
            {
            }
            column(Status_InspectionDataSheet; Status)
            {
            }
            column(PostedSampleQuanity_PostedInspection; sampleQty)
            {
            }
            column(ApprovedQuantity_InspectionDataSheet; "Approved Quantity")
            {
            }
            column(RejectedQuantity_InspectionDataSheet; "Rejected Quantity")
            {
            }
            column(SampleDrawnQuantity_InspectionDataSheet; SmplDrwn)
            {
            }
            column(MfgDate_InspectionDataSheet; "Mfg. Date")
            {
            }
            column(Analyzedon_InspectionDataSheet; "Analyzed on")
            {
            }
            column(Reteston_InspectionDataSheet; "Retest on")
            {
            }
            column(SampleDrawnOn_InspectionDataSheet; "Sample Drawn On")
            {
            }
            column(InspectedBy_InspectionDataSheet; "Inspected By")
            {
            }
            column(ApprovedBy_InspectionDataSheet; "Approved By")
            {
            }
            column(ReplannedProdOrder_InspectionDataSheet; "Replanned Prod. Order")
            {
            }
            column(ReplannedItemNo_InspectionDataSheet; "Replanned Item No.")
            {
            }
            column(Item_Description; RecItem.Description)
            {
            }
            column(Item_Synonym; RecItem.Synonym)
            {
            }
            column(Item_CAS_No; RecItem."CAS No.")
            {
            }
            column(Item_MolFormula; RecItem."Mol. Formula")
            {
            }
            column(Item_MolWeight; RecItem."Mol. Weight")
            {
            }
            column(ExpiryDate_InspectionDataSheet; "Posted Inspection"."EXP Date")
            {
            }
            column(Register_Address; TextRegAddress)
            {
            }
            column(No_Container_Sample; "No. Container Sample")
            {
            }
            column(ApprovedQuantity_PostedInspection; "Posted Inspection"."Approved Quantity")
            {
            }
            column(outer_package; "Outer Package")
            {
            }
            column(Inner_package; "Inner Package")
            {
            }
            column(Mfg_Name; "mfg Name")
            {
            }
            column(Sup_Name; "sup Name")
            {
            }
            column(Pack_details; "Posted Inspection"."RM Packing Detail")
            {
            }
            column(Loc_Name; locname)
            {
            }
            column(Sample_UOM; "Sample UOM")
            {
            }
            column(SampleUOM_PostedInspection; "Posted Inspection"."Sample UOM")
            {
            }
            dataitem("Posted Inspection Line"; "Posted Inspection Line")
            {
                DataItemLink = "No." = FIELD("No."),
                               "Document Type" = FIELD("Document Type"),
                               "Document No." = FIELD("Document No.");
                DataItemTableView = SORTING("No.", "Line No.");
                column(ActualValue_InspectionSheetLine; "Actual Value")
                {
                }
                column(TextValue_InspectionSheetLine; "Text Value")
                {
                }
                column(UnitofMeasure_InspectionSheetLine; "Unit of Measure")
                {
                }
                column(ActualTextValue_PostedInspectionLine; "Actual Text Value")
                {
                }
                column(MinValue_InspectionSheetLine; "Min. Value")
                {
                }
                column(MaxValue_InspectionSheetLine; "Max. Value")
                {
                }
                column(Complies_PostedInspectionLine; CompliesText)
                {
                }
                column(QcDescription_InspectionSheetLine; "Qc Description")
                {
                }
                column(Remark_InspectionSheetLine; Remark)
                {
                }
                column(Date_InspectionSheetLine; 'Date')
                {
                }
                column(TestMandatory_InspectionSheetLine; "Test Mandatory")
                {
                }
                column(QltyMeasureCode_InspectionSheetLine; "Qlty Measure Code")
                {
                }
                column(AccountType_InspectionSheetLine; "Account Type")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    IF Complies THEN
                        CompliesText := 'Complies'
                    ELSE
                        CompliesText := 'Does not Complies';
                end;
            }

            trigger OnAfterGetRecord();
            begin
                IF RecItem.GET("Item No.") THEN;
                "Posted Inspection".CALCFIELDS("Posted Sample Quanity");
                sampleQty := "Posted Inspection"."Posted Sample Quanity";
                puruom := RecItem."Purch. Unit of Measure";

                IF RecItem."Item Category Code" <> 'PM' THEN
                    ReportName := 'Analytical Report For Raw Material'
                ELSE
                    ReportName := 'Analytical Report For Packaging Material';
                IF CompanyInfo.GET THEN
                    CompanyInfo.CALCFIELDS(CompanyInfo.Picture);

                IF "Posted Inspection"."Posted Sample Quanity" <> 0 THEN
                    SmplDrwn := "Posted Inspection"."Posted Sample Quanity"
                ELSE
                    SmplDrwn := "Posted Inspection"."Sample Drawn Quantity";
                //added by sanjay dated 030916
                loca.RESET;
                loca.SETFILTER(loca.Code, "Location Code");
                IF loca.FIND('-') THEN
                    locname := loca.Address + ' ' + loca."Address 2" + ' ' + loca.City + '  ' + loca."Post Code";
                //added by sanjay dated 030916
                //PCPL50
                PostedTransferReceipt.RESET;
                PostedTransferReceipt.SETRANGE("Transfer Order No.", "Document No.");
                IF PostedTransferReceipt.FINDFIRST THEN BEGIN
                    loca.GET(PostedTransferReceipt."Transfer-from Code");
                    SupplierName := loca.Name + ' ' + '(' + ''/*loca.Description */+ ')';
                END
                ELSE BEGIN
                    PurchHeader.RESET;
                    PurchHeader.SETRANGE(PurchHeader."No.", "Document No.");
                    IF PurchHeader.FINDFIRST THEN
                        SupplierName := PurchHeader."Buy-from Vendor Name";
                END;
                //PCPL50
                /*PurchHeader.RESET;
                PurchHeader.SETRANGE(PurchHeader."No.","Document No.");
                IF PurchHeader.FINDFIRST THEN
                IF PurchHeader."Document Type" = PurchHeader."Document Type"::Order THEN  BEGIN
                   SupplierName:=PurchHeader."Buy-from Vendor Name";
                END
                ELSE IF PurchHeader."Document Type" <> PurchHeader."Document Type"::Order THEN  BEGIN
                loca.RESET;
                loca.SETRANGE(loca.Code,"Posted Inspection"."Location Code");
                IF loca.FINDFIRST THEN
                   SupplierName := loca.Name +' '+'('+ loca.Description +')';
                END;*/
                //PCPL50
                //added by sanjay dated 02/09/2016
                PostedTransferReceiptLine.RESET;
                PostedTransferReceiptLine.SETRANGE("Document No.", "Transfer Receipt No.");
                PostedTransferReceiptLine.SETRANGE(PostedTransferReceiptLine."Item No.", "Item No.");
                IF PostedTransferReceiptLine.FINDFIRST THEN;
                IF "GRN No." <> '' THEN BEGIN
                    Recrecpt.RESET;
                    Recrecpt.SETRANGE("No.", "GRN No.");
                    IF Recrecpt.FINDFIRST THEN BEGIN
                        "mfg Name" := '';//Recrecpt."Manufacturer Name1"; //PCPL/NSW/MIG  03Aug22
                        "sup Name" := Recrecpt."Pay-to Name";
                        Packdetail := Recrecpt.PackingDetails;
                    END ELSE
                        Packdetail := "Posted Inspection"."RM Packing Detail";
                END;
                RecPoWhseRecLine.RESET;
                RecPoWhseRecLine.SETRANGE(RecPoWhseRecLine."Posted Source No.", "Posted Inspection"."GRN No.");
                IF RecPoWhseRecLine.FINDFIRST THEN BEGIN
                    RecPoWhseReHead.RESET;
                    RecPoWhseReHead.SETRANGE(RecPoWhseReHead."No.", RecPoWhseRecLine."No.");
                    IF RecPoWhseReHead.FINDFIRST THEN
                        VarManName := RecPoWhseReHead."Manufacturer Name";
                END;
                //added by sanjay dated 02/09/2016
                TransReceiptHeader.RESET;
                TransReceiptHeader.SETRANGE("No.", "Transfer Receipt No.");
                IF TransReceiptHeader.FINDFIRST THEN;
                ItemledgerEntry.RESET;
                ItemledgerEntry.SETRANGE("Document Type", ItemledgerEntry."Document Type"::"Transfer Receipt");
                ItemledgerEntry.SETRANGE("Document No.", TransReceiptHeader."No.");
                IF ItemledgerEntry.FINDFIRST THEN;
                //PCPL 0028/Avinash 26-7-2018
                RecPurchRcptLine.RESET;
                RecPurchRcptLine.SETRANGE(RecPurchRcptLine."Document No.", "Posted Inspection"."GRN No.");
                IF RecPurchRcptLine.FINDFIRST THEN BEGIN
                    PurchUOM := RecPurchRcptLine."Unit of Measure";
                END;
                //Close PCPL 0028
                //PCPL/BRB
                RecPoWhseRecLine.RESET;
                RecPoWhseRecLine.SETRANGE("Posted Source Document", RecPoWhseRecLine."Posted Source Document"::"Posted Receipt");
                RecPoWhseRecLine.SETRANGE("Posted Source No.", "Posted Inspection"."GRN No.");
                IF RecPoWhseRecLine.FINDFIRST THEN BEGIN
                    IF RecPoWhseReHead.GET(RecPoWhseRecLine."No.") THEN;
                    Packdetail := RecPoWhseReHead."Packing details";
                END;
                //PCPL50
                RecWarehouseEntry.RESET;
                RecWarehouseEntry.SETRANGE(RecWarehouseEntry."Lot No.", "Posted Inspection"."Lot No.");
                RecWarehouseEntry.SETRANGE(RecWarehouseEntry."Item No.", "Posted Inspection"."Item No.");
                RecWarehouseEntry.SETFILTER(RecWarehouseEntry."Source Code", '%1', 'PURCHASES');
                RecWarehouseEntry.SETRANGE(RecWarehouseEntry."Whse. Document Type", RecWarehouseEntry."Whse. Document Type"::Receipt);
                IF RecWarehouseEntry.FINDFIRST THEN
                    RecPostedWarehouseReceiptHeader.RESET;
                RecPostedWarehouseReceiptHeader.SETRANGE(RecPostedWarehouseReceiptHeader."No.", RecWarehouseEntry."Whse. Document No.");
                IF RecPostedWarehouseReceiptHeader.FINDFIRST THEN
                    VarManName := RecPostedWarehouseReceiptHeader."Manufacturer Name";

                IF TickMark = TRUE THEN BEGIN
                    VarManName := '';
                    SupplierName := '';
                END;
                //PCPL50

            end;

            trigger OnPreDataItem();
            begin
                "sup Name" := '';
                "mfg Name" := '';
                Packdetail := '';
                SmplDrwn := 0;
                CLEAR(ReportName);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Tick Mark"; TickMark)
                {
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
        RecItem: Record Item;
        loca: Record Location;
        CompanyInfo: Record "Company Information";
        TextRegAddress: Label 'W142 C TTC MIDC Industrial Area, Pawane Village, Thane Belapur Road, Navi Mumbai 400 705. Tel: 27630547. Email : purchase@nglfine.in, URL:www.nglfinechem.com. CIN : L24110MH1981PLCO25884.  HO (For Corresspondance) : 2, New Metalage Industrial Premises, Subhash Road, Jogeshwari East,''+'' Mumbai 400 060. India. Tel: 022-40539944/17. Fax : (+91 22) 40539900';
        Recrecpt: Record "Purch. Rcpt. Header";
        "mfg Name": Text[50];
        "sup Name": Text[50];
        Packdetail: Text[250];
        locname: Text[250];
        puruom: Text;
        PostedTransferReceipt: Record "Transfer Receipt Header";
        PostedTransferReceiptLine: Record "Transfer Receipt Line";
        PurchHeader: Record "Purchase Header";
        SupplierName: Text;
        TransReceiptHeader: Record "Transfer Receipt Header";
        ItemledgerEntry: Record "Item Ledger Entry";
        CompliesText: Text;
        SmplDrwn: Decimal;
        PurchUOM: Code[10];
        RecPurchRcptLine: Record "Purch. Rcpt. Line";
        RecPostedInspection: Record "Posted Inspection";
        RecPoWhseRecLine: Record "Posted Whse. Receipt Line";
        RecPoWhseReHead: Record "Posted Whse. Receipt Header";
        VarManName: Text;
        RecWarehouseEntry: Record "Warehouse Entry";
        RecPostedWarehouseReceiptHeader: Record "Posted Whse. Receipt Header";
        RecTransferReceiptHeader: Record "Transfer Receipt Header";
        FromName: Text;
        RecILE: Record "Item Ledger Entry";
        mfgDate: Date;
        TickMark: Boolean;
        sampleQty: Decimal;
        ReportName: Text;
        user_rec: Record User;
}

