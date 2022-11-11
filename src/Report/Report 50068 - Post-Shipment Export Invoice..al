// report 50068 "Post-Shipment Export Invoice."
// {
//     // version GITLEXIM 6.00.01.03 //PCPL/NSW/MIG 09Aug22

//     DefaultLayout = RDLC;
//     RDLCLayout = 'src\Report Layout\Post-Shipment Export Invoice..rdlc';

//     dataset
//     {
//         dataitem("Sales Header"; "Sales Header")
//         {
//             DataItemTableView = SORTING("No.")
//                                 ORDER(Ascending)
//                                 WHERE("Document Type" = CONST(Invoice));
//             RequestFilterFields = "No.";
//             column(UPPERCASE_txtComapnyAddress1_; '') //UPPERCASE(txtComapnyAddress1)) //PCPL-Deepak
//             {
//             }
//             column(UPPERCASE_txtCompanyName_; '') //UPPERCASE(txtCompanyName)) //PCPL-Deepak
//             {
//             }
//             column(codPostedInvNo______FORMAT_datPostingDate_0_4_; '') //codPostedInvNo+'     '+ FORMAT(datPostingDate,0,'<Day>.<Month>.<Year4>')) //PCPL-Deepak
//             {
//             }
//             column(Sales_Header__Sales_Header___External_Document_No__; "Sales Header"."External Document No.")
//             {
//             }
//             column(txtShipToAddr_1_; '') //txtShipToAddr[1]) //PCPL-Deepak
//             {
//             }
//             column(txtShipToAddr_2_; '') //txtShipToAddr[2]) //PCPL-Deepak
//             {
//             }
//             column(txtShipToAddr_3_; '') //txtShipToAddr[3]) //PCPL-Deepak
//             {
//             }
//             column(UPPERCASE_txtCountryOfOriginOfGoods_; '') //UPPERCASE(txtCountryOfOriginOfGoods)) //PCPL-Deepak
//             {
//             }
//             column(UPPERCASE_txtCountryOfFinalDest_; '') //UPPERCASE(txtCountryOfFinalDest)) //PCPL-Deepak
//             {
//             }
//             column(codVesselNo; '') //"Sales Header"."Vessel/Flight No.") //PCPL-Deepak
//             {
//             }
//             column(txtPortOfLoading; '') //"Sales Header".Port) //PCPL-Deepak
//             {
//             }
//             column(txtFinalDestination; '') //"Sales Header"."Final Destination") //PCPL-Deepak
//             {
//             }
//             column(txtPortOfDischarge; '') //"Sales Header"."Port of Discharge") //PCPL-Deepak
//             {
//             }
//             column(txgprecarriage; '') //"Sales Header"."Pre-Carriage") //PCPL-Deepak
//             {
//             }
//             column(txtreceiptbyprecarriage; '') //"Sales Header".Carriage)//PCPL-Deepak
//             {
//             }
//             column(txtTypeAndPort; '') //txtTypeAndPort) //PCPL-Deepak
//             {
//             }
//             column(txtPaymentTermDescription; '') //txtPaymentTermDescription) //PCPL-Deepak
//             {
//             }
//             column(codLCNo; '') //codLCNo) //PCPL-Deepak
//             {
//             }
//             column(txtShipToAddr_4_; '') //txtShipToAddr[4]) //PCPL-Deepak
//             {
//             }
//             column(in____Sales_Header___Currency_Code______; '( in ' + "Sales Header"."Currency Code" + ' )')
//             {
//             }
//             column(in____Sales_Header___Currency_Code_______Control1000000051; '( in ' + "Sales Header"."Currency Code" + ' )')
//             {
//             }
//             column(txtAdditionalText; '') //txtAdditionalText) //PCPL-Deepak
//             {
//             }
//             column(Invoice_No____DateCaption; '') //Invoice_No____DateCaptionLbl) //PCPL-Deepak
//             {
//             }
//             column(Exporters_Ref_Caption; '') //Exporters_Ref_CaptionLbl) //PCPL-Deepak
//             {
//             }
//             column(Buyer_s_Order_No____DateCaption; '') //Buyer_s_Order_No____DateCaptionLbl) //PCPL-Deepak
//             {
//             }
//             column(Other_referencesCaption; '') //Other_referencesCaptionLbl) //PCPL-Deepak
//             {
//             }
//             column(FINAL_EXPORT_INVOICE__SI_Caption; '') //FINAL_EXPORT_INVOICE__SI_CaptionLbl) //PCPL-Deepak
//             {
//             }
//             column(Buyer__if_other_than_consignee_Caption; Buyer__if_other_than_consignee_CaptionLbl)
//             {
//             }
//             column(Country_of_Origin_of_GoodsCaption; Country_of_Origin_of_GoodsCaptionLbl)
//             {
//             }
//             column(Country_of_Fina_DestinationCaption; Country_of_Fina_DestinationCaptionLbl)
//             {
//             }
//             column(Pre_CarrierCaption; Pre_CarrierCaptionLbl)
//             {
//             }
//             column(Receipt_by_Pre_CarrierCaption; Receipt_by_Pre_CarrierCaptionLbl)
//             {
//             }
//             column(Vessel_No_Caption; Vessel_No_CaptionLbl)
//             {
//             }
//             column(Port_of_LoadingCaption; Port_of_LoadingCaptionLbl)
//             {
//             }
//             column(Port_of_DischargeCaption; Port_of_DischargeCaptionLbl)
//             {
//             }
//             column(Final_DestinationCaption; Final_DestinationCaptionLbl)
//             {
//             }
//             column(Terms_of_Delivery_and_PaymentCaption; Terms_of_Delivery_and_PaymentCaptionLbl)
//             {
//             }
//             column(Marks_of_ContainerCaption; Marks_of_ContainerCaptionLbl)
//             {
//             }
//             column(No_of_No_of_PkgsCaption; No_of_No_of_PkgsCaptionLbl)
//             {
//             }
//             column(Description_of_GoodsCaption; Description_of_GoodsCaptionLbl)
//             {
//             }
//             column(QuantityCaption; QuantityCaptionLbl)
//             {
//             }
//             column(ExporterCaption; ExporterCaptionLbl)
//             {
//             }
//             column(ConsigneeCaption; ConsigneeCaptionLbl)
//             {
//             }
//             column(RateCaption; RateCaptionLbl)
//             {
//             }
//             column(AmountCaption; AmountCaptionLbl)
//             {
//             }
//             column(Signature___DateCaption; Signature___DateCaptionLbl)
//             {
//             }
//             column(Declaration__Caption; Declaration__CaptionLbl)
//             {
//             }
//             column(DataItem1000000068; We_declare_that_this_invoice_shows_the_actual_price_of_the_goods_described_and_that_all_particulars_are_true_and_correct_CaptLbl)
//             {
//             }
//             column(Sales_Header_Document_Type; "Document Type")
//             {
//             }
//             column(Sales_Header_No_; "No.")
//             {
//             }
//             column(SalesCust_Name; "Sales Header"."Bill-to Name")
//             {
//             }
//             column(SalesCust_Address; "Sales Header"."Bill-to Address" + ' ' + "Sales Header"."Bill-to Address 2")
//             {
//             }
//             column(SalesCust_Phoneno; txtCustphone)
//             {
//             }
//             column(Location_Name; txtLocation)
//             {
//             }
//             column(LocAddress1; txtLocAddress)
//             {
//             }
//             column(LocAddress2; txtLocAddress2 + ' - ' + UPPERCASE(txtLocCity) + ' - ' + UPPERCASE(txtCountryOfOriginOfGoods))
//             {
//             }
//             column(LocPhoneNo; txtphoneNo)
//             {
//             }
//             column(BuyerRef_No; "Sales Header"."Buyer Reference No.")
//             {
//             }
//             column(OverseasBank_Details; "Sales Header"."Overseas Bank Details")
//             {
//             }
//             column(IndianBank_Details; "Sales Header".Incoterms)
//             {
//             }
//             column(HDFCBank_CaptionLbl; HDFCBank_CaptionLbl)
//             {
//             }
//             column(CorrBank_CaptionLbl; CorrBank_CaptionLbl)
//             {
//             }
//             column(Export_type; "Sales Header"."Export Shipment Type")
//             {
//             }
//             column(Portdischarge_pm; "Sales Header"."Port of Discharge")
//             {
//             }
//             column(BuyerPayment_Term1; txtpaymenttermcode)
//             {
//             }
//             column(IECCode_No; recCompanyInfo."IEC CODE No.")
//             {
//             }
//             column(Posting_Date; FORMAT("Sales Header"."Posting Date", 0, '<Day>.<Month>.<Year4>'))
//             {
//             }
//             column(Shp_Bl_No; "Sales Header"."Shipping No.")
//             {
//             }
//             column(HAWB_No; "Sales Header"."HAWB No.")
//             {
//             }
//             column(MAWB_No; "Sales Header"."MAWB No.")
//             {
//             }
//             dataitem("Sales Comment Line"; "Sales Comment Line")
//             {
//                 column(SalesComment_Line; "Sales Comment Line".Comment)
//                 {
//                 }
//             }
//             dataitem("Sales Line"; "Sales Line")
//             {
//                 DataItemLink = "Document No." = FIELD("No.");
//                 DataItemTableView = SORTING("Document Type", "Document No.", "Line No.")
//                                     ORDER(Ascending)
//                                     WHERE(Type = CONST(Item));
//                 column(txtComapnyAddress1; txtComapnyAddress1)
//                 {
//                 }
//                 column(txtCompanyName; txtCompanyName)
//                 {
//                 }
//                 column(STRSUBSTNO___1___2___Page_No___CurrReport_PAGENO_; STRSUBSTNO('%1  %2', 'Page No:', CurrReport.PAGENO))
//                 {
//                 }
//                 column(Sales_Header___External_Document_No__; "Sales Header"."External Document No.")
//                 {
//                 }
//                 column(FORMAT_datPostingDate_0_4_; ': ' + FORMAT(datPostingDate, 0, 4))
//                 {
//                 }
//                 column(codPostedInvNo; ': ' + codPostedInvNo)
//                 {
//                 }
//                 column(Continued_from_Page_No____FORMAT_CurrReport_PAGENO_1_; '.......Continued from Page No. ' + FORMAT(CurrReport.PAGENO - 1))
//                 {
//                 }
//                 column(in____Sales_Header___Currency_Code_______Control1000000138; '( in ' + "Sales Header"."Currency Code" + ' )')
//                 {
//                 }
//                 column(in____Sales_Header___Currency_Code_______Control1000000139; '( in ' + "Sales Header"."Currency Code" + ' )')
//                 {
//                 }
//                 column(txtShpMrks; txtShpMrks)
//                 {
//                 }
//                 column(decUOMQuantity; "Sales Line"."Units per Parcel")
//                 {
//                     DecimalPlaces = 0 : 0;
//                 }
//                 column(codUOMDescription; codUOMDescription)
//                 {
//                 }
//                 column(txtItemDescription; txtItemDescription)
//                 {
//                 }
//                 column(decCQuantity; decCQuantity)
//                 {
//                     DecimalPlaces = 3 : 3;
//                 }
//                 column(Sale_Price_To_Customer; ("Sales Line"."Amount Including Tax" + "Sales Line"."Charges To Customer") / "Sales Line".Quantity)
//                 {
//                 }
//                 column(Sale_Price_Tota_Customer; "Sales Line"."Amount Including Tax" + "Sales Line"."Charges To Customer")
//                 {
//                 }
//                 column(codUOMDescriptionCode; codUOMDescriptionCode)
//                 {
//                 }
//                 column(txtarrCaption_1_; txtarrCaption[1])
//                 {
//                     DecimalPlaces = 3 : 3;
//                 }
//                 column(txtarrCaption_2_; txtarrCaption[2])
//                 {
//                 }
//                 column(txtarrCaption_3_; txtarrCaption[3])
//                 {
//                     DecimalPlaces = 3 : 3;
//                 }
//                 column(decarrValue_1_; decarrValue[1])
//                 {
//                     DecimalPlaces = 3 : 3;
//                 }
//                 column(decarrValue_2_; decarrValue[2])
//                 {
//                     DecimalPlaces = 3 : 3;
//                 }
//                 column(decarrValue_3_; decarrValue[3])
//                 {
//                     DecimalPlaces = 3 : 3;
//                 }
//                 column(decarrValue_4_; decarrValue[4])
//                 {
//                     DecimalPlaces = 3 : 3;
//                 }
//                 column(txtarrCaption_4_; txtarrCaption[4])
//                 {
//                 }
//                 column(txtarrKgs_2_; txtarrKgs[2])
//                 {
//                 }
//                 column(txtarrKgs_3_; txtarrKgs[3])
//                 {
//                 }
//                 column(txtarrKgs_4_; txtarrKgs[4])
//                 {
//                 }
//                 column(txtarrKgs_1_; txtarrKgs[1])
//                 {
//                 }
//                 column(codUOMDescriptionCode_Control1000000145; codUOMDescriptionCode)
//                 {
//                 }
//                 column(Sales_Line__Sales_Line___Unit_Price_; "Sales Line"."Unit Price")
//                 {
//                 }
//                 column(Sales_Line___Unit_Price__decCQuantity; "Sales Line"."Unit Price" * decCQuantity)
//                 {
//                 }
//                 column(txtShpMrks_Control1000000088; txtShpMrks)
//                 {
//                 }
//                 column(decUOMQuantity_Control1000000089; decUOMQuantity)
//                 {
//                     DecimalPlaces = 0 : 0;
//                 }
//                 column(codUOMDescription_Control1000000110; codUOMDescription)
//                 {
//                 }
//                 column(txtCombinedExtended; txtCombinedExtended)
//                 {
//                 }
//                 column(decCQuantity_Control1000000090; decCQuantity)
//                 {
//                     DecimalPlaces = 3 : 3;
//                 }
//                 column(codUOMDescriptionCode_Control1000000082; codUOMDescriptionCode)
//                 {
//                 }
//                 column(txtarrCaption_1__Control1000000037; txtarrCaption[1])
//                 {
//                     DecimalPlaces = 3 : 3;
//                 }
//                 column(txtarrCaption_2__Control1000000038; txtarrCaption[2])
//                 {
//                 }
//                 column(decarrValue_1__Control1000000039; decarrValue[1])
//                 {
//                     DecimalPlaces = 3 : 3;
//                 }
//                 column(decarrValue_2__Control1000000075; decarrValue[2])
//                 {
//                     DecimalPlaces = 3 : 3;
//                 }
//                 column(txtarrCaption_3__Control1000000099; txtarrCaption[3])
//                 {
//                     DecimalPlaces = 3 : 3;
//                 }
//                 column(decarrValue_3__Control1000000115; decarrValue[3])
//                 {
//                     DecimalPlaces = 3 : 3;
//                 }
//                 column(decarrValue_4__Control1000000129; decarrValue[4])
//                 {
//                     DecimalPlaces = 3 : 3;
//                 }
//                 column(txtarrCaption_4__Control1000000130; txtarrCaption[4])
//                 {
//                 }
//                 column(txtarrKgs_2__Control1000000131; txtarrKgs[2])
//                 {
//                 }
//                 column(txtarrKgs_3__Control1000000132; txtarrKgs[3])
//                 {
//                 }
//                 column(txtarrKgs_4__Control1000000133; txtarrKgs[4])
//                 {
//                 }
//                 column(txtarrKgs_1__Control1000000134; txtarrKgs[1])
//                 {
//                 }
//                 column(codUOMDescriptionCode_Control1000000148; codUOMDescriptionCode)
//                 {
//                 }
//                 column(Sales_Line__Sales_Line___Unit_Price__Control1000000150; "Sales Line"."Unit Price")
//                 {
//                 }
//                 column(Sales_Line___Unit_Price__decCQuantity_Control1000000152; "Sales Line"."Unit Price" * decCQuantity)
//                 {
//                 }
//                 column(Continued_on_Page_No____FORMAT_CurrReport_PAGENO_1____________; 'Continued on Page No. ' + FORMAT(CurrReport.PAGENO + 1) + ' .......')
//                 {
//                 }
//                 column(txtAdditionalDetails; txtAdditionalDetails)
//                 {
//                 }
//                 column(FORMAT_txtBillOfLadingNumbers_; FORMAT(txtBillOfLadingNumbers))
//                 {
//                 }
//                 column(codCINo_____FORMAT_datCIDt_; codCINo + ' ' + FORMAT(datCIDt))
//                 {
//                 }
//                 column(codShNo_____FORMAT_datShDt_; codShNo + ' ' + FORMAT(datShDt))
//                 {
//                 }
//                 column(codGRNo_____FORMAT_datGRDt_; codGRNo + ' ' + FORMAT(datGRDt))
//                 {
//                 }
//                 column(Marks_of_ContainerCaption_Control1000000017; Marks_of_ContainerCaption_Control1000000017Lbl)
//                 {
//                 }
//                 column(No_of_No_of_PkgsCaption_Control1000000018; No_of_No_of_PkgsCaption_Control1000000018Lbl)
//                 {
//                 }
//                 column(Description_of_GoodsCaption_Control1000000019; Description_of_GoodsCaption_Control1000000019Lbl)
//                 {
//                 }
//                 column(QuantityCaption_Control1000000024; QuantityCaption_Control1000000024Lbl)
//                 {
//                 }
//                 column(Letters_Ref___Caption; Letters_Ref___CaptionLbl)
//                 {
//                 }
//                 column(Buyer_s_Order_No____DateCaption_Control1000000013; Buyer_s_Order_No____DateCaption_Control1000000013Lbl)
//                 {
//                 }
//                 column(Other_referencesCaption_Control1000000014; Other_referencesCaption_Control1000000014Lbl)
//                 {
//                 }
//                 column(Posted_Invoice_No_Caption; Posted_Invoice_No_CaptionLbl)
//                 {
//                 }
//                 column(DateCaption; DateCaptionLbl)
//                 {
//                 }
//                 column(FINAL_EXPORT_INVOICE__SI_Caption_Control1000000135; FINAL_EXPORT_INVOICE__SI_Caption_Control1000000135Lbl)
//                 {
//                 }
//                 column(RateCaption_Control1000000137; RateCaption_Control1000000137Lbl)
//                 {
//                 }
//                 column(AmountCaption_Control1000000140; AmountCaption_Control1000000140Lbl)
//                 {
//                 }
//                 column(PerCaption; PerCaptionLbl)
//                 {
//                 }
//                 column(GREEN_CARD_NO_Caption; GREEN_CARD_NO_CaptionLbl)
//                 {
//                 }
//                 column(PerCaption_Control1000000149; PerCaption_Control1000000149Lbl)
//                 {
//                 }
//                 column(GREEN_CARD_NO_Caption_Control1000000166; GREEN_CARD_NO_Caption_Control1000000166Lbl)
//                 {
//                 }
//                 column(Signature___DateCaption_Control1000000114; Signature___DateCaption_Control1000000114Lbl)
//                 {
//                 }
//                 column(G_R__No____DT_Caption; G_R__No____DT_CaptionLbl)
//                 {
//                 }
//                 column(C_Inv__No____DT_Caption; C_Inv__No____DT_CaptionLbl)
//                 {
//                 }
//                 column(S_Bill__No____DT_Caption; S_Bill__No____DT_CaptionLbl)
//                 {
//                 }
//                 column(B_L__No____DT_Caption; B_L__No____DT_CaptionLbl)
//                 {
//                 }
//                 column(Sales_Line_Document_Type; "Document Type")
//                 {
//                 }
//                 column(Sales_Line_Document_No_; "Document No.")
//                 {
//                 }
//                 column(Sales_Line_Line_No_; "Line No.")
//                 {
//                 }
//                 column(body1; body1)
//                 {
//                 }
//                 column(body2; body2)
//                 {
//                 }
//                 column(Consignee_Name; "Sales Header"."Bill-to Name")
//                 {
//                 }
//                 column(Consignee_Address; "Sales Header"."Bill-to Address")
//                 {
//                 }
//                 column(Consignee_City; "Sales Header"."Bill-to City")
//                 {
//                 }
//                 column(No_Of_Package; "Sales Line"."Packing Code")
//                 {
//                 }
//                 column(Mark_Container_No; "Sales Line"."Mark and Containger No")
//                 {
//                 }

//                 trigger OnAfterGetRecord();
//                 begin
//                     decUOMQuantity := 0;
//                     decCQuantity := 0;
//                     CASE optGroupBy OF
//                         optGroupBy::Item:
//                             BEGIN
//                                 FOR intCounter := 1 TO intNoCount DO BEGIN
//                                     IF "Sales Line"."No." <> '' THEN
//                                         IF "Sales Line"."No." = codUsedNos[intCounter] THEN
//                                             CurrReport.SKIP;
//                                 END;
//                                 recSalesLine.RESET;
//                                 recSalesLine.SETFILTER(recSalesLine."Document No.", "Sales Header"."No.");
//                                 recSalesLine.SETFILTER(recSalesLine."No.", "Sales Line"."No.");
//                                 IF recSalesLine.FIND('-') THEN BEGIN
//                                     blnSameUOM := FALSE;
//                                     intNoCount := intNoCount + 1;
//                                     codUsedNos[intNoCount] := "Sales Line"."No.";
//                                     codQtyUOM := recSalesLine."Unit of Measure Code";
//                                     IF recItemUnitOfMeasure.GET(recSalesLine."No.", recSalesLine."Unit of Measure Code") THEN
//                                         decQtyUOMConv := recItemUnitOfMeasure."Qty. per Unit of Measure";
//                                     REPEAT
//                                         decUOMQuantity := decUOMQuantity + recSalesLine.Quantity;
//                                         IF recSalesLine."Unit of Measure Code" = codQtyUOM THEN
//                                             decCQuantity := decCQuantity + recSalesLine.Quantity
//                                         ELSE BEGIN
//                                             decNextQtytoAdd := 0;
//                                             IF recItemUnitOfMeasure.GET(recSalesLine."No.", recSalesLine."Unit of Measure Code") THEN
//                                                 decNextQtytoAdd := recSalesLine.Quantity * recItemUnitOfMeasure."Qty. per Unit of Measure";

//                                             IF decQtyUOMConv <> 0 THEN decNextQtytoAdd := decNextQtytoAdd / decQtyUOMConv;
//                                             decCQuantity := decCQuantity + decNextQtytoAdd;
//                                         END;
//                                     UNTIL recSalesLine.NEXT = 0;
//                                 END;
//                             END;

//                         optGroupBy::Category:
//                             BEGIN
//                                 FOR intCounter := 1 TO intNoCount DO BEGIN
//                                     CurrReport.SKIP;
//                                 END;
//                                 recSalesLine.RESET;
//                                 recSalesLine.SETFILTER(recSalesLine."Document No.", "Sales Header"."No.");
//                                 IF recSalesLine.FIND('-') THEN BEGIN
//                                     blnSameUOM := FALSE;
//                                     intNoCount := intNoCount + 1;
//                                     codQtyUOM := recSalesLine."Unit of Measure Code";
//                                     IF recItemUnitOfMeasure.GET(recSalesLine."No.", recSalesLine."Unit of Measure Code") THEN
//                                         decQtyUOMConv := recItemUnitOfMeasure."Qty. per Unit of Measure";
//                                     REPEAT
//                                         decUOMQuantity := decUOMQuantity + recSalesLine.Quantity;
//                                         IF recSalesLine."Unit of Measure Code" = codQtyUOM THEN
//                                             decCQuantity := decCQuantity + recSalesLine.Quantity
//                                         ELSE BEGIN
//                                             decNextQtytoAdd := 0;
//                                             IF recItemUnitOfMeasure.GET(recSalesLine."No.", recSalesLine."Unit of Measure Code") THEN
//                                                 decNextQtytoAdd := recSalesLine.Quantity * recItemUnitOfMeasure."Qty. per Unit of Measure";
//                                             IF decQtyUOMConv <> 0 THEN decNextQtytoAdd := decNextQtytoAdd / decQtyUOMConv;
//                                             decCQuantity := decCQuantity + decNextQtytoAdd;
//                                         END;
//                                     UNTIL recSalesLine.NEXT = 0;
//                                 END;
//                             END;
//                     END;


//                     //added from 2009 report body section

//                     //decNoOfPkgs :="Sales Line"."UOM Quantity";

//                     IF (NOT (blnExtendedText) OR (blnReportBasedonLC) OR (optGroupBy = optGroupBy::Category)) THEN
//                         body1 := TRUE;

//                     recLCTerms.RESET;
//                     recLCTerms.SETFILTER(recLCTerms."LC No.", "Sales Header"."LC No.");
//                     IF recLCTerms.FIND('-') THEN
//                         txtItemDescription := recLCTerms.Description
//                     ELSE
//                         txtItemDescription := '';
//                     CASE optGroupBy OF
//                         optGroupBy::" ":
//                             BEGIN
//                                 decUOMQuantity := "Sales Line".Quantity;
//                                 decCQuantity := "Sales Line".Quantity;
//                                 recUnitOfMeasure.RESET;
//                                 recUnitOfMeasure.SETFILTER(recUnitOfMeasure.Code, "Sales Line"."Unit of Measure Code");
//                                 IF recUnitOfMeasure.FIND('-') THEN BEGIN
//                                     codUOMDescription := COPYSTR(recUnitOfMeasure.Description, 1, STRPOS(recUnitOfMeasure.Description, ' '));
//                                     IF codUOMDescription = '' THEN
//                                         codUOMDescription := recUnitOfMeasure.Description;
//                                 END
//                                 ELSE
//                                     codUOMDescription := '';
//                                 recUnitOfMeasure.RESET;
//                                 recUnitOfMeasure.SETFILTER(recUnitOfMeasure.Code, "Sales Line"."Unit of Measure Code");
//                                 IF recUnitOfMeasure.FIND('-') THEN BEGIN
//                                     codUOMDescriptionCode := COPYSTR(recUnitOfMeasure.Description, 1, STRPOS(recUnitOfMeasure.Description, ' '));
//                                     IF codUOMDescriptionCode = '' THEN
//                                         codUOMDescriptionCode := recUnitOfMeasure.Description;
//                                 END
//                                 ELSE
//                                     codUOMDescriptionCode := '';
//                             END;
//                         optGroupBy::Item:
//                             BEGIN
//                                 IF NOT (blnSameUOM) THEN BEGIN
//                                     recUnitOfMeasure.RESET;
//                                     recUnitOfMeasure.SETFILTER(recUnitOfMeasure.Code, "Sales Line"."Unit of Measure Code");
//                                     IF recUnitOfMeasure.FIND('-') THEN BEGIN
//                                         codUOMDescription := COPYSTR(recUnitOfMeasure.Description, 1, STRPOS(recUnitOfMeasure.Description, ' '));
//                                         IF codUOMDescription = '' THEN
//                                             codUOMDescription := recUnitOfMeasure.Description;
//                                     END
//                                     ELSE
//                                         codUOMDescription := '';
//                                 END
//                                 ELSE
//                                     codUOMDescription := 'PACKAGES';
//                                 recUnitOfMeasure.RESET;
//                                 recUnitOfMeasure.SETFILTER(recUnitOfMeasure.Code, "Sales Line"."Unit of Measure Code");
//                                 IF recUnitOfMeasure.FIND('-') THEN BEGIN
//                                     codUOMDescriptionCode := COPYSTR(recUnitOfMeasure.Description, 1, STRPOS(recUnitOfMeasure.Description, ' '));
//                                     IF codUOMDescriptionCode = '' THEN
//                                         codUOMDescriptionCode := recUnitOfMeasure.Description;
//                                 END
//                                 ELSE
//                                     codUOMDescriptionCode := '';
//                             END;
//                     END;
//                     CASE optGroupBy OF
//                         optGroupBy::" ":
//                             BEGIN
//                                 txtItemDescription := "Sales Line".Description + ' ' + "Sales Line"."Description 2";
//                                 decUOMQuantity := "Sales Line".Quantity;
//                                 decCQuantity := "Sales Line".Quantity;
//                                 recUnitOfMeasure.RESET;
//                                 recUnitOfMeasure.SETFILTER(recUnitOfMeasure.Code, "Sales Line"."Unit of Measure Code");
//                                 IF recUnitOfMeasure.FIND('-') THEN BEGIN
//                                     codUOMDescription := COPYSTR(recUnitOfMeasure.Description, 1, STRPOS(recUnitOfMeasure.Description, ' '));
//                                     IF codUOMDescription = '' THEN
//                                         codUOMDescription := recUnitOfMeasure.Description;
//                                 END
//                                 ELSE
//                                     codUOMDescription := '';
//                                 recUnitOfMeasure.RESET;
//                                 recUnitOfMeasure.SETFILTER(recUnitOfMeasure.Code, "Sales Line"."Unit of Measure Code");
//                                 IF recUnitOfMeasure.FIND('-') THEN BEGIN
//                                     codUOMDescriptionCode := COPYSTR(recUnitOfMeasure.Description, 1, STRPOS(recUnitOfMeasure.Description, ' '));
//                                     IF codUOMDescriptionCode = '' THEN
//                                         codUOMDescriptionCode := recUnitOfMeasure.Description;
//                                 END
//                                 ELSE
//                                     codUOMDescriptionCode := '';
//                             END;
//                         optGroupBy::Item:
//                             BEGIN
//                                 txtItemDescription := "Sales Line".Description + ' ' + "Sales Line"."Description 2";
//                                 recUnitOfMeasure.RESET;
//                                 recUnitOfMeasure.SETFILTER(recUnitOfMeasure.Code, "Sales Line"."Unit of Measure Code");
//                                 IF recUnitOfMeasure.FIND('-') THEN BEGIN
//                                     codUOMDescriptionCode := COPYSTR(recUnitOfMeasure.Description, 1, STRPOS(recUnitOfMeasure.Description, ' '));
//                                     IF codUOMDescriptionCode = '' THEN
//                                         codUOMDescriptionCode := recUnitOfMeasure.Description;
//                                 END
//                                 ELSE
//                                     codUOMDescriptionCode := '';
//                                 IF NOT (blnSameUOM) THEN BEGIN
//                                     recUnitOfMeasure.RESET;
//                                     recUnitOfMeasure.SETFILTER(recUnitOfMeasure.Code, "Sales Line"."Unit of Measure Code");
//                                     IF recUnitOfMeasure.FIND('-') THEN BEGIN
//                                         codUOMDescription := COPYSTR(recUnitOfMeasure.Description, 1, STRPOS(recUnitOfMeasure.Description, ' '));
//                                         IF codUOMDescription = '' THEN
//                                             codUOMDescription := recUnitOfMeasure.Description;
//                                     END
//                                     ELSE
//                                         codUOMDescription := '';
//                                 END
//                                 ELSE
//                                     codUOMDescription := 'PACKAGES';
//                             END;
//                         optGroupBy::Category:
//                             BEGIN
//                                 recUnitOfMeasure.RESET;
//                                 recUnitOfMeasure.SETFILTER(recUnitOfMeasure.Code, "Sales Line"."Unit of Measure Code");
//                                 IF recUnitOfMeasure.FIND('-') THEN BEGIN
//                                     codUOMDescriptionCode := COPYSTR(recUnitOfMeasure.Description, 1, STRPOS(recUnitOfMeasure.Description, ' '));
//                                     IF codUOMDescriptionCode = '' THEN
//                                         codUOMDescriptionCode := recUnitOfMeasure.Description;
//                                 END
//                                 ELSE
//                                     codUOMDescriptionCode := '';
//                                 IF NOT (blnSameUOM) THEN BEGIN
//                                     recUnitOfMeasure.RESET;
//                                     recUnitOfMeasure.SETFILTER(recUnitOfMeasure.Code, "Sales Line"."Unit of Measure Code");
//                                     IF recUnitOfMeasure.FIND('-') THEN BEGIN
//                                         codUOMDescription := COPYSTR(recUnitOfMeasure.Description, 1, STRPOS(recUnitOfMeasure.Description, ' '));
//                                         IF codUOMDescription = '' THEN
//                                             codUOMDescription := recUnitOfMeasure.Description;
//                                     END
//                                     ELSE
//                                         codUOMDescription := '';
//                                 END
//                                 ELSE
//                                     codUOMDescription := 'PACKAGES';
//                                 txtShippingMark := '';
//                                 txtItemDescription := '';
//                             END;
//                     END;

//                     IF "Sales Line"."Net Weight" <> 0 THEN BEGIN
//                         // change the capiton of 1 and 2 from base godrej dated 31/12/2014

//                         txtarrCaption[1] := 'Total Net Weight';
//                         txtarrCaption[2] := 'Total Gross Weight';

//                         txtarrCaption[3] := 'Total Net Wt.';
//                         txtarrCaption[4] := 'Total Gross Wt.';
//                         decarrValue[1] := "Sales Line"."Net Weight";
//                         decarrValue[2] := "Sales Line"."Gross Weight";
//                         decarrValue[3] := "Sales Line"."Net Weight" * decUOMQuantity;
//                         decarrValue[4] := "Sales Line"."Gross Weight" * decUOMQuantity;
//                         txtarrKgs[1] := 'KGS';
//                         txtarrKgs[2] := 'KGS';
//                         txtarrKgs[3] := 'KGS' + txtWhenPacked;
//                         txtarrKgs[4] := 'KGS' + txtWhenPacked;
//                     END
//                     ELSE BEGIN
//                         CLEAR(txtarrCaption);
//                         CLEAR(decarrValue);
//                         CLEAR(txtarrKgs);
//                         txtarrCaption[1] := 'Each ' + codUOMDescription + ' Gr. for Net Wt. ';
//                         txtarrCaption[2] := 'Total Gr. for Net Wt. ';
//                         decarrValue[1] := "Sales Line"."Gross Weight";
//                         decarrValue[2] := "Sales Line"."Gross Weight" * decUOMQuantity;
//                         txtarrKgs[1] := 'KGS';
//                         txtarrKgs[2] := 'KGS' + txtWhenPacked;
//                     END;
//                     //

//                     //added from 2009 report body section
//                     IF ((blnReportBasedonLC = FALSE) AND (blnExtendedText = TRUE) AND (optGroupBy <> optGroupBy::Category)) THEN
//                         body2 := TRUE;

//                     CLEAR(txtExtendedDescription);
//                     recExtendedTextLine.RESET;
//                     recExtendedTextLine.SETFILTER(recExtendedTextLine."Table Name", 'Item');
//                     recExtendedTextLine.SETFILTER(recExtendedTextLine."No.", "Sales Line"."No.");
//                     recExtendedTextLine.SETFILTER(recExtendedTextLine."Language Code", 'EI');
//                     IF recExtendedTextLine.FIND('-') THEN BEGIN
//                         FOR intExtCount := 1 TO recExtendedTextLine.COUNT DO BEGIN
//                             txtExtendedDescription[intExtCount] := recExtendedTextLine.Text;
//                             recExtendedTextLine.NEXT;
//                         END;
//                     END;
//                     txtCombinedExtended := '';
//                     FOR intExtCount := 1 TO 4 DO
//                         txtCombinedExtended := txtCombinedExtended + txtExtendedDescription[intExtCount] + ' ';
//                 end;

//                 trigger OnPreDataItem();
//                 begin
//                     CLEAR(codUsedNos);
//                 end;
//             }

//             trigger OnAfterGetRecord();
//             begin
//                 recCompanyInfo.GET;
//                 BEGIN
//                 END;

//                 codPostedInvNo := "Sales Header"."No.";
//                 datPostingDate := "Sales Header"."Posting Date";

//                 recCountry.RESET;
//                 recCountry.SETFILTER(recCountry.Code, "Sales Header"."Ship-to Country/Region Code");
//                 IF recCountry.FIND('-') THEN
//                     txtShipToCustCountry := recCountry.Name;

//                 recCountry.RESET;
//                 recCountry.SETFILTER(recCountry.Code, "Sales Header"."Country of Origin of Goods");
//                 IF recCountry.FIND('-') THEN
//                     txtCountryOfOriginOfGoods := recCountry.Name;

//                 recCountry.RESET;
//                 recCountry.SETFILTER(recCountry.Code, "Sales Header"."Country of Final Destination");
//                 IF recCountry.FIND('-') THEN
//                     txtCountryOfFinalDest := recCountry.Name;

//                 codVesselNo := "Sales Header"."Vessel/Flight No.";

//                 codLCNo := '';
//                 IF recPort.GET(Port) THEN txtPortOfLoading := recPort."Port Name";
//                 IF recPort.GET("Port of Discharge") THEN txtPortOfDischarge := recPort."Port Name";
//                 txtFinalDestination := "Sales Header"."Final Destination";
//                 IF recCountry.GET("Sales Header"."Bill-to Country/Region Code") THEN;
//                 txtBillToCustName := "Sales Header"."Bill-to Name";
//                 txtBillToCustAddress1 := "Sales Header"."Bill-to Address" + ' ' + "Sales Header"."Bill-to Address 2" + ' '
//                                       + "Sales Header"."Bill-to City" + "Sales Header"."Bill-to Post Code" + ' ' + recCountry.Name;
//                 //Sanjay add Phone no of Customer  13/02/2015

//                 RecCustomer.RESET;
//                 RecCustomer.SETFILTER(RecCustomer."No.", "Sales Header"."Sell-to Customer No.");
//                 IF RecCustomer.FIND('-') THEN
//                     txtCustphone := RecCustomer."Phone No.";
//                 //sanjay    add Phone no of Customer  13/02/2015
//                 //sanjay Factory location added for factory  details  13/02/2015
//                 RecLocation.RESET;
//                 RecLocation.SETFILTER(RecLocation.Code, "Sales Header"."Location Code");
//                 IF RecLocation.FIND('-') THEN
//                     txtLocation := RecLocation.Name;
//                 txtLocAddress := RecLocation.Address;
//                 txtLocAddress2 := RecLocation."Address 2";
//                 txtLocCity := RecLocation.City;
//                 txtphoneNo := RecLocation."Phone No.";

//                 //  sanjay Factory location added for factory  details  13/02/2015
//                 // Sanjay Payment Description add in Report
//                 RecPayTerm.RESET;
//                 RecPayTerm.SETFILTER(RecPayTerm.Code, "Sales Header"."Payment Terms Code");
//                 IF RecPayTerm.FIND('-') THEN
//                     txtpaymenttermcode := RecPayTerm.Description;

//                 //    Sanjay Payment Description add in Report
//                 txtPaymentTermDescription := '';
//                 intCommaCount := 0;
//                 recExportmentTerms.RESET;
//                 recExportmentTerms.SETFILTER(recExportmentTerms."Export Order No.", "Sales Header"."No.");
//                 IF recExportmentTerms.FIND('-') THEN
//                     REPEAT
//                         blnDontInsert := FALSE;
//                         FOR inta := 1 TO inti DO BEGIN
//                             IF recExportmentTerms."Bill of Lading No." = codBillOfLadingNo[inta] THEN
//                                 blnDontInsert := TRUE;
//                         END;
//                         IF blnDontInsert = FALSE THEN BEGIN
//                             inti := inti + 1;
//                             codBillOfLadingNo[inti] := recExportmentTerms."Bill of Lading No.";
//                             datBillOfLadingDate[inti] := recExportmentTerms."Bill of Lading Date";
//                         END;

//                         intCommaCount := intCommaCount + 1;
//                         CASE recExportmentTerms.COUNT OF
//                             1:
//                                 txtPaymentTermDescription := recExportmentTerms."Period Description";
//                             ELSE BEGIN
//                                     IF intCommaCount = 1 THEN
//                                         txtPaymentTermDescription := recExportmentTerms."Period Description";
//                                     IF intCommaCount = recExportmentTerms.COUNT THEN
//                                         txtPaymentTermDescription := txtPaymentTermDescription + ' & ' +
//                                         recExportmentTerms."Period Description"
//                                     ELSE
//                                         IF intCommaCount <> 1 THEN
//                                             txtPaymentTermDescription := txtPaymentTermDescription + ', ' +
//                                             recExportmentTerms."Period Description";
//                                 END;
//                         END;
//                     UNTIL recExportmentTerms.NEXT = 0;

//                 IF inti <> 0 THEN
//                     FOR inta := 1 TO inti DO BEGIN
//                         CASE inti OF
//                             1:
//                                 txtBillOfLadingNumbers := codBillOfLadingNo[1] + ' & ' + FORMAT(datBillOfLadingDate[1]);
//                             ELSE BEGIN
//                                     IF inta = 1 THEN
//                                         txtBillOfLadingNumbers := codBillOfLadingNo[1] + ' & ' + FORMAT(datBillOfLadingDate[1])
//                                     ELSE
//                                         txtBillOfLadingNumbers := txtBillOfLadingNumbers + ', ' + codBillOfLadingNo[inta] + ' & ' +
//                                                                 FORMAT(datBillOfLadingDate[inta]);
//                                 END;
//                         END;
//                     END;
//             end;

//             trigger OnPostDataItem();
//             begin
//                 //MESSAGE('%1',RecordsCount);
//             end;

//             trigger OnPreDataItem();
//             begin
//                 IF blnWhenPackedTick THEN
//                     txtWhenPacked := '(When Packed)'
//                 ELSE
//                     txtWhenPacked := '';
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 group(Option)
//                 {
//                     field(Consignee; '')
//                     {
//                     }
//                     field(txtShipToAddr[1];txtShipToAddr[1])
//                     {
//                     }
//                     field(txtShipToAddr[2];txtShipToAddr[2])
//                     {
//                     }
//                     field(txtShipToAddr[3];txtShipToAddr[3])
//                     {
//                     }
//                     field(txtShipToAddr[4];txtShipToAddr[4])
//                     {
//                     }
//                     field(Exporter;'')
//                     {
//                     }
//                     field(txtCompanyName;txtCompanyName)
//                     {
//                     }
//                     field(txtComapnyAddress1;txtComapnyAddress1)
//                     {
//                     }
//                     field("Additional Details";txtAdditionalDetails)
//                     {
//                     }
//                     field("Footer Text";txtAdditionalText)
//                     {
//                     }
//                     field("Shipping Marks";txtShpMrks)
//                     {
//                     }
//                     field("Custom Invoice No";codCINo)
//                     {
//                     }
//                     field("Custom Invoice Date";datCIDt)
//                     {
//                     }
//                     field("Shipping No";codShNo)
//                     {
//                     }
//                     field("Shipping Date";datShDt)
//                     {
//                     }
//                     field("G.R. No";codGRNo)
//                     {
//                     }
//                     field("G.R. Date";datGRDt)
//                     {
//                     }
//                     field("Dispaly ""When Packed""";blnWhenPackedTick)
//                     {
//                     }
//                     field("Extended text";blnExtendedText)
//                     {
//                     }
//                 }
//             }
//         }

//         actions
//         {
//         }

//         trigger OnOpenPage();
//         begin
//             txtShipToAddr[1]:=recSalesHeader."Ship-to Name";
//             txtShipToAddr[2]:=recSalesHeader."Ship-to Address";
//             txtShipToAddr[3]:=recSalesHeader."Ship-to Address 2";
//             IF recCountry.GET(recSalesHeader."Ship-to Country/Region Code") THEN;
//              txtShipToAddr[4]:=recSalesHeader."Ship-to City"+' '+recSalesHeader."Ship-to Post Code"+' '+recCountry.Name;
//             IF recCompanyInfo.GET THEN;
//               txtCompanyName := recCompanyInfo.Name;
//             IF recCountry.GET(recCompanyInfo."Country/Region Code") THEN;
//               txtComapnyAddress1 := recCompanyInfo.Address + ' ' + recCompanyInfo."Address 2"+' '+
//                                recCompanyInfo.City + ' ' + recCompanyInfo."Post Code"+' ' + recCountry.Name+
//                                '\TEL:'+recCompanyInfo."Phone No."+' FAX:'+recCompanyInfo."Fax No."+'\E-MAIL:'+recCompanyInfo."E-Mail";
//         end;
//     }

//     labels
//     {
//     }

//     var
//         txtCompanyName : Text[30];
//         txtComapnyAddress1 : Text[400];
//         txtComapnyAddress2 : Text[100];
//         RecLocation : Record Location;
//         txtLocation : Text[50];
//         txtLocAddress : Text[50];
//         txtLocAddress2 : Text[50];
//         txtLocCity : Text[15];
//         txtphoneNo : Text[30];
//         codPostedInvNo : Code[20];
//         datPostingDate : Date;
//         txtShipToCustName : Text[150];
//         txtShipToCustAddress : Text[150];
//         txtShipToCustCity : Text[30];
//         txtCustphone : Text[30];
//         txtpaymenttermcode : Text[30];
//         RecPayTerm : Record "Payment Terms";
//         RecCustomer : Record Customer;
//         txtShipToCustCountry : Text[30];
//         txtCountryOfOriginOfGoods : Text[30];
//         txtCountryOfFinalDest : Text[30];
//         codVesselNo : Code[20];
//         txtPortOfLoading : Text[30];
//         txtPortOfDischarge : Text[30];
//         txtFinalDestination : Text[30];
//         intiShipmentType : Integer;
//         codExportShipmentType : Code[5];
//         codLCNo : Code[50];
//         txtPaymentTerms : Text[50];
//         datExportInvDate : Date;
//         txtAdditionalText : Text[500];
//         txtAdditionalDetails : Text[500];
//         boolShowCompanyAdd : Boolean;
//         boolShowBillToCustDetails : Boolean;
//         txttxtShippingMark : Text[30];
//         decNoOfPkgs : Decimal;
//         codUOMDescription : Code[30];
//         decTotalWeight : Decimal;
//         txttxtItemDescription : Text[100];
//         decPostedInvLineGrossWt : Decimal;
//         decPostedInvLineTotGrossWt : Decimal;
//         txtBillToCustName : Text[150];
//         txtBillToCustAddress1 : Text[150];
//         txtBillToCustAddress2 : Text[150];
//         recCompanyInfo : Record "Company Information";
//         recItem : Record Item;
//         recPort : Record "33001050";
//         recCountry : Record "Country/Region";
//         recPostCode : Record "Post Code";
//         recPaymentTerm : Record "Payment Terms";
//         recUnitOfMeasure : Record "Unit of Measure";
//         txtExtendedDescription : array [100] of Text[200];
//         recExtendedTextLine : Record "Extended Text Line";
//         intExtCount : Integer;
//         blnExtendedText : Boolean;
//         optGroupBy : Option " ",Item,Category;
//         txtCatShippingMarks : Text[200];
//         txtCatDescription : Text[200];
//         recLCTerms : Record "LC Terms";
//         txtCompAddress : Text[400];
//         recLCDetail : Record "LC Detail";
//         txtItemDescription : Text[300];
//         blnReportBasedonLC : Boolean;
//         txtShippingMark : Text[200];
//         intCounter : Integer;
//         codUsedNos : array [40] of Code[20];
//         intNoCount : Integer;
//         decUOMQuantity : Decimal;
//         recSalesLine : Record "Sales Line";
//         recExportmentTerms : Record "33001040";
//         recPaymentTerms : Record "Payment Terms";
//         txtPaymentTermDescription : Text[100];
//         intCommaCount : Integer;
//         MS33000990 : Label 'The LC details for the Sales Header do not exist!';
//         codUOMDescriptionCode : Code[30];
//         txtarrCaption : array [4] of Text[60];
//         decarrValue : array [4] of Decimal;
//         txtarrKgs : array [4] of Text[60];
//         txtShipToAddr : array [5] of Text[150];
//         recSalesHeader : Record "Sales Header";
//         txtCombinedExtended : Text[500];
//         txtWhenPacked : Text[30];
//         blnWhenPackedTick : Boolean;
//         codQtyUOM : Code[20];
//         recItemUnitOfMeasure : Record "Item Unit of Measure";
//         decQtyUOMConv : Decimal;
//         decNextQtytoAdd : Decimal;
//         decCQuantity : Decimal;
//         intRecordsCount : Integer;
//         blnDontcount : Boolean;
//         recSalesline2 : Record "Sales Line";
//         blnSameUOM : Boolean;
//         blnUpdateCheckList : Boolean;
//         recSalesShipHeader : Record "Sales Shipment Header";
//         recStuffHeader : Record "33001042";
//         txtTypeAndPort : Text[100];
//         txtCustomInvoiceNumbers : Text[300];
//         txtShipBills : Text[500];
//         txtBillOfLadingNumbers : Text[400];
//         blnDontInsert : Boolean;
//         inta : Integer;
//         inti : Integer;
//         codBillOfLadingNo : array [10] of Code[20];
//         datBillOfLadingDate : array [10] of Date;
//         txtShpMrks : Text[50];
//         codCINo : Code[20];
//         datCIDt : Date;
//         codShNo : Code[20];
//         datShDt : Date;
//         codGRNo : Code[20];
//         datGRDt : Date;
//         Invoice_No____DateCaptionLbl : Label 'Invoice No. &     Date';
//         Exporters_Ref_CaptionLbl : Label 'Exporters Ref.';
//         Buyer_s_Order_No____DateCaptionLbl : Label 'Buyer''s Order No. & Date';
//         Other_referencesCaptionLbl : Label 'Other references';
//         FINAL_EXPORT_INVOICE__SI_CaptionLbl : Label 'FINAL EXPORT INVOICE (SI)';
//         Buyer__if_other_than_consignee_CaptionLbl : Label 'Buyer (if other than consignee)';
//         Country_of_Origin_of_GoodsCaptionLbl : Label 'Country of Origin of Goods';
//         Country_of_Fina_DestinationCaptionLbl : Label 'Country of Fina Destination';
//         Pre_CarrierCaptionLbl : Label 'Pre-Carrier';
//         Receipt_by_Pre_CarrierCaptionLbl : Label 'Receipt by Pre-Carrier';
//         Vessel_No_CaptionLbl : Label 'Vessel No.';
//         Port_of_LoadingCaptionLbl : Label 'Port of Loading';
//         Port_of_DischargeCaptionLbl : Label 'Port of Discharge';
//         Final_DestinationCaptionLbl : Label 'Final Destination';
//         Terms_of_Delivery_and_PaymentCaptionLbl : Label 'Terms of Delivery and Payment';
//         Marks_of_ContainerCaptionLbl : Label 'Marks of Container';
//         No_of_No_of_PkgsCaptionLbl : Label 'No of No of Pkgs';
//         Description_of_GoodsCaptionLbl : Label 'Description of Goods';
//         QuantityCaptionLbl : Label 'Quantity';
//         ExporterCaptionLbl : Label 'Exporter';
//         ConsigneeCaptionLbl : Label 'Consignee';
//         RateCaptionLbl : Label 'Rate';
//         AmountCaptionLbl : Label 'Amount';
//         Signature___DateCaptionLbl : Label 'Signature & Date';
//         Declaration__CaptionLbl : Label 'Declaration :';
//         //We_declare_that_this_invoice_shows_the_actual_price_of_the_goods_described_and_that_all_particulars_are_true_and_correct_CaptLbl : Label 'We declare that this invoice shows the actual price of the goods described and that all particulars are true and correct.'; //PCPL-Deepak
//         Marks_of_ContainerCaption_Control1000000017Lbl : Label 'Marks of Container';
//         No_of_No_of_PkgsCaption_Control1000000018Lbl : Label 'No of No of Pkgs';
//         Description_of_GoodsCaption_Control1000000019Lbl : Label 'Description of Goods';
//         QuantityCaption_Control1000000024Lbl : Label 'Quantity';
//         Letters_Ref___CaptionLbl : Label 'Letters Ref. :';
//         Buyer_s_Order_No____DateCaption_Control1000000013Lbl : Label 'Buyer''s Order No. & Date';
//         Other_referencesCaption_Control1000000014Lbl : Label 'Other references';
//         Posted_Invoice_No_CaptionLbl : Label 'Posted Invoice No.';
//         DateCaptionLbl : Label 'Date';
//         FINAL_EXPORT_INVOICE__SI_Caption_Control1000000135Lbl : Label 'FINAL EXPORT INVOICE (SI)';
//         RateCaption_Control1000000137Lbl : Label 'Rate';
//         AmountCaption_Control1000000140Lbl : Label 'Amount';
//         PerCaptionLbl : Label 'Per';
//         GREEN_CARD_NO_CaptionLbl : Label 'GREEN CARD NO.';
//         PerCaption_Control1000000149Lbl : Label 'Per';
//         GREEN_CARD_NO_Caption_Control1000000166Lbl : Label 'GREEN CARD NO.';
//         Signature___DateCaption_Control1000000114Lbl : Label 'Signature & Date';
//         G_R__No____DT_CaptionLbl : Label 'G.R. No. & DT.';
//         C_Inv__No____DT_CaptionLbl : Label 'C.Inv. No. & DT.';
//         S_Bill__No____DT_CaptionLbl : Label 'S/Bill. No. & DT.';
//         B_L__No____DT_CaptionLbl : Label 'B/L. No. & DT.';
//         body1 : Boolean;
//         body2 : Boolean;
//         RecComment : Record "Sales Comment Line";
//         HDFCBank_CaptionLbl : Label 'HDFC BANK LTD :- Manek Smruti, TPS 2, Nehru Rd, Vile Parle(E), Mumbai-400057, India, Current A/C No: 50200014898569, SWIFT CODE: HDFCINBB';
//         CorrBank_CaptionLbl : Label '"Correspondance Bank in USA is Bank of New York, New York, SWIFT: IRVTUS3N, HDFC ACCOUNT: V801-890-0330-937 FEDWIRE ABA: 021000018 OR JPMorgan Chase Bank, NEW YORK, SWIFT: CHASUS33, HDFC ACCOUNT: 001-1-406717; CHIPS ABA : 0002"';

//     procedure fctPassSalesHeader(var PrecRecSalesHeader : Record "Sales Header");
//     begin
//         recSalesHeader.COPY(PrecRecSalesHeader);
//     end;
// }