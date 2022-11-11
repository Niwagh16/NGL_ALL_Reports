report 50041 "Purchase_Order - FA"
{
    // version RSPL/NGL/REPORT-1,KAR1.0

    // Report Name:Large Label-1
    // Company:Urdhwa
    // Date: 30-01-2013
    // Prepared By: Gunjan Mittal
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Purchase_Order - FA.rdl';


    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING("Document Type", "No.")
                                WHERE("Document Type" = FILTER(Order | "Blanket Order"));
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            //ReqFilterHeading = 'Purchase Order';
            column(QuotationNo; "Purchase Header"."Quote No.")
            {
            }
            column(AmendmentNo; "Purchase Header"."No. of Archived Versions")
            {
            }
            column(Contact; Contact)
            {
            }
            column(PhoneNo; PhoneNo)
            {
            }
            column(EMAIL; EMAIL)
            {
            }
            column(LOC; LOC)
            {
            }
            column(Purchase_Line_Frght; Frght)
            {
            }
            column(Purchase_Line_Packing_Forwarding; Packing)
            {
            }
            column(Purchase_Line_Billing_Address; LOC1)
            {
            }
            column(Purchase_Comments; Comments)
            {
            }
            column(CompanyLogo; CompanyInformation.Picture)
            {
            }
            column(Panno; CompInfo."P.A.N. No.")
            {
            }
            column(Address_CompanyInfo; CompanyInfo.Address + ' ' + CompanyInfo."Address 2")
            {
            }
            column(City_CompanyInfo; CompanyInfo.City + '-' + CompanyInfo."Post Code" + ' ' + ' Tel : ' + CompanyInfo."Phone No." + 'Email : ' + CompanyInfo."E-Mail" + '    URL:www.nglfinechem.com. CIN : ' + '')//CompanyInfo."Company Registration  No.")
            {
            }
            column(GstNo; CompInfo."GST Registration No.")
            {
            }
            column(IGSTper; FORMAT(IGSTper) + ' %')
            {
            }
            column(SGSTper; FORMAT(SGSTper) + ' %')
            {
            }
            column(CGSTper; FORMAT(CGSTper) + ' %')
            {
            }
            column(CGSTAmt; CGSTAMT)
            {
            }
            column(SGSTAmt; SGSTAMT)
            {
            }
            column(IGSTAmt; IGSTAMT)
            {
            }
            column(Pack_forward; "Purchase Header"."Rjected Remarks")
            {
            }
            column(GSTIN; Location11."GST Registration No.")
            {
            }
            dataitem(pageLoop; Integer)
            {
                DataItemTableView = SORTING(Number)
                                    WHERE(Number = CONST(1));
                column(Vendor_Name; recVen.Name)
                {
                }
                column(Ven_Add; recVen.Address + ',' + recVen."Address 2")
                {
                }
                column(Ven_city; recVen.City + ',' + recVen."Post Code" + ',' + recVen."Country/Region Code")
                {
                }
                column(Ven_GSTIN; recVen."GST Registration No.")
                {
                }
                column(Delivery_At; recLocation.Name)
                {
                }
                column(DeliverAdd; DeliverAt)
                {
                }
                column(pageLoop_logo; CompanyInfo.Picture)
                {
                }
                column(pageLoop_name; CompanyInfo.Name)
                {
                }
                column(pageLoop_address; CompanyInfo.Address + '  ' + CompanyInfo."Address 2" + ',' + CompanyInfo.City + '-' + CompanyInfo."Post Code" + ' ,Maharashtra,  ' + 'India.' + 'Tel No.022-26636450 &  Fax No. 022-26108030')
                {
                }
                column(Range; '')//CompanyInfo."C.E. Range") PCPL/NSW/MIG 05Aug22
                {
                }
                column(Commissionarate; '')//CompanyInfo."C.E. Commissionerate") PCPL/NSW/MIG 05Aug22
                {
                }
                column(Division; '')//CompanyInfo."C.E. Division") PCPL/NSW/MIG 05Aug22
                {
                }
                column(Comp_ECC; '')//CompanyInfo."E.C.C. No.") PCPL/NSW/MIG 05Aug22
                {
                }
                column(Company_Insurance_Policy_No; CompanyInfo."Insurance Policy No")
                {
                }
                column(PageReg_address; TextRegAddress)
                {
                }
                column(pageLoop_user_email; user."E-Mail")
                {
                }
                column(ShipToLocName; ShipToLocation.Name)
                {
                }
                column(ShipToLocAddress; ShipToLocation.Address)
                {
                }
                column(ShipToLocAddress2; ShipToLocation."Address 2")
                {
                }
                column(ShipToLocCity; ShipToLocation.City)
                {
                }
                column(ShipToLocPostCode; ShipToLocation."Post Code")
                {
                }
                column(ShipToLocStateCode; StateShipTo.Description)
                {
                }
                column(ShipToLocCountry; ShipToLocation.County)
                {
                }
                column(ShipToLoGSTIN; ShipToLocation."GST Registration No.")
                {
                }
                column(ShipToLocPAN; ShipToLocation."PAN No.")
                {
                }
                column(Location_Address; Location.Address)
                {
                }
                column(Location_Address2; Location."Address 2")
                {
                }
                column(Location_City; Location.City)
                {
                }
                column(Location_PostCode; Location."Post Code")
                {
                }
                column(pageLoop_user_works; Location.Name + '  ' + Location.Address + '  ' + Location."Address 2" + ',' + Location.City + '-' + Location."Post Code" + ' ,Maharashtra,  ' + 'India')
                {
                }
                column(pageLoop_user_TIN_No; '')//Location."T.I.N. No.") PCPL/NSW/MIG 05Aug22
                {
                }
                column(pageLoop_user_CST_No; '')//Location."C.S.T No.") //PCPL/NSW/MIG 05Aug22
                {
                }
                column(pageLoop_user_ECC_No; '')//Location."E.C.C. No.") //PCPL/NSW/MIG 05Aug22
                {
                }
                column(pageLoop_user_Range; '')//Location."C.E. Range") //PCPL/NSW/MIG 05Aug22
                {
                }
                column(pageLoop_user_Division; '')//Location."C.E. Division") //PCPL/NSW/MIG 05Aug22
                {
                }
                column(pageLoop_commissionerate; '')//Location."C.E. Commissionerate") //PCPL/NSW/MIG 05Aug22
                {
                }
                column(Location_PAN_No; CompanyInfo."P.A.N. No.")
                {
                }
                column(pageLoop_Address_of_suppliers; VenN + VenN1)
                {
                }
                column(pageLoop_Address_of_suppliers2; VenAdd + ' ' + VenAdd2)
                {
                }
                column(pageLoop_Address_of_suppliers3; VenCity + ',' + VenPC + ',' + VenCountry)
                {
                }
                column(pageLoop_Tel_no; VenTel)
                {
                }
                column(pageLoop_Fax_no; Vendor_FaxNo)
                {
                }
                column(pageLoop_Email; Vendor_Email)
                {
                }
                column(pageLoop_contact; VenCon)
                {
                }
                column(varshecess; varshecess)
                {
                }
                column(pageLoop_Purchase_Header_No; "Purchase Header"."No.")
                {
                }
                column(pageloop_Header_Order_Date; "Purchase Header"."Order Date")
                {
                }
                column(AmendementDate; "Purchase Header"."Document Date")
                {
                }
                column(PurchaseHeader_Requisition_No; "Purchase Header"."Delivery Schedule")
                {
                }
                column(pageLoop_Purchase_Requisition_no_date; FORMAT("Purchase Header"."Delivery Schedule"))
                {
                }
                column(pageLoop_PaymentTerms_Description; PaymentTerms.Description)
                {
                }
                column(PurchaseLine_VAT; "Purchase Line"."VAT %")
                {
                }
                column(PL_TaxAmount; 0)//"Purchase Line"."Tax Amount") PCPL/NSW/MIG 05Aug22
                {
                }
                column(PurchaseHeader_ShiptoAddress; "Purchase Header"."Ship-to Address" + ' ' + "Purchase Header"."Ship-to Address 2")
                {
                }
                column(PurchaseHeader_PaymentTermsCode; "Purchase Header"."Payment Terms Code")
                {
                }
                column(PurchaseHeader_PaymentTerms; "Purchase Header"."Payment terms")
                {
                }
                column(Line_date; Line_date)
                {
                }
                column(PurchaseHeader_ShipCity; "Purchase Header"."Ship-to City")
                {
                }
                column(Purchase_Freight; "Purchase Header".Freight)
                {
                }
                column(Purchase_Quoation_Date; "Purchase Header"."Quoation Date")
                {
                }
                column(Purchase_Quotation_No; "Purchase Header"."Quotation No" + '/' + FORMAT("Purchase Header"."Quoation Date"))
                {
                }
                column(indentno; indentno)
                {
                }
                dataitem("Purchase Line"; "Purchase Line")
                {
                    DataItemLink = "Document Type" = FIELD("Document Type"),
                                   "Document No." = FIELD("No.");
                    DataItemLinkReference = "Purchase Header";
                    DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                    column(serial; Serial)
                    {
                    }
                    column(vartaxgroup; ROUND(vartaxgroup1, 1))
                    {
                    }
                    column(varshecess1; varshecess1)
                    {
                    }
                    column(EXL_text; EXL.Text)
                    {
                    }
                    column(ET; ET[1])
                    {
                    }
                    column(ET2; ET[2])
                    {
                    }
                    column(ET3; ET[3])
                    {
                    }
                    column(ET4; ET[4])
                    {
                    }
                    column(ET5; ET[5])
                    {
                    }
                    column(ET6; ET[6])
                    {
                    }
                    column(bedPercentage1; bedPercentage1)
                    {
                    }
                    column(BEDPERCN; BEDPERCN)
                    {
                    }
                    column(ECESSPERCN; ECESSPERCN)
                    {
                    }
                    column(SHESSPERCN; SHESSPERCN)
                    {
                    }
                    column(txt9; txt9)
                    {
                    }
                    column(txt2; txt2)
                    {
                    }
                    column(txt3; txt3)
                    {
                    }
                    column(txt4; txt4)
                    {
                    }
                    column(InvDiscountAmount_PurchaseLine; InvDisc)
                    {
                    }
                    column(txt5; txt5)
                    {
                    }
                    column(txt6; txt6)
                    {
                    }
                    column(txt7; txt7)
                    {
                    }
                    column(txt8; txt8)
                    {
                    }
                    column(LnNo; "Purchase Line"."Line No.")
                    {
                    }
                    column(Purchase_Line_Sr_no; varSerNo)
                    {
                    }
                    column(Purchase_Line_Specification_Description; "Purchase Line".Description + ' ' + "Purchase Line"."Description 2")
                    {
                    }
                    column(Purchase_Line_Qty; "Purchase Line".Quantity)
                    {
                    }
                    column(Purchase_Line_UOM; "Purchase Line"."Unit of Measure Code")
                    {
                    }
                    column(Purchase_Line_currency_code_heading; 'Rate(' + currencycode + ' )')
                    {
                    }
                    column(Purchase_Line_Discount; LineDisc)
                    {
                    }
                    column(Purchase_Line_Amount_heading; 'Amount(' + currencycode + ' )')
                    {
                    }
                    column(Purchase_Line_Amount; LineAmt)
                    {
                    }
                    column(PurchaseLine_DirectUnitCost; "Purchase Line"."Direct Unit Cost")
                    {
                    }
                    column(Purchase_Line_Transport_Name; transportmethod.Description)
                    {
                    }
                    column(PH_Payementtermscode; "Purchase Header"."Payment Terms Code")
                    {
                    }
                    column(varbed; varbed1)
                    {
                    }
                    column(Varnetdis; Varnetdis)
                    {
                    }
                    column(Purchase_Line_Net_off_discount; netdis1)
                    {
                    }
                    column(varcentralexcise; varcentralexcise)
                    {
                    }
                    column(varvat; varvat)
                    {
                    }
                    column(Purchase_Line_Centera_Excise_Duty; FORMAT('Central Excise Duty') + ' ' + FORMAT(BED) + FORMAT('%'))
                    {
                    }
                    column(PurchaseLine_ExciseAmount; 0)// "Purchase Line"."Excise Amount") PCPL/NSW/MIG 05Aug22
                    {
                    }
                    column(Purchase_Line_Centera_Excise_Duty2; 0)//"Purchase Line"."BED Amount") PCPL/NSW/MIG 05Aug22
                    {
                    }
                    column(Purchase_Line_Ed_Cess_BED; FORMAT('Ed.Cess of B.E.D') + ' ' + FORMAT(ECESS) + ('%'))
                    {
                    }
                    column(varcess; varcess1)
                    {
                    }
                    column(Purchase_Line_eCess_Amount; 0)//"Purchase Line"."eCess Amount") PCPL/NSW/MIG 05Aug22
                    {
                    }
                    column(Purchase_Line_SHEd_Cess_of_BED; FORMAT('S & H Ed.Cess of B.E.D.') + ' ' + FORMAT(SHECESS) + ('%'))
                    {
                    }
                    column(Purchase_Line_SHE_Cess_Amount; 0)//"Purchase Line"."SHE Cess Amount") PCPL/NSW/MIG 05Aug22
                    {
                    }
                    column(Purchase_Line_TaxGrpDesc; TaxGrpDesc)
                    {
                    }
                    column(Purchase_Line_Txt; Txt)
                    {
                    }
                    column(Purchase_Line_Tax_Amount; 0)//"Purchase Line"."Tax Amount") PCPL/NSW/MIG 05Aug22
                    {
                    }
                    column(vartotalprice; vartotalprice)
                    {
                    }
                    column(Purchase_Line_Total_price; 'Total Price  (' + currencycode + ' )')
                    {
                    }
                    column(Purchase_Line_Amount_To_Vendor; 0)// "Purchase Line"."Amount To Vendor") PCPL/NSW/MIG 05Aug22
                    {
                    }
                    column(vardiscount; vardiscount)
                    {
                    }
                    column(PurchaseLineLine_DiscountAmount; "Purchase Line"."Line Discount Amount")
                    {
                    }
                    column(PurchaseLine_InsuranceNo; "Purchase Line"."Insurance No.")
                    {
                    }
                    column(Insurance_No; Insurance."No.")
                    {
                    }
                    column(Transport_Description; Transport.Description)
                    {
                    }
                    column(UMC; UMC)
                    {
                    }
                    column(MINV; MINV)
                    {
                    }
                    column(MAXV; MAXV)
                    {
                    }
                    column(BED_Amount; 0)//"Purchase Line"."BED Amount") PCPL/NSW/MIG 05Aug22
                    {
                    }
                    column(Packing; "Purchase Line"."Description 2")
                    {
                    }
                    column(PaymentDes; PaymentDes)
                    {
                    }
                    column(Paymentmethodcode; Paymethod.Description)
                    {
                    }
                    column(PH_Insurance; "Purchase Header".Insurance)
                    {
                    }
                    column(PolicyNo; '')
                    {
                    }
                    column(TRANSPORTER; TRANSPORTER)
                    {
                    }
                    column(Pack; PACK1)
                    {
                    }
                    column(Frght; Frght1)
                    {
                    }
                    column(NODES; "Purchase Line"."Description 2")
                    {
                    }
                    column(excise; excise)
                    {
                    }
                    column(eces; eces)
                    {
                    }
                    column(she; she)
                    {
                    }
                    column(bd; bd)
                    {
                    }
                    column(delivery_date; "Purchase Line"."Expected Receipt Date")
                    {
                    }
                    column(AmounttoVendor_PurchaseHeader; ROUND(AmtToVend, 1))
                    {
                    }
                    column(Packing_Size; "Purchase Line"."Packing Size")
                    {
                    }
                    dataitem("Item Quality Measure"; "Item Quality Measure")
                    {
                        DataItemLink = "Item No." = FIELD("No.");
                        column(QMC; "Qlty Measure Code")
                        {
                        }
                        column(MinVal; "Min. Value")
                        {
                        }
                        column(Desc; Description)
                        {
                        }
                        column(MaxVal; "Max. Value")
                        {
                        }
                        column(TextVal; "Text Value")
                        {
                        }
                    }

                    trigger OnAfterGetRecord();
                    begin
                        //MS
                        CLEAR(LineAmt);
                        CLEAR(LineDisc);
                        CLEAR(InvDisc);
                        p := 1;
                        EXL.RESET;
                        EXL.SETRANGE(EXL."No.", "Purchase Line"."No.");
                        IF EXL.FINDFIRST THEN
                            REPEAT
                                ET[p] := EXL.Text;
                                p := p + 1;
                            UNTIL EXL.NEXT = 0;

                        IF Type = Type::"Fixed Asset" THEN BEGIN
                            IF fixedassets.GET("Purchase Line"."No.") THEN
                                Serial := fixedassets."Serial No.";
                        END;
                        /*
                        //Gunjan-Start
                        IF "Purchase Line"."BED Amount" <> 0 THEN BEGIN
                            IF "Purchase Line".Amount <> 0 THEN
                                //IF "Purchase Line".FINDFIRST THEN BEGIN
                                BEDPERCN := ("Purchase Line"."BED Amount" / "Purchase Line"."Line Amount") * 100;
                            //MESSAGE('%1',"Purchase Line".Amount);
                            ECESSPERCN := "Purchase Line"."eCess Amount" / "Purchase Line"."BED Amount" * 100;
                            SHESSPERCN := "Purchase Line"."SHE Cess Amount" / "Purchase Line"."BED Amount" * 100;
                            //EXPER := SalesLine."Excise Amount"/ "Sales Line".Amount*100;
                            //Gunjan-End
                        END;
                        //END;
                    
                        eces := 'Ed. Cess of B.E.D' + ' ' + FORMAT(ECESSPERCN) + ' ' + '%';
                        she := ' S & H Ed. Cess of B.E.D' + ' ' + FORMAT(SHESSPERCN) + ' ' + '%';


                        //bedPercentage1 := 0;
                        //eCessPercentage := 0;
                        //ShecessPercentage := 0;
                        IF "Purchase Line"."Excise Amount" <> 0 THEN BEGIN
                            excisepost1.RESET;
                            excisepost1.SETRANGE(excisepost1."Excise Bus. Posting Group", "Excise Bus. Posting Group");
                            excisepost1.SETRANGE(excisepost1."Excise Prod. Posting Group", "Excise Prod. Posting Group");
                            IF excisepost1.FINDFIRST THEN BEGIN
                                bedPercentage1 := excisepost1."BED %";
                                //eCessPercentage   :=  excisepost."eCess %";
                                //ShecessPercentage :=  excisepost."SHE Cess %";
                            END;
                        END;
                        bd := 'Central Excise Duty' + ' ' + FORMAT(bedPercentage1) + ' ' + '%';
                            
                        //VK
                        StrOrdDet1.RESET;
                        StrOrdDet1.SETRANGE(StrOrdDet1.Type, StrOrdDet1.Type::Purchase);
                        StrOrdDet1.SETRANGE(StrOrdDet1."Document Type", StrOrdDet1."Document Type"::Order);
                        StrOrdDet1.SETRANGE(StrOrdDet1."Document No.", "Purchase Header"."No.");
                        StrOrdDet1.SETRANGE("Tax/Charge Type", StrOrdDet1."Tax/Charge Type"::Charges);
                        IF StrOrdDet1.FINDSET THEN
                            REPEAT
                                // IF StrOrdDet1."Tax/Charge Group" = 'FREIGHT' THEN BEGIN
                                IF StrOrdDet1."Tax/Charge Code" = 'FREIGHT' THEN BEGIN      //as per requirement
                                    Frght += StrOrdDet1.Amount;
                                    Frght1 += StrOrdDet1.Amount;

                                END;

                                IF StrOrdDet1."Tax/Charge Group" = 'PACKING' THEN BEGIN
                                    Packing += StrOrdDet1.Amount;
                                END;
                            UNTIL StrOrdDet1.NEXT = 0;

                            */ //PCPL/NSW/MIG 05Aug22




                        IF Paymethod.GET("Purchase Header"."Payment Method Code") THEN;
                        //excise:=("Purchase Line"."Excise Amount"/"Purchase Line"."Line Amount")*100;


                        ACommentsLine.RESET;
                        ACommentsLine.SETRANGE(ACommentsLine."No.", "Purchase Line"."Document No.");
                        ACommentsLine.SETRANGE(ACommentsLine."Document Type", "Purchase Line"."Document Type");
                        ACommentsLine.SETFILTER(ACommentsLine."Document Line No.", '%1', 0);
                        IF ACommentsLine.FIND('-') THEN BEGIN
                            cnt := 1;
                            REPEAT
                                IF cnt = 1 THEN BEGIN
                                    txt9 := ACommentsLine.Comment;
                                    cnt += 1;
                                END
                                ELSE
                                    IF cnt = 2 THEN BEGIN
                                        txt2 := ACommentsLine.Comment;
                                        cnt += 1;
                                    END ELSE
                                        IF cnt = 3 THEN BEGIN
                                            txt3 := ACommentsLine.Comment;
                                            cnt += 1;
                                        END ELSE
                                            IF cnt = 4 THEN BEGIN
                                                txt4 := ACommentsLine.Comment;
                                                cnt += 1;
                                            END ELSE
                                                IF cnt = 5 THEN BEGIN
                                                    txt5 := ACommentsLine.Comment;
                                                    cnt += 1;
                                                END ELSE
                                                    IF cnt = 6 THEN BEGIN
                                                        txt6 := ACommentsLine.Comment;
                                                        cnt += 1;
                                                    END ELSE
                                                        IF cnt = 7 THEN BEGIN
                                                            txt7 := ACommentsLine.Comment;
                                                            cnt += 1;
                                                        END ELSE
                                                            IF cnt = 8 THEN BEGIN
                                                                txt8 := ACommentsLine.Comment;
                                                                cnt += 1;
                                                            END
                            //END;
                            UNTIL ACommentsLine.NEXT = 0
                        END;


                        /*
                           BED := 0;
                           ECESS :=0;
                           SHECESS :=0;
                           */
                        /* PCPL/NSW/MIG 05Aug22
                        ExcisePosSetup.RESET;
                        ExcisePosSetup.SETRANGE(ExcisePosSetup."Excise Bus. Posting Group", "Excise Bus. Posting Group");
                        ExcisePosSetup.SETRANGE(ExcisePosSetup."Excise Prod. Posting Group", "Excise Prod. Posting Group");
                        IF ExcisePosSetup.FINDFIRST THEN
                            //REPEAT
                              BED := ExcisePosSetup."BED %";
                        ECESS := ExcisePosSetup."eCess %";
                        SHECESS := ExcisePosSetup."SHE Cess %";
                        // UNTIL ExcisePosSetup.NEXT =0;
                        */ //PCPL/NSW/MIG 05Aug22


                        IF "Purchase Line"."No." <> '' THEN
                            srno := srno + 1;

                        IF "Purchase Line"."No." <> '' THEN
                            varSerNo := srno
                        ELSE
                            varSerNo := 0;

                        IF TaxGroup.GET("Purchase Line"."Tax Group Code") THEN;


                        //MESSAGE('%1',Packing);

                        IF ("Purchase Line".Quantity <> 0) AND ("Purchase Line"."Units per Parcel" <> 0) THEN
                            UnitPerQty := "Purchase Line".Quantity / "Purchase Line"."Units per Parcel";

                        //-------Footer section


                        //IF shipcode.GET("Purchase Header"."Shiping Agent Code") THEN BEGIN
                        transname := shipcode.Name;
                        //transadd := shipcode."Address 1"+' '+shipcode."Address 2";
                        //END;

                        repcheck.InitTextVariable;
                        //repcheck.FormatNoText(NoText,"Purchase Line"."Amount To Vendor","Purchase Header"."Currency Code");

                        IF "Purchase Header"."Transport Method" <> '' THEN
                            IF transportmethod.GET("Purchase Header"."Transport Method") THEN;

                        strTaxgroup := '';
                        recpurchline.RESET;
                        recpurchline.SETCURRENTKEY("Tax Group Code");
                        recpurchline.SETRANGE(recpurchline."Document No.", "Purchase Header"."No.");
                        IF recpurchline.FINDSET THEN
                            REPEAT
                                IF recpurchline."Tax Group Code" <> strTaxgroup THEN BEGIN
                                    IF rectaxgroup.GET(recpurchline."Tax Group Code") THEN;
                                    TaxGrpDesc := rectaxgroup.Description;
                                    strTaxgroup := recpurchline."Tax Group Code";
                                END;
                            UNTIL recpurchline.NEXT = 0;


                        // IF "Purchase Header"."C Form" = TRUE THEN
                        //   Txt := 'With' + ' ' + "Purchase Header"."Form Code"
                        //ELSE //PCPL/NSW/MIG 05Aug22
                        Txt := '';
                        /* //PCPL/NSW/MIG 05Aug22
                        ExcisePosSetup.RESET;
                        ExcisePosSetup.SETRANGE(ExcisePosSetup."Excise Bus. Posting Group", "Purchase Line"."Excise Bus. Posting Group");
                        ExcisePosSetup.SETRANGE(ExcisePosSetup."Excise Prod. Posting Group", "Purchase Line"."Excise Prod. Posting Group");
                        IF ExcisePosSetup.FINDSET THEN
                            REPEAT
                                BED := ExcisePosSetup."BED %";
                                ECESS := ExcisePosSetup."eCess %";
                                SHECESS := ExcisePosSetup."SHE Cess %";
                            UNTIL ExcisePosSetup.NEXT = 0;
                        */ //PCPL/NSW/MIG 05Aug22

                        /* //PCPL/NSW/MIG 05Aug22
                        IF "Purchase Line"."Excise Amount" = 0 THEN BEGIN
                            BED := 0;
                            ECESS := 0;
                            SHECESS := 0;
                        END;
                        */ //PCPL/NSW/MIG 05Aug22

                        /*
                        vartotalprice := "Purchase Line"."Line Amount"-"Purchase Line"."Inv. Discount Amount"+"Purchase Line"."BED Amount"+"Purchase Line"."eCess Amount"+
                        "Purchase Line"."SHE Cess Amount" +"Purchase Line"."Tax Amount"+ Frght+Packing;
                        */

                        //Gunjan--28.2.13--Start
                        IF IQM.GET("Purchase Line"."Unit of Measure Code") THEN BEGIN
                            UMC := IQM."Qlty Measure Code";
                            MINV := IQM."Min. Value";
                            MAXV := IQM."Max. Value";
                        END;
                        //Gunjan-End


                        //Gunjan--Start
                        IF Payment.GET("Purchase Header"."Payment Terms Code") THEN
                            PaymentDes := Payment.Description;
                        //Gunjan-End

                        //Gunjan--Start

                        IF ITM.GET("Purchase Line"."No.") THEN
                            NODES := ITM."Description 2";
                        //Gunjan-End



                        //Gunjan
                        IF ShipAgent.GET("Purchase Header"."Shiping Agent Code") THEN
                            TRANSPORTER := ShipAgent.Name;
                        //Gunjan


                        /*
                        "Purchase Line".SETRANGE("Purchase Line"."No." ,SOLD."Item No.") ;
                        
                           IF SOLD."Tax/Charge Group" =FREIGHT THEN BEGIN
                              Pack := SOLD."Calculation Value";
                        
                            END;
                        */
                        //Pack:=0;


                        //gunjan --Start
                        /* //PCPL/NSW/MIG 05Aug22
                        StrOrdDet.RESET;
                        StrOrdDet.SETRANGE(StrOrdDet.Type, StrOrdDet.Type::Purchase);
                        StrOrdDet.SETRANGE(StrOrdDet."Document Type", StrOrdDet."Document Type"::Order);
                        StrOrdDet.SETRANGE(StrOrdDet."Document No.", "Purchase Header"."No.");
                        StrOrdDet.SETRANGE(StrOrdDet."Item No.", "Purchase Line"."No.");

                        IF StrOrdDet.FIND('-') THEN
                            REPEAT
                                IF StrOrdDet."Tax/Charge Type" = StrOrdDet."Tax/Charge Type"::Charges THEN BEGIN
                                    IF (StrOrdDet."Tax/Charge Group" = 'PACK_FOR') AND (StrOrdDet."Calculation Type" = StrOrdDet."Calculation Type"::"Fixed Value") THEN BEGIN
                                        // IF StrOrdDet."Tax/Charge Code" = 'F1' THEN
                                        Pack += StrOrdDet."Calculation Value";

                                        PACK1 += StrOrdDet."Calculation Value";  //MS




                                        // Frght += StrOrdDet."Calculation Value";

                                    END;
                                END;
                            UNTIL StrOrdDet.NEXT = 0;
                            */ //PCPL/NSW/MIG 05Aug22
                        //ESSAGE('%1',Pack);

                        //Gunjan-End
                        /*
                        PL.RESET;
                        PL.SETRANGE(PL."Document No.", "Purchase Line"."No.");
                        IF PL.FINDFIRST THEN BEGIN
                            REPEAT
                                varbed += PL."BED Amount";
                                varcess += PL."eCess Amount";
                                varshecess += PL."SHE Cess Amount";
                                vartaxgroup += PL."Tax Amount";
                                netdis += PL."Line Amount" - PL."Inv. Discount Amount";
                            UNTIL PL.NEXT = 0;
                        END;

                        //MS
                        CLEAR(vartaxgroup1);
                        CLEAR(varbed1);
                        CLEAR(varcess1);
                        CLEAR(varshecess1);
                        CLEAR(netdis1);
                        PL.RESET;
                        PL.SETRANGE(PL."Document No.", "Purchase Line"."Document No.");
                        IF PL.FINDFIRST THEN BEGIN
                            REPEAT
                                IF PL.Quantity <> 0 THEN BEGIN
                                    varbed1 += (PL."BED Amount" / PL.Quantity) * PL.Quantity;
                                    varcess1 += (PL."eCess Amount" / PL.Quantity) * PL.Quantity;
                                    varshecess1 += (PL."SHE Cess Amount" / PL.Quantity) * PL.Quantity;
                                    vartaxgroup1 += (PL."Tax Amount" / PL.Quantity) * PL.Quantity;
                                    netdis1 += (((PL."Line Amount" / PL.Quantity) * PL.Quantity) - ((PL."Inv. Discount Amount" / PL.Quantity) * PL.Quantity));
                                END;
                            UNTIL PL.NEXT = 0;
                        END;


                        */ //PCPL/NSW/MIG 05Aug22
                        //      MS





                        /*
                        vartotalprice +="Purchase Line"."Line Amount"-"Purchase Line"."Inv. Discount Amount"+
                        "Purchase Line"."BED Amount"+"Purchase Line"."eCess Amount"+
                        "Purchase Line"."SHE Cess Amount" +"Purchase Line"."Tax Amount"+ Pack ;
                         */

                        //MESSAGE('%1',vartotalprice);



                        //ACCORDING TO NEW PO QUANTITY FIELD
                        //MS


                        /*
                        LineAmt := ("Purchase Line"."Line Amount"/"Purchase Line".Quantity)*"Purchase Line"."PO Quantity";
                        LineDisc:=("Purchase Line"."Line Discount Amount"/"Purchase Line".Quantity)*"Purchase Line"."PO Quantity";
                        BedAmt:=("Purchase Line"."BED Amount"/"Purchase Line".Quantity)*"Purchase Line"."PO Quantity";
                        EcessAmt:=("Purchase Line"."eCess Amount"/"Purchase Line".Quantity)*"Purchase Line"."PO Quantity";
                        ShecessAmt:=("Purchase Line"."SHE Cess Amount"/"Purchase Line".Quantity)*"Purchase Line"."PO Quantity";
                        ExciseAmt:=("Purchase Line"."Excise Amount"/"Purchase Line".Quantity)*"Purchase Line"."PO Quantity";
                        AmtToVend:=("Purchase Header"."Amount to Vendor"/"Purchase Line".Quantity)*"Purchase Line"."PO Quantity";
                        InvDisc:=  ("Purchase Line"."Inv. Discount Amount"/"Purchase Line".Quantity)*"Purchase Line"."PO Quantity";
                        TaxAmt:=("Purchase Line"."Tax Amount"/"Purchase Line".Quantity)*"Purchase Line"."PO Quantity";
                        
                        TotalPrice:=LineAmt-InvDisc+BedAmt+EcessAmt+ShecessAmt+TaxAmt+Frght;
                        */

                        //MS
                        IF "Purchase Line".Quantity <> 0 THEN BEGIN
                            LineDisc := ("Purchase Line"."Line Discount Amount" / "Purchase Line".Quantity) * "Purchase Line".Quantity;
                            LineAmt := ("Purchase Line"."Line Amount" / "Purchase Line".Quantity) * "Purchase Line".Quantity + LineDisc;
                            InvDisc := ("Purchase Line"."Inv. Discount Amount" / "Purchase Line".Quantity) * "Purchase Line".Quantity;
                        END;
                        //sanjay
                        pl2.RESET;
                        pl2.SETRANGE(pl2."Document No.", "Purchase Header"."No.");
                        IF pl2.FINDFIRST THEN
                            indentno := pl2."Indent No.";

                        //sanjay

                    end;

                    trigger OnPreDataItem();
                    begin
                        bedPercentage1 := 0;
                        Serial := '';
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    /*
                    IF recLocation.GET("Purchase Header"."Delivery At") THEN;
                    Location.RESET;
                    Location.SETRANGE(Location.Code,"Purchase Header"."Delivery At");
                    IF Location.FINDFIRST THEN
                      DeliverAt:=Location.Address+' '+Location."Address 2"+' '+Location.City+' '+Location."Post Code";
                    */
                    //------section
                    Location.RESET;
                    Location.SETRANGE(Location.Code, "Purchase Header"."Location Code");
                    IF Location.FINDFIRST THEN BEGIN
                        locname := Location.Name;
                        locadd := Location.Address;
                        locadd1 := Location."Address 2";
                        locadd2 := Location.City;
                        locadd3 := Location."Post Code";
                        loctel := Location."Phone No.";
                        locfax := Location."E-Mail";
                        loctin := '';// Location."T.I.N. No."; //PCPL/NSW/MIG 05Aug22
                        loccst := '';//-Location."C.S.T No."; //PCPL/NSW/MIG 05Aug22
                        locecc := '';//Location."E.C.C. No."; //PCPL/NSW/MIG 05Aug22
                        locser := '';//Location."Service Tax Registration No."; //PCPL/NSW/MIG 05Aug22
                        locrang := '';//Location."C.E. Range"; 
                        locdivision := '';//Location."C.E. Division";  //PCPL/NSW/MIG 05Aug22
                        loccom := '';// Location."C.E. Commissionerate"; PCPL/NSW/MIG 05Aug22
                        LocCon := Location.Contact;
                        LocMob := Location."Phone No. 2";
                        LocMail := Location."Fax No.";

                        IF ven.GET("Purchase Header"."Buy-from Vendor No.") THEN
                            ven.SETRANGE(ven."No.", "Purchase Header"."Buy-from Vendor No.");
                        IF ven.FINDFIRST THEN BEGIN
                            VTIN := '';//ven."T.I.N. No."; PCPL/NSW/MIG 05Aug22
                            VCST := '';//ven."C.S.T. No."; PCPL/NSW/MIG 05Aug22
                            VECC := '';//ven."E.C.C. No."; PCPL/NSW/MIG 05Aug22
                            VPAN := ven."P.A.N. No.";
                            VRANGE := '';//ven.Range;PCPL/NSW/MIG 05Aug22
                            VDIV := '';//ven.Collectorate; //PCPL/NSW/MIG 05Aug22
                            VCOMM := ven."Commissioner's Permission No.";
                            VenCon := ven.Contact;
                            VenTel := ven."Phone No.";
                            VenMob := '';
                            VenFax := ven."Fax No.";
                            VenMail := ven."E-Mail";
                        END;
                        CompanyInfo.GET;
                        CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
                    END;

                    Rec_Vendor1.RESET;
                    Rec_Vendor1.SETRANGE(Rec_Vendor1."No.", "Purchase Header"."Pay-to Vendor No.");
                    IF Rec_Vendor1.FINDFIRST THEN BEGIN
                        VenN := ven.Name;
                        VenN1 := ven."Name 2";
                        VenAdd := ven.Address;
                        VenAdd2 := ven."Address 2";
                        VenCity := ven.City;
                        VenPC := ven."Post Code";
                        VenCountry := ven."Country/Region Code";
                    END;

                    Agent.RESET;
                    Agent.SETRANGE(Agent.Code, "Purchase Header"."Purchaser Code");
                    IF Agent.FINDFIRST THEN BEGIN
                        agentn := Agent.Name;
                        commrate := Agent."Commission %";
                    END;
                    CR.RESET;
                    CR.SETRANGE(CR.Code, ven."Country/Region Code");
                    ven.SETRANGE(ven."Country/Region Code", "Purchase Header"."Buy-from Vendor No.");
                    IF CR.FINDFIRST THEN BEGIN
                        Country := CR.Name;
                    END;

                    IF user.GET("Purchase Header"."Assigned User ID") THEN;

                end;

                trigger OnPreDataItem();
                begin
                    IF recVen.GET("Purchase Header"."Buy-from Vendor No.") THEN;
                end;
            }

            trigger OnAfterGetRecord();
            var
                TmpVendor: Record 23;
            begin
                //P.Saravanan, Karya, 02/07/20134, ++
                IF CompanyInfo.GET THEN;
                TmpVendor.RESET;
                TmpVendor.SETRANGE(TmpVendor."No.", "Purchase Header"."Buy-from Vendor No.");
                IF TmpVendor.FINDSET THEN BEGIN
                    Vendor_FaxNo := TmpVendor."Fax No.";
                    Vendor_Email := TmpVendor."E-Mail";
                END;
                //P.Saravanan, Karya, 02/07/2014, --
                PL.RESET;
                PL.SETRANGE("Document No.", "No.");
                IF PL.FINDSET THEN
                    REPEAT
                        qty += PL.Quantity;
                    //poqty+=PL."PO Quantity";
                    UNTIL PL.NEXT = 0;
                //"Purchase Header".CALCFIELDS("Amount to Vendor");
                AmtToVend := 0;// ("Purchase Header"."Amount to Vendor"); //PCPL/NSW/MIG 05Aug22
                CLEAR(Frght);
                CLEAR(Frght1);
                //"Purchase Header".CALCFIELDS("Amount to Vendor"); //PCPL/NSW/MIG 05Aug22
                //varbed:=0;
                vardiscount := 0;
                Varnetdis := 0;
                //varcess := 0;
                varcentralexcise := 0;
                //vartaxgroup := 0;
                varshecess := 0;
                varvat := 0;
                vartotalprice := 0;
                //------section
                //MESSAGE('%1',"Purchase Header"."Location Code");
                Location.RESET;
                Location.SETRANGE(Location.Code, "Purchase Header"."Location Code");
                IF Location.FINDFIRST THEN BEGIN
                    locname := Location.Name;
                    //MESSAGE('%1',locname);
                    locadd := Location.Address;
                    locadd1 := Location."Address 2";
                    locadd2 := Location.City;
                    locadd3 := Location."Post Code";
                    loctel := Location."Phone No.";
                    locfax := Location."E-Mail";
                    loctin := '';//Location."T.I.N. No."; //PCPL/NSW/MIG 05Aug22
                    loccst := '';//Location."C.S.T No."; //PCPL/NSW/MIG 05Aug22
                    locecc := '';//Location."E.C.C. No."; //PCPL/NSW/MIG 05Aug22
                    locser := '';//Location."Service Tax Registration No."; //PCPL/NSW/MIG 05Aug22
                    locrang := '';//Location."C.E. Range"; //PCPL/NSW/MIG 05Aug22
                    locdivision := '';//Location."C.E. Division"; //PCPL/NSW/MIG 05Aug22
                    loccom := '';//Location."C.E. Commissionerate"; //PCPL/NSW/MIG 05Aug22
                    LocCon := Location.Contact;
                    LocMob := Location."Phone No. 2";
                    LocMail := Location."Fax No.";

                    IF ven.GET("Purchase Header"."Buy-from Vendor No.") THEN
                        ven.SETRANGE(ven."No.", "Purchase Header"."Buy-from Vendor No.");
                    IF ven.FINDFIRST THEN BEGIN
                        VTIN := '';//ven."T.I.N. No."; //PCPL/NSW/MIG 05Aug22
                        VCST := '';//ven."C.S.T. No."; //PCPL/NSW/MIG 05Aug22
                        VECC := '';//ven."E.C.C. No."; //PCPL/NSW/MIG 05Aug22
                        VPAN := ven."P.A.N. No.";
                        VRANGE := '';// ven.Range; //PCPL/NSW/MIG 05Aug22
                        VDIV := '';//ven.Collectorate; //PCPL/NSW/MIG 05Aug22
                        VCOMM := ven."Commissioner's Permission No.";
                        VenCon := ven.Contact;
                        VenTel := ven."Phone No.";
                        VenMob := '';
                        VenFax := ven."Fax No.";
                        VenMail := ven."E-Mail";
                    END;
                    CompanyInfo.GET;
                    CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
                END;

                Agent.RESET;
                Agent.SETRANGE(Agent.Code, "Purchase Header"."Purchaser Code");
                IF Agent.FINDFIRST THEN BEGIN
                    agentn := Agent.Name;
                    commrate := Agent."Commission %";
                END;
                CR.RESET;
                CR.SETRANGE(CR.Code, ven."Country/Region Code");
                ven.SETRANGE(ven."Country/Region Code", "Purchase Header"."Buy-from Vendor No.");
                IF CR.FINDFIRST THEN BEGIN
                    Country := CR.Name;
                END;

                IF ShipToLocation.GET("Purchase Header"."Location Code") THEN;
                IF StateShipTo.GET(ShipToLocation."State Code") THEN;

                IF user.GET("Purchase Header"."Assigned User ID") THEN
                    //CurrReport.LANGUAGE := 1;//Language.GetLanguageID("Language Code");
                CompanyInfo.GET;

                /*IF "Purchase Header"."Shortcut Dimension 1 Code"='' THEN
                  ERROR('Please select Unit code');
                 */
                IF "Purchase Header"."Currency Code" = '' THEN
                    currencycode := 'Rs.'
                ELSE
                    currencycode := "Purchase Header"."Currency Code";
                IF RespCenter.GET("Responsibility Center") THEN BEGIN
                    FormatAddr.RespCenter(CompanyAddr, RespCenter);
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                END ELSE
                    FormatAddr.Company(CompanyAddr, CompanyInfo);
                /*
                    DocDim1.SETRANGE("Table ID",DATABASE::"Purchase Header");
                    DocDim1.SETRANGE("Document Type","Purchase Header"."Document Type");
                    DocDim1.SETRANGE("Document No.","Purchase Header"."No.");
                
                //Agent Dimension
                
                DocDim.SETRANGE("Table ID",DATABASE::"Purchase Header");
                DocDim.SETRANGE("Document Type","Purchase Header"."Document Type");
                DocDim.SETRANGE("Document No.","Purchase Header"."No.");
                DocDim.SETRANGE(DocDim."Dimension Code",'AGENT');
                IF DocDim.FINDFIRST THEN BEGIN
                  Dim.SETRANGE(Dim."Dimension Code", 'AGENT');
                  Dim.SETRANGE(Dim.Code,DocDim."Dimension Value Code");
                  IF Dim.FINDFIRST THEN;
                END;
                 */
                IF "Purchaser Code" = '' THEN BEGIN
                    SalesPurchPerson.INIT;
                    PurchaserText := '';
                END ELSE BEGIN
                    SalesPurchPerson.GET("Purchaser Code");
                    PurchaserText := SalesPurchPerson.Name;
                END;
                IF "Your Reference" = '' THEN
                    ReferenceText := ''
                ELSE
                    ReferenceText := FIELDCAPTION("Your Reference");
                IF "VAT Registration No." = '' THEN
                    VATNoText := ''
                ELSE
                    VATNoText := FIELDCAPTION("VAT Registration No.");
                IF "Currency Code" = '' THEN BEGIN
                    GLSetup.GET;
                    GLSetup.TESTFIELD("LCY Code");
                    TotalText := STRSUBSTNO(Text001, GLSetup."LCY Code");
                    TotalInclVATText := STRSUBSTNO(Text13700, GLSetup."LCY Code");
                    TotalExclVATText := STRSUBSTNO(Text13701, GLSetup."LCY Code");
                END ELSE BEGIN
                    TotalText := STRSUBSTNO(Text001, "Currency Code");
                    TotalInclVATText := STRSUBSTNO(Text13700, "Currency Code");
                    TotalExclVATText := STRSUBSTNO(Text13701, "Currency Code");
                END;
                //gunjan
                FormatAddr.PurchHeaderBuyFrom(BuyFromAddr, "Purchase Header");
                IF ("Purchase Header"."Buy-from Vendor No." <> "Purchase Header"."Pay-to Vendor No.") THEN
                    FormatAddr.PurchHeaderPayTo(VendAddr, "Purchase Header");
                IF "Payment Terms Code" <> '' THEN BEGIN
                    PaymentTerms.GET("Payment Terms Code");
                    PaymentTerms.TranslateDescription(PaymentTerms, "Language Code");
                END;
                IF "Prepmt. Payment Terms Code" = '' THEN
                    PrepmtPaymentTerms.INIT
                ELSE BEGIN
                    PrepmtPaymentTerms.GET("Prepmt. Payment Terms Code");
                    PrepmtPaymentTerms.TranslateDescription(PrepmtPaymentTerms, "Language Code");
                END;
                IF "Shipment Method Code" = '' THEN
                    ShipmentMethod.INIT
                ELSE BEGIN
                    ShipmentMethod.GET("Shipment Method Code");
                    ShipmentMethod.TranslateDescription(ShipmentMethod, "Language Code");
                END;


                FormatAddr.PurchHeaderShipTo(ShipToAddr, "Purchase Header");

                IF NOT CurrReport.PREVIEW THEN BEGIN
                    IF ArchiveDocument THEN
                        ArchiveManagement.StorePurchDocument("Purchase Header", LogInteraction);

                    IF LogInteraction THEN BEGIN
                        CALCFIELDS("No. of Archived Versions");
                        SegManagement.LogDocument(
                          13, "No.", "Doc. No. Occurrence", "No. of Archived Versions", DATABASE::Vendor, "Buy-from Vendor No.",
                          "Purchaser Code", '', "Posting Description", '');
                    END;
                END;
                Comments := '';


                PurchaseComments.RESET;
                PurchaseComments.SETRANGE(PurchaseComments."Document Type", PurchaseComments."Document Type"::Order);
                PurchaseComments.SETRANGE(PurchaseComments."No.", "Purchase Header"."No.");
                //MESSAGE ('%1', PurchaseComments.COUNT);

                IF PurchaseComments.FINDFIRST THEN BEGIN
                    REPEAT
                        Comments := Comments + ' ' + PurchaseComments.Comment;
                    UNTIL PurchaseComments.NEXT = 0;
                END;
                /* //PCPL/NSW/MIG 05Aug22
                //road transitdocument
                "Transit Document Order Details".SETFILTER("Transit Document Order Details"."Vendor / Customer Ref.",
                "Purchase Header"."Buy-from Vendor No.");
                "Transit Documen //PCPL/NSW/MIG 05Aug22t Order Details".SETFILTER("Transit Document Order Details"."PO / SO No.",
                "Purchase Header"."No.");
                //IF "Purchase Header"."Transit Document" = FALSE THEN
                    Roadno := 'Not Applicable';

                IF "Transit Document Order Details".FIND('-') THEN
                    Roadno := "Transit Document Order Details"."Form No.";
                    */  //PCPL/NSW/MIG 05Aug22

                IF Cust.GET("Purchase Header"."Sell-to Customer No.") THEN
                    Cust.RESET;
                Cust.SETRANGE(Cust."No.", "Purchase Header"."Sell-to Customer No.");
                IF Cust.FINDFIRST THEN BEGIN
                    VTIN := '';//Cust."T.I.N. No."; //PCPL/NSW/MIG 05Aug22
                    VCST := '';//Cust."C.S.T. No."; //PCPL/NSW/MIG 05Aug22
                END;
                /*
                CommentsLine.RESET;
                CommentsLine.SETRANGE(CommentsLine."Document Type", CommentsLine."Document Type"::Order);
                CommentsLine.SETRANGE(CommentsLine."No.","Purchase Header"."No.");
                //MESSAGE ('%1', PurchaseComments.COUNT);
                IF CommentsLine.FINDSET THEN
                REPEAT
                  FOR i := 1 TO CommentsLine.COUNT DO BEGIN
                    Text[i] := PurchaseComments.Comment;
                  //  PurchaseComments.NEXT;
                   END;
                UNTIL PurchaseComments.NEXT =0;
                
                */
                i := 1;
                CommentsLine.RESET;
                CommentsLine.SETRANGE(CommentsLine."Document Type", CommentsLine."Document Type"::Order);
                CommentsLine.SETRANGE(CommentsLine."No.", "Purchase Header"."No.");
                IF CommentsLine.FINDFIRST THEN
                    REPEAT
                        Text[i] := PurchaseComments.Comment;
                        i += 1;
                    UNTIL PurchaseComments.NEXT = 0;




                Location.RESET;
                Location.SETRANGE(Location.Code, "Purchase Header"."Location Code");
                IF Location.FINDFIRST THEN BEGIN
                    locadd := Location.Address;
                    locadd1 := Location."Address 2";
                    locadd2 := Location.City;
                    locadd3 := Location."Post Code";
                    loctel := Location."Phone No.";
                    locfax := Location."E-Mail";
                    loctin := '';//Location."T.I.N. No.";
                    loccst := '';//Location."C.S.T No.";
                    locecc := '';//Location."E.C.C. No.";
                    locser := '';//Location."Service Tax Registration No.";
                    locrang := '';//Location."C.E. Range";
                    locdivision := '';//Location."C.E. Division";
                    loccom := '';//Location."C.E. Commissionerate";
                END;


                //
                IF "Purchase Header"."Shortcut Dimension 1 Code" = 'B34R&D' THEN
                    LOC := locname + '  ' + locadd + '   ' + Location."Name 2" + '  ' + locadd1 + ',' + locadd2 + '- ' + locadd3
                ELSE
                    LOC := locname + '  ' + locadd + '  ' + locadd1 + ',' + locadd2 + '- ' + locadd3;
                // MESSAGE('%1',LOC);
                //
                IF "Purchase Header"."Shortcut Dimension 1 Code" = 'B34R&D' THEN
                    LOC1 := "Purchase Header"."Ship-to Name" + ' ' + "Purchase Header"."Ship-to Address" + '  ' + "Purchase Header"."Ship-to Name 2"
                    + ' ' + "Purchase Header"."Ship-to Address 2" + ' ' +
                   "Purchase Header"."Ship-to Post Code"
                ELSE
                    LOC1 := "Purchase Header"."Ship-to Name" + ' ' + "Purchase Header"."Ship-to Address" + ' ' + "Purchase Header"."Ship-to Address 2" + ' ' +
                   "Purchase Header"."Ship-to Post Code";

                DGEB.RESET;
                DGEB.SETRANGE(DGEB."Document No.", "Purchase Header"."No.");
                DGEB.SETRANGE(DGEB."Transaction Type", DGEB."Transaction Type"::Purchase);
                IF DGEB.FINDFIRST THEN
                    REPEAT
                        IF DGEB."GST Component Code" = 'IGST' THEN BEGIN
                            IGSTper := DGEB."GST %";
                            IGSTAMT += ABS(DGEB."GST Amount");
                        END
                        ELSE
                            IF DGEB."GST Component Code" = 'SGST' THEN BEGIN
                                SGSTAMT += ABS(DGEB."GST Amount");
                                SGSTper := DGEB."GST %";
                            END
                            ELSE
                                IF DGEB."GST Component Code" = 'CGST' THEN BEGIN
                                    CGSTAMT += ABS(DGEB."GST Amount");
                                    CGSTper := DGEB."GST %";
                                END;
                    UNTIL DGEB.NEXT = 0;

                Line_arch.SETRANGE(Line_arch."No.", "Purchase Header"."No.");
                IF Line_arch.FINDLAST THEN
                    Line_date := Line_arch."Date Archived";
                //-------section
                IF VENDOR.GET("Purchase Header"."Buy-from Vendor No.") THEN
                    EMAIL := VENDOR."E-Mail";
                Contact := VENDOR.Contact;
                PhoneNo := VENDOR."Phone No.";
                IF Location11.GET("Purchase Header"."Location Code") THEN;

            end;

            trigger OnPreDataItem();
            begin

                i := 1;


                IF CompanyInformation.GET THEN
                    CompanyInformation.CALCFIELDS(CompanyInformation.Picture);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Control001)
                {
                    field(NoOfCopies; NoOfCopies)
                    {
                        Caption = 'No. of Copies';
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

    trigger OnInitReport();
    begin
        CompInfo.GET;
    end;

    var
        Text000: Label 'Purchaser';
        GLSetup: Record "General Ledger Setup";
        CompanyInfo: Record "Company Information";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        PrepmtPaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        VATAmountLine: Record "VAT Amount Line" temporary;
        PrepmtVATAmountLine: Record "VAT Amount Line" temporary;
        PurchLine: Record "Purchase Line" temporary;
        PrepmtInvBuf: Record "Prepayment Inv. Line Buffer" temporary;
        RespCenter: Record "Responsibility Center";
        Language: Record Language;
        CurrExchRate: Record "Currency Exchange Rate";
        PurchSetup: Record "Purchases & Payables Setup";
        PurchCountPrinted: Codeunit "Purch.Header-Printed";
        FormatAddr: Codeunit "Format Address";
        PurchPost: Codeunit "Purch.-Post";
        ArchiveManagement: Codeunit "ArchiveManagement";
        SegManagement: Codeunit 5051;
        PurchPostPrepmt: Codeunit "Purchase-Post Prepayments";
        VendAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        BuyFromAddr: array[8] of Text[50];
        PurchaserText: Text[30];
        VATNoText: Text[30];
        ReferenceText: Text[30];
        TotalText: Text[50];
        TotalInclVATText: Text[50];
        TotalExclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        ArchiveDocument: Boolean;
        LogInteraction: Boolean;
        VATAmount: Decimal;
        VATBaseAmount: Decimal;
        VATDiscountAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        VALExchRate: Text[50];
        PrepmtVATAmount: Decimal;
        PrepmtVATBaseAmount: Decimal;
        PrepmtAmountInclVAT: Decimal;
        PrepmtTotalAmountInclVAT: Decimal;
        PrepmtLineAmount: Decimal;
        OtherTaxesAmount: Decimal;
        ChargesAmount: Decimal;
        //TINNos: Record "T.I.N. Nos.";
        //ECCNo: Record "E.C.C. Nos.";
        Location: Record Location;
        //ExcisePostingSetup: Record "Excise Posting Setup";
        //        TINNoDesc: Text[30];
        //TinNo: Record "T.I.N. Nos.";
        //ExciseBuss: Record "Excise Bus. Posting Group";
        // excisepost: Record "Excise Posting Setup";
        ItemUnitOfMeasure: Record "Item Unit of Measure";
        UOMCode: Record "Unit of Measure";
        ven: Record Vendor;
        gcont: Text[30];
        Comments: Text[400];
        PurchaseComments: Record "Purch. Comment Line";
        locfax: Text[30];
        loctin: Text[50];
        loccst: Text[60];
        locadd: Text[50];
        locadd1: Text[60];
        locadd2: Text[60];
        locadd3: Text[60];
        loctel: Text[50];
        locecc: Text[50];
        locser: Text[50];
        locrang: Text[100];
        loccom: Text[50];
        locdivision: Text[100];
        Agent: Record "Salesperson/Purchaser";
        agentn: Text[30];
        commrate: Decimal;
        CR: Record "Country/Region";
        Country: Text[50];
        repcheck: Report 1401;
        NoText: array[2] of Text[500];
        VTIN: Text[30];
        VCST: Text[30];
        VECC: Text[30];
        VRANGE: Text[30];
        VDIV: Text[30];
        VCOMM: Text[30];
        VPAN: Text[30];
        //DetailedTaxEntryBuffer: Record "Detailed Tax Entry Buffer";
        bedPercentage: Decimal;
        eCessPercentage: Decimal;
        ShecessPercentage: Decimal;
        taxpercentage: Decimal;
        transname: Text[50];
        transadd: Text[100];
        shipcode: Record "Shipping Agent";
        // "Transit Document Order Details": Record "Transit Document Order Details";
        Roadno: Text[50];
        Dim: Record "Dimension Value";
        // ExcisePosSetup: Record "Excise Posting Setup";
        BED: Decimal;
        ECESS: Decimal;
        SHECESS: Decimal;
        Text: array[20] of Text[250];
        Cust: Record Customer;
        CommentsLine: Record "Purch. Comment Line";
        i: Integer;
        ACommentsLine: Record "Purch. Comment Line";
        txt1: array[10] of Text[100];
        j: Integer;
        LocCon: Code[20];
        LocMob: Code[20];
        LocMail: Code[20];
        VenCon: Text[50];
        VenMail: Text[50];
        VenFax: Code[20];
        VenMob: Code[50];
        VenTel: Code[50];
        UnitPerQty: Decimal;
        srno: Integer;
        TaxGroup: Record "Tax Group";
        transportmethod: Record "Transport Method";
        locname: Text[60];
        varSerNo: Integer;
        currencycode: Code[10];
        user: Record "User Setup";
        strTaxgroup: Text[50];
        recpurchline: Record "Purchase Line";
        rectaxgroup: Record "Tax Group";
        TaxGrpDesc: Text[50];
        LOC: Text[150];
        LOC1: Text[150];
        Txt: Text[50];
        //StrOrdDet: Record "Structure Order Line Details";
        Frght: Decimal;
        Packing: Decimal;
        Text001: Label 'Total %1';
        Text002: Label 'Total %1 Incl. VAT';
        Text003: Label 'COPY';
        Text004: Label 'Order %1';
        Text005: Label 'Page %1';
        Text006: Label 'Total %1 Excl. VAT';
        Text007: Label '"VAT Amount Specification in "';
        Text008: Label 'Local Currency';
        Text009: Label 'Exchange rate: %1/%2';
        Text13700: Label 'Total %1 Incl. Taxes';
        Text13701: Label 'Total %1 Excl. Taxes';
        Text0012: Label '"""Property in the goods shall not pass till they have been tested/checked & approved by us."""';
        Text0013: Label 'Goods not conforming to our specifications and standards or to samples approved, will be rejected.';
        Text0014: Label 'Price: Ex-work,Vatva,Ahmedabad,un-packed  Freight : To be delivered at Plast India by Supplier. Insurance : To be covered by the supplier till plast India. Excise Duty  : Extra as applicable. Prevailing rate is 10.30%. Sales Tax : Extra on actual basis at the time of delivery  2%  C.S.T. against form ''C'' will be charged . Payment  : 30% advance  Delivery by 26 January 2009 at Plast India or by the nigociated date.  Warranty : The product is warranted against any manufacturing defect for a period of one year from the date of dispatch.However, the warranty for electrical item will be passed to you as per what the manufacturer provides. As we don not manufacture or repair the bought out electrical parts.';
        varbed: Decimal;
        vardiscount: Decimal;
        Varnetdis: Decimal;
        varcess: Decimal;
        varcentralexcise: Decimal;
        varshecess: Decimal;
        vartaxgroup: Decimal;
        varvat: Decimal;
        VarPckforwd: Decimal;
        vartotalprice: Decimal;
        txt9: Text[250];
        txt2: Text[250];
        txt3: Text[250];
        txt4: Text[250];
        txt5: Text[250];
        txt6: Text[250];
        txt7: Text[250];
        txt8: Text[250];
        cnt: Integer;
        Insurance: Record "Insurance";
        Transport: Record "Transport Method";
        IQM: Record "Item Quality Measure";
        UMC: Code[10];
        MINV: Decimal;
        MAXV: Decimal;
        VENDOR: Record Vendor;
        EMAIL: Text[50];
        Contact: Text[50];
        PhoneNo: Text[50];
        Payment: Record "Payment Terms";
        PaymentDes: Text[150];
        ShipAgent: Record "Shipping Agent";
        TRANSPORTER: Text[150];
        // SOLD: Record "Structure Order Line Details";
        FREIGHT: Code[10];
        Pack: Decimal;
        // StrOrderDetailsRec: Record "Structure Order Details";
        ITM: Record Item;
        NODES: Text[100];
        Line_arch: Record "Purchase Header Archive";
        Line_date: Date;
        excise: Decimal;
        recLocation: Record Location;
        Paymethod: Record "Payment Method";
        // StrOrdDet1: Record "Structure Order Line Details";
        BEDPERCN: Decimal;
        ECESSPERCN: Decimal;
        SHESSPERCN: Decimal;
        //excisepost1: Record "Excise Posting Setup";
        bedPercentage1: Decimal;
        eces: Text;
        she: Text;
        bd: Text;
        VenN: Text[50];
        VenN1: Text[50];
        VenAdd: Text[50];
        VenAdd2: Text[50];
        VenCity: Text[50];
        VenPC: Text[50];
        VenCountry: Text[50];
        Rec_Vendor1: Record "Vendor";
        EXL: Record "Extended Text Line";
        p: Integer;
        ET: array[7] of Text[50];
        PL: Record "Purchase Line";
        netdis: Decimal;
        "-------------": Integer;
        LineAmt: Decimal;
        LineDisc: Decimal;
        BedAmt: Decimal;
        EcessAmt: Decimal;
        ShecessAmt: Decimal;
        ExciseAmt: Decimal;
        TaxAmt: Decimal;
        AmtToVend: Decimal;
        InvDisc: Decimal;
        TotalPrice: Decimal;
        "--": Integer;
        varbed1: Decimal;
        varcess1: Decimal;
        varshecess1: Decimal;
        vartaxgroup1: Decimal;
        netdis1: Decimal;
        PACK1: Decimal;
        Frght1: Decimal;
        poqty: Decimal;
        qty: Decimal;
        DeliverAt: Text[100];
        recVen: Record Vendor;
        TextRegAddress: Label '" 301, E-Square,Subhash Road, Vile Parle(East), Mumbai-400057. India. Tel:022-26636450. Email : purchase@nglfinechem.com, URL:www.nglfinechem.com. CIN : L24110MH1981PLC025884. "';
        CompanyInformation: Record "Company Information";
        Vendor_FaxNo: Text[30];
        Vendor_Email: Text[80];
        indentno: Text;
        pl2: Record "Purchase Line";
        Serial: Text[50];
        fixedassets: Record "Fixed Asset";
        DGEB: Record "Detailed GST Entry Buffer";
        IGSTper: Decimal;
        SGSTper: Decimal;
        CGSTper: Decimal;
        IGSTAMT: Decimal;
        SGSTAMT: Decimal;
        CGSTAMT: Decimal;
        Location11: Record Location;
        ShipToLocation: Record Location;
        StateShipTo: Record State;
        CompInfo: Record "Company Information";

    procedure InitTextVariable();
    begin
    end;
}

