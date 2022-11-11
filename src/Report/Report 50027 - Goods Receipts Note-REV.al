report 50027 "Goods Receipts Note-REV"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Goods Receipts Note-REV.rdl';

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
            column(totamt; totamt)
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
            column(ManufactureName; '')//"Purch. Rcpt. Header"."Manufacturer Name1")  //PCPL/NSW/MIG  03Aug22
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
                column(UOM_PurchRcptLine; "Purch. Rcpt. Line"."Unit of Measure")
                {
                }
                dataitem("Item Ledger Entry"; "Item Ledger Entry")
                {
                    DataItemLink = "Document No." = FIELD("Document No.");
                    column(ExpDate; ExpDate)
                    {
                    }
                    column(MFGDate; MFGDate)
                    {
                    }
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
                        DataItemLink = "GRN No." = FIELD("Document No."),
                                       "Lot No." = FIELD("Lot No.");
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
                        IF PostedInspection.FINDFIRST THEN BEGIN
                            //REPEAT
                            //MESSAGE(PostedInspection."Certificate No.");
                            certificateno := PostedInspection."Certificate No.";
                            //UNTIL PostedInspection.NEXT=0;
                        END;
                        // << Saravanan.P, Karya, 04/07/2014
                        //PCPL-25
                        InspectionDataSheet.RESET;
                        InspectionDataSheet.SETRANGE("GRN No.", "Item Ledger Entry"."Document No.");
                        InspectionDataSheet.SETRANGE("Lot No.", "Item Ledger Entry"."Lot No.");
                        IF InspectionDataSheet.FINDFIRST THEN BEGIN
                            MFGDate := InspectionDataSheet."Mfg. Date";
                            ExpDate := InspectionDataSheet."EXP Date";
                        END
                        ELSE BEGIN
                            PostedInspection.RESET;
                            PostedInspection.SETRANGE("GRN No.", "Item Ledger Entry"."Document No.");
                            PostedInspection.SETRANGE("Lot No.", "Item Ledger Entry"."Lot No.");
                            IF PostedInspection.FINDFIRST THEN BEGIN
                                MFGDate := PostedInspection."Mfg. Date";
                                ExpDate := PostedInspection."EXP Date";
                            END;
                        END;
                        //PCPL-25
                    end;
                }

                trigger OnAfterGetRecord();
                begin

                    cOUNNT += "Purch. Rcpt. Line".COUNT;
                    IF cOUNNT > 3 THEN
                        CurrReport.SKIP;


                    /*
                    Ile.RESET;
                    Ile.SETRANGE(Ile."Item No.","Purch. Rcpt. Line"."No.");
                    Ile.SETRANGE(Ile."Document No.","Purch. Rcpt. Line"."Document No.");
                    
                    IF Ile.FINDFIRST THEN ;
                    */
                    //add by sanjay start
                    WE.RESET;
                    WE.SETRANGE(WE."Item No.", "Purch. Rcpt. Line"."No.");
                    WE.SETRANGE(WE."Source No.", "Purch. Rcpt. Line"."Document No.");
                    WE.SETRANGE(WE."Source Line No.", "Item Ledger Entry"."Document Line No.");
                    WE.SETRANGE(WE.Quantity, Ile.Quantity);
                    IF WE.FINDFIRST THEN;
                    //add by sanjay end
                    PL.RESET;
                    PL.SETRANGE(PL."Document No.", "Purch. Rcpt. Line"."Order No.");

                    IF PL.FINDFIRST THEN

                        //To addd Item Base unit of Measure
                        ItemCard.RESET;
                    ItemCard.SETRANGE(ItemCard."No.", "Purch. Rcpt. Line"."No.");
                    IF ItemCard.FINDFIRST THEN
                        ItemUnitofMeasure := ItemCard."Base Unit of Measure";

                    QTY := 0;
                    QTY2 := 0;
                    IDS.RESET;
                    IDS.SETRANGE(IDS."GRN No.", "Purch. Rcpt. Line"."Document No.");
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
                        ApproDesignation := '';//User_rec."User Designation";  //PCPL/NSW/MIG  03Aug22
                    END;
                    User_rec.RESET;
                    User_rec.SETRANGE("User Name", IDS."Inspected By");
                    IF User_rec.FINDFIRST THEN BEGIN
                        Inspectedby := User_rec."Full Name";
                        InspectedDesignation := '';//User_rec."User Designation"; //PCPL/NSW/MIG  03Aug22
                    END;
                END;
                User_rec.RESET;
                User_rec.SETRANGE("User Name", "Purch. Rcpt. Header"."User ID");
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
                /*ELSE BEGIN
                nam := ManufactureName;
                add := ManufactureAddress;
                add2 := ManufactureAddress2;
                city :=ManufactureCity+' '+ManufacturePostcode;
                END;
                */

                //KARYA_SARAN--

                //PCPL0024--End
                //PCPL-25
                PurchRcptLine.RESET;
                PurchRcptLine.SETRANGE(PurchRcptLine."Document No.", "Purch. Rcpt. Header"."No.");
                //PurchRcptLine.SETFILTER(Quantity,'>','0');
                IF PurchRcptLine.FINDSET THEN BEGIN
                    REPEAT
                        totamt += PurchRcptLine.Quantity;
                    UNTIL PurchRcptLine.NEXT = 0;
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
        User_rec: Record user;
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
        PurchRcptLine: Record 121;
        totamt: Decimal;
        MFGDate: Date;
        ExpDate: Date;
}

