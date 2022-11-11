report 50046 "Sales Trend Report"
{
    // Report Name:Sales Register
    // Company:KAPL
    // Prepared By: Gunjan Mittal
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Sales Trend Report.rdl';


    dataset
    {
        dataitem(Integer; Integer)
        {
            MaxIteration = 1;
            column(Comp_Name; comprec.Name)
            {
            }
            column(Comp_add; comprec.Address)
            {
            }
            column(Comp_Add1; comprec."Address 2")
            {
            }
            column(Comp_City; comprec.City)
            {
            }
            column(SSL; SSL)
            {
            }
            column(SIL; SIL)
            {
            }
            column(RSL; RSL)
            {
            }
            column(CML; CML)
            {
            }
            column(Summary; Summary)
            {
            }

            trigger OnAfterGetRecord();
            begin
                comprec.SETRANGE(comprec.Name);
                IF comprec.FIND('-') THEN;
            end;
        }
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.")
                                ORDER(Ascending);
            column(SIH_No; rec_sales_inv_head."No.")
            {
            }
            column(VesselFlightNo_SalesInvoiceH; '')// "Sales Invoice Header"."Vessel/Flight No.") PCPL-Deepak
            {
            }
            column(BuyerReferenceNo_SalesInvoiceHeader; 0) //"Sales Invoice Header"."Buyer Reference No.1") PCPL-Deepak
            {
            }
            column(BankRefNo_SalesInvoiceHeader; 0) //"Sales Invoice Header"."Bank Ref No.") PCPL-Deepak
            {
            }
            column(PaymentTermsCode_SalesInvoiceHeader; PaymentTerms.Description)
            {
            }

            trigger OnPreDataItem();
            begin
                CLEAR(Ship_toName);
            end;
        }
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            DataItemTableView = WHERE("No." = FILTER(<> 144900),
                                      Quantity = FILTER(<> 0));
            RequestFilterFields = "Posting Date", "Location Code", "Gen. Bus. Posting Group", "Gen. Prod. Posting Group";
            column(ExportFreight_SalesInvoiceHeader; SalesInvoiceHeader."Export Freight")
            {
            }
            column(ComissionPayble; CommisionAmt)
            {
            }
            column(VendorName; VendorName)
            {
            }
            column(countrycode; countrycode)
            {
            }
            column(CHACharges_SalesInvoiceHeader; '') //SalesInvoiceHeader."CHA Charges") PCPL-Deepak
            {
            }
            column(VarBankRefNo; VarBankRefNo)
            {
            }
            column(VarPaymentDes; VarPaymentDes)
            {
            }
            column(BillofLadinggedate; '')//FORMAT(ExportOrder."Bill of Lading Date")) //PCPL/NSW/MIG 05Aug22
            {
            }
            column(BillofLadinggeNo; '')//ExportOrder."Bill of Lading No.") //PCPL/NSW/MIG 05Aug22
            {
            }
            column(BillofExchangeNo; '')//ExportOrder."Bill of Exchange No.") //PCPL/NSW/MIG 05Aug22
            {
            }
            column(BillofExchangedate; '')//FORMAT(ExportOrder."Bill of Exchange Date")) //PCPL/NSW/MIG 05Aug22
            {
            }
            column(PortCode; '') //ShipmentMethod."Port Code") PCPL-Deepak
            {
            }
            column(SIHEXEPER; SIHEXEPER)
            {
            }
            column(GST_Amount; CGSTAmount + CGSTAmount + IGSTAmount)
            {
            }
            column(PER; PER)
            {
            }
            column(VesselFlightNo_SalesInvoiceHeader; 0) //SalesInvoiceHeader."Vessel/Flight No.") PCPL-Deepak
            {
            }
            column(CurrencyCode; SalesInvoiceHeader."Currency Code")
            {
            }
            column(ExternalDocumentNo_SalesInvoiceHeader; 0) //SalesInvoiceHeader."Buyer Reference No.1") PCPL-Deepak
            {
            }
            column(Ship_toName; Ship_toName)
            {
            }
            column(FinalDestination_SalesInvoiceHeader; '') //SalesInvoiceHeader."Final Destination") PCPL-Deepak
            {
            }
            column(Amount_SalesInvoiceLine; "Sales Invoice Line".Amount)
            {
            }
            column(UnitPrice_SalesInvoiceLine; "Sales Invoice Line"."Unit Price")
            {
            }
            column(amt_ty; amt_ty)
            {
            }
            column(AT2; ABS(AT2))
            {
            }
            column(CFORMDATE; CFORMDATE)
            {
            }
            column(C_VAT; C_VAT)
            {
            }
            column(C_CST; C_CST)
            {
            }
            column(Sum2; Sum2)
            {
            }
            column(IC_DecSIL; IC.Description)
            {
            }
            column(PG_DesSIL; '')//PG.Description) //PCPL/NSW/MIG 05Aug22
            {
            }
            column(SIL_ADCVAT; SIHADCVAT)
            {
            }
            column(SIL_PostingDate; "Sales Invoice Line"."Posting Date")
            {
            }
            column(SIL_DocNo; "Sales Invoice Line"."Document No.")
            {
            }
            column(SIL_LineNo; "Sales Invoice Line"."No.")
            {
            }
            column(SIL_Des; "Sales Invoice Line".Description)
            {
            }
            column(ItemDescription; ItemDescription)
            {
            }
            column(ItemDescription1; ItemDescription1)
            {
            }
            column(SIL_Quantity; "Sales Invoice Line".Quantity)
            {
            }
            column(SIL_UOM; "Sales Invoice Line"."Unit of Measure")
            {
            }
            column(Location_Code; rec_sales_inv_line."Location Code")
            {
            }
            column(Cust_Country; CustCountry2)
            {
            }
            column(Export_Local_Sale; Saletype)
            {
            }
            column(SIL_UnitCost; SIHUPLCY)
            {
            }
            column(SIL_Amount; SIHAmt)
            {
            }
            column(SIL_BEDAmount; SIHBEDAMT)
            {
            }
            column(SIL_ECESSAmount; SIHECESSAMT)
            {
            }
            column(SIL_SHEAmount; SIHSHEECESS)
            {
            }
            column(SIL_ExciseAmount; SIHEXCISEAMT)
            {
            }
            column(SIL_TaxPer; 0) //"Sales Invoice Line"."Tax %") PCPL-Deepak
            {
            }
            column(SIL_TaxAmount; SIHTAXAMT)
            {
            }
            column(SIL_Discount; "Sales Invoice Line"."Line Discount %")
            {
            }
            column(SIL_ServiceTaxAmount; SIHSERVCETAXAMT)
            {
            }
            column(SIL_AmounttoVendor; SIHATC)
            {
            }
            column(SIL_ChargestoVendor; SIHCTC)
            {
            }
            column(SIL_Dim1; "Sales Invoice Line"."Shortcut Dimension 1 Code")
            {
            }
            column(SIL_Dim2; "Sales Invoice Line"."Shortcut Dimension 2 Code")
            {
            }
            column(SILName; SILName)
            {
            }
            column(SILDES; SILDES)
            {
            }
            column(SIL_FormNo; SIL_FormNo)
            {
            }
            column(SIL_FormC; SIL_FormC)
            {
            }
            column(SIL_TDSAmount; SIHTDSAMT)
            {
            }
            column(SIL_LRNo; SIL_LRNo)
            {
            }
            column(SIL_LRDate; SIL_LRDate)
            {
            }
            column(SIL_Transporter; SIL_Transporter)
            {
            }
            column(SIL_CurrencyCode; SIL_CurrencyCode)
            {
            }
            column(Export_Freight; '') //SIH."Export Freight") PCPL-Deepak
            {
            }
            column(CHA_Charges; '') //SIH."CHA Charges" PCPL-Deepak
            {
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                DataItemTableView = WHERE("Document Type" = FILTER(Invoice));
                column(DocumentNo_CustLedgerEntry; "Cust. Ledger Entry"."Document No.")
                {
                }
                dataitem("Applied Document Entry"; "Cust. Ledger Entry")
                {
                    DataItemLink = "Entry No." = FIELD("Closed by Entry No.");
                    DataItemTableView = WHERE("Document Type" = FILTER("Credit Memo"));
                    column(DocumentNo_AppliedDocumentEntry; "Applied Document Entry"."Document No.")
                    {
                    }
                    dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
                    {
                        DataItemLink = "Document No." = FIELD("Document No.");
                        DataItemTableView = WHERE("No." = FILTER(<> 144900),
                                                  Quantity = FILTER(<> 0));
                        column(ShortcutDimension1Code_SalesCrMemoLine; "Sales Cr.Memo Line"."Shortcut Dimension 1 Code")
                        {
                        }
                        column(SelltoCustomerNo_SalesCrMemoLine; "Sales Cr.Memo Line"."Sell-to Customer No.")
                        {
                        }
                        column(DocumentNo_SalesCrMemoLine; "Sales Cr.Memo Line"."Document No.")
                        {
                        }
                        column(ShortcutDimension2Code_SalesCrMemoLine; "Sales Cr.Memo Line"."Shortcut Dimension 2 Code")
                        {
                        }
                        column(No_SalesCrMemoLine; "Sales Cr.Memo Line"."No.")
                        {
                        }
                        column(LocationCode_SalesCrMemoLine; "Sales Cr.Memo Line"."Location Code")
                        {
                        }
                        column(Description_SalesCrMemoLine; "Sales Cr.Memo Line".Description)
                        {
                        }
                        column(Description2_SalesCrMemoLine; "Sales Cr.Memo Line"."Description 2")
                        {
                        }
                        column(UnitofMeasure_SalesCrMemoLine; "Sales Cr.Memo Line"."Unit of Measure")
                        {
                        }
                        column(Quantity_SalesCrMemoLine; -"Sales Cr.Memo Line".Quantity)
                        {
                        }
                        column(UnitPrice_SalesCrMemoLine; "Sales Cr.Memo Line"."Unit Price")
                        {
                        }
                        column(PostingDate_SalesCrMemoLine; "Sales Cr.Memo Line"."Posting Date")
                        {
                        }
                        column(Amount_SalesCrMemoLine; -"Sales Cr.Memo Line".Amount)
                        {
                        }
                        column(UnitCostLCY_SalesCrMemoLine; "Sales Cr.Memo Line"."Unit Cost (LCY)")
                        {
                        }
                        column(GSTBaseAmount_SalesCrMemoLine; 0) //"Sales Cr.Memo Line"."GST Base Amount")  PCPL-Deepak
                        {
                        }
                        column(CustName; Customer1.Name)
                        {
                        }
                        column(Cust_Country_credit; CountryRegion1.Name)
                        {
                        }
                        column(Export_Local_Sale_Credit; Customer1."Customer Posting Group")
                        {
                        }
                        column(FormNo_credit; 0) //SalesCrMemoHead."Form No.") PCPL-Deepak
                        {
                        }
                        column(CurrencyCode_credit; SalesCrMemoHead."Currency Code")
                        {
                        }
                        column(FormC_credit; '') //SalesCrMemoHead."Form Code") PCPL-Deepak
                        {
                        }
                        column(TDSAmount_credit; SIHTDSAMT)
                        {
                        }
                        column(Transporter_credit; SIL_Transporter)
                        {
                        }
                        column(CR_UnitCost; SIHUPLCY)
                        {
                        }
                        column(CR_Amount; -SIHAmt)
                        {
                        }
                        column(CRL_BEDAmount; SIHBEDAMT)
                        {
                        }
                        column(CR_ECESSAmount; SIHECESSAMT)
                        {
                        }
                        column(CR_SHEAmount; SIHSHEECESS)
                        {
                        }
                        column(CR_ExciseAmount; SIHEXCISEAMT)
                        {
                        }
                        column(CR_TaxPer; 0)// "Sales Invoice Line"."Tax %") //PCPL/NSW/MIG 05Aug22
                        {
                        }
                        column(CR_TaxAmount; SIHTAXAMT)
                        {
                        }
                        column(CR_Discount; "Sales Invoice Line"."Line Discount %")
                        {
                        }
                        column(CR_ServiceTaxAmount; SIHSERVCETAXAMT)
                        {
                        }
                        column(CR_AmounttoVendor; SIHATC)
                        {
                        }
                        column(CR_ChargestoVendor; SIHCTC)
                        {
                        }
                        column(GST_Amount_cr; (CGSTAmount_cr + SGSTAmount_cr + IGSTAmount_cr))
                        {
                        }
                        column(CommisionAmt_Cr; CommisionAmt_Cr)
                        {
                        }
                        column(VarPaymentDes_cr; PaymentTerms.Description)
                        {
                        }
                        column(countryname; RecCountry.Name)
                        {
                        }
                        column(portcode_cr; '')  //ShipmentMethod."Port Code") PCPL-Deepak
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            //PCPL-25 5aug21
                            IF Customer1.GET("Sales Cr.Memo Line"."Sell-to Customer No.") THEN;
                            IF CountryRegion1.GET(Customer1."Country/Region Code") THEN;

                            SalesCrMemoHead.RESET;
                            SalesCrMemoHead.SETRANGE("No.", "Sales Cr.Memo Line"."Document No.");
                            IF SalesCrMemoHead.FINDFIRST THEN;

                            IF ShiptoAddress.GET(SalesCrMemoHead."Sell-to Customer No.", SalesCrMemoHead."Ship-to Code") THEN
                                Ship_toName := ShiptoAddress.Name;

                            IF PaymentTerms.GET(SalesCrMemoHead."Payment Terms Code") THEN;
                            IF RecCountry.GET(Customer1."Country/Region Code") THEN;
                            IF ShipmentMethod.GET(SalesCrMemoHead."Shipment Method Code") THEN;

                            SIHCF_cr := Rec_SIH."Currency Factor";

                            IF SIHCF_cr <> 0 THEN BEGIN
                                /* SIHUPLCY_cr := "Sales Invoice Line"."Unit Price" / SIHCF_cr;
                                 SIHAmt_cr := ("Sales Invoice Line".Quantity * "Sales Invoice Line"."Unit Price") / SIHCF_cr;
                                 SIHBEDAMT_cr := "Sales Invoice Line"."BED Amount" / SIHCF_cr;
                                 SIHADCVAT_cr := "Sales Invoice Line"."ADC VAT Amount" / SIHCF_cr;
                                 SIHECESSAMT_cr := "Sales Invoice Line"."eCess Amount" / SIHCF_cr;
                                 SIHSHEECESS_cr := "Sales Invoice Line"."SHE Cess Amount" / SIHCF_cr;
                                 SIHEXCISEAMT_cr := "Sales Invoice Line"."Excise Amount" / SIHCF_cr;
                                 SIHTAXAMT_cr := "Sales Invoice Line"."Tax Amount" / SIHCF_cr;
                                 SIHSERVCETAXAMT_cr := "Sales Invoice Line"."Service Tax Amount" / SIHCF_cr;
                                 SIHCTC_cr := "Sales Invoice Line"."Charges To Customer" / SIHCF_cr;
                                 SIHTDSAMT_cr := "Sales Invoice Line"."TDS/TCS Amount" / SIHCF_cr;*/ //PCPL-Deepak
                            END
                            ELSE BEGIN
                                /* SIHUPLCY_cr := "Sales Invoice Line"."Unit Price";
                                 SIHAmt_cr := ("Sales Invoice Line".Quantity * "Sales Invoice Line"."Unit Price");
                                 SIHBEDAMT_cr := "Sales Invoice Line"."BED Amount";
                                 SIHADCVAT_cr := "Sales Invoice Line"."ADC VAT Amount";
                                 SIHECESSAMT_cr := "Sales Invoice Line"."eCess Amount";
                                 SIHSHEECESS_cr := "Sales Invoice Line"."SHE Cess Amount";
                                 SIHEXCISEAMT_cr := "Sales Invoice Line"."Excise Amount";
                                 SIHTAXAMT_cr := "Sales Invoice Line"."Tax Amount";
                                 SIHSERVCETAXAMT_cr := "Sales Invoice Line"."Service Tax Amount";
                                 SIHCTC_cr := "Sales Invoice Line"."Charges To Customer";
                                 SIHTDSAMT_cr := "Sales Invoice Line"."TDS/TCS Amount";*/ //PCPL-Deepak
                            END;

                            GSTPer_cr := 0;
                            CGSTAmount_cr := 0;
                            IGSTAmount_cr := 0;
                            SGSTAmount_cr := 0;
                            DetailedGSTLedgerEntry.RESET;
                            DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type", "Document Type", "Document No.", "Document Line No.");
                            DetailedGSTLedgerEntry.SETRANGE("Transaction Type", DetailedGSTLedgerEntry."Transaction Type"::Sales);
                            DetailedGSTLedgerEntry.SETRANGE("Document No.", "Document No.");
                            DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Line No.");
                            IF DetailedGSTLedgerEntry.FINDFIRST THEN BEGIN
                                IF DetailedGSTLedgerEntry."GST Component Code" = 'CGST' THEN BEGIN
                                    CGSTAmount_cr := DetailedGSTLedgerEntry."GST Amount";
                                    GSTPer_cr := DetailedGSTLedgerEntry."GST %";
                                END
                                ELSE
                                    IF DetailedGSTLedgerEntry."GST Component Code" = 'SGST' THEN BEGIN
                                        CGSTAmount_cr := DetailedGSTLedgerEntry."GST Amount";
                                        ;
                                        GSTPer_cr := DetailedGSTLedgerEntry."GST %";
                                    END
                                    ELSE
                                        IF DetailedGSTLedgerEntry."GST Component Code" = 'IGST' THEN BEGIN
                                            IGSTAmount_cr := DetailedGSTLedgerEntry."GST Amount";
                                            ;
                                            //IGSTPer:=DetailedGSTLedgerEntry."GST %";
                                        END;
                            END;


                            //PCPL-25 5aug21
                        end;
                    }
                }
            }

            trigger OnAfterGetRecord();
            begin
                //PCPL50
                CLEAR(CommisionAmt);
                CLEAR(VendorName);
                "Sales Invoice Header".RESET;
                "Sales Invoice Header".SETRANGE("Sales Invoice Header"."No.", "Sales Invoice Line"."Document No.");
                IF "Sales Invoice Header".FINDFIRST THEN;



                RecVendLdgrEntry.RESET;
                RecVendLdgrEntry.SETRANGE(RecVendLdgrEntry."External Document No.", "Sales Invoice Header"."Order No.");
                IF RecVendLdgrEntry.FINDFIRST THEN BEGIN
                    RecVendLdgrEntry.CALCFIELDS(RecVendLdgrEntry.Amount);
                    CommisionAmt := ABS(RecVendLdgrEntry.Amount);
                    IF Vendor_.GET(RecVendLdgrEntry."Vendor No.") THEN
                        VendorName := Vendor_.Name;
                END;
                //PCPL50

                // ExportOrder.RESET;
                // //  ExportOrder.SETRANGE("Invoice No.", "Document No."); //PCPL-Deepak
                // IF ExportOrder.FINDFIRST THEN;
                // IF SalesHeader.GET(SalesHeader."Document Type"::Invoice, "Sales Invoice Line"."Document No.") THEN;
                // BEDP := 0;
                // ECESSP := 0;
                // SHECESSP := 0;
                // PER := 0;
                IF Type = Type::Item THEN BEGIN
                    /* ExciseEntry.RESET;
                     ExciseEntry.SETRANGE(ExciseEntry."Document Type", ExciseEntry."Document Type"::Invoice);
                     //ExciseEntry.SETRANGE(ExciseEntry.Type,ExciseEntry.Type::Sale);
                     ExciseEntry.SETRANGE(ExciseEntry."Document No.", "Document No.");
                     ExciseEntry.SETRANGE(ExciseEntry."Item No.", "No.");
                     ExciseEntry.SETRANGE(ExciseEntry."Excise Bus. Posting Group", "Excise Bus. Posting Group");
                     ExciseEntry.SETRANGE(ExciseEntry."Excise Prod. Posting Group", "Excise Prod. Posting Group");
                     IF ExciseEntry.FINDFIRST THEN BEGIN
                         IF "Excise Amount" <> 0 THEN BEGIN
                             BEDP := ExciseEntry."BED %";
                             ECESSP := (ExciseEntry."BED %" * ExciseEntry."eCess %") / 100;
                             //MESSAGE('%1',ECESSP);
                             SHECESSP := (ExciseEntry."BED %" * ExciseEntry."SHE Cess %") / 100;
                             //MESSAGE('%1',SHECESSP);
                             PER := BEDP + ECESSP + SHECESSP;
                         END;
                     END;*/ //PCPL-Deepak
                END;

                GSTPer := 0;
                //IGSTPer:=0;
                CGSTAmount := 0;
                IGSTAmount := 0;
                DetailedGSTLedgerEntry.RESET;
                DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type", "Document Type", "Document No.", "Document Line No.");
                DetailedGSTLedgerEntry.SETRANGE("Transaction Type", DetailedGSTLedgerEntry."Transaction Type"::Sales);
                DetailedGSTLedgerEntry.SETRANGE("Document No.", "Document No.");
                DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Line No.");
                IF DetailedGSTLedgerEntry.FINDFIRST THEN BEGIN
                    IF DetailedGSTLedgerEntry."GST Component Code" = 'CGST' THEN BEGIN
                        CGSTAmount := DetailedGSTLedgerEntry."GST Amount";
                        GSTPer := DetailedGSTLedgerEntry."GST %";
                    END
                    ELSE
                        IF DetailedGSTLedgerEntry."GST Component Code" = 'IGST' THEN BEGIN
                            IGSTAmount := DetailedGSTLedgerEntry."GST Amount";
                            ;
                            //IGSTPer:=DetailedGSTLedgerEntry."GST %";
                        END;
                END;

                //pcpl0024--start
                IF SalesInvoiceHeader.GET("Document No.") THEN;
                BEGIN
                    IF PaymentTerms.GET(SalesInvoiceHeader."Payment Terms Code") THEN;
                    VarPaymentDes := PaymentTerms.Description;

                    VarBankRefNo := SalesInvoiceHeader."Bank Ref No.";

                    BillCust.RESET;
                    BillCust.SETRANGE(BillCust."No.", SalesInvoiceHeader."Sell-to Customer No.");
                    IF BillCust.FINDFIRST THEN
                        countrycode1 := BillCust."Country/Region Code";
                    IF RecCountry.GET(countrycode1) THEN;
                    countrycode := RecCountry.Name;

                    IF ShiptoAddress.GET(SalesInvoiceHeader."Sell-to Customer No.", SalesInvoiceHeader."Ship-to Code") THEN
                        Ship_toName := ShiptoAddress.Name;

                    IF ShipmentMethod.GET(SalesInvoiceHeader."Shipment Method Code") THEN;
                END;
                //pcpl0024--end
                RecItem.RESET;
                RecItem.SETRANGE(RecItem."No.", "Sales Invoice Line"."No.");
                IF RecItem.FINDFIRST THEN
                    ItemDescription := RecItem.Description;

                recGLAccount.RESET;
                recGLAccount.SETRANGE("No.", "Sales Invoice Line"."No.");
                IF recGLAccount.FINDFIRST THEN BEGIN
                    ItemDescription := recGLAccount.Name;
                END;


                //GUNJAN-START
                Rec_SIH.RESET;
                Rec_SIH.SETRANGE(Rec_SIH."No.", "Sales Invoice Line"."Document No.");
                IF Rec_SIH.FINDFIRST THEN BEGIN
                    SIHCF := Rec_SIH."Currency Factor";
                    IF SIHCF <> 0 THEN BEGIN
                        /*  SIHUPLCY := "Sales Invoice Line"."Unit Price" / SIHCF;
                          SIHAmt := ("Sales Invoice Line".Quantity * "Sales Invoice Line"."Unit Price") / SIHCF;
                          SIHBEDAMT := "Sales Invoice Line"."BED Amount" / SIHCF;
                          SIHADCVAT := "Sales Invoice Line"."ADC VAT Amount" / SIHCF;
                          SIHECESSAMT := "Sales Invoice Line"."eCess Amount" / SIHCF;
                          SIHSHEECESS := "Sales Invoice Line"."SHE Cess Amount" / SIHCF;
                          SIHEXCISEAMT := "Sales Invoice Line"."Excise Amount" / SIHCF;
                          SIHTAXAMT := "Sales Invoice Line"."Tax Amount" / SIHCF;
                          SIHSERVCETAXAMT := "Sales Invoice Line"."Service Tax Amount" / SIHCF;*/ //PCPL-Deepak
                                                                                                  /*IF Rec_SIH."Export Document"=TRUE THEN
                                                                                                    SIHATC :="Sales Invoice Line".Amount/SIHCF
                                                                                                  ELSE
                                                                                                    SIHATC :="Sales Invoice Line"."Amount To Customer"/SIHCF; */
                                                                                                  /*SIHCTC := "Sales Invoice Line"."Charges To Customer" / SIHCF;
                                                                                                  SIHTDSAMT := "Sales Invoice Line"."TDS/TCS Amount" / SIHCF;*/ //PCPL-Deepak
                                                                                                                                                                //SIHEXEPER :=PER/SIHCF;
                    END
                    ELSE BEGIN
                        /*   SIHUPLCY := "Sales Invoice Line"."Unit Price";
                           SIHAmt := ("Sales Invoice Line".Quantity * "Sales Invoice Line"."Unit Price");
                           SIHBEDAMT := "Sales Invoice Line"."BED Amount";
                           SIHADCVAT := "Sales Invoice Line"."ADC VAT Amount";
                           SIHECESSAMT := "Sales Invoice Line"."eCess Amount";
                           SIHSHEECESS := "Sales Invoice Line"."SHE Cess Amount";
                           SIHEXCISEAMT := "Sales Invoice Line"."Excise Amount";
                           SIHTAXAMT := "Sales Invoice Line"."Tax Amount";
                           SIHSERVCETAXAMT := "Sales Invoice Line"."Service Tax Amount";
                           /*IF Rec_SIH."Export Document"=TRUE THEN /* //PCPL-Deepak
                             SIHATC :="Sales Invoice Line".Amount
                           ELSE
                             SIHATC :="Sales Invoice Line"."Amount To Customer";
                           */
                        /*SIHCTC := "Sales Invoice Line"."Charges To Customer";
                        SIHTDSAMT := "Sales Invoice Line"."TDS/TCS Amount";*/ //PCPL-Deepak
                                                                              //SIHEXEPER :=PER;
                    END;
                    //GUNJAN-END
                END;




                BEDA := 0;
                ECESSA := 0;
                SHECESSA := 0;
                SHADC := 0;
                AT2 := 0;
                //IF Type=Type::Item THEN
                //BEGIN
                //Rec_SIH.GET(SalesInvLine2."Document No.");
                SalesInvLine2.RESET;
                //SalesInvLine1.SETRANGE(SalesInvLine1.Type,SalesInvLine1.Type::Item);
                SalesInvLine2.SETRANGE(SalesInvLine2."Document No.", "Document No.");
                IF SalesInvLine2.FINDFIRST THEN BEGIN
                    // ExciseEntry2.RESET;
                    // ExciseEntry2.SETRANGE(ExciseEntry2."Document Type", ExciseEntry."Document Type"::Invoice);
                    // //ExciseEntry.SETRANGE(ExciseEntry.Type,ExciseEntry.Type::Sale);
                    // ExciseEntry2.SETRANGE(ExciseEntry2."Document No.", SalesInvLine2."Document No.");
                    // ExciseEntry2.SETRANGE(ExciseEntry2."Item No.", SalesInvLine2."No.");
                    //  ExciseEntry2.SETRANGE(ExciseEntry2."Excise Bus. Posting Group", SalesInvLine2."Excise Bus. Posting Group"); //PCPL-Deepak
                    //ExciseEntry2.SETRANGE(ExciseEntry2."Excise Prod. Posting Group", SalesInvLine2."Excise Prod. Posting Group"); //PCPL-Deepak
                    /*
                    IF ExciseEntry2.FINDFIRST THEN BEGIN
                        IF (SalesInvLine2."Direct Debit To PLA / RG" = TRUE) THEN BEGIN
                            BEDA := ExciseEntry2."BED Amount";
                            ECESSA := ExciseEntry2."eCess Amount";
                            //MESSAGE('%1',ECESSP);
                            SHECESSA := ExciseEntry2."SHE Cess Amount";
                            //MESSAGE('%1',SHECESSP);
                            SHADC := ExciseEntry2."ADC VAT Amount";
                            AT2 := BEDA + ECESSA + SHECESSA + SHADC;
                            SIHBEDAMT := 0;
                            SIHADCVAT := 0;
                            SIHECESSAMT := 0;
                            SIHSHEECESS := 0;
                            SIHEXCISEAMT := 0;
                            PER := 0;

                        END;
                    END;
                    */ //PCPL/NSW/MIG 05Aug22
                END;
                //END;





                /*
                //GUNJAN-START
                AT2:=0;
                REC_SALES_INVOICE_HEADER.RESET;
                REC_SALES_INVOICE_HEADER.SETRANGE(REC_SALES_INVOICE_HEADER."No.","Sales Invoice Line"."Document No.");
                IF REC_SALES_INVOICE_HEADER.FINDFIRST THEN BEGIN
                  IF REC_SALES_INVOICE_HEADER."Export Document"=TRUE THEN
                  BEGIN
                    AT2 :=SIHBEDAMT+ SIHADCVAT+ SIHECESSAMT+ SIHSHEECESS;
                    SIHBEDAMT:=0;
                    SIHADCVAT:=0;
                    SIHECESSAMT:=0;
                    SIHSHEECESS:=0;
                    SIHEXCISEAMT:=0;
                    SIHEXEPER:=0;
                  END;
                END;
                //GUNJAN-END
                */

                SIH.RESET;
                SIH.SETRANGE(SIH."No.", "Sales Invoice Line"."Document No.");
                IF SIH.FINDFIRST THEN;
                SILName := SIH."Sell-to Customer Name";


                //IF PG.GET("Product Group Code") THEN;
                IF IC.GET("Item Category Code") THEN;

                IF IPG.GET("Sales Invoice Line"."Posting Group") THEN
                    SILDES := IPG.Description;

                //IF "Sales Invoice Line".Amount <>0 THEN
                //SIL_EXPER := "Sales Invoice Line"."Excise Amount"/"Sales Invoice Line".Amount*100;

                Sales_IH.RESET;
                Sales_IH.SETRANGE(Sales_IH."No.", "Sales Invoice Line"."Document No.");
                IF Sales_IH.FINDFIRST THEN BEGIN
                    SIL_FormC := '';//Sales_IH."Form Code"; //PCPL/NSW/MIG 05Aug22
                    SIL_FormNo := '';//Sales_IH."Form No."; //PCPL/NSW/MIG 05Aug22
                    SIL_LRNo := Sales_IH."LR/RR No.";
                    SIL_LRDate := Sales_IH."LR/RR Date";
                    SIL_CurrencyCode := Sales_IH."Currency Code";
                    // CFORMDATE := Sales_IH."C form Date";
                    SIL_SCODE := Sales_IH."Shipping Agent Code";
                END;

                CLEAR(SIL_Transporter);
                CLEAR(SIL_SCODE);

                Sales_IH.RESET;
                Sales_IH.SETRANGE(Sales_IH."No.", "Sales Invoice Line"."Document No.");
                IF Sales_IH.FINDFIRST THEN BEGIN
                    SIL_SCODE := Sales_IH."Shipping Agent Code";
                    IF SAC.GET(SIL_SCODE) THEN
                        SIL_Transporter := SAC.Name;
                END;
                //--  sanjay start
                Rec_Cust.RESET;
                Rec_Cust.SETRANGE(Rec_Cust."No.", "Sales Invoice Line"."Sell-to Customer No.");
                IF Rec_Cust.FINDFIRST THEN BEGIN

                    CustCountry := Rec_Cust."Country/Region Code";

                    CountryDeatails.RESET;
                    CountryDeatails.SETRANGE(CountryDeatails.Code, Rec_Cust."Country/Region Code");
                    IF CountryDeatails.FINDFIRST THEN BEGIN
                        CustCountry2 := CountryDeatails.Name;
                    END;

                    IF BillCust.GET("Sales Invoice Header"."Bill-to Customer No.") THEN;

                    Saletype := Rec_Cust."Customer Posting Group";
                END;
                /*
                CountryDeatails.RESET;
                CountryDeatails.SETRANGE(CountryDeatails.Code,rec_sales_inv_head."Sell-to County");
                IF CountryDeatails.FINDFIRST THEN BEGIN
                 CustCountry :=CountryDeatails.Name;
                 END;
                
                 */

                //-- sanjay end

                Rec_Cust.RESET;
                Rec_Cust.SETRANGE(Rec_Cust."No.", "Sales Invoice Line"."Sell-to Customer No.");
                IF Rec_Cust.FINDFIRST THEN
                    C_CST := '';//Rec_Cust."C.S.T. No."; //PCPL/NSW/MIG 05Aug22
                C_VAT := '';//Rec_Cust."T.I.N. No."; //PCPL/NSW/MIG 05Aug22

                amt_ty := 0;
                rec_sales_inv_line.RESET;
                //rec_sales_inv_line.SETRANGE(rec_sales_inv_line."Document No.",rec_sales_inv_head."No.");
                rec_sales_inv_line.SETRANGE(rec_sales_inv_line."Document No.", "Document No.");
                IF rec_sales_inv_line.FINDFIRST THEN
                    REPEAT
                        IF rec_sales_inv_line.Type = rec_sales_inv_line.Type::"G/L Account" THEN
                            amt_ty += rec_sales_inv_line."Line Amount";
                    UNTIL rec_sales_inv_line.NEXT = 0;

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
                    field(SIL; SIL)
                    {
                        Caption = 'InvoiceLine';

                        trigger OnValidate();
                        begin
                            IF (CML = TRUE) OR (SSL = TRUE) OR (RSL = TRUE) OR (Summary = TRUE) THEN BEGIN
                                SIL := FALSE;
                                ERROR('Select only One at a time');
                            END;
                        end;
                    }
                    field(Summary; Summary)
                    {
                        Caption = 'Summary';
                        Visible = false;

                        trigger OnValidate();
                        begin
                            IF (RSL = TRUE) OR (SSL = TRUE) OR (SIL = TRUE) OR (CML = TRUE) THEN BEGIN
                                Summary := FALSE;
                                ERROR('Select only One at a time');
                            END;
                        end;
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage();
        begin
            SIL := TRUE; //PCPL50
        end;
    }

    labels
    {
    }

    trigger OnPreReport();
    begin
        CountryName := "Sales Invoice Line".GETFILTER("Location Code");

        PeriodTex := "Sales Invoice Line".GETFILTER("Posting Date");
    end;

    var
        SSH: Record "Sales Shipment Header";
        SSHNAME: Text[100];
        SSL: Boolean;
        SIL: Boolean;
        RSL: Boolean;
        CML: Boolean;
        SIH: Record "Sales Invoice Header";
        SILName: Text[100];
        RSH: Record "Return Shipment Header";
        RSLNAME: Text[100];
        CMH: Record "Sales Cr.Memo Header";
        CMHNAME: Text[100];
        comprec: Record "Company Information";
        IC: Record "Item Category";
        ICDesShp: Text[30];
        IPG: Record "Inventory Posting Group";
        SLDES: Text[100];
        // PG: Record "Product Group";
        SILDES: Text[100];
        RSLDES: Text[100];
        CMLDES: Text[100];
        SIL_EXPER: Decimal;
        CML_EXPER: Decimal;
        Sale_SH: Record "Sales Shipment Header";
        FORMC: Code[60];
        FORMNO: Code[60];
        Sales_IH: Record "Sales Invoice Header";
        SIL_FormNo: Code[60];
        SIL_FormC: Code[60];
        Retrun_SH: Record "Return Shipment Header";
        RSL_FORMC: Code[60];
        RSL_FormNo: Code[60];
        Sales_CMH: Record "Sales Cr.Memo Header";
        SCML_FormC: Code[60];
        SCML_FormNo: Code[20];
        SSL_LRNO: Code[20];
        SSL_LRDate: Date;
        SIL_LRNo: Code[20];
        SIL_LRDate: Date;
        RSL_LRNo: Code[20];
        RSL_LRDate: Date;
        SCML_LRNo: Code[20];
        SCML_LRDate: Date;
        SAC: Record "Shipping Agent";
        SHL_Transporter: Text[100];
        SCODE: Code[20];
        SIL_SCODE: Code[20];
        SIL_Transporter: Text[100];
        RSL_SCODE: Code[20];
        RSL_Transporter: Text[100];
        CML_Transporter: Text[100];
        CML_SCODE: Code[20];
        Summary: Boolean;
        SIL_CurrencyCode: Code[20];
        SCML_CurrencyCode: Code[20];
        EXPER: Decimal;
        RSL_EXPER: Decimal;
        sum1: Boolean;
        Sum2: Boolean;
        sum3: Boolean;
        sum4: Boolean;
        Rec_Cust: Record Customer;
        cust_CST: Code[20];
        cust_VAT: Code[20];
        C_CST: Code[20];
        C_VAT: Code[20];
        RSL_VAT: Code[20];
        RSL_CST: Code[20];
        CMH_VAT: Code[20];
        CMH_CST: Code[20];
        Rec_ShipLine: Record "Sales Shipment Line";
        Rec_ShipHeader: Record "Sales Shipment Header";
        CF: Decimal;
        UPLCY: Decimal;
        Amt: Decimal;
        BEDAMT: Decimal;
        ADCVAT: Decimal;
        ECESSAMT: Decimal;
        SHEECESS: Decimal;
        EXCISEAMT: Decimal;
        Rec_SIH: Record "Sales Invoice Header";
        SIHCF: Decimal;
        SIHUPLCY: Decimal;
        SIHAmt: Decimal;
        SIHBEDAMT: Decimal;
        SIHADCVAT: Decimal;
        SIHTDSAMT: Decimal;
        SIHECESSAMT: Decimal;
        SIHSHEECESS: Decimal;
        SIHEXCISEAMT: Decimal;
        SIHTAXAMT: Decimal;
        SIHSERVCETAXAMT: Decimal;
        SIHATC: Decimal;
        SIHCTC: Decimal;
        Rec_RSH: Record "Return Shipment Header";
        RSHCF: Decimal;
        RSHUPLCY: Decimal;
        RSHBEDAMT: Decimal;
        RSHADCVAT: Decimal;
        RSHAmt: Decimal;
        RSHSHEECESS: Decimal;
        RSHECESSAMT: Decimal;
        RSHEXCISEAMT: Decimal;
        RSHTAXAMT: Decimal;
        Rec_CMH: Record "Sales Cr.Memo Header";
        CMHCF: Decimal;
        CMHUPLCY: Decimal;
        CMHAmt: Decimal;
        CMHBEDAMT: Decimal;
        CMHADCVAT: Decimal;
        CMHECESSAMT: Decimal;
        CMHSHEECESS: Decimal;
        CMHEXCISEAMT: Decimal;
        CMHTAXAMT: Decimal;
        CMHSERVCETAXAMT: Decimal;
        CMHATC: Decimal;
        CMHCTC: Decimal;
        CMHTDSAMT: Decimal;
        SIHEXEPER: Decimal;
        RSHEXEPER: Decimal;
        CMHEXEPER: Decimal;
        EXEPER: Decimal;
        CFORMDATE: Date;
        REC_SALES_SHIPMENT_HEADER: Record "Sales Shipment Header";
        AT: Decimal;
        REC_SALES_INVOICE_HEADER: Record "Sales Invoice Header";
        AT2: Decimal;
        REC_SALES_CREDIT_MEMO_HEADER: Record "Sales Cr.Memo Header";
        AT4: Decimal;
        rec_sales_inv_head: Record "Sales Invoice Header";
        rec_sales_inv_line: Record "Sales Invoice Line";
        amt_ty: Decimal;
        rec_sales_credit_memo_line: Record "Sales Cr.Memo Line";
        amt_ty2: Decimal;

        BEDP: Decimal;
        ECESSP: Decimal;
        SHECESSP: Decimal;
        PER: Decimal;
        SSBEDP: Decimal;
        SSECESSP: Decimal;
        SSSHECESSP: Decimal;
        SSPER: Decimal;

        RSBEDP: Decimal;
        RSECESSP: Decimal;
        RSSHECESSP: Decimal;
        RSPER: Decimal;
        // RSEPS: Record "Excise Posting Setup";
        SCMBEDP: Decimal;
        SCMECESSP: Decimal;
        SCMSHECESSP: Decimal;
        SCMPER: Decimal;
        // SCMEPS: Record "Excise Posting Setup";
        SalesInvLine1: Record "Sales Invoice Line";
        //ExciseEntry: Record "Excise Entry";
        SalesshpLine1: Record "Sales Shipment Line";
        returnship1: Record "Return Shipment Line";
        SalescrmLine1: Record "Sales Cr.Memo Line";
        // ExciseEntry2: Record "Excise Entry";
        SalesInvLine2: Record "Sales Invoice Line";
        BEDA: Decimal;
        ECESSA: Decimal;
        SHECESSA: Decimal;
        SHADC: Decimal;
        AMTCUS: Decimal;
        CustCountry: Text[50];
        Saletype: Text[15];
        PeriodTex: Text[30];
        CountryName: Text[30];
        LocationName: Text[15];
        CountryDeatails: Record "Country/Region";
        CustCountry2: Text[30];
        RecItem: Record Item;
        ItemDescription: Text[100];
        // ExportOrder: Record "Posted Export Payment Terms";
        BIllOfLadinno: Text;
        Billofladindate: Date;
        SHBLno: Text;
        SHBLDate: Date;
        SalesInvoiceHeader: Record "Sales Invoice Header";
        PaymentTerms: Record "Payment Terms";
        BillCust: Record Customer;
        VarPaymentDes: Text[100];
        VarBankRefNo: Text[50];
        countrycode1: Code[50];
        countrycode: Code[50];
        RecCountry: Record "Country/Region";
        ShipmentMethod: Record "Shipment Method";
        SalesHeader: Record "Sales Header";
        recGLAccount: Record "G/L Account";
        ItemDescription1: Code[30];
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        GSTPer: Decimal;
        CGSTAmount: Decimal;
        IGSTAmount: Decimal;
        RecVendLdgrEntry: Record "Vendor Ledger Entry";
        CommisionAmt: Decimal;
        SalesCrMemoHead: Record "Sales Cr.Memo Header";
        Customer1: Record Customer;
        CountryRegion1: Record "Country/Region";
        SIHCF_cr: Decimal;
        SIHUPLCY_cr: Decimal;
        SIHAmt_cr: Decimal;
        SIHBEDAMT_cr: Decimal;
        SIHADCVAT_cr: Decimal;
        SIHTDSAMT_cr: Decimal;
        SIHECESSAMT_cr: Decimal;
        SIHSHEECESS_cr: Decimal;
        SIHEXCISEAMT_cr: Decimal;
        SIHTAXAMT_cr: Decimal;
        SIHSERVCETAXAMT_cr: Decimal;
        SIHATC_cr: Decimal;
        SIHCTC_cr: Decimal;
        GSTPer_cr: Decimal;
        CGSTAmount_cr: Decimal;
        IGSTAmount_cr: Decimal;
        SGSTAmount_cr: Decimal;
        CommisionAmt_Cr: Decimal;
        VendorName: Text;
        Vendor_: Record Vendor;
        Ship_toName: Text;
        ShiptoAddress: Record "Ship-to Address";
}

