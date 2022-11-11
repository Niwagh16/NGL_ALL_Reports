// report 50082 "Posted Packing List"
// {  //PCPL/NSW/MIG 09Aug22
//     // version PCPL

//     DefaultLayout = RDLC;
//     RDLCLayout = 'src\Report Layout\Posted Packing List.rdl';
//     UseRequestPage = true;

//     dataset
//     {
//         dataitem(DataItem5444;Table2000000026)
//         {
//             DataItemTableView = SORTING(Number);
//             dataitem(DataItem8078;Table33001046)
//             {
//                 DataItemTableView = SORTING(No.);
//                 RequestFilterFields = "No.";
//                 ReqFilterHeading = 'Packing List Document';
//                 column(Packing_List_Header_No_;"No.")
//                 {
//                 }
//                 column(mfgdruglicno;'MFG DRUG LIC NO.:'+' '+MfgDrugLic)
//                 {
//                 }
//                 column(Qtyyy;quantity)
//                 {
//                 }
//                 column(UnitPrice;unitprice)
//                 {
//                 }
//                 column(amount;quantity*unitprice)
//                 {
//                 }
//                 column(amtinwords;amtinwords[2])
//                 {
//                 }
//                 column(Orderno;"Packing List Header"."SO NO.")
//                 {
//                 }
//                 column(buyerrefno;BuyRefNo)
//                 {
//                 }
//                 column(GSTin;recCompanyInfo."GST Registration No.")
//                 {
//                 }
//                 column(Packing_List_Header___Vessel_Flight_No__;ShipmentMethod)
//                 {
//                 }
//                 column(VisselFlight;ShipmentMethod)
//                 {
//                 }
//                 dataitem(DataItem1535;Table33001048)
//                 {
//                     DataItemLink = Packing List No.=FIELD(No.);
//                     DataItemTableView = SORTING(Incentive Type,Claim DDB)
//                                         ORDER(Ascending)
//                                         WHERE(Quantity=FILTER(<>0));
//                     column(ExtenstedText;ExtenstedText)
//                     {
//                     }
//                     column(net;"Packing List Package Details"."Net Wght. per Case")
//                     {
//                     }
//                     column(gross;"Packing List Package Details"."Gross Wght. per Case")
//                     {
//                     }
//                     column(prodctdesc;ProductGroup.Description)
//                     {
//                     }
//                     column(LineNoGroup;"Packing List Package Details"."Line No.")
//                     {
//                     }
//                     column(ItemNoGroup;"Packing List Package Details"."Item No.")
//                     {
//                     }
//                     column(itemd;ItemDesctext)
//                     {
//                     }
//                     column(ItemDesc_PackingList;ItemDescr)
//                     {
//                     }
//                     column(Remarks;Remarks)
//                     {
//                     }
//                     column(itemdescprprgr;itemdescprodgrouptex)
//                     {
//                     }
//                     column(UOM;"Packing List Package Details"."Unit of Measure")
//                     {
//                     }
//                     column(Packing_List_Header___Final_Destination_;"Packing List Header"."Final Destination")
//                     {
//                     }
//                     column(LOCADDRESS;lOCATIONCODE.Address)
//                     {
//                     }
//                     column(Tarewt;"Packing List Package Details"."Tare Weight Per Case")
//                     {
//                     }
//                     column(LOCADDRESS2;lOCATIONCODE."Address 2"+' '+lOCATIONCODE.City)
//                     {
//                     }
//                     column(LOCAddress3;lOCATIONCODE."Post Code"+' '+recState.Description)
//                     {
//                     }
//                     column(LocAddress4;Country.Name)
//                     {
//                     }
//                     column(KindofPacking_PackingListPackageDetails;"Packing List Package Details"."Kind of Packing")
//                     {
//                     }
//                     column(WeightUOM_PackingListPackageDetails;"Packing List Package Details"."Weight UOM")
//                     {
//                     }
//                     column(lOCNAME;lOCATIONCODE.Name)
//                     {
//                     }
//                     column(txtShippingMarks;txtShippingMarks)
//                     {
//                     }
//                     column(txtPortName;txtPortName)
//                     {
//                     }
//                     column(FromTOPackg;("Packing List Header".Marks))
//                     {
//                     }
//                     column(ToPackg;"Packing List Package Details"."To Package No.")
//                     {
//                     }
//                     column(FromPackg;"Packing List Package Details"."From Package No.")
//                     {
//                     }
//                     column(TarriffCode;'DRAWBACK TARIFF NO: '+FORMAT(TarriffCode)+'(GST/CENVAT AVAILED)')
//                     {
//                     }
//                     column(HsCode;'HS Code No :'+FORMAT(HSCode))
//                     {
//                     }
//                     column(txtPortofDischarge;txtPortofDischarge)
//                     {
//                     }
//                     column(recBankAcc__Bank_Account_No__;recBankAcc."Bank Account No.")
//                     {
//                     }
//                     column(recBankAcc__Bank_Branch_No__;recBankAcc."Bank Branch No.")
//                     {
//                     }
//                     column(STRSUBSTNO___1___2__decNetWght_codWeightUOM_;STRSUBSTNO('%1  %2',decNetWght,codWeightUOM))
//                     {
//                         DecimalPlaces = 2:5;
//                     }
//                     column(recBankAcc_City;recBankAcc.City)
//                     {
//                     }
//                     column(STRSUBSTNO___1___2__decGrossWght_codWeightUOM_;STRSUBSTNO('%1  %2',decGrossWght,codWeightUOM))
//                     {
//                         DecimalPlaces = 2:5;
//                     }
//                     column(recBankAcc__Post_Code_;recBankAcc."Post Code")
//                     {
//                     }
//                     column(recBankAcc__Address_2_;recBankAcc."Address 2")
//                     {
//                     }
//                     column(recBankAcc_Address;recBankAcc.Address)
//                     {
//                     }
//                     column(txtCountryofFinalDest;txtCountryofFinalDest)
//                     {
//                     }
//                     column(txtCountryofOrigin;txtCountryofOrigin)
//                     {
//                     }
//                     column(recBankAcc_Name;recBankAcc.Name)
//                     {
//                     }
//                     column(txtShipToAddr_8_;txtShipToAddr[8])
//                     {
//                     }
//                     column(txtShipToAddr_7_;txtShipToAddr[7])
//                     {
//                     }
//                     column(txtShipToAddr_6_;txtShipToAddr[6])
//                     {
//                     }
//                     column(txtShipToAddr_5_;txtShipToAddr[5])
//                     {
//                     }
//                     column(txtShipToAddr_4_;txtShipToAddr[4])
//                     {
//                     }
//                     column(txtShipToAddr_3_;txtShipToAddr[3])
//                     {
//                     }
//                     column(txtShipToAddr_2_;txtShipToAddr[2])
//                     {
//                     }
//                     column(txtShipToAddr_1_;txtShipToAddr[1])
//                     {
//                     }
//                     column(txtBill_1;txtBillToCust[1])
//                     {
//                     }
//                     column(txtBill_2;txtBillToCust[2])
//                     {
//                     }
//                     column(txtBill_3;txtBillToCust[3])
//                     {
//                     }
//                     column(txtBill_4;txtBillToCust[4])
//                     {
//                     }
//                     column(txtBill_5;txtBillToCust[5])
//                     {
//                     }
//                     column(txtBill_6;txtBillToCust[6])
//                     {
//                     }
//                     column(txtBill_7;txtBillToCust[7])
//                     {
//                     }
//                     column(txtBill_8;txtBillToCust[8])
//                     {
//                     }
//                     column(txtCompanyAddr_6_;txtCompanyAddr[6])
//                     {
//                     }
//                     column(txtCompanyAddr_5_;txtCompanyAddr[5])
//                     {
//                     }
//                     column(recCompanyInfo__Country_Region_Code_;recCompanyInfo."Country/Region Code")
//                     {
//                     }
//                     column(txtCompanyAddr_4_;txtCompanyAddr[4])
//                     {
//                     }
//                     column(Packing_List_Header___Order_Date_;"Packing List Header"."Order Date")
//                     {
//                     }
//                     column(txtCompanyAddr_3_;txtCompanyAddr[3])
//                     {
//                     }
//                     column(Packing_List_Header___External_Document_No__;"Packing List Header"."External Document No.")
//                     {
//                     }
//                     column(txtCompanyAddr_2_;txtCompanyAddr[2])
//                     {
//                     }
//                     column(recCompanyInfo__I_E_C__Code_;recCompanyInfo."IEC CODE No.")
//                     {
//                     }
//                     column(Packing_List_Header___Posting_Date_;"Packing List Header"."Posting Date")
//                     {
//                     }
//                     column(txtCompanyAddr_1_;txtCompanyAddr[1])
//                     {
//                     }
//                     column(Packing_List_Header___No__;"Packing List Header"."No.")
//                     {
//                     }
//                     column(STRSUBSTNO___1___2___Page_No___CurrReport_PAGENO_;STRSUBSTNO('%1  %2','Page No:',CurrReport.PAGENO))
//                     {
//                     }
//                     column(codWeightUOM;codWeightUOM)
//                     {
//                     }
//                     column(codWeightUOM_Control1280004;codWeightUOM)
//                     {
//                     }
//                     column(txtItmCategoryCode;txtItmCategoryCode)
//                     {
//                     }
//                     column(intTotalConsolidatePkgs;intTotalConsolidatePkgs)
//                     {
//                     }
//                     column(STRSUBSTNO___1___2__txtHeadingDesc_1__txtHeadingDesc_2__;STRSUBSTNO('%1  %2',txtHeadingDesc[1],txtHeadingDesc[2]))
//                     {
//                     }
//                     column(QtyPercase;"Qty per Case")
//                     {
//                     }
//                     column(Qty;Quantity)
//                     {
//                     }
//                     column(ItemDesc;"Item Description")
//                     {
//                     }
//                     column(ItemDscc;ItemDesctext)
//                     {
//                     }
//                     column(ItemDscccc;itemdescprodgrouptex)
//                     {
//                     }
//                     column(ItemNo;"Item No.")
//                     {
//                     }
//                     column(codCommonItm;codCommonItm)
//                     {
//                     }
//                     column(decNetWeight;"Packing List Package Details"."Net Wght. per Case"*"Packing List Package Details"."No. Of Packages")
//                     {
//                         DecimalPlaces = 2:5;
//                     }
//                     column(decGrossWeight;"Packing List Package Details"."Gross Wght. per Case"*"Packing List Package Details"."No. Of Packages")
//                     {
//                         DecimalPlaces = 2:5;
//                     }
//                     column(intToPackageNo;"Packing List Package Details"."No. Of Packages")
//                     {
//                     }
//                     column(totgross;"Packing List Package Details"."Tare Weight Per Case"*"Packing List Package Details"."No. Of Packages")
//                     {
//                     }
//                     column(intFrmPackageNo;intFrmPackageNo)
//                     {
//                     }
//                     column(STRSUBSTNO___1___2___For__txtCompanyAddr_1__;STRSUBSTNO('%1  %2','For',txtCompanyAddr[1]))
//                     {
//                     }
//                     column(Final_Destination__Caption;Final_Destination__CaptionLbl)
//                     {
//                     }
//                     column(Port_of_Discharge__Caption;Port_of_Discharge__CaptionLbl)
//                     {
//                     }
//                     column(Port_of_Loading__Caption;Port_of_Loading__CaptionLbl)
//                     {
//                     }
//                     column(Vessel_Flight_No__Caption;Vessel_Flight_No__CaptionLbl)
//                     {
//                     }
//                     column(B_L_No___Date__Caption;B_L_No___Date__CaptionLbl)
//                     {
//                     }
//                     column(Shipping_MarksCaption;Shipping_MarksCaptionLbl)
//                     {
//                     }
//                     column(Container_NumbersCaption;Container_NumbersCaptionLbl)
//                     {
//                     }
//                     column(Net_WeightCaption;Net_WeightCaptionLbl)
//                     {
//                     }
//                     column(Gross_WeightCaption;Gross_WeightCaptionLbl)
//                     {
//                     }
//                     column(Country_of_Final_Destination__Caption;Country_of_Final_Destination__CaptionLbl)
//                     {
//                     }
//                     column(Bill_Drawn_Through__Caption;Bill_Drawn_Through__CaptionLbl)
//                     {
//                     }
//                     column(Country_of_Origin_of_Goods_Caption;Country_of_Origin_of_Goods_CaptionLbl)
//                     {
//                     }
//                     column(Terms_of_Delivery___Payment_Caption;Terms_of_Delivery___Payment_CaptionLbl)
//                     {
//                     }
//                     column(Consignee__Caption;Consignee__CaptionLbl)
//                     {
//                     }
//                     column(Shipping_Bill_No____Date__Caption;Shipping_Bill_No____Date__CaptionLbl)
//                     {
//                     }
//                     column(G_R_I_No____Date__Caption;G_R_I_No____Date__CaptionLbl)
//                     {
//                     }
//                     column(Buyer_s_Order_No____Dt__Caption;Buyer_s_Order_No____Dt__CaptionLbl)
//                     {
//                     }
//                     column(IEC_Caption;IEC_CaptionLbl)
//                     {
//                     }
//                     column(P_L__Date__Caption;P_L__Date__CaptionLbl)
//                     {
//                     }
//                     column(Exporter_s_Ref__Caption;Exporter_s_Ref__CaptionLbl)
//                     {
//                     }
//                     column(Packing_List_No__Caption;Packing_List_No__CaptionLbl)
//                     {
//                     }
//                     column(Exporter__Caption;Exporter__CaptionLbl)
//                     {
//                     }
//                     column(PACKING_LISTCaption;PACKING_LISTCaptionLbl)
//                     {
//                     }
//                     column(Item_No_Caption;Item_No_CaptionLbl)
//                     {
//                     }
//                     column(From_ToCaption;From_ToCaptionLbl)
//                     {
//                     }
//                     column(CaseCaption;CaseCaptionLbl)
//                     {
//                     }
//                     column(Qty_Per_CaseCaption;Qty_Per_CaseCaptionLbl)
//                     {
//                     }
//                     column(CaseCaption_Control1280006;CaseCaption_Control1280006Lbl)
//                     {
//                     }
//                     column(Item_CodeCaption;Item_CodeCaptionLbl)
//                     {
//                     }
//                     column(DescriptionCaption;DescriptionCaptionLbl)
//                     {
//                     }
//                     column(CommonCaption;CommonCaptionLbl)
//                     {
//                     }
//                     column(PkgsCaption;PkgsCaptionLbl)
//                     {
//                     }
//                     column(Gross_Wt_PerCaption;Gross_Wt_PerCaptionLbl)
//                     {
//                     }
//                     column(Total_QtyCaption;Total_QtyCaptionLbl)
//                     {
//                     }
//                     column(Net_Wt_PerCaption;Net_Wt_PerCaptionLbl)
//                     {
//                     }
//                     column(PKG_SCaption;PKG_SCaptionLbl)
//                     {
//                     }
//                     column(QuantityCaption;QuantityCaptionLbl)
//                     {
//                     }
//                     column(RemarksCaption;RemarksCaptionLbl)
//                     {
//                     }
//                     column(Description_of_GoodsCaption;Description_of_GoodsCaptionLbl)
//                     {
//                     }
//                     column(No_____Kind_Of_Pkgs_Caption;No_____Kind_Of_Pkgs_CaptionLbl)
//                     {
//                     }
//                     column(AUTHORISED_SIGNATORY_Caption;AUTHORISED_SIGNATORY_CaptionLbl)
//                     {
//                     }
//                     column(Packing_List_Package_Details_Packing_List_No_;"Packing List No.")
//                     {
//                     }
//                     column(Packing_List_Package_Details_Line_No_;"Line No.")
//                     {
//                     }
//                     column(Packing_List_Package_Details_Incentive_Type;"Incentive Type")
//                     {
//                     }
//                     column(Packing_List_Package_Details_Claim_DDB;"Claim DDB")
//                     {
//                     }
//                     column(PD;ProductGroup.Description)
//                     {
//                     }
//                     column(Lot_No;LotNo)
//                     {
//                     }
//                     column(Manufacturing_Date;ManuDate)
//                     {
//                     }
//                     column(Expiry_Date;ExpiryDate)
//                     {
//                     }

//                     trigger OnAfterGetRecord();
//                     begin
//                         //CountPack:="Packing List Package Details".COUNT;
//                         CountPack += 1;
//                         LotNo := "Lot Number";
//                         ExpiryDate := "Expiry Date";
//                         ManuDate := "Manufacturing Date";
//                         IF "Packing List Package Details"."Line No."=10000 THEN
//                           ItemDesctext :="Packing List Header".Marks
//                         ELSE
//                           ItemDesctext:='';

//                         CASE optIncentiveOption OF
//                           optIncentiveOption::All:
//                             BEGIN
//                              IF NOT (("Incentive Type" IN ["Incentive Type"::DFRC,"Incentive Type"::DEPB,"Incentive Type"::DDB,
//                                                              "Incentive Type"::" "])) THEN CurrReport.SKIP;
//                             END;
//                           optIncentiveOption::DFRC:
//                             BEGIN
//                               IF NOT (("Incentive Type" = "Incentive Type"::DFRC) AND ("Claim DDB" = FALSE)) THEN CurrReport.SKIP;
//                             END;
//                           optIncentiveOption::DEPB:
//                             BEGIN
//                               IF NOT ("Incentive Type" = "Incentive Type"::DEPB) THEN CurrReport.SKIP;
//                             END;
//                           optIncentiveOption::DDB:
//                             BEGIN
//                               IF NOT ("Incentive Type" = "Incentive Type"::DDB) THEN CurrReport.SKIP;
//                             END;
//                           optIncentiveOption::"DFRC & Claim DDB":
//                             BEGIN
//                               IF NOT (("Incentive Type" = "Incentive Type"::DFRC) AND ("Claim DDB" = TRUE)) THEN CurrReport.SKIP;
//                             END;
//                         END;

//                         recItem.RESET;
//                         recItem.SETRANGE(recItem."No.","Item No.");
//                         IF recItem.FINDFIRST THEN BEGIN
//                           codCommonItm := recItem."Common Item No.";
//                          // HSCode := recItem."Excise Prod. Posting Group";
//                           HSCode := recItem."HSN/SAC Code"; //PCPL 0028 Added Code

//                           TariffNo.RESET;
//                           TariffNo.SETRANGE(TariffNo."No.",recItem."Tariff No.");
//                           IF TariffNo.FINDFIRST THEN
//                             TarriffCode := TariffNo.Description;

//                         //IF "Packing List Header".Status<>"Packing List Header".Status::Shipped THEN
//                         //BEGIN
//                           IF ProductGroup.GET(recItem."Item Category Code",recItem."Product Group Code") THEN;
//                           //END;
//                         END;
//                         CLEAR(Descr2);
//                         PackingListLine.RESET;
//                         PackingListLine.SETRANGE("Document No.","Packing List Package Details"."Packing List No.");
//                         IF PackingListLine.FINDSET THEN REPEAT
//                           Descr2 := Descr2 + PackingListLine."Description 2";
//                         UNTIL PackingListLine.NEXT=0;
//                         ItemDescr := "Packing List Package Details"."Item Description"+ Descr2;
//                         IF "Packing List Package Details"."Line No."=10000 THEN //BEGIN
//                           //itemdescprodgrouptex:= ProductGroup.Description+"Packing List Package Details"."Item Description";
//                           itemdescprodgrouptex:= ProductGroup.Description;
//                           ItemDescr := "Packing List Package Details"."Item Description" + Descr2;
//                         /*
//                         END
//                         ELSE BEGIN
//                           itemdescprodgrouptex:='';
//                           ItemDescr := '';
//                         END;
//                          */
//                         CLEAR(decNetWeight);
//                         CLEAR(decGrossWeight);

//                         recPackListPackageDetails.RESET;
//                         recPackListPackageDetails.SETRANGE(recPackListPackageDetails."Packing List No.","Packing List No.");
//                         recPackListPackageDetails.SETRANGE(recPackListPackageDetails."From Package No.","From Package No.");
//                         recPackListPackageDetails.SETRANGE(recPackListPackageDetails."To Package No.","To Package No.");
//                         recPackListPackageDetails.SETRANGE(recPackListPackageDetails."Incentive Type","Incentive Type");
//                         recPackListPackageDetails.SETRANGE(recPackListPackageDetails."Claim DDB","Claim DDB");

//                         IF ("From Package No." = intFrmPackageNo) AND
//                            ("To Package No." = intToPackageNo) THEN BEGIN
//                            decNetWeight := 0;
//                            decGrossWeight := 0;
//                            intFrmPackageNo := 0;
//                            intToPackageNo := 0;
//                         END ELSE BEGIN
//                         IF recPackListPackageDetails.FIND('-') THEN
//                           REPEAT
//                             decNetWeightUOM := recPackListPackageDetails."Net Wght. per Case";
//                             cduEximMgmt.fctUOMConversion(codWeightUOM,recPackListPackageDetails."Weight UOM",decNetWeightUOM);
//                             decGrossWeightUOM := recPackListPackageDetails."Gross Wght. per Case";
//                             cduEximMgmt.fctUOMConversion(codWeightUOM,recPackListPackageDetails."Weight UOM",decGrossWeightUOM);
//                             decNetWeight := decNetWeight + decNetWeightUOM;
//                             decGrossWeight := decGrossWeight + decGrossWeightUOM;
//                         UNTIL recPackListPackageDetails.NEXT = 0;
//                          intFrmPackageNo := "From Package No.";
//                          intToPackageNo := "To Package No.";
//                         END;

//                         fctGetHeading("Incentive Type","Claim DDB");
//                         fctGetIncentiveWiseWght("Packing List No.","Incentive Type","Claim DDB");
//                         cduEximMgmt.fctTotalConsolidatePkgs("Packing List Header"."No.","Incentive Type","Claim DDB",intTotalConsolidatePkgs);
//                         recPackListPackageDetails.RESET;
//                         recPackListPackageDetails.SETRANGE(recPackListPackageDetails."Packing List No.","Packing List Package Details"."Packing List No.");
//                         IF recPackListPackageDetails.FINDLAST THEN
//                           TONO:=recPackListPackageDetails."To Package No.";

//                         //pcpl0024 04 june 2019
//                         IF ExtendedLinePrint =TRUE THEN
//                           BEGIN
//                               CLEAR(ExtenstedText);
//                               RecextendedLine.RESET;
//                               RecextendedLine.SETRANGE(RecextendedLine."No.","Packing List Package Details"."Item No.");
//                               IF RecextendedLine.FINDSET THEN
//                                 BEGIN
//                                   REPEAT
//                                   ExtenstedText+=RecextendedLine.Text+' ';
//                                   UNTIL RecextendedLine.NEXT=0;
//                                 END;
//                           END;
//                         //pcpl0024 04 june 2019

//                     end;

//                     trigger OnPreDataItem();
//                     begin
//                         CountPack:=0;
//                     end;
//                 }
//                 dataitem(FixedLay;Table2000000026)
//                 {
//                     DataItemTableView = SORTING(Number)
//                                         ORDER(Ascending);
//                     column(FixedLay;Number)
//                     {
//                     }
//                     dataitem(DataItem3405;Table280)
//                     {
//                         DataItemLink = No.=FIELD(Item No.);
//                         DataItemLinkReference = "Packing List Package Details";
//                         DataItemTableView = SORTING(No.);
//                         column(Extended_Text_Line__Extended_Text_Line__Text;"Extended Text Line".Text)
//                         {
//                         }
//                         column(Extended_Text_Line_Table_Name;"Table Name")
//                         {
//                         }
//                         column(Extended_Text_Line_No_;"No.")
//                         {
//                         }
//                         column(Extended_Text_Line_Language_Code;"Language Code")
//                         {
//                         }
//                         column(Extended_Text_Line_Text_No_;"Text No.")
//                         {
//                         }
//                         column(Extended_Text_Line_Line_No_;"Line No.")
//                         {
//                         }
//                     }

//                     trigger OnPreDataItem();
//                     begin
//                         SETRANGE(Number,1,6-CountPack);
//                     end;
//                 }

//                 trigger OnAfterGetRecord();
//                 begin
//                     IF Remarks<>'' THEN
//                      Remarks:='Remarks :'+' '+Remarks;

//                     IF "Packing List Header".Status="Packing List Header".Status::Shipped THEN
//                     BEGIN
//                       SalesInvHeader.RESET;
//                       SalesInvHeader.SETRANGE(SalesInvHeader."No.","Packing List Header"."No.");
//                       IF SalesInvHeader.FINDFIRST THEN
//                         BuyRefNo:=SalesInvHeader."Buyer Reference No.1";
//                         //ShipmentMethod := "Packing List Header"."Shipment Method Code";
//                       ShipmentMethod := SalesInvHeader."Vessel/Flight No.";
//                     END ELSE
//                     BEGIN
//                       SalesHeader.RESET;
//                       SalesHeader.SETRANGE(SalesHeader."No.","Packing List Header"."SO NO.");
//                       IF SalesHeader.FINDFIRST THEN
//                         BuyRefNo:=SalesHeader."Buyer Reference No.";
//                       ShipmentMethod := SalesHeader."Vessel/Flight No.";
//                     END;

//                     IF recCompanyInfo.GET(CompInfo."Primary Key") THEN BEGIN
//                       cduFormatAddr.Company(txtCompanyAddr,recCompanyInfo)
//                     END;

//                     fctPackingListSellTo(txtSellToCust,"Packing List Header");
//                     IF recBankAcc.GET("Company Bank Account") THEN;

//                     IF "Ship-to Code" = '' THEN
//                       FOR inti := 1 TO ARRAYLEN(txtSellToCust) DO
//                         txtShipToAddr[inti] := txtSellToCust[inti]
//                     ELSE
//                         fctPackingListShptTo(txtShipToAddr,"Packing List Header");

//                     IF "Packing List Header"."Bill-to Customer No."<>'' THEN
//                       fctPackingListBillTo(txtBillToCust,"Packing List Header");

//                     IF recPorts.GET(Port) THEN txtPortName := recPorts."Port Name";
//                     IF recPorts.GET("Port of Discharge") THEN txtPortofDischarge := recPorts."Port Name";
//                     IF recCountry.GET("Country of Origin of Goods") THEN txtCountryofOrigin := recCountry.Name;
//                     IF recCountry.GET("Country of Final Destination") THEN txtCountryofFinalDest := recCountry.Name;

//                     IF "Location Code" = '' THEN BEGIN
//                         IF recState.GET(recCompanyInfo.State) THEN
//                           codLocationName := recState.Description;
//                     END
//                     ELSE BEGIN
//                     IF recLocation.GET("Location Code") THEN
//                       MfgDrugLic := recLocation."Drug license No.";

//                       IF recState.GET(recLocation."State Code") THEN
//                         codLocationName := recState.Description;
//                     END;

//                     IF recShipmentMethod.GET("Shipment Method Code") THEN txtShipMethod := recShipmentMethod.Description;

//                     PackingListLine.RESET;
//                     PackingListLine.SETRANGE(PackingListLine."Document No.","Packing List Header"."No.");
//                     IF PackingListLine.FINDSET THEN
//                     REPEAT
//                       quantity:=PackingListLine.Quantity;
//                       unitprice:=PackingListLine."Unit Price";

//                     UNTIL PackingListLine.NEXT=0;

//                     CheckRep.InitTextVariable;
//                     CheckRep.FormatNoText(amtinwords,quantity*unitprice,'');

//                     IF lOCATIONCODE.GET("Packing List Header"."Location Code") THEN;
//                     IF recState.GET(lOCATIONCODE."State Code") THEN;
//                     IF Country.GET(lOCATIONCODE."Country/Region Code") THEN;
//                 end;
//             }

//             trigger OnPreDataItem();
//             begin
//                 intNoOfLoops := ABS(intNoOfCopies) + 1;
//                 SETRANGE(Number,1,intNoOfLoops);
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
//                     field("Select Insetive";optIncentiveOption)
//                     {
//                     }
//                     field("Report Options...";'')
//                     {
//                     }
//                     field("No of Copies";intctr)
//                     {
//                     }
//                     field("Weight UOM";codWeightUOM)
//                     {
//                         TableRelation = "Unit of Measure";
//                     }
//                     field("Description of Goods";txtItmCategoryCode)
//                     {
//                         Visible = false;
//                     }
//                     field("Shipping Marks";txtShippingMarks)
//                     {
//                         Visible = false;
//                     }
//                     field(Remarks;Remarks)
//                     {
//                         Visible = true;
//                     }
//                     field(ExtendedLinePrint;ExtendedLinePrint)
//                     {
//                         Caption = 'Extended Line Print';
//                     }
//                 }
//             }
//         }

//         actions
//         {
//         }

//         trigger OnOpenPage();
//         begin
//             codWeightUOM := 'KG';
//             ExtendedLinePrint:=FALSE;//pcpl0024
//         end;
//     }

//     labels
//     {
//     }

//     trigger OnInitReport();
//     begin
//         intctr := 1;
//     end;

//     trigger OnPreReport();
//     begin
//         CompInfo.GET;
//     end;

//     var
//         recState : Record "13762";
//         recItem : Record "27";
//         recLocation : Record "14";
//         recCompanyInfo : Record "79";
//         recPackListPackageDetails : Record "33001048";
//         recBankAcc : Record "270";
//         recPorts : Record "33001050";
//         recPostCode : Record "225";
//         recCountry : Record "9";
//         recShipmentMethod : Record "10";
//         cduFormatAddr : Codeunit "365";
//         cduEximMgmt : Codeunit "33001004";
//         txtCountryofOrigin : Text[50];
//         txtShipMethod : Text[50];
//         txtCountryofFinalDest : Text[50];
//         txtCompanyAddr : array [8] of Text[50];
//         txtShipToAddr : array [8] of Text[80];
//         txtSellToCust : array [8] of Text[80];
//         inti : Integer;
//         intctr : Integer;
//         txtPortName : Text[30];
//         txtPortofDischarge : Text[30];
//         codLocationName : Code[50];
//         intNoOfCopies : Integer;
//         intNoOfLoops : Integer;
//         txtItmCategoryCode : Text[30];
//         MS33000991 : Label '1 To  %1';
//         intFrmPackageNo : Integer;
//         intToPackageNo : Integer;
//         decNetWeight : Decimal;
//         decGrossWeight : Decimal;
//         intPackages : Integer;
//         decNetWght : Decimal;
//         decGrossWght : Decimal;
//         txtHeadingDesc : array [2] of Text[80];
//         MS33000992 : Label '%1 -  %2';
//         codWeightUOM : Code[10];
//         decNetWeightUOM : Decimal;
//         decGrossWeightUOM : Decimal;
//         optIncentiveOption : Option All,DFRC,DEPB,DDB,"DFRC & Claim DDB";
//         codCommonItm : Code[20];
//         txtShippingMarks : Text[30];
//         MS33000993 : Label '%1 %2';
//         intTotalConsolidatePkgs : Integer;
//         Final_Destination__CaptionLbl : Label 'Final Destination :';
//         Port_of_Discharge__CaptionLbl : Label 'Port of Discharge :';
//         Port_of_Loading__CaptionLbl : Label 'Port of Loading :';
//         Vessel_Flight_No__CaptionLbl : Label 'Vessel/Flight No :';
//         B_L_No___Date__CaptionLbl : Label 'B/L No.& Date :';
//         Shipping_MarksCaptionLbl : Label 'Shipping Marks';
//         Container_NumbersCaptionLbl : Label 'Container Numbers';
//         Net_WeightCaptionLbl : Label 'Net Weight';
//         Gross_WeightCaptionLbl : Label 'Gross Weight';
//         Country_of_Final_Destination__CaptionLbl : Label '"Country of Final Destination: "';
//         Bill_Drawn_Through__CaptionLbl : Label 'Bill Drawn Through :';
//         Country_of_Origin_of_Goods_CaptionLbl : Label 'Country of Origin of Goods:';
//         Terms_of_Delivery___Payment_CaptionLbl : Label 'Terms of Delivery & Payment:';
//         Consignee__CaptionLbl : Label 'Consignee :';
//         Shipping_Bill_No____Date__CaptionLbl : Label 'Shipping Bill No. & Date :';
//         G_R_I_No____Date__CaptionLbl : Label 'G.R.I No. & Date :';
//         Buyer_s_Order_No____Dt__CaptionLbl : Label 'Buyer''s Order No. & Dt :';
//         IEC_CaptionLbl : Label 'IEC:';
//         P_L__Date__CaptionLbl : Label 'P.L. Date :';
//         Exporter_s_Ref__CaptionLbl : Label 'Exporter''s Ref :';
//         Packing_List_No__CaptionLbl : Label 'Packing List No.:';
//         Exporter__CaptionLbl : Label 'Exporter :';
//         PACKING_LISTCaptionLbl : Label 'PACKING LIST';
//         Item_No_CaptionLbl : Label 'Item No.';
//         From_ToCaptionLbl : Label 'From-To';
//         CaseCaptionLbl : Label 'Case';
//         Qty_Per_CaseCaptionLbl : Label 'Qty Per Case';
//         CaseCaption_Control1280006Lbl : Label 'Case';
//         Item_CodeCaptionLbl : Label 'Item Code';
//         DescriptionCaptionLbl : Label 'Description';
//         CommonCaptionLbl : Label 'Common';
//         PkgsCaptionLbl : Label 'Pkgs';
//         Gross_Wt_PerCaptionLbl : Label 'Gross Wt Per';
//         Total_QtyCaptionLbl : Label 'Total Qty';
//         Net_Wt_PerCaptionLbl : Label 'Net Wt Per';
//         PKG_SCaptionLbl : Label 'PKG''S';
//         QuantityCaptionLbl : Label 'Quantity';
//         RemarksCaptionLbl : Label 'Remarks';
//         Description_of_GoodsCaptionLbl : Label 'Description of Goods';
//         No_____Kind_Of_Pkgs_CaptionLbl : Label 'No. &  Kind Of Pkgs.';
//         AUTHORISED_SIGNATORY_CaptionLbl : Label '(AUTHORISED SIGNATORY)';
//         txtBillToCust : array [10] of Text;
//         MfgDrugLic : Code[50];
//         PackingListLine : Record "33001047";
//         quantity : Decimal;
//         unitprice : Decimal;
//         CheckRep : Report "1401";
//         amtinwords : array [2] of Text;
//         CompInfo : Record "79";
//         lOCATIONCODE : Record "14";
//         HSCode : Code[20];
//         TarriffCode : Code[20];
//         State : Record "13762";
//         Country : Record "9";
//         Remarks : Text[250];
//         ProductGroup : Record "5723";
//         ItemDesctext : Text;
//         itemdescprodgrouptex : Text;
//         SalesHeader : Record "36";
//         SalesInvHeader : Record "112";
//         BuyRefNo : Text[50];
//         TariffNo : Record "260";
//         CountPack : Integer;
//         TONO : Integer;
//         ItemDescr : Text;
//         LotNo : Text;
//         ExpiryDate : Date;
//         ManuDate : Date;
//         ShipmentMethod : Text;
//         Descr2 : Text[55];
//         ExtendedLinePrint : Boolean;
//         RecextendedLine : Record "280";
//         ExtenstedText : Text[1024];

//     procedure fctGetHeading(poptIncentive : Option " ",DFRC,DEPB,DDB;pblnClaimDDB : Boolean);
//     begin
//         IF ((poptIncentive = poptIncentive::DFRC) AND (pblnClaimDDB = TRUE)) THEN BEGIN
//             txtHeadingDesc[1] := UPPERCASE(txtItmCategoryCode);
//             txtHeadingDesc[2] := 'UNDER DUTY FREE REPLENISHMENT SCHEME CUM DRAWBACK SHIPMENT';
//         END
//         ELSE IF ((poptIncentive = poptIncentive::DFRC) AND (pblnClaimDDB = FALSE)) THEN BEGIN
//           txtHeadingDesc[1] := 'UNDER DUTY FREE REPLENISHMENT SCHEME';
//           txtHeadingDesc[2] := '';
//         END
//         ELSE IF ((poptIncentive = poptIncentive::DEPB) AND (pblnClaimDDB = FALSE))  THEN BEGIN
//           txtHeadingDesc[1] := UPPERCASE(txtItmCategoryCode);
//           txtHeadingDesc[2] :=  'UNDER DUTY ENTITLEMENT PASS BOOK SCHEME';
//         END
//         ELSE IF ((poptIncentive = poptIncentive::DDB) AND (pblnClaimDDB = FALSE))  THEN BEGIN
//           txtHeadingDesc[1] := UPPERCASE(txtItmCategoryCode);
//           txtHeadingDesc[2] := 'UNDER DUTY DRAWBACK ITEMS';
//         END
//         ELSE IF ((poptIncentive = poptIncentive::" ") AND (pblnClaimDDB = FALSE)) THEN BEGIN
//           txtHeadingDesc[1] := 'NO DRAWBACK IS BEING CLAIMED ON THESE';
//           txtHeadingDesc[2] := UPPERCASE(txtItmCategoryCode);
//         END;
//     end;

//     procedure fctGetIncentiveWiseWght(pcodPackingListNo : Code[20];poptIncentive : Option " ",DFRC,DEPB,DDB;pblnClaimDDB : Boolean);
//     var
//         lrecPackingListPackageDetails : Record "33001048";
//     begin
//         CLEAR(decNetWght);
//         CLEAR(decGrossWght);

//         lrecPackingListPackageDetails.RESET;
//         lrecPackingListPackageDetails.SETRANGE(lrecPackingListPackageDetails."Packing List No.",pcodPackingListNo);
//         lrecPackingListPackageDetails.SETRANGE(lrecPackingListPackageDetails."Incentive Type",poptIncentive);
//         lrecPackingListPackageDetails.SETRANGE(lrecPackingListPackageDetails."Claim DDB",pblnClaimDDB);

//         IF lrecPackingListPackageDetails.FIND('-') THEN
//           REPEAT
//             decNetWeightUOM := lrecPackingListPackageDetails."Net Wght. per Case";
//             cduEximMgmt.fctUOMConversion(codWeightUOM,lrecPackingListPackageDetails."Weight UOM",decNetWeightUOM);
//             decGrossWeightUOM := lrecPackingListPackageDetails."Gross Wght. per Case";
//             cduEximMgmt.fctUOMConversion(codWeightUOM,lrecPackingListPackageDetails."Weight UOM",decGrossWeightUOM);
//               IF lrecPackingListPackageDetails."From Package No." <> lrecPackingListPackageDetails."To Package No." THEN BEGIN
//                 intPackages := lrecPackingListPackageDetails."To Package No." - (lrecPackingListPackageDetails."From Package No." - 1);
//                 decNetWght := decNetWght + (decNetWeightUOM * intPackages);
//                 decGrossWght := decGrossWght + (decGrossWeightUOM * intPackages);
//               END
//               ELSE BEGIN
//                 decNetWght := decNetWght + decNetWeightUOM;
//                 decGrossWght := decGrossWght + decGrossWeightUOM;
//               END;
//           UNTIL lrecPackingListPackageDetails.NEXT = 0
//     end;

//     procedure fctPackingListSellTo(var PtxtAddrArray : array [8] of Text[80];var PrecPackingList : Record "33001046");
//     begin
//         WITH PrecPackingList DO
//           cduFormatAddr.FormatAddr(
//             PtxtAddrArray,"Sell-to Customer Name","Sell-to Customer Name 2","Sell-to Contact","Sell-to Address","Sell-to Address 2",
//             "Sell-to City","Sell-to Post Code","Sell-to County","Sell-to Country Code");
//     end;

//     procedure fctPackingListShptTo(var PtxtAddrArray : array [8] of Text[80];var PrecPackingList : Record "33001046");
//     begin
//         WITH PrecPackingList DO
//           cduFormatAddr.FormatAddr(
//             PtxtAddrArray,"Ship-to Name","Ship-to Name 2","Ship-to Contact","Ship-to Address",
//             "Ship-to Address 2","Ship-to City","Ship-to Post Code","Ship-to County","Ship-to Country Code");
//     end;

//     procedure fctPackingListBillTo(var PtxtAddrArray : array [8] of Text[80];var PrecPackingList : Record "33001046");
//     begin
//         WITH PrecPackingList DO
//           cduFormatAddr.FormatAddr(
//             PtxtAddrArray,"Bill-to Name","Bill-to Name 2","Bill-to Contact","Bill-to Address",
//             "Bill-to Address 2","Bill-to City","Bill-to Post Code","Bill-to County","Bill-to Country Code");
//     end;
// }

