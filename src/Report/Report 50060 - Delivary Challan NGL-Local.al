report 50060 "Delivary Challan NGL-Local"
{
    // version KAR1.00

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Delivary Challan NGL-Local.rdl';

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            DataItemTableView = WHERE("Customer Posting Group" = CONST('DOMESTIC'));
            RequestFilterFields = "No.";
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(Head_Off_CaptionLbl; Head_Off_CaptionLbl)
            {
            }
            column(TelNo_CaptionLbl; TelNo_CaptionLbl)
            {
            }
            column(ConsigeeName_Address_CaptionLbl; ConsigeeName_Address_CaptionLbl)
            {
            }
            column(CustomerName_Address_CaptionLbl; CustomerName_Address_CaptionLbl)
            {
            }
            column(ChallanNo_CaptionLbl; ChallanNo_CaptionLbl)
            {
            }
            column(LRNo_CaptionLbl; LRNo_CaptionLbl)
            {
            }
            column(Transporter_CaptionLbl; Transporter_CaptionLbl)
            {
            }
            column(Date_CaptionLbl; Date_CaptionLbl)
            {
            }
            column(DespatchMode_CaptionLbl; DespatchMode_CaptionLbl)
            {
            }
            column(VehicleNo_CaptionLbl; VehicleNo_CaptionLbl)
            {
            }
            column(VATTIN_CaptionLbl; VATTIN_CaptionLbl)
            {
            }
            column(CSTTIN_CaptionLbl; CSTTIN_CaptionLbl)
            {
            }
            column(ECC_CaptionLbl; ECC_CaptionLbl)
            {
            }
            column(No_SalesShipmentHeader; "Sales Shipment Header"."No.")
            {
            }
            column(PostingDate_SalesShipmentHeader; "Sales Shipment Header"."Posting Date")
            {
            }
            column(ShipmentMethodCode_SalesShipmentHeader; "Sales Shipment Header"."Shipment Method Code")
            {
            }
            column(Unit_ofMeasure; "Sales Shipment Line"."Unit of Measure")
            {
            }
            column(Location_Code1; Location_code1)
            {
            }
            column(vat_no; Vat_no)
            {
            }
            column(ecc_no; ecc_no)
            {
            }
            column(BilltoAddr1; BilltoAddr[1])
            {
            }
            column(BilltoAddr2; BilltoAddr[2])
            {
            }
            column(BilltoAddr3; BilltoAddr[3])
            {
            }
            column(BilltoAddr4; BilltoAddr[4])
            {
            }
            column(BilltoAddr5; BilltoAddr[5])
            {
            }
            column(BilltoAddr6; BilltoAddr[6])
            {
            }
            column(BilltoAddr7; BilltoAddr[7])
            {
            }
            column(BilltoAddr8; BilltoAddr[8])
            {
            }
            column(SelltoAddr1; SelltoAddr[1])
            {
            }
            column(SelltoAddr2; SelltoAddr[2])
            {
            }
            column(SelltoAddr3; SelltoAddr[3])
            {
            }
            column(SelltoAddr4; SelltoAddr[4])
            {
            }
            column(SelltoAddr5; SelltoAddr[5])
            {
            }
            column(SelltoAddr6; SelltoAddr[6])
            {
            }
            column(SelltoAddr7; SelltoAddr[7])
            {
            }
            column(SelltoAddr8; SelltoAddr[8])
            {
            }
            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                column(SrNo_CaptionLbl; SrNo_CaptionLbl)
                {
                }
                column(Description_CaptionLbl; Description_CaptionLbl)
                {
                }
                column(NoofBundles_CaptionLbl; NoofBundles_CaptionLbl)
                {
                }
                column(ContentsPer_CaptionLbl; ContentsPer_CaptionLbl)
                {
                }
                column(TotalNos_CaptionLbl; TotalNos_CaptionLbl)
                {
                }
                column(Quantity_CaptionLbl; Quantity_CaptionLbl)
                {
                }
                column(Units_CaptionLbl; Units_CaptionLbl)
                {
                }
                column(Remarks_CaptionLbl; Remarks_CaptionLbl)
                {
                }
                column(Description_SalesShipmentLine; "Sales Shipment Line".Description)
                {
                }
                column(Quantity_SalesShipmentLine; "Sales Shipment Line".Quantity)
                {
                }
                column(ShiptoAddr1; ShiptoAddr[1])
                {
                }
                column(ShiptoAddr2; ShiptoAddr[2])
                {
                }
                column(ShiptoAddr3; ShiptoAddr[3])
                {
                }
                column(ShiptoAddr4; ShiptoAddr[4])
                {
                }
                column(ShiptoAddr5; ShiptoAddr[5])
                {
                }
                column(ShiptoAddr6; ShiptoAddr[6])
                {
                }
                column(ShiptoAddr7; ShiptoAddr[7])
                {
                }
                column(ShiptoAddr8; ShiptoAddr[8])
                {
                }
                column(BatchText; BatchText)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    CLEAR(BatchNo);
                    CLEAR(BatchQty);
                    CLEAR(BatchText);
                    i := 1;
                    ILE.RESET;
                    ILE.SETCURRENTKEY("Document No.");
                    ILE.SETRANGE("Document No.", "Document No.");
                    ILE.SETRANGE("Document Line No.", "Line No.");
                    IF ILE.FIND('-') THEN
                        REPEAT
                            BatchNo[i] := ILE."Lot No.";
                            BatchQty[i] := ABS(ILE.Quantity);

                            IF i = 1 THEN
                                BatchText := BatchNo[1] + '(' + FORMAT(BatchQty[1]) + ')'
                            ELSE
                                BatchText += ', ' + BatchNo[i] + '(' + FORMAT(BatchQty[i]) + ')';

                            i += 1;
                        UNTIL ILE.NEXT = 0;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                // FormatAddr.SalesShptBillTo(BilltoAddr, "Sales Shipment Header");
                // FormatAddr.SalesShptBillTo(SelltoAddr, "Sales Shipment Header");
                // FormatAddr.SalesShptBillTo(ShiptoAddr, "Sales Shipment Header");

                //Add Location wise address by sanjay

                Rec_Loati.RESET;
                Rec_Loati.SETRANGE(Rec_Loati.Code, "Sales Shipment Header"."Location Code");
                IF Rec_Loati.FINDFIRST THEN BEGIN
                    Location_code1 := Rec_Loati.Address + ' ' + Rec_Loati."Address 2" + ' ' + Rec_Loati.City + ' ' + Rec_Loati."Post Code" + ',' + Rec_Loati."Phone No." + ',' + Rec_Loati."Fax No.";
                    Vat_no := '';//Rec_Loati."T.I.N. No."; PCPL/NSW/MIG 09Aug22
                    ecc_no := '';//Rec_Loati."E.C.C. No."; PCPL/NSW/MIG 09Aug22

                END;

                //added code by sanjay end
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
        ConsigneeCap = 'Consignee Name & Address';
    }

    trigger OnPreReport();
    begin
        IF CompanyInfo.GET THEN
            CompanyInfo.CALCFIELDS(Picture);

        IF "Sales Shipment Header".GETFILTER("Sales Shipment Header"."No.") = '' THEN
            ERROR(ERR_TXT);
    end;

    var
        CompanyInfo: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        BilltoAddr: array[8] of Text[50];
        SelltoAddr: array[8] of Text[50];
        Head_Off_CaptionLbl: Label '<b> Works: </b> 2 New Metalage Indl Premises, Subhash Road, Jogeshwari East, Mumbai 400060, India';
        TelNo_CaptionLbl: Label '<b> Tel.:</b> (+91 22) 40539999 <b>Fax:</b> (+91 22) 40539900 <b>Email:</b> info@nglfinechem.com';
        ConsigeeName_Address_CaptionLbl: Label 'Consignee Name & Address';
        CustomerName_Address_CaptionLbl: Label 'Customer Name & Address';
        ChallanNo_CaptionLbl: Label 'Challan No :';
        Date_CaptionLbl: Label 'Date:';
        LRNo_CaptionLbl: Label 'L R No:';
        Transporter_CaptionLbl: Label 'Transporter Name:';
        DespatchMode_CaptionLbl: Label 'Despatch Mode:';
        VehicleNo_CaptionLbl: Label 'Vehicle No:';
        VATTIN_CaptionLbl: Label 'VAT TIN NO:';
        CSTTIN_CaptionLbl: Label 'CST TIN NO:';
        ECC_CaptionLbl: Label 'E.C.C. NO:';
        SrNo_CaptionLbl: Label 'Sr. No';
        Description_CaptionLbl: Label 'Description of goods';
        NoofBundles_CaptionLbl: Label 'No. of Bundles';
        ContentsPer_CaptionLbl: Label 'Contents per Bundles';
        TotalNos_CaptionLbl: Label 'Total Nos';
        Quantity_CaptionLbl: Label 'Quantity';
        Units_CaptionLbl: Label 'Units';
        Remarks_CaptionLbl: Label 'Remarks';
        ShiptoAddr: array[8] of Text[50];
        ILE: Record "Item Ledger Entry";
        BatchNo: array[1024] of Text[100];
        BatchQty: array[1024] of Decimal;
        i: Integer;
        BatchText: Text[1024];
        ERR_TXT: Label 'Please Enter Shipment No.';
        Rec_Loati: Record Location;
        Location_code1: Text[1024];
        Vat_no: Text;
        ecc_no: Text;
}

