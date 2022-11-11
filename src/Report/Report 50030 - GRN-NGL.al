report 50030 "GRN-NGL"
{
    // version KAR1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\GRN-NGL.rdl';

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
            column(ManufactureAddress; '')//"Purch. Rcpt. Header"."Manufacturer Address1") //PCPL/NSW/MIG  03Aug22
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
                column(Inspection_ApprovedBy; IDS."Approved By")
                {
                }
                column(Inspection_InspectedBy; IDS."Inspected By")
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
                    column(Rejected_Qty; RejectedQty)
                    {
                    }
                    column(QC_STATUS; "Item Ledger Entry"."QC Status")
                    {
                    }
                    dataitem("Inspection Data Sheet"; "Inspection Data Sheet")
                    {
                        DataItemLink = "GRN No." = FIELD("Document No."),
                                       "Lot No." = FIELD("Lot No.");
                        column(Manufacutered_Date; "Mfg. Date")
                        {
                        }
                        column(Certificate_No; "Certificate No.")
                        {
                        }
                        column(Expiry_Date; 'Expiry_Date')
                        {
                        }
                    }

                    trigger OnAfterGetRecord();
                    begin
                        // >> Saravanan.P, Karya, 04/07/2014
                        ApprovedQty := 0;
                        RejectedQty := 0;

                        IF "Item Ledger Entry"."QC Status" = "Item Ledger Entry"."QC Status"::Approved THEN
                            ApprovedQty := "Item Ledger Entry".Quantity
                        ELSE
                            IF "Item Ledger Entry"."QC Status" = "Item Ledger Entry"."QC Status"::Rejected THEN
                                RejectedQty := "Item Ledger Entry".Quantity;



                        // << Saravanan.P, Karya, 04/07/2014
                    end;
                }

                trigger OnAfterGetRecord();
                begin

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

                end;
            }

            trigger OnAfterGetRecord();
            begin
                PH.RESET;
                PH.SETRANGE(PH."No.", "Purch. Rcpt. Header"."Order No.");
                IF PH.FINDFIRST THEN;

                IF loca.GET("Purch. Rcpt. Header"."Location Code") THEN;

                IF InspectionDataSheet.GET("Purch. Rcpt. Header"."No.") THEN;

                //KARYA_SARAN++

                IDS.RESET;
                IDS.SETRANGE(IDS."GRN No.", "Purch. Rcpt. Header"."No.");
                IF IDS.FINDFIRST THEN;
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



                /*
                QTY:=0;
                QTY2:=0;
                IDS.RESET;
                IDS.SETRANGE(IDS."GRN No.","Purch. Rcpt. Header"."No.");
                IF IDS.Approval=IDS.Approval::Approved THEN
                  QTY := IDS.Quantity
                   ELSE IF IDS.Approval=IDS.Approval::Rejected THEN
                  QTY2 := IDS.Quantity;
                */

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

    var
        company: Record "Company Information";
        PH: Record "Purchase Header";
        Ile: Record "Item Ledger Entry";
        loca: Record Location;
        PL: Record "Purchase Line";
        InspectionDataSheet: Record 50011;
        InspectionDataSheetline: Record 50012;
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
        IDS: Record 50011;
        QTY: Decimal;
        QTY2: Decimal;
        Inspection: Record 50011;
        ApprovedQty: Decimal;
        RejectedQty: Decimal;
        Packing_Size: Code[30];
        WE: Record "Warehouse Entry";
        ItemUnitofMeasure: Text;
        ItemCard: Record Item;
}

