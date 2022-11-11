report 50039 "Analytical Report FG/SFG"
{
    // version RSPL/QC/V3/001

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Analytical Report FGSFG.rdl';

    dataset
    {
        dataitem("Posted Inspection"; "Posted Inspection")
        {
            column(FromName; FromName)
            {
            }
            column(No_InspectionDataSheet; "No.")
            {
            }
            column(Company_picture; CompanyInfo.Picture)
            {
            }
            column(location_name; locname)
            {
            }
            column(loca_address; loca.Address + ' ' + loca."Address 2" + ' ' + loca.City)
            {
            }
            column(LocationAdd; LocationAdd)
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
            column(ItemNo_InspectionDataSheet; "Item No.")
            {
            }
            column(ItemDescription_InspectionDataSheet; "Item Description")
            {
            }
            column(ItemDescription2_InspectionDataSheet; "Item Description 2")
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
            column(GRNNo_InspectionDataSheet; "GRN No.")
            {
            }
            column(GRNDate_InspectionDataSheet; "GRN Date")
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
            column(ExpiryDate_InspectionDataSheet; "EXP Date")
            {
            }
            column(Register_Address; TextRegAddress)
            {
            }
            column(No_Container_Sample; "No. Container Sample")
            {
            }
            column(outer_package; "Outer Package")
            {
            }
            column(Inner_package; "Inner Package")
            {
            }
            column(Pro_Pack_Detail; '"Prod. Packing Detail"')
            {
            }
            column(Mfg_Name; "mfg Name")
            {
            }
            column(Sup_Name; "sup Name")
            {
            }
            column(Pack_details; Packdetail)
            {
            }
            column(ProdPackingDetail_PostedInspection; PackingDetail)
            {
            }
            column(Loc_Name; locname)
            {
            }
            column(Sample_By; "Sample By")
            {
            }
            column(Sample_UOM; "Posted Inspection"."Sample UOM")
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
                column(ActualTextValue_PostedInspectionLine; "Posted Inspection Line"."Actual Text Value")
                {
                }
                column(TextValue_InspectionSheetLine; "Text Value")
                {
                }
                column(UnitofMeasure_InspectionSheetLine; "Unit of Measure")
                {
                }
                column(MinValue_InspectionSheetLine; "Min. Value")
                {
                }
                column(MaxValue_InspectionSheetLine; "Max. Value")
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
            }

            trigger OnAfterGetRecord();
            begin
                IF RecItem.GET("Item No.") THEN;

                IF CompanyInfo.GET THEN
                    CompanyInfo.CALCFIELDS(CompanyInfo.Picture);

                IF "Posted Inspection"."Posted Sample Quanity" <> 0 THEN
                    SmplDrwn := "Posted Inspection"."Posted Sample Quanity"
                ELSE
                    SmplDrwn := "Posted Inspection"."Sample Drawn Quantity";
                //>>PCL-BRB-20220103
                IF "Posted Inspection"."Document Type" = "Posted Inspection"."Document Type"::Transfer THEN
                    PackingDetail := "Posted Inspection"."RM Packing Detail"
                ELSE
                    PackingDetail := "Posted Inspection"."Prod. Packing Detail";
                //<<PCL-BRB-20220103
                //added by sanjay dated 030916
                IF "Posted Inspection"."Transfer Receipt No." = '' THEN BEGIN//PCPL50
                    loca.RESET;
                    loca.SETFILTER(loca.Code, "Posted Inspection"."Location Code");
                    IF loca.FINDFIRST THEN
                        IF loca.Description = '' THEN BEGIN
                            locname := loca.Name
                        END ELSE
                            IF loca.Description <> '' THEN BEGIN
                                locname := loca.Name + ' ' + '(' + loca.Description + ')';
                            END;
                END
                ELSE//PCPL50
                    IF "Posted Inspection"."Transfer Receipt No." <> '' THEN BEGIN
                        RecTransferReceiptHeader.RESET;
                        RecTransferReceiptHeader.SETRANGE(RecTransferReceiptHeader."No.", "Posted Inspection"."Transfer Receipt No.");
                        IF RecTransferReceiptHeader.FINDFIRST THEN BEGIN
                            loca.RESET;
                            loca.SETRANGE(loca.Code, RecTransferReceiptHeader."Transfer-from Code");
                            IF loca.FINDFIRST THEN
                                IF loca.Description = '' THEN BEGIN
                                    locname := loca.Name
                                END ELSE
                                    IF loca.Description <> '' THEN BEGIN
                                        locname := loca.Name + ' ' + '(' + loca.Description + ')';
                                    END;
                        END;
                    END;
                //PCPL50
                //added by sanjay dated 030916

                //added by sanjay dated 02/09/2016

                //<<PCPL-BRB 20211125
                IF "Posted Inspection"."Transfer Receipt No." <> '' THEN BEGIN
                    RecTransferReceiptHeader.RESET;
                    RecTransferReceiptHeader.SETRANGE(RecTransferReceiptHeader."No.", "Posted Inspection"."Transfer Receipt No.");
                    IF RecTransferReceiptHeader.FINDFIRST THEN BEGIN
                        loca.RESET;
                        loca.SETRANGE(loca.Code, RecTransferReceiptHeader."Transfer-to Code");
                        IF loca.FINDFIRST THEN
                            LocationAdd := loca.Address + ' ' + loca."Address 2" + ' ' + loca.City + '  ' + loca."Post Code";
                    END;
                END ELSE BEGIN
                    loca.RESET;
                    loca.SETRANGE(loca.Code, "Posted Inspection"."Location Code");
                    IF loca.FINDFIRST THEN
                        LocationAdd := loca.Address + ' ' + loca."Address 2" + ' ' + loca.City + '  ' + loca."Post Code";

                END;

                //>>PCPL-BRB 20211125
                Recrecpt.RESET;
                Recrecpt.SETFILTER(Recrecpt."No.", "Posted Inspection"."GRN No.");
                IF Recrecpt.FIND('-') THEN
                    "mfg Name" := ''//Recrecpt."Manufacturer Name1" //PCPL/NSW/MIG  03Aug22
                ELSE
                    "mfg Name" := 'Self';

                "sup Name" := Recrecpt."Pay-to Name";
                Packdetail := Recrecpt.PackingDetails;
                //added by sanjay dated 02/09/2016
                //PCPL50
                IF TickMark = TRUE THEN
                    locname := '';
                //PCPL50
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
        Packdetail: Text[50];
        locname: Text[250];
        TextMan: Label 'Self';
        LocationAdd: Text;
        SmplDrwn: Decimal;
        RecPostedInspection: Record "Posted Inspection";
        RecTransferReceiptHeader: Record "Transfer Receipt Header";
        FromName: Text;
        TickMark: Boolean;
        PackingDetail: Text;
}

