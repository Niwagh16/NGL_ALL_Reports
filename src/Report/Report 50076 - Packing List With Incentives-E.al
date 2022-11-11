// report 50076 "Packing List With Incentives-E"
// { //PCPL/NSW/MIG 09Aug22
//     // version GITLEXIM 6.00.01.03

//     DefaultLayout = RDLC;
//     RDLCLayout = 'src\Report Layout\Packing List With Incentives-E.rdl';
//     UseRequestPage = true;

//     dataset
//     {
//         dataitem(Integer;Integer)
//         {
//             DataItemTableView = SORTING(Number);
//             dataitem(DataItem8078; Table33001046)
//             {
//                 DataItemTableView = SORTING("No.");
//                 RequestFilterFields = "No.";
//                 //ReqFilterHeading = 'Packing List Document';
//                 column(Packing_List_Header_No_; "No.")
//                 {
//                 }
//                 dataitem(DataItem1535; Table33001048)
//                 {
//                     DataItemLink = Packing List No.=FIELD(No.);
//                     DataItemTableView = SORTING(Incentive Type, Claim DDB)
//                                         ORDER(Ascending);
//                     column(Packing_List_Header___Final_Destination_; "Packing List Header"."Final Destination")
//                     {
//                     }
//                     column(txtShippingMarks; txtShippingMarks)
//                     {
//                     }
//                     column(txtPortName; txtPortName)
//                     {
//                     }
//                     column(txtPortofDischarge; txtPortofDischarge)
//                     {
//                     }
//                     column(Packing_List_Header___Vessel_Flight_No__; "Packing List Header"."Vessel/Flight No.")
//                     {
//                     }
//                     column(recBankAcc__Bank_Account_No__; recBankAcc."Bank Account No.")
//                     {
//                     }
//                     column(recBankAcc__Bank_Branch_No__; recBankAcc."Bank Branch No.")
//                     {
//                     }
//                     column(STRSUBSTNO___1___2__decNetWght_codWeightUOM_; STRSUBSTNO('%1  %2', decNetWght, codWeightUOM))
//                     {
//                         DecimalPlaces = 2 : 5;
//                     }
//                     column(recBankAcc_City; recBankAcc.City)
//                     {
//                     }
//                     column(STRSUBSTNO___1___2__decGrossWght_codWeightUOM_; STRSUBSTNO('%1  %2', decGrossWght, codWeightUOM))
//                     {
//                         DecimalPlaces = 2 : 5;
//                     }
//                     column(recBankAcc__Post_Code_; recBankAcc."Post Code")
//                     {
//                     }
//                     column(recBankAcc__Address_2_; recBankAcc."Address 2")
//                     {
//                     }
//                     column(recBankAcc_Address; recBankAcc.Address)
//                     {
//                     }
//                     column(txtCountryofFinalDest; txtCountryofFinalDest)
//                     {
//                     }
//                     column(txtCountryofOrigin; txtCountryofOrigin)
//                     {
//                     }
//                     column(recBankAcc_Name; recBankAcc.Name)
//                     {
//                     }
//                     column(txtShipToAddr_8_; txtShipToAddr[8])
//                     {
//                     }
//                     column(txtShipToAddr_7_; txtShipToAddr[7])
//                     {
//                     }
//                     column(txtShipToAddr_6_; txtShipToAddr[6])
//                     {
//                     }
//                     column(txtShipToAddr_5_; txtShipToAddr[5])
//                     {
//                     }
//                     column(txtShipToAddr_4_; txtShipToAddr[4])
//                     {
//                     }
//                     column(txtShipToAddr_3_; txtShipToAddr[3])
//                     {
//                     }
//                     column(txtShipToAddr_2_; txtShipToAddr[2])
//                     {
//                     }
//                     column(txtShipToAddr_1_; txtShipToAddr[1])
//                     {
//                     }
//                     column(txtCompanyAddr_6_; txtCompanyAddr[6])
//                     {
//                     }
//                     column(txtCompanyAddr_5_; txtCompanyAddr[5])
//                     {
//                     }
//                     column(recCompanyInfo__Country_Region_Code_; recCompanyInfo."Country/Region Code")
//                     {
//                     }
//                     column(txtCompanyAddr_4_; txtCompanyAddr[4])
//                     {
//                     }
//                     column(Packing_List_Header___Order_Date_; "Packing List Header"."Order Date")
//                     {
//                     }
//                     column(txtCompanyAddr_3_; txtCompanyAddr[3])
//                     {
//                     }
//                     column(Packing_List_Header___External_Document_No__; "Packing List Header"."External Document No.")
//                     {
//                     }
//                     column(txtCompanyAddr_2_; txtCompanyAddr[2])
//                     {
//                     }
//                     column(recCompanyInfo__I_E_C__Code_; recCompanyInfo."I.E.C. Code")
//                     {
//                     }
//                     column(Packing_List_Header___Posting_Date_; "Packing List Header"."Posting Date")
//                     {
//                     }
//                     column(txtCompanyAddr_1_; txtCompanyAddr[1])
//                     {
//                     }
//                     column(Packing_List_Header___No__; "Packing List Header"."No.")
//                     {
//                     }
//                     column(STRSUBSTNO___1___2___Page_No___CurrReport_PAGENO_; STRSUBSTNO('%1  %2', 'Page No:', CurrReport.PAGENO))
//                     {
//                     }
//                     column(codWeightUOM; codWeightUOM)
//                     {
//                     }
//                     column(codWeightUOM_Control1280004; codWeightUOM)
//                     {
//                     }
//                     column(txtItmCategoryCode; txtItmCategoryCode)
//                     {
//                     }
//                     column(intTotalConsolidatePkgs; intTotalConsolidatePkgs)
//                     {
//                     }
//                     column(STRSUBSTNO___1___2__txtHeadingDesc_1__txtHeadingDesc_2__; STRSUBSTNO('%1  %2', txtHeadingDesc[1], txtHeadingDesc[2]))
//                     {
//                     }
//                     column(Packing_List_Package_Details__Qty_per_Case_; "Qty per Case")
//                     {
//                     }
//                     column(Packing_List_Package_Details_Quantity; Quantity)
//                     {
//                     }
//                     column(Packing_List_Package_Details__Item_Description_; "Item Description")
//                     {
//                     }
//                     column(Packing_List_Package_Details__Item_No__; "Item No.")
//                     {
//                     }
//                     column(codCommonItm; codCommonItm)
//                     {
//                     }
//                     column(decNetWeight; decNetWeight)
//                     {
//                         DecimalPlaces = 2 : 5;
//                     }
//                     column(decGrossWeight; decGrossWeight)
//                     {
//                         DecimalPlaces = 2 : 5;
//                     }
//                     column(intToPackageNo; intToPackageNo)
//                     {
//                     }
//                     column(intFrmPackageNo; intFrmPackageNo)
//                     {
//                     }
//                     column(STRSUBSTNO___1___2___For__txtCompanyAddr_1__; STRSUBSTNO('%1  %2', 'For', txtCompanyAddr[1]))
//                     {
//                     }
//                     column(Final_Destination__Caption; Final_Destination__CaptionLbl)
//                     {
//                     }
//                     column(Port_of_Discharge__Caption; Port_of_Discharge__CaptionLbl)
//                     {
//                     }
//                     column(Port_of_Loading__Caption; Port_of_Loading__CaptionLbl)
//                     {
//                     }
//                     column(Vessel_Flight_No__Caption; Vessel_Flight_No__CaptionLbl)
//                     {
//                     }
//                     column(B_L_No___Date__Caption; B_L_No___Date__CaptionLbl)
//                     {
//                     }
//                     column(Shipping_MarksCaption; Shipping_MarksCaptionLbl)
//                     {
//                     }
//                     column(Container_NumbersCaption; Container_NumbersCaptionLbl)
//                     {
//                     }
//                     column(Net_WeightCaption; Net_WeightCaptionLbl)
//                     {
//                     }
//                     column(Gross_WeightCaption; Gross_WeightCaptionLbl)
//                     {
//                     }
//                     column(Country_of_Final_Destination__Caption; Country_of_Final_Destination__CaptionLbl)
//                     {
//                     }
//                     column(Bill_Drawn_Through__Caption; Bill_Drawn_Through__CaptionLbl)
//                     {
//                     }
//                     column(Country_of_Origin_of_Goods_Caption; Country_of_Origin_of_Goods_CaptionLbl)
//                     {
//                     }
//                     column(Terms_of_Delivery___Payment_Caption; Terms_of_Delivery___Payment_CaptionLbl)
//                     {
//                     }
//                     column(Consignee__Caption; Consignee__CaptionLbl)
//                     {
//                     }
//                     column(Shipping_Bill_No____Date__Caption; Shipping_Bill_No____Date__CaptionLbl)
//                     {
//                     }
//                     column(G_R_I_No____Date__Caption; G_R_I_No____Date__CaptionLbl)
//                     {
//                     }
//                     column(Buyer_s_Order_No____Dt__Caption; Buyer_s_Order_No____Dt__CaptionLbl)
//                     {
//                     }
//                     column(IEC_Caption; IEC_CaptionLbl)
//                     {
//                     }
//                     column(P_L__Date__Caption; P_L__Date__CaptionLbl)
//                     {
//                     }
//                     column(Exporter_s_Ref__Caption; Exporter_s_Ref__CaptionLbl)
//                     {
//                     }
//                     column(Packing_List_No__Caption; Packing_List_No__CaptionLbl)
//                     {
//                     }
//                     column(Exporter__Caption; Exporter__CaptionLbl)
//                     {
//                     }
//                     column(PACKING_LISTCaption; PACKING_LISTCaptionLbl)
//                     {
//                     }
//                     column(Item_No_Caption; Item_No_CaptionLbl)
//                     {
//                     }
//                     column(From_ToCaption; From_ToCaptionLbl)
//                     {
//                     }
//                     column(CaseCaption; CaseCaptionLbl)
//                     {
//                     }
//                     column(Qty_Per_CaseCaption; Qty_Per_CaseCaptionLbl)
//                     {
//                     }
//                     column(CaseCaption_Control1280006; CaseCaption_Control1280006Lbl)
//                     {
//                     }
//                     column(Item_CodeCaption; Item_CodeCaptionLbl)
//                     {
//                     }
//                     column(DescriptionCaption; DescriptionCaptionLbl)
//                     {
//                     }
//                     column(CommonCaption; CommonCaptionLbl)
//                     {
//                     }
//                     column(PkgsCaption; PkgsCaptionLbl)
//                     {
//                     }
//                     column(Gross_Wt_PerCaption; Gross_Wt_PerCaptionLbl)
//                     {
//                     }
//                     column(Total_QtyCaption; Total_QtyCaptionLbl)
//                     {
//                     }
//                     column(Net_Wt_PerCaption; Net_Wt_PerCaptionLbl)
//                     {
//                     }
//                     column(PKG_SCaption; PKG_SCaptionLbl)
//                     {
//                     }
//                     column(QuantityCaption; QuantityCaptionLbl)
//                     {
//                     }
//                     column(RemarksCaption; RemarksCaptionLbl)
//                     {
//                     }
//                     column(Description_of_GoodsCaption; Description_of_GoodsCaptionLbl)
//                     {
//                     }
//                     column(No_____Kind_Of_Pkgs_Caption; No_____Kind_Of_Pkgs_CaptionLbl)
//                     {
//                     }
//                     column(AUTHORISED_SIGNATORY_Caption; AUTHORISED_SIGNATORY_CaptionLbl)
//                     {
//                     }
//                     column(Packing_List_Package_Details_Packing_List_No_; "Packing List No.")
//                     {
//                     }
//                     column(Packing_List_Package_Details_Line_No_; "Line No.")
//                     {
//                     }
//                     column(Packing_List_Package_Details_Incentive_Type; "Incentive Type")
//                     {
//                     }
//                     column(Packing_List_Package_Details_Claim_DDB; "Claim DDB")
//                     {
//                     }
//                     column(COA_No; recPackListPackageDetails."COA No.")
//                     {
//                     }
//                     column(Lot_No; recPackListPackageDetails."Lot Number")
//                     {
//                     }
//                     column(Manufacturing_Date; recPackListPackageDetails."Manufacturing Date")
//                     {
//                     }
//                     column(Expiry_Date; recPackListPackageDetails."Expiry Date")
//                     {
//                     }
//                     column(Kind_of_Packing; recPackListPackageDetails."Kind of Packing")
//                     {
//                     }
//                     column(Shipping_MarkDetails; "Packing List Package Details"."Shipping Mark")
//                     {
//                     }
//                     dataitem(DataItem3405; Table280)
//                     {
//                         DataItemLink = No.=FIELD(Item No.);
//                         DataItemTableView = SORTING(No.);
//                         column(Extended_Text_Line__Extended_Text_Line__Text; "Extended Text Line".Text)
//                         {
//                         }
//                         column(Extended_Text_Line_Table_Name; "Table Name")
//                         {
//                         }
//                         column(Extended_Text_Line_No_; "No.")
//                         {
//                         }
//                         column(Extended_Text_Line_Language_Code; "Language Code")
//                         {
//                         }
//                         column(Extended_Text_Line_Text_No_; "Text No.")
//                         {
//                         }
//                         column(Extended_Text_Line_Line_No_; "Line No.")
//                         {
//                         }
//                     }

//                     trigger OnAfterGetRecord();
//                     begin
//                         CASE optIncentiveOption OF
//                             optIncentiveOption::All:
//                                 BEGIN
//                                     IF NOT (("Incentive Type" IN ["Incentive Type"::DFRC, "Incentive Type"::DEPB, "Incentive Type"::DDB,
//                                                                     "Incentive Type"::" "])) THEN
//                                         CurrReport.SKIP;
//                                 END;
//                             optIncentiveOption::DFRC:
//                                 BEGIN
//                                     IF NOT (("Incentive Type" = "Incentive Type"::DFRC) AND ("Claim DDB" = FALSE)) THEN CurrReport.SKIP;
//                                 END;
//                             optIncentiveOption::DEPB:
//                                 BEGIN
//                                     IF NOT ("Incentive Type" = "Incentive Type"::DEPB) THEN CurrReport.SKIP;
//                                 END;
//                             optIncentiveOption::DDB:
//                                 BEGIN
//                                     IF NOT ("Incentive Type" = "Incentive Type"::DDB) THEN CurrReport.SKIP;
//                                 END;
//                             optIncentiveOption::"DFRC & Claim DDB":
//                                 BEGIN
//                                     IF NOT (("Incentive Type" = "Incentive Type"::DFRC) AND ("Claim DDB" = TRUE)) THEN CurrReport.SKIP;
//                                 END;
//                         END;

//                         recItem.RESET;
//                         IF recItem.GET("Item No.") THEN codCommonItm := recItem."Common Item No.";

//                         CLEAR(decNetWeight);
//                         CLEAR(decGrossWeight);

//                         recPackListPackageDetails.RESET;
//                         recPackListPackageDetails.SETRANGE(recPackListPackageDetails."Packing List No.", "Packing List No.");
//                         recPackListPackageDetails.SETRANGE(recPackListPackageDetails."From Package No.", "From Package No.");
//                         recPackListPackageDetails.SETRANGE(recPackListPackageDetails."To Package No.", "To Package No.");
//                         recPackListPackageDetails.SETRANGE(recPackListPackageDetails."Incentive Type", "Incentive Type");
//                         recPackListPackageDetails.SETRANGE(recPackListPackageDetails."Claim DDB", "Claim DDB");

//                         IF ("From Package No." = intFrmPackageNo) AND
//                            ("To Package No." = intToPackageNo) THEN BEGIN
//                             decNetWeight := 0;
//                             decGrossWeight := 0;
//                             intFrmPackageNo := 0;
//                             intToPackageNo := 0;
//                         END ELSE BEGIN
//                             IF recPackListPackageDetails.FIND('-') THEN
//                                 REPEAT
//                                     decNetWeightUOM := recPackListPackageDetails."Net Wght. per Case";
//                                     cduEximMgmt.fctUOMConversion(codWeightUOM, recPackListPackageDetails."Weight UOM", decNetWeightUOM);
//                                     decGrossWeightUOM := recPackListPackageDetails."Gross Wght. per Case";
//                                     cduEximMgmt.fctUOMConversion(codWeightUOM, recPackListPackageDetails."Weight UOM", decGrossWeightUOM);
//                                     decNetWeight := decNetWeight + decNetWeightUOM;
//                                     decGrossWeight := decGrossWeight + decGrossWeightUOM;
//                                 UNTIL recPackListPackageDetails.NEXT = 0;
//                             intFrmPackageNo := "From Package No.";
//                             intToPackageNo := "To Package No.";
//                             // Package Details:=intFrmPackageNo
//                         END;


//                         fctGetHeading("Incentive Type", "Claim DDB");
//                         fctGetIncentiveWiseWght("Packing List No.", "Incentive Type", "Claim DDB");
//                         cduEximMgmt.fctTotalConsolidatePkgs("Packing List Header"."No.", "Incentive Type", "Claim DDB", intTotalConsolidatePkgs);
//                     end;
//                 }

//                 trigger OnAfterGetRecord();
//                 begin
//                     IF recCompanyInfo.GET(recCompanyInfo."Primary Key") THEN BEGIN
//                         cduFormatAddr.Company(txtCompanyAddr, recCompanyInfo)
//                     END;

//                     fctPackingListSellTo(txtSellToCust, "Packing List Header");
//                     IF recBankAcc.GET("Company Bank Account") THEN;

//                     IF "Ship-to Code" = '' THEN
//                         FOR inti := 1 TO ARRAYLEN(txtSellToCust) DO
//                             txtShipToAddr[inti] := txtSellToCust[inti]
//                     ELSE
//                         fctPackingListShptTo(txtShipToAddr, "Packing List Header");

//                     IF recPorts.GET(Port) THEN txtPortName := recPorts."Port Name";
//                     IF recPorts.GET("Port of Discharge") THEN txtPortofDischarge := recPorts."Port Name";
//                     IF recCountry.GET("Country of Origin of Goods") THEN txtCountryofOrigin := recCountry.Name;
//                     IF recCountry.GET("Country of Final Destination") THEN txtCountryofFinalDest := recCountry.Name;

//                     IF "Location Code" = '' THEN BEGIN
//                         IF recState.GET(recCompanyInfo.State) THEN
//                             codLocationName := recState.Description;
//                     END
//                     ELSE BEGIN
//                         recLocation.GET("Location Code");
//                         IF recState.GET(recLocation."State Code") THEN
//                             codLocationName := recState.Description;
//                     END;

//                     IF recShipmentMethod.GET("Shipment Method Code") THEN txtShipMethod := recShipmentMethod.Description;
//                 end;
//             }

//             trigger OnPreDataItem();
//             begin
//                 intNoOfLoops := ABS(intNoOfCopies) + 1;
//                 SETRANGE(Number, 1, intNoOfLoops);
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 group(option)
//                 {
//                     field("Select Insetive"; optIncentiveOption)
//                     {
//                     }
//                     field("Report Options..."; '')
//                     {
//                     }
//                     field("No of Copies"; intctr)
//                     {
//                     }
//                     field("Weight UOM"; codWeightUOM)
//                     {
//                         TableRelation = "Unit of Measure";
//                     }
//                     field("Description of Goods"; txtItmCategoryCode)
//                     {
//                     }
//                     field("Shipping Marks"; txtShippingMarks)
//                     {
//                     }
//                 }
//             }
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     trigger OnInitReport();
//     begin
//         intctr := 1;
//     end;

//     var
//         recState: Record State;
//         recItem: Record Item;
//         recLocation: Record "Location";
//         recCompanyInfo: Record "Company Information";
//         recPackListPackageDetails: Record "33001048";
//         recBankAcc: Record "Bank Account";
//         recPorts: Record "33001050";
//         recPostCode: Record "Post Code";
//         recCountry: Record "Country/Region";
//         recShipmentMethod: Record "Shipment Method";
//         cduFormatAddr: Codeunit "Format Address";
//         cduEximMgmt: Codeunit "33001004";
//         txtCountryofOrigin: Text[50];
//         txtShipMethod: Text[50];
//         txtCountryofFinalDest: Text[50];
//         txtCompanyAddr: array[8] of Text[50];
//         txtShipToAddr: array[8] of Text[50];
//         txtSellToCust: array[8] of Text[50];
//         inti: Integer;
//         intctr: Integer;
//         txtPortName: Text[30];
//         txtPortofDischarge: Text[30];
//         codLocationName: Code[50];
//         intNoOfCopies: Integer;
//         intNoOfLoops: Integer;
//         txtItmCategoryCode: Text[30];
//         MS33000991: Label '1 To  %1';
//         intFrmPackageNo: Integer;
//         intToPackageNo: Integer;
//         decNetWeight: Decimal;
//         decGrossWeight: Decimal;
//         intPackages: Integer;
//         decNetWght: Decimal;
//         decGrossWght: Decimal;
//         txtHeadingDesc: array[2] of Text[80];
//         MS33000992: Label '%1 -  %2';
//         codWeightUOM: Code[10];
//         decNetWeightUOM: Decimal;
//         decGrossWeightUOM: Decimal;
//         optIncentiveOption: Option All,DFRC,DEPB,DDB,"DFRC & Claim DDB";
//         codCommonItm: Code[20];
//         txtShippingMarks: Text[30];
//         MS33000993: Label '%1 %2';
//         intTotalConsolidatePkgs: Integer;
//         Final_Destination__CaptionLbl: Label 'Final Destination :';
//         Port_of_Discharge__CaptionLbl: Label 'Port of Discharge :';
//         Port_of_Loading__CaptionLbl: Label 'Port of Loading :';
//         Vessel_Flight_No__CaptionLbl: Label 'Vessel/Flight No :';
//         B_L_No___Date__CaptionLbl: Label 'B/L No.& Date :';
//         Shipping_MarksCaptionLbl: Label 'Shipping Marks';
//         Container_NumbersCaptionLbl: Label 'Container Numbers';
//         Net_WeightCaptionLbl: Label 'Net Weight';
//         Gross_WeightCaptionLbl: Label 'Gross Weight';
//         Country_of_Final_Destination__CaptionLbl: Label '"Country of Final Destination: "';
//         Bill_Drawn_Through__CaptionLbl: Label 'Bill Drawn Through :';
//         Country_of_Origin_of_Goods_CaptionLbl: Label 'Country of Origin of Goods:';
//         Terms_of_Delivery___Payment_CaptionLbl: Label 'Terms of Delivery & Payment:';
//         Consignee__CaptionLbl: Label 'Consignee :';
//         Shipping_Bill_No____Date__CaptionLbl: Label 'Shipping Bill No. & Date :';
//         G_R_I_No____Date__CaptionLbl: Label 'G.R.I No. & Date :';
//         Buyer_s_Order_No____Dt__CaptionLbl: Label 'Buyer''s Order No. & Dt :';
//         IEC_CaptionLbl: Label 'IEC:';
//         P_L__Date__CaptionLbl: Label 'P.L. Date :';
//         Exporter_s_Ref__CaptionLbl: Label 'Exporter''s Ref :';
//         Packing_List_No__CaptionLbl: Label 'Packing List No.:';
//         Exporter__CaptionLbl: Label 'Exporter :';
//         PACKING_LISTCaptionLbl: Label 'PACKING LIST';
//         Item_No_CaptionLbl: Label 'Item No.';
//         From_ToCaptionLbl: Label 'From-To';
//         CaseCaptionLbl: Label 'Case';
//         Qty_Per_CaseCaptionLbl: Label 'Qty Per Case';
//         CaseCaption_Control1280006Lbl: Label 'Case';
//         Item_CodeCaptionLbl: Label 'Item Code';
//         DescriptionCaptionLbl: Label 'Description';
//         CommonCaptionLbl: Label 'Common';
//         PkgsCaptionLbl: Label 'No. Of Pkgs';
//         Gross_Wt_PerCaptionLbl: Label 'Gross Wt Per';
//         Total_QtyCaptionLbl: Label 'Total Qty';
//         Net_Wt_PerCaptionLbl: Label 'Net Wt Per';
//         PKG_SCaptionLbl: Label 'PKG''S';
//         QuantityCaptionLbl: Label 'Quantity';
//         RemarksCaptionLbl: Label 'Remarks';
//         Description_of_GoodsCaptionLbl: Label 'Description of Goods';
//         No_____Kind_Of_Pkgs_CaptionLbl: Label 'No. &  Kind Of Pkgs.';
//         AUTHORISED_SIGNATORY_CaptionLbl: Label '(AUTHORISED SIGNATORY)';
//         "Package Details": Text;

//     procedure fctGetHeading(poptIncentive: Option " ",DFRC,DEPB,DDB; pblnClaimDDB: Boolean);
//     begin
//         IF ((poptIncentive = poptIncentive::DFRC) AND (pblnClaimDDB = TRUE)) THEN BEGIN
//             txtHeadingDesc[1] := UPPERCASE(txtItmCategoryCode);
//             txtHeadingDesc[2] := 'UNDER DUTY FREE REPLENISHMENT SCHEME CUM DRAWBACK SHIPMENT';
//         END
//         ELSE
//             IF ((poptIncentive = poptIncentive::DFRC) AND (pblnClaimDDB = FALSE)) THEN BEGIN
//                 txtHeadingDesc[1] := 'UNDER DUTY FREE REPLENISHMENT SCHEME';
//                 txtHeadingDesc[2] := '';
//             END
//             ELSE
//                 IF ((poptIncentive = poptIncentive::DEPB) AND (pblnClaimDDB = FALSE)) THEN BEGIN
//                     txtHeadingDesc[1] := UPPERCASE(txtItmCategoryCode);
//                     txtHeadingDesc[2] := 'UNDER DUTY ENTITLEMENT PASS BOOK SCHEME';
//                 END
//                 ELSE
//                     IF ((poptIncentive = poptIncentive::DDB) AND (pblnClaimDDB = FALSE)) THEN BEGIN
//                         txtHeadingDesc[1] := UPPERCASE(txtItmCategoryCode);
//                         txtHeadingDesc[2] := 'UNDER DUTY DRAWBACK ITEMS';
//                     END
//                     ELSE
//                         IF ((poptIncentive = poptIncentive::" ") AND (pblnClaimDDB = FALSE)) THEN BEGIN
//                             txtHeadingDesc[1] := 'NO DRAWBACK IS BEING CLAIMED ON THESE';
//                             txtHeadingDesc[2] := UPPERCASE(txtItmCategoryCode);
//                         END;
//     end;

//     procedure fctGetIncentiveWiseWght(pcodPackingListNo: Code[20]; poptIncentive: Option " ",DFRC,DEPB,DDB; pblnClaimDDB: Boolean);
//     var
//         lrecPackingListPackageDetails: Record "33001048";
//     begin
//         CLEAR(decNetWght);
//         CLEAR(decGrossWght);

//         lrecPackingListPackageDetails.RESET;
//         lrecPackingListPackageDetails.SETRANGE(lrecPackingListPackageDetails."Packing List No.", pcodPackingListNo);
//         lrecPackingListPackageDetails.SETRANGE(lrecPackingListPackageDetails."Incentive Type", poptIncentive);
//         lrecPackingListPackageDetails.SETRANGE(lrecPackingListPackageDetails."Claim DDB", pblnClaimDDB);

//         IF lrecPackingListPackageDetails.FIND('-') THEN
//             REPEAT
//                 decNetWeightUOM := lrecPackingListPackageDetails."Net Wght. per Case";
//                 cduEximMgmt.fctUOMConversion(codWeightUOM, lrecPackingListPackageDetails."Weight UOM", decNetWeightUOM);
//                 decGrossWeightUOM := lrecPackingListPackageDetails."Gross Wght. per Case";
//                 cduEximMgmt.fctUOMConversion(codWeightUOM, lrecPackingListPackageDetails."Weight UOM", decGrossWeightUOM);
//                 IF lrecPackingListPackageDetails."From Package No." <> lrecPackingListPackageDetails."To Package No." THEN BEGIN
//                     intPackages := lrecPackingListPackageDetails."To Package No." - (lrecPackingListPackageDetails."From Package No." - 1);
//                     decNetWght := decNetWght + (decNetWeightUOM * intPackages);
//                     decGrossWght := decGrossWght + (decGrossWeightUOM * intPackages);
//                 END
//                 ELSE BEGIN
//                     decNetWght := decNetWght + decNetWeightUOM;
//                     decGrossWght := decGrossWght + decGrossWeightUOM;
//                 END;
//             UNTIL lrecPackingListPackageDetails.NEXT = 0
//     end;

//     procedure fctPackingListSellTo(var PtxtAddrArray: array[8] of Text[50]; var PrecPackingList: Record "33001046");
//     begin
//         WITH PrecPackingList DO
//             cduFormatAddr.FormatAddr(
//               PtxtAddrArray, "Sell-to Customer Name", "Sell-to Customer Name 2", "Sell-to Contact", "Sell-to Address", "Sell-to Address 2",
//               "Sell-to City", "Sell-to Post Code", "Sell-to County", "Sell-to Country Code");
//     end;

//     procedure fctPackingListShptTo(var PtxtAddrArray: array[8] of Text[50]; var PrecPackingList: Record "33001046");
//     begin
//         WITH PrecPackingList DO
//             cduFormatAddr.FormatAddr(
//               PtxtAddrArray, "Ship-to Name", "Ship-to Name 2", "Ship-to Contact", "Ship-to Address",
//               "Ship-to Address 2", "Ship-to City", "Ship-to Post Code", "Ship-to County", "Ship-to Country Code");
//     end;
// }

