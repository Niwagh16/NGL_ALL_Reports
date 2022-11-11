// report 50085 "Bill Of Exchange- NGL"
// {  //PCPL/NSW/MIG 09Aug22
//     // version GITLEXIM 6.00.01.03

//     DefaultLayout = RDLC;
//     RDLCLayout = './Bill Of Exchange- NGL.rdlc';

//     dataset
//     {
//         dataitem(DataItem6640;Table36)
//         {
//             DataItemTableView = SORTING(No.);
//             PrintOnlyIfDetail = false;
//             column(Sales_Header_Document_Type;"Document Type")
//             {
//             }
//             column(Sales_Header_No_;"No.")
//             {
//             }
//             dataitem(DataItem2445;Table33001040)
//             {
//                 DataItemLink = Export Order No.=FIELD(No.);
//                 DataItemLinkReference = "Sales Header";
//                 DataItemTableView = SORTING(Export Order No.,Line No.);
//                 PrintOnlyIfDetail = false;
//                 column(Exp_Order_No;"Export Payment Terms"."Export Order No.")
//                 {
//                 }
//                 column(Sales_Header___Currency_Code_;"Sales Header"."Currency Code")
//                 {
//                 }
//                 column(recCompanyInfo_City;recCompanyInfo.City)
//                 {
//                 }
//                 column(datDate;datDate)
//                 {
//                 }
//                 column(txtBankName_______txtBankAddress1______txtBankAddress2______txtBankCity______codBankCityCode;txtBankName +'  '+txtBankAddress1+'  '+txtBankAddress2+'  '+txtBankCity+'  '+codBankCityCode)
//                 {
//                 }
//                 column(txtDescriptionOfAmount_1_;txtDescriptionOfAmount[1])
//                 {
//                 }
//                 column(txtDescriptionOfAmount_2_;txtDescriptionOfAmount[2])
//                 {
//                 }
//                 column(OUR_INVOICE_NO____FORMAT__Sales_Header___No_______DATE___FORMAT__Sales_Header___Document_Date__;'OUR INVOICE NO. '+FORMAT("Sales Header"."No.")+'  DATE '+FORMAT("Sales Header"."Document Date"))
//                 {
//                 }
//                 column(txtText1;txtText1)
//                 {
//                 }
//                 column(recCompanyInfo_City_Control1000000095;recCompanyInfo.City)
//                 {
//                 }
//                 column(datDate_Control1000000098;datDate)
//                 {
//                 }
//                 column(txtBankName_______txtBankAddress1______txtBankAddress2______txtBankCity______codBankCityCode_Control1000000110;txtBankName +'  '+txtBankAddress1+'  '+txtBankAddress2+'  '+txtBankCity+'  '+codBankCityCode)
//                 {
//                 }
//                 column(txtDescriptionOfAmount_1__Control1000000112;txtDescriptionOfAmount[1])
//                 {
//                 }
//                 column(txtDescriptionOfAmount_2__Control1000000113;txtDescriptionOfAmount[2])
//                 {
//                 }
//                 column(OUR_INVOICE_NO____FORMAT__Sales_Header___No______DATE___FORMAT__Sales_Header___Document_Date__;'OUR INVOICE NO. '+FORMAT("Sales Header"."No.")+' DATE '+FORMAT("Sales Header"."Document Date"))
//                 {
//                 }
//                 column(txtText1_Control1000000119;txtText1)
//                 {
//                 }
//                 column(txtLCInput;txtLCInput)
//                 {
//                 }
//                 column(txtLCInput_Control1000000130;txtLCInput)
//                 {
//                 }
//                 column(EmptyString;'_')
//                 {
//                 }
//                 column(EmptyString_Control1000000066;'_')
//                 {
//                 }
//                 column(decAmountDue;decAmountDue)
//                 {
//                 }
//                 column(Sales_Header___Currency_Code__Control1000000076;"Sales Header"."Currency Code")
//                 {
//                 }
//                 column(decAmountDue_Control1000000094;decAmountDue)
//                 {
//                 }
//                 column(recCompanyInfo_Name_recCompanyInfo__Name_2_;recCompanyInfo.Name+recCompanyInfo."Name 2")
//                 {
//                 }
//                 column(recCompanyInfo_Name_recCompanyInfo__Name_2__Control1000000017;recCompanyInfo.Name+recCompanyInfo."Name 2")
//                 {
//                 }
//                 column(recCompanyInfo_Name_recCompanyInfo__Name_2__Control1000000107;recCompanyInfo.Name+recCompanyInfo."Name 2")
//                 {
//                 }
//                 column(recCompanyInfo_Name_recCompanyInfo__Name_2__Control1000000123;recCompanyInfo.Name+recCompanyInfo."Name 2")
//                 {
//                 }
//                 column(recCompanyInfo_City_Control1000000018;recCompanyInfo.City)
//                 {
//                 }
//                 column(datDate_Control1000000021;datDate)
//                 {
//                 }
//                 column(recLCDetail__LC_No__;recLCDetail."LC No.")
//                 {
//                 }
//                 column(txtCustomerBankName;txtCustomerBankName)
//                 {
//                 }
//                 column(txtLCInput_Control1000000000;txtLCInput)
//                 {
//                 }
//                 column(txtBankName_______txtBankAddress1______txtBankAddress2______txtBankCity______codBankCityCode_Control1000000007;txtBankName +'  '+txtBankAddress1+'  '+txtBankAddress2+'  '+txtBankCity+'  '+codBankCityCode)
//                 {
//                 }
//                 column(txtDescriptionOfAmount_1__Control1000000009;txtDescriptionOfAmount[1])
//                 {
//                 }
//                 column(txtDescriptionOfAmount_2__Control1000000010;txtDescriptionOfAmount[2])
//                 {
//                 }
//                 column(OUR_INVOICE_NO____FORMAT__Sales_Header___No______DATE___FORMAT__Sales_Header___Document_Date___Control1000000023;'OUR INVOICE NO. '+FORMAT("Sales Header"."No.")+' DATE '+FORMAT("Sales Header"."Document Date"))
//                 {
//                 }
//                 column(txtText1_Control1000000027;txtText1)
//                 {
//                 }
//                 column(recCompanyInfo_City_Control1000000034;recCompanyInfo.City)
//                 {
//                 }
//                 column(datDate_Control1000000038;datDate)
//                 {
//                 }
//                 column(recLCDetail__LC_No___Control1000000040;recLCDetail."LC No.")
//                 {
//                 }
//                 column(txtCustomerBankName_Control1000000042;txtCustomerBankName)
//                 {
//                 }
//                 column(txtBankName_______txtBankAddress1______txtBankAddress2______txtBankCity______codBankCityCode_Control1000000050;txtBankName +'  '+txtBankAddress1+'  '+txtBankAddress2+'  '+txtBankCity+'  '+codBankCityCode)
//                 {
//                 }
//                 column(txtDescriptionOfAmount_1__Control1000000052;txtDescriptionOfAmount[1])
//                 {
//                 }
//                 column(txtDescriptionOfAmount_2__Control1000000053;txtDescriptionOfAmount[2])
//                 {
//                 }
//                 column(OUR_INVOICE_NO____FORMAT__Sales_Header___No______DATE___FORMAT__Sales_Header___Document_Date___Control1000000055;'OUR INVOICE NO. '+FORMAT("Sales Header"."No.")+' DATE '+FORMAT("Sales Header"."Document Date"))
//                 {
//                 }
//                 column(txtText1_Control1000000059;txtText1)
//                 {
//                 }
//                 column(txtLCInput_Control1000000070;txtLCInput)
//                 {
//                 }
//                 column(EmptyString_Control1000000022;'_')
//                 {
//                 }
//                 column(EmptyString_Control1000000046;'_')
//                 {
//                 }
//                 column(recLCDetail__Date_of_Issue_;recLCDetail."Date of Issue")
//                 {
//                 }
//                 column(recLCDetail__Date_of_Issue__Control1000000077;recLCDetail."Date of Issue")
//                 {
//                 }
//                 column(Sales_Header___Currency_Code__Control1000000100;"Sales Header"."Currency Code")
//                 {
//                 }
//                 column(decAmountDue_Control1000000101;decAmountDue)
//                 {
//                 }
//                 column(Sales_Header___Currency_Code__Control1000000102;"Sales Header"."Currency Code")
//                 {
//                 }
//                 column(decAmountDue_Control1000000103;decAmountDue)
//                 {
//                 }
//                 column(recCompanyInfo_Name_recCompanyInfo__Name_2__Control1000000134;recCompanyInfo.Name+recCompanyInfo."Name 2")
//                 {
//                 }
//                 column(recCompanyInfo_Name_recCompanyInfo__Name_2__Control1000000135;recCompanyInfo.Name+recCompanyInfo."Name 2")
//                 {
//                 }
//                 column(recCompanyInfo_Name_recCompanyInfo__Name_2__Control1000000137;recCompanyInfo.Name+recCompanyInfo."Name 2")
//                 {
//                 }
//                 column(recCompanyInfo_Name_recCompanyInfo__Name_2__Control1000000140;recCompanyInfo.Name+recCompanyInfo."Name 2")
//                 {
//                 }
//                 column(Exchange_forCaption;Exchange_forCaptionLbl)
//                 {
//                 }
//                 column(No_Caption;No_CaptionLbl)
//                 {
//                 }
//                 column(Second_of_the_same_tenor_and_date_being_unpaid___Pay_to_the_OrderCaption;Second_of_the_same_tenor_and_date_being_unpaid___Pay_to_the_OrderCaptionLbl)
//                 {
//                 }
//                 column(ofCaption;ofCaptionLbl)
//                 {
//                 }
//                 column(the_sum_ofCaption;the_sum_ofCaptionLbl)
//                 {
//                 }
//                 column(for_value_receive_againstCaption;for_value_receive_againstCaptionLbl)
//                 {
//                 }
//                 column(ToCaption;ToCaptionLbl)
//                 {
//                 }
//                 column(ForCaption;ForCaptionLbl)
//                 {
//                 }
//                 column(PartnerCaption;PartnerCaptionLbl)
//                 {
//                 }
//                 column(EmptyStringCaption;EmptyStringCaptionLbl)
//                 {
//                 }
//                 column(Exchange_forCaption_Control1000000093;Exchange_forCaption_Control1000000093Lbl)
//                 {
//                 }
//                 column(No_Caption_Control1000000097;No_Caption_Control1000000097Lbl)
//                 {
//                 }
//                 column(First_of_the_same_tenor_and_date_being_unpaid___Pay_to_the_OrderCaption;First_of_the_same_tenor_and_date_being_unpaid___Pay_to_the_OrderCaptionLbl)
//                 {
//                 }
//                 column(ofCaption_Control1000000109;ofCaption_Control1000000109Lbl)
//                 {
//                 }
//                 column(the_sum_ofCaption_Control1000000111;the_sum_ofCaption_Control1000000111Lbl)
//                 {
//                 }
//                 column(for_value_receive_againstCaption_Control1000000114;for_value_receive_againstCaption_Control1000000114Lbl)
//                 {
//                 }
//                 column(ToCaption_Control1000000116;ToCaption_Control1000000116Lbl)
//                 {
//                 }
//                 column(PartnerCaption_Control1000000118;PartnerCaption_Control1000000118Lbl)
//                 {
//                 }
//                 column(AtCaption;AtCaptionLbl)
//                 {
//                 }
//                 column(sight_of_thisCaption;sight_of_thisCaptionLbl)
//                 {
//                 }
//                 column(FIRSTCaption;FIRSTCaptionLbl)
//                 {
//                 }
//                 column(of_ExchangeCaption;of_ExchangeCaptionLbl)
//                 {
//                 }
//                 column(AtCaption_Control1000000129;AtCaption_Control1000000129Lbl)
//                 {
//                 }
//                 column(sight_of_thisCaption_Control1000000131;sight_of_thisCaption_Control1000000131Lbl)
//                 {
//                 }
//                 column(SECONDCaption;SECONDCaptionLbl)
//                 {
//                 }
//                 column(of_ExchangeCaption_Control1000000133;of_ExchangeCaption_Control1000000133Lbl)
//                 {
//                 }
//                 column(Drawn_Under_License_No_Caption;Drawn_Under_License_No_CaptionLbl)
//                 {
//                 }
//                 column(Issued_byCaption;Issued_byCaptionLbl)
//                 {
//                 }
//                 column(Drawn_Under_License_No_Caption_Control1000000044;Drawn_Under_License_No_Caption_Control1000000044Lbl)
//                 {
//                 }
//                 column(Issued_byCaption_Control1000000045;Issued_byCaption_Control1000000045Lbl)
//                 {
//                 }
//                 column(ForCaption_Control1000000122;ForCaption_Control1000000122Lbl)
//                 {
//                 }
//                 column(Exchange_forCaption_Control1000000016;Exchange_forCaption_Control1000000016Lbl)
//                 {
//                 }
//                 column(No_Caption_Control1000000019;No_Caption_Control1000000019Lbl)
//                 {
//                 }
//                 column(Drawn_Under_License_No_Caption_Control1000000012;Drawn_Under_License_No_Caption_Control1000000012Lbl)
//                 {
//                 }
//                 column(Issued_byCaption_Control1000000014;Issued_byCaption_Control1000000014Lbl)
//                 {
//                 }
//                 column(AtCaption_Control1000000001;AtCaption_Control1000000001Lbl)
//                 {
//                 }
//                 column(sight_of_thisCaption_Control1000000002;sight_of_thisCaption_Control1000000002Lbl)
//                 {
//                 }
//                 column(FIRSTCaption_Control1000000003;FIRSTCaption_Control1000000003Lbl)
//                 {
//                 }
//                 column(of_ExchangeCaption_Control1000000004;of_ExchangeCaption_Control1000000004Lbl)
//                 {
//                 }
//                 column(Second_of_the_same_tenor_and_date_being_unpaid___Pay_to_the_OrderCaption_Control1000000005;Second_of_the_same_tenor_and_date_being_unpaid___Pay_to_the_OrderCaption_Control1000000005Lbl)
//                 {
//                 }
//                 column(ofCaption_Control1000000006;ofCaption_Control1000000006Lbl)
//                 {
//                 }
//                 column(the_sum_ofCaption_Control1000000008;the_sum_ofCaption_Control1000000008Lbl)
//                 {
//                 }
//                 column(for_value_receive_againstCaption_Control1000000011;for_value_receive_againstCaption_Control1000000011Lbl)
//                 {
//                 }
//                 column(ToCaption_Control1000000024;ToCaption_Control1000000024Lbl)
//                 {
//                 }
//                 column(EmptyStringCaption_Control1000000029;EmptyStringCaption_Control1000000029Lbl)
//                 {
//                 }
//                 column(Exchange_forCaption_Control1000000028;Exchange_forCaption_Control1000000028Lbl)
//                 {
//                 }
//                 column(No_Caption_Control1000000036;No_Caption_Control1000000036Lbl)
//                 {
//                 }
//                 column(Drawn_Under_License_No_Caption_Control1000000039;Drawn_Under_License_No_Caption_Control1000000039Lbl)
//                 {
//                 }
//                 column(Issued_byCaption_Control1000000041;Issued_byCaption_Control1000000041Lbl)
//                 {
//                 }
//                 column(First_of_the_same_tenor_and_date_being_unpaid___Pay_to_the_OrderCaption_Control1000000048;First_of_the_same_tenor_and_date_being_unpaid___Pay_to_the_OrderCaption_Control1000000048Lbl)
//                 {
//                 }
//                 column(ofCaption_Control1000000049;ofCaption_Control1000000049Lbl)
//                 {
//                 }
//                 column(the_sum_ofCaption_Control1000000051;the_sum_ofCaption_Control1000000051Lbl)
//                 {
//                 }
//                 column(for_value_receive_againstCaption_Control1000000054;for_value_receive_againstCaption_Control1000000054Lbl)
//                 {
//                 }
//                 column(ToCaption_Control1000000056;ToCaption_Control1000000056Lbl)
//                 {
//                 }
//                 column(AtCaption_Control1000000069;AtCaption_Control1000000069Lbl)
//                 {
//                 }
//                 column(sight_of_thisCaption_Control1000000071;sight_of_thisCaption_Control1000000071Lbl)
//                 {
//                 }
//                 column(SECONDCaption_Control1000000072;SECONDCaption_Control1000000072Lbl)
//                 {
//                 }
//                 column(of_ExchangeCaption_Control1000000099;of_ExchangeCaption_Control1000000099Lbl)
//                 {
//                 }
//                 column(DateCaption;DateCaptionLbl)
//                 {
//                 }
//                 column(DateCaption_Control1000000096;DateCaption_Control1000000096Lbl)
//                 {
//                 }
//                 column(ForCaption_Control1000000136;ForCaption_Control1000000136Lbl)
//                 {
//                 }
//                 column(PartnerCaption_Control1000000138;PartnerCaption_Control1000000138Lbl)
//                 {
//                 }
//                 column(ForCaption_Control1000000139;ForCaption_Control1000000139Lbl)
//                 {
//                 }
//                 column(PartnerCaption_Control1000000141;PartnerCaption_Control1000000141Lbl)
//                 {
//                 }
//                 column(Export_Payment_Terms_Export_Order_No_;"Export Order No.")
//                 {
//                 }
//                 column(Export_Payment_Terms_Line_No_;"Line No.")
//                 {
//                 }
//                 column(blnReportBasedonLC;blnReportBasedonLC)
//                 {
//                 }

//                 trigger OnAfterGetRecord();
//                 begin
//                     intOnePAge := intOnePAge+1;
//                     IF (intOnePAge <> 1) THEN
//                       CurrReport.SKIP;

//                     repcheck.InitTextVariable;
//                     repcheck.FormatNoText(txtDescriptionOfAmount,ROUND(decAmountDue,0.01),
//                     "Sales Header"."Currency Code");

//                     //TO PRINT LC BASED REPORT
//                     IF blnReportBasedonLC THEN
//                        BEGIN
//                           recLCDetail.RESET;
//                           IF recLCDetail.GET("Sales Header"."LC No.") THEN
//                               BEGIN
//                                 IF recLCDetail."Transaction Type"=recLCDetail."Transaction Type"::Sale THEN
//                                   BEGIN
//                                    IF recCustomerBankAccount.GET(recLCDetail."Issued To/Received From",recLCDetail."Issuing Bank") THEN
//                                       BEGIN
//                                         IF recCountry.GET(recCustomerBankAccount."Country/Region Code") THEN;
//                                          txtText1:=recCustomerBankAccount.Name+' '
//                                                    +recCustomerBankAccount.Address+' '+recCustomerBankAccount."Address 2"+' '+
//                                                    recCustomerBankAccount.City+' '+recCustomerBankAccount."Post Code"+' '+recCountry.Name;
//                                         txtCustomerBankName:=txtText1;
//                                       END;
//                                   END
//                                 ELSE
//                                   BEGIN
//                                    recBankAccount.GET(recLCDetail."Issuing Bank");
//                                     BEGIN
//                                       IF recCountry.GET(recBankAccount."Country/Region Code") THEN;
//                                       txtText1:=recBankAccount.Name+' '+recBankAccount.Address+' '+
//                                                 recBankAccount."Address 2"+' '+recBankAccount.City+' '+
//                                                 recBankAccount."Post Code"+' '+recCountry.Name;
//                                       txtCustomerBankName:=txtText1;
//                                     END;
//                                   END
//                               END
//                            ELSE
//                                ERROR(MS33000990);
//                        END
//                     ELSE
//                        BEGIN
//                            IF recCountry.GET("Sales Header"."Bill-to Country/Region Code") THEN
//                               txtBillToCustomerCountry:=recCountry.Name;

//                             txtText1:="Sales Header"."Bill-to Name"+'  '+"Sales Header"."Bill-to Name 2"+'  '+
//                              "Sales Header"."Bill-to Address"+'  '+"Sales Header"."Bill-to Address 2"+'  '+
//                              "Sales Header"."Bill-to City"+' '+"Sales Header"."Bill-to Post Code"+'  '+txtBillToCustomerCountry;
//                        END;

//                     //avinash//
//                     /*
//                     CurrReport.SHOWOUTPUT(NOT(blnReportBasedonLC));
//                     recCompanyInfo.GET;
//                     */
//                     //avinash//

//                 end;
//             }

//             trigger OnAfterGetRecord();
//             begin
//                 IF ("LC No." <> '') THEN BEGIN
//                   recCustomerBankAccount.RESET;
//                   recCustomerBankAccount.SETFILTER(recCustomerBankAccount."Customer No.","Sell-to Customer No.");
//                   IF recCustomerBankAccount.FIND('-') THEN
//                     txtCustomerBankName:=recCustomerBankAccount.Name;
//                 END ELSE
//                   txtCustomerBankName:='';

//                 recCompanyInfo.GET;

//                 recBankAccount.RESET;
//                 IF ("Bank Account" <> '') THEN BEGIN
//                   recBankAccount.RESET;
//                   recBankAccount.SETFILTER(recBankAccount."No.","Bank Account");
//                   IF recBankAccount.FIND('-') THEN BEGIN
//                     txtBankName := recBankAccount.Name;
//                     codAccountNo := recBankAccount."Bank Account No.";
//                     txtBankAddress1 := recBankAccount.Address;
//                     txtBankAddress2 := recBankAccount."Address 2";
//                     txtBankCity := recBankAccount.City;
//                     codBankCityCode := recBankAccount."Post Code";
//                   END;
//                 END;
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
//                     field(Date;datDate)
//                     {
//                     }
//                     field(Terms;txtLCInput)
//                     {
//                     }
//                     field(PaymentTermLine;'')
//                     {
//                     }
//                     field(optPayTermLine;optPayTermLine)
//                     {

//                         trigger OnValidate();
//                         begin

//                             recExportPaymentTerm.RESET;
//                             recExportPaymentTerm.SETFILTER(recExportPaymentTerm."Export Order No.",recSalesHeader."No.");
//                             IF recExportPaymentTerm.FIND('-') THEN;
//                             IF (optPayTermLine > recExportPaymentTerm.COUNT) THEN ERROR(MS33000991);
//                                FOR intiCounter:=1 TO (optPayTermLine-1) DO recExportPaymentTerm.NEXT;
//                             IF optPayTermLine<>optPayTermLine::" " THEN
//                              BEGIN
//                               txtPayTermLineDesc:=recExportPaymentTerm."Period Description";
//                               decAmountDue:=decInvAmt*recExportPaymentTerm."% of Invoice Value"/100;
//                              END
//                             ELSE
//                               BEGIN
//                                txtPayTermLineDesc:='';
//                                decAmountDue:=0;
//                               END;
//                         end;
//                     }
//                     field(txtPayTermLineDesc;txtPayTermLineDesc)
//                     {
//                     }
//                     field(decAmountDue;decAmountDue)
//                     {
//                     }
//                     field("Report Based On LC";blnReportBasedonLC)
//                     {
//                     }
//                     field("SalesInvoice No";recSalesHeader."No.")
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
//             decInvAmt:=0;
//             recSalesLine.RESET;
//             recSalesLine.SETFILTER(recSalesLine."Document Type",'Invoice');
//             recSalesLine.SETFILTER(recSalesLine."Document No.",recSalesHeader."No.");
//             IF recSalesLine.FIND('-') THEN
//                REPEAT
//                   decInvAmt:=decInvAmt+recSalesLine."Amount To Customer";
//                UNTIL recSalesLine.NEXT=0;
//         end;
//     }

//     labels
//     {
//     }

//     trigger OnInitReport();
//     begin
//         datDate:=TODAY;
//     end;

//     var
//         recCustomerBankAccount : Record "287";
//         txtCustomerBankName : Text[300];
//         recCompanyInfo : Record "79";
//         datDate : Date;
//         txtExpirationdaysText : Text[90];
//         txtExpirationdays : Text[30];
//         txtVar1 : Text[30];
//         txtLCInput : Text[100];
//         recBankAccount : Record "270";
//         txtBankName : Text[200];
//         codAccountNo : Code[50];
//         txtBankAddress1 : Text[100];
//         txtBankAddress2 : Text[100];
//         txtBankCity : Text[50];
//         codBankCityCode : Code[10];
//         repcheck : Report "1401";
//         txtNumberText : array [2] of Text[80];
//         txtDescriptionOfAmount : array [2] of Text[80];
//         txtText1 : Text[500];
//         recCountry : Record "9";
//         txtBillToCustomerCountry : Text[80];
//         recSalesLine : Record "37";
//         decAmountDue : Decimal;
//         blnReportBasedonLC : Boolean;
//         recLCDetail : Record "16300";
//         MS33000990 : Label 'The LC details for the Sales Header do not exist!';
//         intOnePAge : Integer;
//         recExportPaymentTerm : Record "33001040";
//         optPayTermLine : Option " ","1","2","3","4","5";
//         txtPayTermLineDesc : Text[100];
//         intiCounter : Integer;
//         decInvAmt : Decimal;
//         recSalesHeader : Record "36";
//         MS33000991 : Label 'The Payment Term Line does not exist';
//         Exchange_forCaptionLbl : Label 'Exchange for';
//         No_CaptionLbl : Label 'No.';
//         Second_of_the_same_tenor_and_date_being_unpaid___Pay_to_the_OrderCaptionLbl : Label '(Second of the same tenor and date being unpaid ) Pay to the Order of';
//         ofCaptionLbl : Label 'of';
//         the_sum_ofCaptionLbl : Label 'the sum of';
//         for_value_receive_againstCaptionLbl : Label 'for value receive against';
//         ToCaptionLbl : Label 'To';
//         ForCaptionLbl : Label 'For';
//         PartnerCaptionLbl : Label 'Partner';
//         EmptyStringCaptionLbl : Label '-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------';
//         Exchange_forCaption_Control1000000093Lbl : Label 'Exchange for';
//         No_Caption_Control1000000097Lbl : Label 'No.';
//         First_of_the_same_tenor_and_date_being_unpaid___Pay_to_the_OrderCaptionLbl : Label '(First of the same tenor and date being unpaid ) Pay to the Order of';
//         ofCaption_Control1000000109Lbl : Label 'of';
//         the_sum_ofCaption_Control1000000111Lbl : Label 'the sum of';
//         for_value_receive_againstCaption_Control1000000114Lbl : Label 'for value receive against';
//         ToCaption_Control1000000116Lbl : Label 'To';
//         PartnerCaption_Control1000000118Lbl : Label 'Partner';
//         AtCaptionLbl : Label 'At';
//         sight_of_thisCaptionLbl : Label 'sight of this';
//         FIRSTCaptionLbl : Label 'FIRST';
//         of_ExchangeCaptionLbl : Label 'of Exchange';
//         AtCaption_Control1000000129Lbl : Label 'At';
//         sight_of_thisCaption_Control1000000131Lbl : Label 'sight of this';
//         SECONDCaptionLbl : Label 'SECOND';
//         of_ExchangeCaption_Control1000000133Lbl : Label 'of Exchange';
//         Drawn_Under_License_No_CaptionLbl : Label 'Drawn Under License No.';
//         Issued_byCaptionLbl : Label 'Issued by';
//         Drawn_Under_License_No_Caption_Control1000000044Lbl : Label 'Drawn Under License No.';
//         Issued_byCaption_Control1000000045Lbl : Label 'Issued by';
//         ForCaption_Control1000000122Lbl : Label 'For';
//         Exchange_forCaption_Control1000000016Lbl : Label 'Exchange for';
//         No_Caption_Control1000000019Lbl : Label 'No.';
//         Drawn_Under_License_No_Caption_Control1000000012Lbl : Label 'Drawn Under License No.';
//         Issued_byCaption_Control1000000014Lbl : Label 'Issued by';
//         AtCaption_Control1000000001Lbl : Label 'At';
//         sight_of_thisCaption_Control1000000002Lbl : Label 'sight of this';
//         FIRSTCaption_Control1000000003Lbl : Label 'FIRST';
//         of_ExchangeCaption_Control1000000004Lbl : Label 'of Exchange';
//         Second_of_the_same_tenor_and_date_being_unpaid___Pay_to_the_OrderCaption_Control1000000005Lbl : Label '(Second of the same tenor and date being unpaid ) Pay to the Order';
//         ofCaption_Control1000000006Lbl : Label 'of';
//         the_sum_ofCaption_Control1000000008Lbl : Label 'the sum of';
//         for_value_receive_againstCaption_Control1000000011Lbl : Label 'for value receive against';
//         ToCaption_Control1000000024Lbl : Label 'To';
//         EmptyStringCaption_Control1000000029Lbl : Label '-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------';
//         Exchange_forCaption_Control1000000028Lbl : Label 'Exchange for';
//         No_Caption_Control1000000036Lbl : Label 'No.';
//         Drawn_Under_License_No_Caption_Control1000000039Lbl : Label 'Drawn Under License No.';
//         Issued_byCaption_Control1000000041Lbl : Label 'Issued by';
//         First_of_the_same_tenor_and_date_being_unpaid___Pay_to_the_OrderCaption_Control1000000048Lbl : Label '(First of the same tenor and date being unpaid ) Pay to the Order';
//         ofCaption_Control1000000049Lbl : Label 'of';
//         the_sum_ofCaption_Control1000000051Lbl : Label 'the sum of';
//         for_value_receive_againstCaption_Control1000000054Lbl : Label 'for value receive against';
//         ToCaption_Control1000000056Lbl : Label 'To';
//         AtCaption_Control1000000069Lbl : Label 'At';
//         sight_of_thisCaption_Control1000000071Lbl : Label 'sight of this';
//         SECONDCaption_Control1000000072Lbl : Label 'SECOND';
//         of_ExchangeCaption_Control1000000099Lbl : Label 'of Exchange';
//         DateCaptionLbl : Label 'Date';
//         DateCaption_Control1000000096Lbl : Label 'Date';
//         ForCaption_Control1000000136Lbl : Label 'For';
//         PartnerCaption_Control1000000138Lbl : Label 'Partner';
//         ForCaption_Control1000000139Lbl : Label 'For';
//         PartnerCaption_Control1000000141Lbl : Label 'Partner';

//     procedure fctPassSalesHeader(precSalesHeader : Record "36");
//     begin
//         recSalesHeader.COPY(precSalesHeader);
//     end;
// }

