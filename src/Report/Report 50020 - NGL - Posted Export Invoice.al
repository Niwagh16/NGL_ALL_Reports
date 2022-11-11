report 50020 "NGL - Posted Export Invoice"
{
    // version KAR1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\NGL - Posted Export Invoice.rdl';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.")
                                ORDER(Ascending);
            RequestFilterFields = "No.";
            column(HeaderPrint1; HeaderPrint1)
            {
            }
            column(HeaderPrint2; HeaderPrint2)
            {
            }
            column(CustomerNo; "Sales Invoice Header"."Sell-to Customer No.")
            {
            }
            column(InvoiceNo; "Sales Invoice Header"."No.")
            {
            }
            column(CompanyNmae; CompInfo.Name)
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(CompanyAddress; CompInfo.Address)
            {
            }
            column(CompanyCity; CompInfo.City)
            {
            }
            column(CompRange; '')//CompInfo."C.E. Range") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(CompRegisration; '')//CompInfo."C.E. Registration No.") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(CompDivision; '')//CompInfo."C.E. Division") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(CompInfo_IEC_Code; '')//CompInfo."I.E.C. Code") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(CustNmae; Customer.Name)
            {
            }
            column(CustAdd; Customer.Address)
            {
            }
            column(CustAdd2; Customer."Address 2")
            {
            }
            column(CustCity; Customer.City)
            {
            }
            column(CustPhone; Customer."Phone No.")
            {
            }
            column(CustEccc; '')//Customer."E.C.C. No.") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(CustRange; '')//Customer.Range) //PCPL/NSW/MIG  03Aug22
            {
            }
            column(CustPAN; Customer."P.A.N. No.")
            {
            }
            column(CustAccNo; Customer."Our Account No.")
            {
            }
            column(InvoiceDate; FORMAT("Sales Invoice Header"."Posting Date"))
            {
            }
            column(BuyerOrderNo; "Sales Invoice Header"."Order No.")
            {
            }
            column(BuyerOrderDate; FORMAT("Sales Invoice Header"."Order Date"))
            {
            }
            column(Preecarriage; '')//"Sales Invoice Header"."Pre-Carriage") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(Carriage; '')//"Sales Invoice Header".Carriage) //PCPL/NSW/MIG  03Aug22
            {
            }
            column(VesselNo; '')//"Sales Invoice Header"."Vessel/Flight No.") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(PortofDischarge; '')//"Sales Invoice Header"."Port of Discharge")//PCPL/NSW/MIG  03Aug22
            {
            }
            column(PortOfDischargeName; PortOfDischargeName)
            {
            }
            column(PortName; PortName)
            {
            }
            column(FinalDestination; '')//"Sales Invoice Header"."Final Destination") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(CountryOfFinalDesName; CountryOfFinalDesName)
            {
            }
            column(CountryOrgingoods; '')//"Sales Invoice Header"."Country of Origin of Goods") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(CountryOfOriginName; CountryOfOriginName)
            {
            }
            column(ExportMethod; '')//"Sales Invoice Header"."Export Shipment Method") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(AmtInWords1_AmtInWords2; AmtInWords[1] + AmtInWords[2])
            {
            }
            column(CountryFinalDestination; '')//"Sales Invoice Header"."Country of Final Destination") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(Export_Shipment_Type; '')//"Sales Invoice Header"."Export Shipment Type") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(Bank_Name; CompInfo."Bank Name")
            {
            }
            column(Bank_Address; '')//CompInfo."Bank name 2") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(Bank_Address2; '')
            {
            }
            column(Bank_City; '')
            {
            }
            column(Bank_SWIFTCode; CompInfo."SWIFT Code")
            {
            }
            column(Bank_No; Bank."No.")
            {
            }
            column(Bank_Bank_Account_No; CompInfo."Bank Branch No.")
            {
            }
            column(Volume; Volume)
            {
            }
            column(ContainerNo; '')//PackingListPackageDetails."Transport Reg") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(PackingListPackageDetails_Length; 0)// PackingListPackageDetails.Length) //PCPL/NSW/MIG  03Aug22
            {
            }
            column(PackingListPackageDetails_Height; 0)//PackingListPackageDetails.Height) //PCPL/NSW/MIG  03Aug22
            {
            }
            column(PackingListPackageDetails_Width; 0)//PackingListPackageDetails.Width) //PCPL/NSW/MIG  03Aug22
            {
            }
            column(Pallets; Pallets)
            {
            }
            column(GrossWt; GrossWt)
            {
            }
            column(NetWt; NetWt)
            {
            }
            column(CurrencyRate; ROUND(1 / "Currency Factor", 1, '='))
            {
                DecimalPlaces = 0 : 2;
            }
            column(ExportValueInRS; ExportValueInRS)
            {
            }
            column(CurrencyCode; "Sales Invoice Header"."Currency Code")
            {
            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = WHERE(Type = CONST(Item));
                column(Description; "Sales Invoice Line".Description)
                {
                }
                column(Qty; "Sales Invoice Line".Quantity)
                {
                }
                column(Rate; "Sales Invoice Line"."Unit Price")
                {
                }
                column(Amt; "Sales Invoice Line"."Line Amount")
                {
                }
                column(LiceseNo; '')//"Sales Invoice Line"."Adv. License No.") //PCPL/NSW/MIG  03Aug22
                {
                }
                column(ExciseDuty; ExciseDuty)
                {
                }
                column(Educess; Educess)
                {
                }
                column(Shecess; Shecess)
                {
                }
                column(LineAmt; LineAmt)
                {
                }
                column(ExcisePostingSetup_BEDPercent; 0)//ExcisePostingSetup."BED %") //PCPL/NSW/MIG  03Aug22
                {
                }
                column(ExcisePostingSetup_eCessPercent; 0)//ExcisePostingSetup."eCess %") //PCPL/NSW/MIG  03Aug22
                {
                }
                column(ExcisePostingSetup_SHECessPercent; 0)//ExcisePostingSetup."SHE Cess %") //PCPL/NSW/MIG  03Aug22
                {
                }
                column(ARE1No; '')//PostedWhseShipmentLine."ARE-1 No.") //PCPL/NSW/MIG  03Aug22
                {
                }
                column(Sno; inti)
                {
                }
                column(ItemNo; "Sales Invoice Line"."No.")
                {
                }
                dataitem("Value Entry"; "Value Entry")
                {
                    DataItemLink = "Document No." = FIELD("Document No."),
                                   "Document Line No." = FIELD("Line No.");
                    DataItemTableView = SORTING("Item Ledger Entry No.", "Document No.", "Document Line No.")
                                        ORDER(Ascending)
                                        WHERE("Document Type" = CONST("Sales Invoice"));
                    column(ILE_Qty; ABS("Value Entry"."Item Ledger Entry Quantity"))
                    {
                    }
                    column(ILE_Amount; "Sales Invoice Line"."Unit Price" * ABS("Value Entry"."Item Ledger Entry Quantity"))
                    {
                    }
                    dataitem("Item Ledger Entry"; "Item Ledger Entry")
                    {
                        DataItemLink = "Entry No." = FIELD("Item Ledger Entry No.");
                        DataItemTableView = SORTING("Entry No.");
                        column(Batch_No; "Item Ledger Entry"."Lot No.")
                        {
                        }
                        column(Mfg_Date; MfgDate)
                        {
                        }
                        column(Exp_Date; ExpiryDate)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            RecIDS.RESET;
                            RecIDS.SETRANGE(RecIDS."Document Type", RecIDS."Document Type"::"Prod. Order");
                            RecIDS.SETRANGE(RecIDS."Lot No.", "Lot No.");
                            IF RecIDS.FINDFIRST THEN BEGIN
                                MfgDate := RecIDS."Mfg. Date";
                                //ExpiryDate := RecIDS.Expiry_Date;
                            END;
                        end;
                    }

                    trigger OnAfterGetRecord();
                    begin
                        inti := inti + 1;
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    inti := inti;
                    ExciseDuty := 0;
                    Educess := 0;
                    Shecess := 0;
                    LineAmt := 0;

                    /*ExcisePostingSetup.RESET;
                    ExcisePostingSetup.SETRANGE("Excise Bus. Posting Group","Excise Bus. Posting Group");
                    ExcisePostingSetup.SETRANGE("Excise Prod. Posting Group","Excise Prod. Posting Group");
                    ExcisePostingSetup.SETFILTER("From Date",'<=%1',"Posting Date");
                    IF ExcisePostingSetup.FINDLAST THEN;*/ //PCPL-Deepak



                    RecSIL.RESET;
                    RecSIL.SETRANGE("Document No.", "Document No.");
                    IF RecSIL.FINDFIRST THEN
                        REPEAT
                        //NetWt+=RecSIL."Net Weight";
                        //GrossWt+=RecSIL."Gross Weight";
                        /*ExciseDuty+=RecSIL."Excise Amount";
                        Educess+=RecSIL."eCess Amount";
                        Shecess+=RecSIL."SHE Cess Amount";
                        LineAmt+=RecSIL."Line Amount"; */ //PCPL-Deepak
                        UNTIL RecSIL.NEXT = 0;

                    PostedWhseShipmentLine.RESET;
                    PostedWhseShipmentLine.SETCURRENTKEY("Posted Source No.");
                    PostedWhseShipmentLine.SETRANGE("Posted Source Document", PostedWhseShipmentLine."Posted Source Document"::"Posted Shipment");
                    PostedWhseShipmentLine.SETRANGE("Posted Source No.", "Sales Invoice Line"."Shipment No.");
                    IF PostedWhseShipmentLine.FINDFIRST THEN;



                    Check.InitTextVariable;
                    Check.FormatNoText(AmtInWords, LineAmt, "Sales Invoice Header"."Currency Code");
                end;

                trigger OnPreDataItem();
                begin
                    NoOfInvLines := "Sales Invoice Line".COUNT;
                end;
            }
            dataitem(Integer; Integer)
            {
                column(Number; Number)
                {
                }

                trigger OnPreDataItem();
                begin
                    IF HeaderPrint1 <> '' THEN
                        SETRANGE(Number, 1, 10 - NoOfInvLines)
                    ELSE
                        SETRANGE(Number, 1, 17 - NoOfInvLines)
                end;
            }

            trigger OnAfterGetRecord();
            begin
                Volume := 0;
                Pallets := 0;
                CountryOfOriginName := '';
                CountryOfFinalDesName := '';
                PortOfDischargeName := '';
                PortName := '';
                GrossWt := 0;
                NetWt := 0;
                IF Customer.GET("Sell-to Customer No.") THEN;
                NoOfInvLines := 0;

                //IF Bank.GET("Sales Invoice Header"."Bank Account") THEN; //PCPL/NSW/MIG  03Aug22
                //PCPL/NSW/MIG  03Aug22
                /*
                PackingListPackageDetails.RESET;
                PackingListPackageDetails.SETRANGE("Packing List No.", "Sales Invoice Header"."Packing List No.");
                IF PackingListPackageDetails.FIND('-') THEN
                    REPEAT
                        Volume += PackingListPackageDetails.Volume;
                        Pallets += (PackingListPackageDetails."To Package No." - PackingListPackageDetails."From Package No.") + 1;
                    UNTIL PackingListPackageDetails.NEXT = 0;

                PackingListPackageDetails.RESET;
                PackingListPackageDetails.SETRANGE("Packing List No.", "Sales Invoice Header"."Packing List No.");
                IF PackingListPackageDetails.FIND('-') THEN
                    REPEAT
                        GrossWt += PackingListPackageDetails."Gross Wght. per Case" * Pallets;
                        NetWt += PackingListPackageDetails."Net Wght. per Case" * Pallets;
                    UNTIL PackingListPackageDetails.NEXT = 0;
                */
                //PCPL/NSW/MIG  03Aug22

                //IF CountryRegion.GET("Sales Invoice Header"."Country of Origin of Goods") THEN //PCPL/NSW/MIG  03Aug22
                CountryOfOriginName := '';// CountryRegion.Name; //PCPL/NSW/MIG  03Aug22

                //IF CountryRegion.GET("Sales Invoice Header"."Country of Final Destination") THEN //PCPL/NSW/MIG  03Aug22
                CountryOfFinalDesName := '';//CountryRegion.Name; //PCPL/NSW/MIG  03Aug22

                //IF PortRec.GET("Sales Invoice Header"."Port of Discharge") THEN //PCPL/NSW/MIG  03Aug22
                PortOfDischargeName := '';//PortRec."Port Name"; //PCPL/NSW/MIG  03Aug22

                // IF PortRec.GET("Sales Invoice Header".Port) THEN //PCPL/NSW/MIG  03Aug22
                PortName := '';//PortRec."Port Name"; //PCPL/NSW/MIG  03Aug22
            end;

            trigger OnPreDataItem();
            begin
                CompInfo.GET;
                CompInfo.CALCFIELDS(Picture);

                CASE ExportType OF
                    ExportType::"Without Payment Of Duty":
                        BEGIN
                            HeaderPrint1 := Text001;
                            HeaderPrint2 := Text002;
                        END;
                    ExportType::"With Payment Of Duty":
                        BEGIN
                            HeaderPrint1 := Text001;
                            HeaderPrint2 := ''
                        END;
                    ExportType::"Buyer Invoice":
                        BEGIN
                            HeaderPrint1 := '';
                            HeaderPrint2 := '';
                        END;
                END;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Export Type"; ExportType)
                {
                }
                field("Weight UOM"; codWeightUOM)
                {
                }
                field("Description of Goods"; txtItmCategoryCode)
                {
                }
                field("Shipping Marks"; txtShippingMarks)
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
        MS33000991: Label '"%1 %2 "';
        MS33000992: Label '%1 %2  (%3)';
        MS33000993: Label '1 To  %1';
        MS33000994: Label '%1 To %2';
        Final_Destination__CaptionLbl: Label 'Final Destination :';
        Port_of_Discharge__CaptionLbl: Label 'Port of Discharge :';
        Vessel_Flight_No__CaptionLbl: Label 'Vessel/Flight No :';
        Port_of_Loading__CaptionLbl: Label 'Port of Loading :';
        B_L_No___Date__CaptionLbl: Label 'B/L No.& Date :';
        Container_NumbersCaptionLbl: Label 'Container Numbers';
        Shipping_MarksCaptionLbl: Label 'Shipping Marks';
        Gross_WeightCaptionLbl: Label 'Gross Weight';
        Net_WeightCaptionLbl: Label 'Net Weight';
        Bill_Drawn_Through__CaptionLbl: Label 'Bill Drawn Through :';
        Country_of_Final_Destination__CaptionLbl: Label '"Country of Final Destination: "';
        Country_of_Origin_of_Goods_CaptionLbl: Label 'Country of Origin of Goods:';
        Terms_of_Delivery___Payment_CaptionLbl: Label 'Terms of Delivery & Payment:';
        Consignee__CaptionLbl: Label 'Consignee :';
        Shipping_Bill_No____Date__CaptionLbl: Label 'Shipping Bill No. & Date :';
        G_R_I_No____Date__CaptionLbl: Label 'G.R.I No. & Date :';
        Buyer_s_Order_No____Dt__CaptionLbl: Label 'Buyer''s Order No. & Dt :';
        Invoice_Date__CaptionLbl: Label 'Invoice Date :';
        Invoice_No__CaptionLbl: Label 'Invoice No.:';
        Exporter__CaptionLbl: Label 'Exporter :';
        INVOICECaptionLbl: Label 'INVOICE';
        Buyer_CodeCaptionLbl: Label 'Buyer Code';
        Item_CodeCaptionLbl: Label 'Item Code';
        DescriptionCaptionLbl: Label 'Description';
        S__No_CaptionLbl: Label 'S. No.';
        PKG_SCaptionLbl: Label 'PKG''S';
        MeasureCaptionLbl: Label 'Measure';
        Container_No_CaptionLbl: Label 'Container No.';
        Of_Pkgs_CaptionLbl: Label 'Of Pkgs.';
        Unit_OfCaptionLbl: Label 'Unit Of';
        Description_of_GoodsCaptionLbl: Label 'Description of Goods';
        QuantityCaptionLbl: Label 'Quantity';
        RateCaptionLbl: Label 'Rate';
        AmountCaptionLbl: Label 'Amount';
        Marks___Nos__CaptionLbl: Label 'Marks & Nos./';
        No_____KindCaptionLbl: Label 'No. &  Kind';
        Final_Destination__Caption_Control1280037Lbl: Label 'Final Destination :';
        Port_of_Discharge__Caption_Control1280045Lbl: Label 'Port of Discharge :';
        Vessel_Flight_No__Caption_Control1280047Lbl: Label 'Vessel/Flight No :';
        Port_of_Loading__Caption_Control1280048Lbl: Label 'Port of Loading :';
        B_L_No___Date__Caption_Control1280051Lbl: Label 'B/L No.& Date :';
        Container_NumbersCaption_Control1280053Lbl: Label 'Container Numbers';
        Shipping_MarksCaption_Control1280054Lbl: Label 'Shipping Marks';
        Gross_WeightCaption_Control1280059Lbl: Label 'Gross Weight';
        Net_WeightCaption_Control1280060Lbl: Label 'Net Weight';
        Bill_Drawn_Through__Caption_Control1280068Lbl: Label 'Bill Drawn Through :';
        Country_of_Final_Destination__Caption_Control1280069Lbl: Label '"Country of Final Destination: "';
        Country_of_Origin_of_Goods_Caption_Control1280070Lbl: Label 'Country of Origin of Goods:';
        Terms_of_Delivery___Payment_Caption_Control1280078Lbl: Label 'Terms of Delivery & Payment:';
        Consignee__Caption_Control1280082Lbl: Label 'Consignee :';
        Shipping_Bill_No____Date__Caption_Control1280083Lbl: Label 'Shipping Bill No. & Date :';
        G_R_I_No____Date__Caption_Control1280087Lbl: Label 'G.R.I No. & Date :';
        Buyer_s_Order_No____Dt__Caption_Control1280093Lbl: Label 'Buyer''s Order No. & Dt :';
        Invoice_Date__Caption_Control1280097Lbl: Label 'Invoice Date :';
        Invoice_No__Caption_Control1280099Lbl: Label 'Invoice No.:';
        Exporter__Caption_Control1280100Lbl: Label 'Exporter :';
        INVOICECaption_Control1280104Lbl: Label 'INVOICE';
        Buyer_CodeCaption_Control1280400Lbl: Label 'Buyer Code';
        DescriptionCaption_Control1280401Lbl: Label 'Description';
        Item_CodeCaption_Control1280404Lbl: Label 'Item Code';
        PKG_SCaption_Control1280407Lbl: Label 'PKG''S';
        S__No_Caption_Control1280408Lbl: Label 'S. No.';
        MeasureCaption_Control1280416Lbl: Label 'Measure';
        Container_No_Caption_Control1280417Lbl: Label 'Container No.';
        Of_Pkgs_Caption_Control1280418Lbl: Label 'Of Pkgs.';
        Unit_OfCaption_Control1280421Lbl: Label 'Unit Of';
        Description_of_GoodsCaption_Control1280422Lbl: Label 'Description of Goods';
        QuantityCaption_Control1280423Lbl: Label 'Quantity';
        RateCaption_Control1280424Lbl: Label 'Rate';
        AmountCaption_Control1280425Lbl: Label 'Amount';
        Marks___Nos__Caption_Control1280426Lbl: Label 'Marks & Nos./';
        No_____KindCaption_Control1280427Lbl: Label 'No. &  Kind';
        Amount_Chargeable__In_Words___CaptionLbl: Label 'Amount Chargeable (In Words) :';
        GOODS_DESCRIBED_AND_THAT_ALL_PARTICULARS_ARE_TRUE___CORRECT_CaptionLbl: Label 'GOODS DESCRIBED AND THAT ALL PARTICULARS ARE TRUE & CORRECT.';
        AUTHORISED_SIGNATORY_CaptionLbl: Label '(AUTHORISED SIGNATORY)';
        WE_DECLARE_THAT_THIS_INVOICE_SHOWS_THE_ACTUAL_PRICE_OF_THECaptionLbl: Label 'WE DECLARE THAT THIS INVOICE SHOWS THE ACTUAL PRICE OF THE';
        DECLARATION__CaptionLbl: Label 'DECLARATION :';
        Continued_on_Page_No_CaptionLbl: Label 'Continued on Page No.';
        Amount_Chargeable__In_Words___Caption_Control1280369Lbl: Label 'Amount Chargeable (In Words) :';
        Total_Pkgs__CaptionLbl: Label 'Total Pkgs :';
        TOTAL_PCS___CaptionLbl: Label '"TOTAL PCS : "';
        GOODS_DESCRIBED_AND_THAT_ALL_PARTICULARS_ARE_TRUE___CORRECT_Caption_Control1280381Lbl: Label 'GOODS DESCRIBED AND THAT ALL PARTICULARS ARE TRUE & CORRECT.';
        AUTHORISED_SIGNATORY_Caption_Control1280382Lbl: Label '(AUTHORISED SIGNATORY)';
        WE_DECLARE_THAT_THIS_INVOICE_SHOWS_THE_ACTUAL_PRICE_OF_THECaption_Control1280383Lbl: Label 'WE DECLARE THAT THIS INVOICE SHOWS THE ACTUAL PRICE OF THE';
        DECLARATION__Caption_Control1280385Lbl: Label 'DECLARATION :';
        CompInfo: Record "Company Information";
        Customer: Record Customer;
        GrossWt: Decimal;
        NetWt: Decimal;
        RecSIL: Record "Sales Invoice Line";
        ExciseDuty: Decimal;
        Educess: Decimal;
        Shecess: Decimal;
        LineAmt: Decimal;
        Check: Report 1401;
        AmtInWords: array[2] of Text[200];
        NoOfInvLines: Integer;
        Bank: Record "Bank Account";
        //PackingListPackageDetails: Record "33001048";
        Volume: Decimal;
        Pallets: Decimal;
        //ExcisePostingSetup: Record "Excise Posting Setup";
        CountryRegion: Record "Country/Region";
        CountryOfOriginName: Text;
        CountryOfFinalDesName: Text;
        //PortRec: Record "33001050";
        PortOfDischargeName: Text;
        PortName: Text;
        ExportValueInRS: Decimal;
        SalesShipmentLine: Record "Sales Shipment Line";
        PostedWhseShipmentLine: Record "Posted Whse. Shipment Line";
        ExportType: Option "Without Payment Of Duty","With Payment Of Duty","Buyer Invoice";
        HeaderPrint1: Text;
        Text001: Label '"INVOICE FOR REMOVAL OF EXCISABLE GOODS FROM FACTORY OR WAREHOUSE ON PAYMENT OF DUTY UNDER RULE 11(2) OF CENTRAL EXCISE RULE 2002 "';
        Text002: Label 'FOR EXPORT WITHOUT PAYMENT OF DUTY';
        HeaderPrint2: Text;
        codWeightUOM: Code[10];
        txtItmCategoryCode: Text[30];
        txtShippingMarks: Text[30];
        inti: Integer;
        MfgDate: Date;
        ExpiryDate: Date;
        RecIDS: Record 50011;
}

