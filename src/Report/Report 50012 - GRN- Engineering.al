report 50012 "GRN- Engineering"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\GRN- Engineering.rdl';

    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            RequestFilterFields = "No.";
            column(Company_Name; company.Name)
            {
            }
            column(Company_Pic; company.Picture)
            {
            }
            column(LOCATION_Name; loca.Name)
            {
            }
            column(Location_Address; loca.Address + ' ' + loca."Address 2" + ' ' + loca.City + '  ' + loca."Post Code")
            {
            }
            column(location_FormatNo; loca."Format No.")
            {
            }
            column(usrID; usrID)
            {
            }
            column(PH_orderDate; PH."Order Date")
            {
            }
            column(PH_Buyfrom_No; PH."Buy-from Vendor No.")
            {
            }
            column(PH_Buyfrom_Name; PH."Buy-from Vendor Name")
            {
            }
            column(PH_Buyfrom_Addr; PH."Buy-from Address")
            {
            }
            column(PH_Buyfrom_Addr2; PH."Buy-from Address 2")
            {
            }
            column(PH_Buyfrom_Citypost; PH."Buy-from City" + ' ' + PH."Buy-from Post Code")
            {
            }
            column(No_PurchRcptHeader; "Purch. Rcpt. Header"."No.")
            {
            }
            column(BuyfromVendorName_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Vendor Name")
            {
            }
            column(BuyfromAddress_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Address")
            {
            }
            column(BuyfromAddress2_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Address 2")
            {
            }
            column(BuyfromCity_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from City" + ' - ' + "Purch. Rcpt. Header"."Buy-from Post Code")
            {
            }
            column(OrderNo_PurchRcptHeader; "Purch. Rcpt. Header"."Order No.")
            {
            }
            column(PostingDate_PurchRcptHeader; "Purch. Rcpt. Header"."Posting Date")
            {
            }
            column(UserID_PurchRcptHeader; "Purch. Rcpt. Header"."User ID")
            {
            }
            column(PaytoName_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Name")
            {
            }
            column(PaytoAddress_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Address")
            {
            }
            column(PaytoAddress2_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Address 2")
            {
            }
            column(PaytoCity_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to City" + ' ' + "Purch. Rcpt. Header"."Pay-to Post Code")
            {
            }
            column(ManufactureName; '')//"Purch. Rcpt. Header"."Manufacturer Name1") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(ManufactureAddress; '')// "Purch. Rcpt. Header"."Manufacturer Address1") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(UserName; User_rec."Full Name")
            {
            }
            column(UserDesignation; '')//User_rec."User Designation") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(InspectedDesignation; InspectedDesignation)
            {
            }
            column(ApproDesignation; ApproDesignation)
            {
            }
            column(ManufactureAddress2; add2)
            {
            }
            column(ManufactureCityPostcode; city)
            {
            }
            column(VendorChallanNo; PH."Vendor Order No.")
            {
            }
            column(VendorChallanDate; PH."Document Date")
            {
            }
            column(PRH_VendorChallanNo; "Purch. Rcpt. Header"."Vendor Shipment No.")
            {
            }
            column(Approved_By; IDS."Approved By")
            {
            }
            column(PostingDate_Time; "Purch. Rcpt. Header".Postingdatetime)
            {
            }
            column(VendorInvoice_no; PH."Vendor Invoice No.")
            {
            }
            column(Packing_Deatails; PH.PackingDetails)
            {
            }
            column(VarManName; VarManName)
            {
            }
            column(VarManAddress; VarManAddress)
            {
            }
            column(VarPacAddress; VarPacAddress)
            {
            }
            column(VarVendShipNo; VarVendShipNo)
            {
            }
            column(VarVendShipDt; VarVendShipDt)
            {
            }
            column(VarVendShipDt_; PH."Document Date")
            {
            }
            dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.")
                                    WHERE(Quantity = FILTER(> 0));
                column(Quantity_PurchRcptLine; "Purch. Rcpt. Line".Quantity)
                {
                }
                column(VarCode; VarCode)
                {
                }
                column(Desc; Desc)
                {
                }
                column(No_PurchRcptLine; "Purch. Rcpt. Line"."No.")
                {
                }
                column(Description_PurchRcptLine; "Purch. Rcpt. Line".Description)
                {
                }
                column(docpurchrcptline; "Purch. Rcpt. Line"."Document No.")
                {
                }
                column(linenopurchrcptline; "Purch. Rcpt. Line"."Line No.")
                {
                }
                column(VariantCode_PurchRcptLine; "Purch. Rcpt. Line"."Variant Code")
                {
                }
                column(Sr; Sr)
                {
                }
                column(ILE_LotNo; Ile."Lot No.")
                {
                }
                column(ILE_ExpirationDate; Ile."Expiration Date")
                {
                }
                column(ILE_Unitofmeasure; Ile."Unit of Measure Code")
                {
                }
                column(PL_PackingSize; PL."Packing Size")
                {
                }
                column(Inspection_CertificateNo; IDS."Certificate No.")
                {
                }
                column(Inspection_Approval; IDS."Approved Quantity")
                {
                }
                column(Inspection_Rejected; IDS."Rejected Quantity")
                {
                }
                column(Inspection_ApprovedBy; ApprovedBy)
                {
                }
                column(Inspection_InspectedBy; Inspectedby)
                {
                }
                column(ItemUnitof_Measure; ItemUnitofMeasure)
                {
                }
                column(QTYApproved; QTY)
                {
                }
                column(QTYRejected; QTY2)
                {
                }
                column(PRL_DocumentNo; "Document No.")
                {
                }
                column(UOM_PurchRcptLine; Uom)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    Sr := Sr + 1;
                    //CLEAR(VarCode);
                    PurchRecpLine.RESET;
                    PurchRecpLine.SETRANGE(PurchRecpLine."Document No.", "Purch. Rcpt. Line"."Document No.");
                    PurchRecpLine.SETRANGE(PurchRecpLine."Line No.", "Purch. Rcpt. Line"."Line No.");
                    IF PurchRecpLine.FINDSET THEN BEGIN
                        VarCode := PurchRecpLine."Variant Code";
                        IF VarCode <> '' THEN BEGIN //REPEAT
                            ItemVariant.RESET;
                            ItemVariant.SETRANGE(ItemVariant."Item No.", PurchRecpLine."No.");
                            ItemVariant.SETRANGE(ItemVariant.Code, VarCode);
                            IF ItemVariant.FINDFIRST THEN BEGIN
                                Desc := ItemVariant.Description;
                            END;
                            ItemUnitofMeasure1.RESET;
                            ItemUnitofMeasure1.SETRANGE(ItemUnitofMeasure1."Item No.", PurchRecpLine."No.");
                            IF ItemUnitofMeasure1.FINDFIRST THEN BEGIN
                                //Uom := ItemUnitofMeasure1.Code;
                                Uom := "Purch. Rcpt. Line"."Unit of Measure";
                            END;
                        END
                        ELSE
                            IF VarCode = '' THEN BEGIN //REPEAT
                                Uom := "Purch. Rcpt. Line"."Unit of Measure";
                                RecItem.RESET;
                                RecItem.SETRANGE(RecItem."No.", "Purch. Rcpt. Line"."No.");
                                IF RecItem.FINDFIRST THEN BEGIN
                                    Desc := RecItem.Description;
                                END;
                            END;
                        //PCPL41_05032020_S
                        FixedAsset.RESET;
                        FixedAsset.SETRANGE(FixedAsset."No.", "Purch. Rcpt. Line"."No.");
                        IF FixedAsset.FINDFIRST THEN
                            Desc := FixedAsset.Description + ' ' + FixedAsset."Description 2";
                        //PCPL41_05032020_E
                    END;
                    BEGIN
                        ;
                        Glaccount.RESET;
                        Glaccount.SETRANGE(Glaccount."No.", "Purch. Rcpt. Line"."No.");
                        IF Glaccount.FINDFIRST THEN
                            Desc := PurchRecpLine.Description + ' ' + PurchRecpLine."Description 2"
                    END;
                    //MESSAGE(FORMAT(Desc));
                    //
                end;
            }

            trigger OnAfterGetRecord();
            begin
                PH.RESET;
                PH.SETRANGE(PH."No.", "Purch. Rcpt. Header"."Order No.");
                IF PH.FINDFIRST THEN;

                IF loca.GET("Purch. Rcpt. Header"."Location Code") THEN;
                IF InspectionDataSheet.GET("Purch. Rcpt. Header"."No.") THEN;

                //KARYA_SARAN++ids
                IDS.RESET;
                IDS.SETRANGE(IDS."GRN No.", "Purch. Rcpt. Header"."No.");
                IF IDS.FINDFIRST THEN BEGIN
                    User_rec.RESET;
                    User_rec.SETRANGE("User Name", IDS."Approved By");
                    IF User_rec.FINDFIRST THEN BEGIN
                        ApprovedBy := User_rec."Full Name";
                        ApproDesignation := '';// User_rec."User Designation"; //PCPL/NSW/MIG  03Aug22
                    END;
                    User_rec.RESET;
                    User_rec.SETRANGE("User Name", IDS."Inspected By");
                    IF User_rec.FINDFIRST THEN BEGIN
                        Inspectedby := User_rec."Full Name";
                        InspectedDesignation := '';//User_rec."User Designation"; //PCPL/NSW/MIG  03Aug22
                    END;
                END;
                //KARYA_SARAN--
                User_rec.RESET;
                User_rec.SETRANGE("User Name", "Purch. Rcpt. Header"."User ID");
                IF User_rec.FINDFIRST THEN BEGIN
                    usrID := User_rec."Full Name";
                END;

                //PCPL0024--Start
                RecPoWhseRecLine.RESET;
                RecPoWhseRecLine.SETRANGE(RecPoWhseRecLine."Posted Source No.", "No.");
                IF RecPoWhseRecLine.FINDFIRST THEN BEGIN
                    RecPoWhseReHead.RESET;
                    RecPoWhseReHead.SETRANGE(RecPoWhseReHead."No.", RecPoWhseRecLine."No.");
                    IF RecPoWhseReHead.FINDFIRST THEN BEGIN
                        VarManName := RecPoWhseReHead."Manufacturer Name";
                        VarManAddress := RecPoWhseReHead."Manufacturer Address";
                        VarPacAddress := RecPoWhseReHead."Packing details";
                        VarVendShipNo := RecPoWhseReHead."Vendor Shipment No.";
                        VarVendShipDt := 0D;//RecPoWhseReHead."Vendor Shipment Date"; //PCPL/NSW/MIG  03Aug22
                    END;
                END;
                //MESSAGE(VarManName+' ' +VarManAddress+' ' + VarPacAddress+' '+VarVendShipNo);

                IF VarManName = '' THEN
                    //KARYA_SARAN++

                    IDS.RESET;
                IDS.SETRANGE(IDS."GRN No.", "Purch. Rcpt. Header"."No.");
                IF IDS.FINDFIRST THEN;

                // MESSAGE('inspected %1',IDS."Inspected By");
                IF ManufactureAdd THEN BEGIN
                    VarManName := "Purch. Rcpt. Header"."Manufacturer Name";
                    VarManAddress := "Purch. Rcpt. Header"."Manufacturer Address";
                    VarPacAddress := "Purch. Rcpt. Header".PackingDetails;
                    VarVendShipNo := "Purch. Rcpt. Header"."Vendor Shipment No.";
                    VarVendShipDt := "Purch. Rcpt. Header"."Document Date";
                END;

                //KARYA_SARAN--
                //PCPL0024--End
            end;

            trigger OnPreDataItem();
            begin
                company.GET;
                company.CALCFIELDS(Picture);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(Manufacture; ManufactureAdd)
                {
                    Caption = 'Manufacture';
                    Visible = false;
                }
                group("Manufacture ")
                {
                    Caption = 'Manufacture Address';
                    Visible = false;
                    field(ManufactureName; ManufactureName)
                    {
                        Caption = 'Name';
                    }
                    field(ManufactureAddress; ManufactureAddress)
                    {
                        Caption = 'Address';
                    }
                    field(ManufactureAddress2; ManufactureAddress2)
                    {
                        Caption = 'Address2';
                    }
                    field(ManufactureCity; ManufactureCity)
                    {
                        Caption = 'City';
                    }
                    field(ManufacturePostcode; ManufacturePostcode)
                    {
                        Caption = 'Postcode';
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

    trigger OnPreReport();
    begin
        Sr := 0;
    end;

    var
        company: Record "Company Information";
        PH: Record "Purchase Header";
        Ile: Record "Item Ledger Entry";
        loca: Record Location;
        PL: Record "Purchase Line";
        InspectionDataSheet: Record 50011;
        InspectionDataSheetline: Record 50012;
        User_rec: Record User;
        ManufactureName: Text;
        ManufactureAddress: Text;
        ManufactureAddress2: Text;
        ManufactureCity: Text;
        ManufacturePostcode: Code[10];
        ManufactureAdd: Boolean;
        nam: Text;
        add: Text;
        add2: Text;
        city: Text;
        post: Code[10];
        Appro: Text;
        IDS: Record 50022;
        QTY: Decimal;
        QTY2: Decimal;
        Inspection: Record 50011;
        ApprovedQty: Decimal;
        RejectedQty: Decimal;
        Packing_Size: Code[30];
        WE: Record "Warehouse Entry";
        ItemUnitofMeasure: Text;
        ItemCard: Record Item;
        cOUNNT: Integer;
        certificateno: Code[50];
        PostedInspection: Record 50022;
        LotNoInformation: Record "Lot No. Information";
        RecPoWhseRecLine: Record "Posted Whse. Receipt Line";
        RecPoWhseReHead: Record "Posted Whse. Receipt Header";
        VarManName: Text[60];
        VarManAddress: Text[60];
        VarPacAddress: Text[250];
        VarVendShipNo: Code[35];
        VarVendShipDt: Date;
        Sr: Integer;
        ApprovedBy: Text;
        Inspectedby: Text;
        ApproDesignation: Text;
        InspectedDesignation: Text;
        ItemVariant: Record "Item Variant";
        RecItem: Record Item;
        Desc: Text[200];
        VarCode: Code[20];
        UserSetup: Record "User Setup";
        usrID: Text[100];
        PurchRecpLine: Record "Purch. Rcpt. Line";
        ItemUnitofMeasure1: Record "Item Unit of Measure";
        Uom: Code[20];
        FixedAsset: Record "Fixed Asset";
        Glaccount: Record "G/L Account";
}

