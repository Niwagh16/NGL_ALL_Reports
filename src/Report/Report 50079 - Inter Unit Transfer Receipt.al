report 50079 "Inter Unit Transfer Receipt"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Inter Unit Transfer Receipt.rdl';

    dataset
    {
        dataitem("Transfer Receipt Header"; "Transfer Receipt Header")
        {
            RequestFilterFields = "No.";
            column(Company_Name; company.Name)
            {
            }
            column(Company_Pic; company.Picture)
            {
            }
            column(totamt; totamt)
            {
                //DecimalPlaces = 0:5;
            }
            column(LOCATION_Name; LocationVar.Name)
            {
            }
            column(Location_Address; LocationVar.Address + ' ' + LocationVar."Address 2" + ' ' + LocationVar.City + '  ' + LocationVar."Post Code")
            {
            }
            column(location_FormatNo; 0) //LocationVar."Format No.") //PCPL-Deepak
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
            column(No_PurchRcptHeader; "No.")
            {
            }
            column(ExternalDocumentNo_TransferReceiptHeader; "Transfer Receipt Header"."External Document No.")
            {
            }
            column(ShipmentDate_TransferReceiptHeader; "Transfer Receipt Header"."Shipment Date")
            {
            }
            column(BuyfromVendorName_PurchRcptHeader; "Transfer Receipt Header"."Transfer-from Name")
            {
            }
            column(BuyfromAddress_PurchRcptHeader; Location_from.Description + ' ' + "Transfer Receipt Header"."Transfer-from Address")
            {
            }
            column(BuyfromAddress2_PurchRcptHeader; "Transfer Receipt Header"."Transfer-from Address 2")
            {
            }
            column(BuyfromCity_PurchRcptHeader; "Transfer Receipt Header"."Transfer-from City")
            {
            }
            column(OrderNo_PurchRcptHeader; '"Purch. Rcpt. Header"."Order No."')
            {
            }
            column(JWDeliveryChallan_TransferReceiptHeader; '') //"Transfer Receipt Header"."JW Delivery Challan") //PCPL-Deepak
            {
            }
            column(PostingDate_PurchRcptHeader; "Posting Date")
            {
            }
            column(VarManName; VarManName)
            {
            }
            column(VarManAddress; VarManAddress)
            {
            }
            column(UserID_PurchRcptHeader; "User ID")
            {
            }
            column(PaytoName_PurchRcptHeader; '"Purch. Rcpt. Header"."Pay-to Name"')
            {
            }
            column(PaytoAddress_PurchRcptHeader; '"Purch. Rcpt. Header"."Pay-to Address"')
            {
            }
            column(PaytoAddress2_PurchRcptHeader; '"Purch. Rcpt. Header"."Pay-to Address 2"')
            {
            }
            column(PaytoCity_PurchRcptHeader; '"Purch. Rcpt. Header"."Pay-to City"' + ' ' + '"Purch. Rcpt. Header"."Pay-to Post Code"')
            {
            }
            column(ManufactureName; '"Purch. Rcpt. Header"."Manufacturer Name1"')
            {
            }
            column(ManufactureAddress; '"Purch. Rcpt. Header"."Manufacturer Address1"')
            {
            }
            column(UserName; User_rec."Full Name")
            {
            }
            column(UserDesignation; '')// User_rec."User Designation") //PCPL/NSW/MIG 09Aug22
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
            column(PRH_VendorChallanNo; '"Purch. Rcpt. Header"."Vendor Shipment No."')
            {
            }
            column(Approved_By; IDS."Approved By")
            {
            }
            column(PostingDate_Time; "Transfer Receipt Header"."Posting Date")
            {
            }
            column(PostingDate_Time_; "Transfer Receipt Header".Postingdate_time)
            {
            }
            column(VendorInvoice_no; PH."Vendor Invoice No.")
            {
            }
            column(Packing_Deatails; PH.PackingDetails)
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
            dataitem("Transfer Receipt Line"; "Transfer Receipt Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.")
                                    WHERE(Quantity = FILTER(> 0));
                column(Quantity_PurchRcptLine; Quantity)
                {
                }
                column(No_PurchRcptLine; "Item No.")
                {
                }
                column(Description_PurchRcptLine; Description)
                {
                }
                column(docpurchrcptline; "Document No.")
                {
                }
                column(linenopurchrcptline; "Line No.")
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
                column(Inspection_InspectedBy_r; Inspectedby)
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
                column(UOM_PurchRcptLine; "Unit of Measure")
                {
                }
                dataitem("Item Ledger Entry"; "Item Ledger Entry")
                {
                    DataItemLink = "Item No." = FIELD("Item No."),
                                   "Document No." = FIELD("Document No."),
                                   "Location Code" = FIELD("Transfer-to Code");
                    column(ItemDescription_ItemLedgerEntry; "Item Ledger Entry"."Item Description")
                    {
                    }
                    column(Sr; Sr)
                    {
                    }
                    column(Item_Ledger_ItemNo; "Item Ledger Entry"."Item No.")
                    {
                    }
                    column(Batch_No; "Item Ledger Entry"."Lot No.")
                    {
                    }
                    column(Item_Ledger_Qty; "Item Ledger Entry".Quantity)
                    {
                    }
                    column(Item_Ledger_unitofmeasure; "Item Ledger Entry"."Unit of Measure Code")
                    {
                    }
                    column(Apprroved_Qty; ApprovedQty)
                    {
                    }
                    column(certificateno; certificateno)
                    {
                    }
                    column(Rejected_Qty; RejectedQty)
                    {
                    }
                    column(Ext_Lot_No; "Item Ledger Entry"."External Lot No.")
                    {
                    }
                    dataitem("Inspection Data Sheet"; "Inspection Data Sheet")
                    {
                        DataItemLink = "Document No." = FIELD("Order No.");
                        DataItemTableView = WHERE("Document Type" = FILTER(Transfer));
                        column(EXPDate_InspectionDataSheet; "Inspection Data Sheet"."EXP Date")
                        {
                        }
                        column(Manufacutered_Date; "Mfg. Date")
                        {
                        }
                        column(Certificate_No; "Certificate No.")
                        {
                        }
                        column(QtyApp; InspectionDataSheet.Quantity)
                        {
                        }
                        column(RM_PackingDetail; InspectionDataSheet."RM Packing Detail")
                        {
                        }
                        column(ApprovedBy_InspectionDataSheet; "Inspection Data Sheet"."Approved By")
                        {
                        }
                        column(Inspection_InspectedBy; "Inspection Data Sheet"."Inspected By")
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            IF "Item Ledger Entry"."QC Status" = "Item Ledger Entry"."QC Status"::Approved THEN
                                InspectionDataSheet."Certificate No." := "Inspection Data Sheet"."Certificate No."
                            ELSE
                                "Inspection Data Sheet"."Certificate No." := '';

                            PostedInspection.RESET;
                        end;
                    }

                    trigger OnAfterGetRecord();
                    var
                        Location: Record 14;
                    begin

                        Sr := Sr + 1;
                        // >> Saravanan.P, Karya, 04/07/2014
                        //"Item Ledger Entry".SETRANGE("Location Code","Purch. Rcpt. Line"."Location Code");

                        ApprovedQty := 0;
                        RejectedQty := 0;

                        IF "Item Ledger Entry"."QC Status" = "Item Ledger Entry"."QC Status"::Approved THEN
                            ApprovedQty := "Item Ledger Entry".Quantity
                        ELSE
                            IF "Item Ledger Entry"."QC Status" = "Item Ledger Entry"."QC Status"::Rejected THEN
                                RejectedQty := "Item Ledger Entry".Quantity;

                        certificateno := '';
                        PostedInspection.RESET;
                        //PostedInspection.SETRANGE(PostedInspection."Document No.","Item Ledger Entry"."Document No.");
                        PostedInspection.SETRANGE(PostedInspection."Lot No.", "Item Ledger Entry"."Lot No.");
                        PostedInspection.SETRANGE("Document Type", PostedInspection."Document Type"::Transfer);
                        IF PostedInspection.FINDLAST THEN BEGIN
                            //REPEAT
                            //MESSAGE(PostedInspection."Certificate No.");
                            certificateno := PostedInspection."Certificate No.";
                            //UNTIL PostedInspection.NEXT=0;
                        END;
                        // << Saravanan.P, Karya, 04/07/2014
                    end;
                }

                trigger OnAfterGetRecord();
                begin

                    cOUNNT += "Transfer Receipt Line".COUNT;
                    IF cOUNNT > 3 THEN
                        CurrReport.SKIP;


                    //PCPL/NSW/MIG 09Aug22
                    // Ile.RESET;
                    // Ile.SETRANGE(Ile."Item No.", "Transfer Receipt Line"."Item No.");
                    // Ile.SETRANGE(Ile."Document No.", "Transfer Receipt Line"."Document No.");

                    // IF Ile.FINDFIRST THEN;
                    /*
                    RecPoWhseRecLine.RESET;
                    RecPoWhseRecLine.SETRANGE(RecPoWhseRecLine."Posted Source No.","Posted Inspection"."GRN No.");
                    IF RecPoWhseRecLine.FINDFIRST THEN
                    BEGIN
                      RecPoWhseReHead.RESET;
                      RecPoWhseReHead.SETRANGE(RecPoWhseReHead."No.",RecPoWhseRecLine."No.");
                      IF RecPoWhseReHead.FINDFIRST THEN
                        VarManName:=RecPoWhseReHead."Manufacturer Name";
                    END;
                    */
                    //BRB 20211214
                    IF ItemCard.GET(Ile."Item No.") THEN;

                    IF ItemCard."Inventory Posting Group" = 'RM' THEN BEGIN
                        RecWarehouseEntry.RESET;
                        RecWarehouseEntry.SETRANGE(RecWarehouseEntry."Lot No.", Ile."Lot No.");
                        RecWarehouseEntry.SETRANGE(RecWarehouseEntry."Item No.", Ile."Item No.");
                        RecWarehouseEntry.SETFILTER(RecWarehouseEntry."Source Code", '%1', 'PURCHASES');
                        RecWarehouseEntry.SETRANGE(RecWarehouseEntry."Whse. Document Type", RecWarehouseEntry."Whse. Document Type"::Receipt);
                        IF RecWarehouseEntry.FINDFIRST THEN;
                        RecPostedWarehouseReceiptHeader.RESET;
                        RecPostedWarehouseReceiptHeader.SETRANGE(RecPostedWarehouseReceiptHeader."No.", RecWarehouseEntry."Whse. Document No.");
                        IF RecPostedWarehouseReceiptHeader.FINDFIRST THEN BEGIN
                            VarManName := RecPostedWarehouseReceiptHeader."Manufacturer Name";
                            VarManAddress := RecPostedWarehouseReceiptHeader."Manufacturer Address";
                            // VarPacAddress := RecPostedWarehouseReceiptHeader."Packing details";
                        END;
                    END ELSE BEGIN
                        RecWarehouseEntry.RESET;
                        RecWarehouseEntry.SETRANGE(RecWarehouseEntry."Lot No.", Ile."Lot No.");
                        RecWarehouseEntry.SETRANGE(RecWarehouseEntry."Item No.", Ile."Item No.");
                        //RecWarehouseEntry.SETFILTER(RecWarehouseEntry."Source Code",'%1','PRODORDER');
                        RecWarehouseEntry.SETRANGE("Source Document", RecWarehouseEntry."Source Document"::"Output Jnl.");
                        RecWarehouseEntry.SETRANGE(RecWarehouseEntry."Whse. Document Type", RecWarehouseEntry."Whse. Document Type"::Production);
                        IF RecWarehouseEntry.FINDFIRST THEN BEGIN
                            IF loca.GET(RecWarehouseEntry."Location Code") THEN;

                            VarManName := loca.Name;
                            VarManAddress := loca.Address + ' ' + loca."Address 2";
                            VarPacAddress := RecPostedWarehouseReceiptHeader."Packing details";
                        END;
                    END;
                    RecWarehouseEntry.RESET;
                    RecWarehouseEntry.SETRANGE(RecWarehouseEntry."Lot No.", Ile."Lot No.");
                    RecWarehouseEntry.SETRANGE(RecWarehouseEntry."Item No.", Ile."Item No.");
                    RecWarehouseEntry.SETFILTER(RecWarehouseEntry."Source Code", '%1', 'TRANSFER');
                    RecWarehouseEntry.SETRANGE(RecWarehouseEntry."Whse. Document Type", RecWarehouseEntry."Whse. Document Type"::Receipt);
                    IF RecWarehouseEntry.FINDLAST THEN;
                    RecPostedWarehouseReceiptHeader.RESET;
                    RecPostedWarehouseReceiptHeader.SETRANGE(RecPostedWarehouseReceiptHeader."No.", RecWarehouseEntry."Whse. Document No.");
                    IF RecPostedWarehouseReceiptHeader.FINDFIRST THEN BEGIN
                        VarPacAddress := RecPostedWarehouseReceiptHeader."Packing details";
                    END;

                    //add by sanjay start
                    WE.RESET;
                    WE.SETRANGE(WE."Item No.", "Transfer Receipt Line"."Item No.");
                    WE.SETRANGE(WE."Source No.", "Transfer Receipt Line"."Document No.");
                    WE.SETRANGE(WE."Source Line No.", "Item Ledger Entry"."Document Line No.");
                    WE.SETRANGE(WE.Quantity, Ile.Quantity);
                    IF WE.FINDFIRST THEN;
                    //add by sanjay end
                    //PL.RESET;   //BRB
                    //PL.SETRANGE(PL."Document No.","Transfer Receipt Line"."Order No.");

                    IF PL.FINDFIRST THEN

                        //To addd Item Base unit of Measure
                        ItemCard.RESET;
                    ItemCard.SETRANGE(ItemCard."No.", "Transfer Receipt Line"."Item No.");
                    IF ItemCard.FINDFIRST THEN
                        ItemUnitofMeasure := ItemCard."Base Unit of Measure";

                    QTY := 0;
                    QTY2 := 0;
                    IDS.RESET;
                    IDS.SETRANGE(IDS."GRN No.", "Transfer Receipt Line"."Document No.");
                    IF IDS.FINDSET THEN BEGIN
                        IF IDS.Approval = IDS.Approval::Approved THEN
                            QTY := IDS.Quantity
                        ELSE
                            IF IDS.Approval = IDS.Approval::Rejected THEN
                                QTY2 := IDS.Quantity;
                    END;

                    /*//
                    //certificateno :='';
                    PostedInspection.RESET;
                    PostedInspection.SETRANGE(PostedInspection."GRN No.","Purch. Rcpt. Line"."Document No.");
                    IF PostedInspection.FINDFIRST THEN BEGIN
                      //REPEAT
                        certificateno := PostedInspection."Certificate No.";
                      //UNTIL PostedInspection.NEXT=0;
                    END
                    //
                    */

                end;
            }

            trigger OnAfterGetRecord();
            begin
                PH.RESET;
                //PH.SETRANGE(PH."No.","Transfer Receipt Header"."Order No.");
                //IF PH.FINDFIRST THEN ;

                IF LocationVar.GET("Transfer Receipt Header"."Transfer-to Code") THEN;

                IF InspectionDataSheet.GET("Transfer Receipt Header"."No.") THEN;

                //KARYA_SARAN++ids
                IF Location_from.GET("Transfer Receipt Header"."Transfer-from Code") THEN;

                IDS.RESET;
                IDS.SETRANGE("Transfer Receipt No.", "Transfer Receipt Header"."No.");
                IF IDS.FINDFIRST THEN BEGIN
                    User_rec.RESET;
                    User_rec.SETRANGE("User Name", IDS."Approved By");
                    IF User_rec.FINDFIRST THEN BEGIN
                        ApprovedBy := User_rec."Full Name";
                        ApproDesignation := '';// User_rec."User Designation"; Inspection Data Sheet
                    END;
                    User_rec.RESET;
                    User_rec.SETRANGE("User Name", IDS."Inspected By");
                    IF User_rec.FINDFIRST THEN BEGIN
                        Inspectedby := User_rec."Full Name";
                        InspectedDesignation := '';// User_rec."User Designation"; Inspection Data Sheet
                    END;
                END;
                User_rec.RESET;
                User_rec.SETRANGE("User Name", "Transfer Receipt Header"."User ID");
                IF User_rec.FINDFIRST THEN;
                /*
                // MESSAGE('inspected %1',IDS."Inspected By");
                IF ManufactureAdd THEN BEGIN
                 nam := "Purch. Rcpt. Header"."Pay-to Name";
                 add := "Purch. Rcpt. Header"."Pay-to Address";
                 add2 := "Purch. Rcpt. Header"."Pay-to Address 2" ;
                 city := "Purch. Rcpt. Header"."Pay-to City" +' '+"Purch. Rcpt. Header"."Pay-to Post Code";
                 END ELSE BEGIN
                 nam := ManufactureName;
                 add := ManufactureAddress;
                 add2 := ManufactureAddress2;
                 city :=ManufactureCity+' '+ManufacturePostcode;
                 END;
                */
                //KARYA_SARAN--


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
                        VarVendShipDt := 0D;//RecPoWhseReHead."Vendor Shipment Date"; Inspection Data Sheet
                    END;
                END;
                //BRB

                IF VarManName = '' THEN
                    //KARYA_SARAN++

                    IDS.RESET;
                IDS.SETRANGE(IDS."GRN No.", "Transfer Receipt Header"."No.");
                IF IDS.FINDFIRST THEN;



                //KARYA_SARAN--

                //PCPL0024--End
                //PCPL-25
                CLEAR(totamt);
                TransRcptLine.RESET;
                TransRcptLine.SETRANGE("Document No.", "Transfer Receipt Header"."No.");
                //PurchRcptLine.SETFILTER(Quantity,'>','0');
                IF TransRcptLine.FINDSET THEN BEGIN
                    REPEAT
                        totamt += TransRcptLine.Quantity;
                    UNTIL TransRcptLine.NEXT = 0;
                END;
                //MESSAGE(FORMAT(totamt));
                //PCPL-25

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
        VarManAddress: Text;
        VarPacAddress: Text[250];
        VarVendShipNo: Code[35];
        VarVendShipDt: Date;
        Sr: Integer;
        ApprovedBy: Text;
        Inspectedby: Text;
        ApproDesignation: Text;
        InspectedDesignation: Text;
        TransRcptLine: Record "Transfer Receipt Line";
        totamt: Decimal;
        Location_from: Record Location;
        RecWarehouseEntry: Record "Warehouse Entry";
        RecPostedWarehouseReceiptHeader: Record "Posted Whse. Receipt Header";
        LocationVar: Record Location;
}

