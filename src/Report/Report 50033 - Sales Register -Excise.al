report 50033 "Sales Register -Excise"
{
    // version KAR 1.0

    // Report Name:Sales Register
    // Company:KAPL
    // Prepared By: Gunjan Mittal
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Sales Register -Excise.rdl';
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

            // trigger OnAfterGetRecord();
            // begin
            //     comprec.SETRANGE(comprec.Name);
            //     IF comprec.FIND('-') THEN
            // end;
        }
        dataitem("Sales Shipment Line"; "Sales Shipment Line")
        {
            DataItemTableView = WHERE(Quantity = FILTER(<> 0));
            column(CF; CF)
            {
            }
            column(cust_CST; cust_CST)
            {
            }
            column(cust_VAT; cust_VAT)
            {
            }
            column(sum1; sum1)
            {
            }
            column(SSL_ADCVAT; ADCVAT)
            {
            }
            column(SSL_Postingdate; "Sales Shipment Line"."Posting Date")
            {
            }
            column(SSL_DocNo; "Sales Shipment Line"."Document No.")
            {
            }
            column(SSL_LineNo; "Sales Shipment Line"."No.")
            {
            }
            column(SHL_Description; "Sales Shipment Line".Description)
            {
            }
            column(SSL_Quantity; "Sales Shipment Line".Quantity)
            {
            }
            column(SSL_UOM; "Sales Shipment Line"."Unit of Measure")
            {
            }
            column(SSL_UP; UPLCY)
            {
            }
            column(SSL_Amount; Amt)
            {
            }
            column(SSl_BEDAmount; BEDAMT)
            {
            }
            column(SSL_ecessAmount; ECESSAMT)
            {
            }
            column(SSL_SheAmount; SHEECESS)
            {
            }
            column(SSL_ExciseAmount; EXCISEAMT)
            {
            }
            column(SSL_TaxPercentage; 0)// "Sales Shipment Line"."Tax %") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(SSL_Dim1; "Sales Shipment Line"."Shortcut Dimension 1 Code")
            {
            }
            column(SSL_Dim2; "Sales Shipment Line"."Shortcut Dimension 2 Code")
            {
            }
            column(SSL_Discount; "Sales Shipment Line"."Line Discount %")
            {
            }
            column(SSHNAME; SSHNAME)
            {
            }
            column(ICDesShp; IC.Description)
            {
            }
            column(PG_DesShp; '')//' PG.Description)  //PCPL/NSW/MIG  03Aug22
            {
            }
            column(SSL_CurrencyCode; "Sales Shipment Line"."Currency Code")
            {
            }
            column(SLDES; SLDES)
            {
            }
            column(FORMC; FORMC)
            {
            }
            column(FORMNO; FORMNO)
            {
            }
            column(SSL_LRNO; SSL_LRNO)
            {
            }
            column(SSL_LRDate; SSL_LRDate)
            {
            }
            column(SHL_Transporter; SHL_Transporter)
            {
            }
            column(EXPER; EXEPER)
            {
            }

            trigger OnAfterGetRecord();
            begin
                SSBEDP := 0;
                SSECESSP := 0;
                SSSHECESSP := 0;
                SSPER := 0;
                IF Type = Type::Item THEN BEGIN
                    SalesshpLine1.RESET;
                    //SalesInvLine1.SETRANGE(SalesInvLine1.Type,SalesInvLine1.Type::Item);
                    SalesshpLine1.SETRANGE(SalesshpLine1."Document No.", "Document No.");
                    IF SalesshpLine1.FINDFIRST THEN BEGIN
                        /* //PCPL/NSW/MIG  03Aug22
                        ExciseEntry.RESET;
                        ExciseEntry.SETRANGE(ExciseEntry."Document Type", ExciseEntry."Document Type"::Invoice);
                        //ExciseEntry.SETRANGE(ExciseEntry.Type,ExciseEntry.Type::Sale);
                        ExciseEntry.SETRANGE(ExciseEntry."Document No.", SalesshpLine1."Document No.");
                        ExciseEntry.SETRANGE(ExciseEntry."Item No.", SalesshpLine1."No.");
                        //ExciseEntry.SETRANGE(ExciseEntry."Excise Bus. Posting Group", SalesshpLine1."Excise Bus. Posting Group"); //PCPL/NSW/MIG  03Aug22
                        //ExciseEntry.SETRANGE(ExciseEntry."Excise Prod. Posting Group", SalesshpLine1."Excise Prod. Posting Group"); //PCPL/NSW/MIG  03Aug22
                        IF ExciseEntry.FINDFIRST THEN BEGIN
                            IF SalesshpLine1."Excise Amount" <> 0 THEN BEGIN
                                SSBEDP := ExciseEntry."BED %";
                                SSECESSP := (ExciseEntry."BED %" * ExciseEntry."eCess %") / 100;
                                //MESSAGE('%1',ECESSP);
                                SSSHECESSP := (ExciseEntry."BED %" * ExciseEntry."SHE Cess %") / 100;
                                //MESSAGE('%1',SHECESSP);
                                SSPER := SSBEDP + SSECESSP + SSSHECESSP;
                            END;
                        END;
                        *///PCPL/NSW/MIG  03Aug22
                    END;
                END;



                //GUNJAN-START
                Rec_ShipHeader.RESET;
                Rec_ShipHeader.SETRANGE(Rec_ShipHeader."No.", "Sales Shipment Line"."Document No.");
                IF Rec_ShipHeader.FINDFIRST THEN
                    CF := Rec_ShipHeader."Currency Factor";

                IF CF <> 0 THEN BEGIN
                    UPLCY := "Sales Shipment Line"."Unit Price" / CF;
                    Amt := ("Sales Shipment Line".Quantity * "Sales Shipment Line"."Unit Price") / CF;
                    BEDAMT := 0;//"Sales Shipment Line"."BED Amount" / CF; //PCPL/NSW/MIG  03Aug22
                    ADCVAT := 0;//"Sales Shipment Line"."ADC VAT Amount" / CF; //PCPL/NSW/MIG  03Aug22
                    ECESSAMT := 0;// "Sales Shipment Line"."eCess Amount" / CF; //PCPL/NSW/MIG  03Aug22
                    SHEECESS := 0;// "Sales Shipment Line"."SHE Cess Amount" / CF; //PCPL/NSW/MIG  03Aug22
                    EXCISEAMT := 0;//"Sales Shipment Line"."Excise Amount" / CF; //PCPL/NSW/MIG  03Aug22
                    EXEPER := SSPER / CF;
                END
                ELSE BEGIN
                    UPLCY := "Sales Shipment Line"."Unit Price";
                    Amt := ("Sales Shipment Line".Quantity * "Sales Shipment Line"."Unit Price");
                    BEDAMT := 0;//"Sales Shipment Line"."BED Amount"; //PCPL/NSW/MIG  03Aug22
                    ADCVAT := 0;//"Sales Shipment Line"."ADC VAT Amount"; //PCPL/NSW/MIG  03Aug22
                    ECESSAMT := 0;//"Sales Shipment Line"."eCess Amount"; 
                    SHEECESS := 0;//"Sales Shipment Line"."SHE Cess Amount"; //PCPL/NSW/MIG  03Aug22
                    EXCISEAMT := 0;//"Sales Shipment Line"."Excise Amount"; //PCPL/NSW/MIG  03Aug22
                    EXEPER := SSPER;
                END;
                //GUNJAN-END




                //Gunjan-Start

                //IF SSH.GET("Sales Shipment Line"."No.") THEN
                SSH.RESET;
                SSH.SETRANGE(SSH."No.", "Sales Shipment Line"."Document No.");
                IF SSH.FINDFIRST THEN
                    SSHNAME := SSH."Sell-to Customer Name";

                //IF PG.GET("Product Group Code") THEN;
                IF IC.GET("Item Category Code") THEN;

                //IF IC.GET("Sales Shipment Line"."No.") THEN
                //ICDesShp := IC.Description;

                IF IPG.GET("Sales Shipment Line"."Posting Group") THEN
                    SLDES := IPG.Description;

                //IF  ("Sales Shipment Line".Quantity*"Sales Shipment Line"."Unit Price") <>0 THEN
                //EXPER := ("Sales Shipment Line"."Excise Amount"/("Sales Shipment Line".Quantity*"Sales Shipment Line"."Unit Price"))*100;
                //EXPER := SalesLine."Excise Amount"/ "Sales Line".Amount*100;

                Sale_SH.RESET;
                Sale_SH.SETRANGE(Sale_SH."No.", "Sales Shipment Line"."Document No.");
                FORMC := '';//SSH."Form Code"; //PCPL/NSW/MIG  03Aug22
                FORMNO := '';//SSH."Form No."; //PCPL/NSW/MIG  03Aug22
                SSL_LRNO := Sale_SH."LR/RR No.";
                SSL_LRDate := Sale_SH."LR/RR Date";






                CLEAR(SHL_Transporter);
                CLEAR(SCODE);
                Sale_SH.RESET;
                Sale_SH.SETRANGE(Sale_SH."No.", "Sales Shipment Line"."Document No.");
                IF Sale_SH.FINDFIRST THEN BEGIN
                    SCODE := Sale_SH."Shipping Agent Code";
                    IF SAC.GET(SCODE) THEN
                        SHL_Transporter := SAC.Name;
                END;


                SSH.RESET;
                SSH.SETRANGE(SSH."No.", "Sales Shipment Line"."Document No.");
                Rec_Cust.RESET;
                Rec_Cust.SETRANGE(Rec_Cust."No.", SSH."Sell-to Customer No.");
                IF Rec_Cust.FINDFIRST THEN
                    cust_CST := '';//Rec_Cust."C.S.T. No."; //PCPL/NSW/MIG  03Aug22
                cust_VAT := '';//Rec_Cust."T.I.N. No."; //PCPL/NSW/MIG  03Aug22
                //Gunjan-End
            end;

            trigger OnPreDataItem();
            begin
                //Gunjan


                IF Summary = TRUE THEN
                    sum1 := TRUE
                ELSE
                    sum1 := FALSE;

                IF Summary = TRUE THEN
                    Sum2 := TRUE
                ELSE
                    Sum2 := FALSE;

                IF Summary = TRUE THEN
                    sum3 := TRUE
                ELSE
                    sum3 := FALSE;

                IF Summary = TRUE THEN
                    sum4 := TRUE
                ELSE
                    sum4 := FALSE;
            end;
        }
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            DataItemTableView = WHERE("No." = FILTER(<> 144900),
                                      Quantity = FILTER(<> 0));
            column(SIHEXEPER; SIHEXEPER)
            {
            }
            column(PER; PER)
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
            column(PG_DesSIL; '')//PG.Description) //PCPL/NSW/MIG  03Aug22
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
            column(SIL_Quantity; "Sales Invoice Line".Quantity)
            {
            }
            column(SIL_UOM; "Sales Invoice Line"."Unit of Measure")
            {
            }
            column(SIL_EChapterNo; '')//"Sales Invoice Line"."Excise Prod. Posting Group") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(Sale_Type; "Sales Invoice Line"."Gen. Bus. Posting Group")
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
            column(SIL_TaxPer; 0)// "Sales Invoice Line"."Tax %") //PCPL/NSW/MIG  03Aug22
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

            trigger OnAfterGetRecord();
            begin

                BEDP := 0;
                ECESSP := 0;
                SHECESSP := 0;
                PER := 0;
                IF Type = Type::Item THEN BEGIN
                    /*
                        ExciseEntry.RESET;
                        ExciseEntry.SETRANGE(ExciseEntry."Document Type", ExciseEntry."Document Type"::Invoice);
                        //ExciseEntry.SETRANGE(ExciseEntry.Type,ExciseEntry.Type::Sale);
                        ExciseEntry.SETRANGE(ExciseEntry."Document No.", "Document No.");
                        ExciseEntry.SETRANGE(ExciseEntry."Item No.", "No.");
                        //ExciseEntry.SETRANGE(ExciseEntry."Excise Bus. Posting Group", "Excise Bus. Posting Group");
                        //ExciseEntry.SETRANGE(ExciseEntry."Excise Prod. Posting Group", "Excise Prod. Posting Group");
                        IF ExciseEntry.FINDFIRST THEN BEGIN
                            IF "Excise Amount" <> 0 THEN BEGIN
                                BEDP := ExciseEntry."BED %";
                                ECESSP := (ExciseEntry."BED %" * ExciseEntry."eCess %") / 100;
                                //MESSAGE('%1',ECESSP);
                                SHECESSP := (ExciseEntry."BED %" * ExciseEntry."SHE Cess %") / 100;
                                //MESSAGE('%1',SHECESSP);
                                PER := BEDP + ECESSP + SHECESSP;
                            END;
                        END;
                        */
                END;





                //GUNJAN-START
                Rec_SIH.RESET;
                Rec_SIH.SETRANGE(Rec_SIH."No.", "Sales Invoice Line"."Document No.");
                IF Rec_SIH.FINDFIRST THEN BEGIN
                    SIHCF := Rec_SIH."Currency Factor";
                    IF SIHCF <> 0 THEN BEGIN
                        SIHUPLCY := "Sales Invoice Line"."Unit Price" / SIHCF;
                        SIHAmt := ("Sales Invoice Line".Quantity * "Sales Invoice Line"."Unit Price") / SIHCF;
                        SIHBEDAMT := 0;//"Sales Invoice Line"."BED Amount" / SIHCF; //PCPL/NSW/MIG  03Aug22
                        SIHADCVAT := 0;//"Sales Invoice Line"."ADE Amount" / SIHCF; //PCPL/NSW/MIG  03Aug22
                        SIHECESSAMT := 0;// "Sales Invoice Line"."eCess Amount" / SIHCF; //PCPL/NSW/MIG  03Aug22
                        SIHSHEECESS := 0;//"Sales Invoice Line"."SHE Cess Amount" / SIHCF; //PCPL/NSW/MIG  03Aug22
                        SIHEXCISEAMT := 0;//"Sales Invoice Line"."Excise Amount" / SIHCF; //PCPL/NSW/MIG  03Aug22
                        SIHTAXAMT := 0;//"Sales Invoice Line"."Tax Amount" / SIHCF; //PCPL/NSW/MIG  03Aug22
                        SIHSERVCETAXAMT := 0;// "Sales Invoice Line"."Service Tax Amount" / SIHCF; //PCPL/NSW/MIG  03Aug22
                        /*IF Rec_SIH."Export Document"=TRUE THEN
                          SIHATC :="Sales Invoice Line".Amount/SIHCF
                        ELSE
                          SIHATC :="Sales Invoice Line"."Amount To Customer"/SIHCF; */
                        SIHCTC := 0;//"Sales Invoice Line"."Charges To Customer" / SIHCF; //PCPL/NSW/MIG  03Aug22
                        SIHTDSAMT := 0;//"Sales Invoice Line"."TDS/TCS Amount" / SIHCF; //PCPL/NSW/MIG  03Aug22
                        //SIHEXEPER :=PER/SIHCF;
                    END
                    ELSE BEGIN
                        SIHUPLCY := "Sales Invoice Line"."Unit Price";
                        SIHAmt := ("Sales Invoice Line".Quantity * "Sales Invoice Line"."Unit Price");
                        SIHBEDAMT := 0;//"Sales Invoice Line"."BED Amount"; //PCPL/NSW/MIG  03Aug22
                        SIHADCVAT := 0;//"Sales Invoice Line"."ADE Amount"; //PCPL/NSW/MIG  03Aug22
                        SIHECESSAMT := 0;//"Sales Invoice Line"."eCess Amount"; //PCPL/NSW/MIG  03Aug22
                        SIHSHEECESS := 0;//"Sales Invoice Line"."SHE Cess Amount"; //PCPL/NSW/MIG  03Aug22
                        SIHEXCISEAMT := 0;//"Sales Invoice Line"."Excise Amount"; //PCPL/NSW/MIG  03Aug22
                        SIHTAXAMT := 0;//"Sales Invoice Line"."Tax Amount"; //PCPL/NSW/MIG  03Aug22
                        SIHSERVCETAXAMT := 0;//"Sales Invoice Line"."Service Tax Amount"; //PCPL/NSW/MIG  03Aug22
                        /*IF Rec_SIH."Export Document"=TRUE THEN
                          SIHATC :="Sales Invoice Line".Amount
                        ELSE
                          SIHATC :="Sales Invoice Line"."Amount To Customer";
                        */
                        SIHCTC := 0;//"Sales Invoice Line"."Charges To Customer"; //PCPL/NSW/MIG  03Aug22
                        SIHTDSAMT := 0;//"Sales Invoice Line"."TDS/TCS Amount"; //PCPL/NSW/MIG  03Aug22
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
                /*
                SalesInvLine2.RESET;
                //SalesInvLine1.SETRANGE(SalesInvLine1.Type,SalesInvLine1.Type::Item);
                SalesInvLine2.SETRANGE(SalesInvLine2."Document No.", "Document No.");

                IF SalesInvLine2.FINDFIRST THEN BEGIN
                    ExciseEntry2.RESET;
                    ExciseEntry2.SETRANGE(ExciseEntry2."Document Type", ExciseEntry."Document Type"::Invoice);
                    //ExciseEntry.SETRANGE(ExciseEntry.Type,ExciseEntry.Type::Sale);
                    ExciseEntry2.SETRANGE(ExciseEntry2."Document No.", SalesInvLine2."Document No.");
                    ExciseEntry2.SETRANGE(ExciseEntry2."Item No.", SalesInvLine2."No.");
                   // ExciseEntry2.SETRANGE(ExciseEntry2."Excise Bus. Posting Group", SalesInvLine2."Excise Bus. Posting Group");
                   // ExciseEntry2.SETRANGE(ExciseEntry2."Excise Prod. Posting Group", SalesInvLine2."Excise Prod. Posting Group");
                    IF ExciseEntry2.FINDFIRST THEN BEGIN
                        //IF (SalesInvLine2."Direct Debit To PLA / RG" = TRUE) THEN BEGIN
                            BEDA := ExciseEntry2."BED Amount";
                            ECESSA := ExciseEntry2."eCess Amount";
                            //MESSAGE('%1',ECESSP);
                            SHECESSA := ExciseEntry2."SHE Cess Amount";
                            //MESSAGE('%1',SHECESSP);
                            SHADC := ExciseEntry2."ADE Amount";
                            AT2 := BEDA + ECESSA + SHECESSA + SHADC;
                            SIHBEDAMT := 0;
                            SIHADCVAT := 0;
                            SIHECESSAMT := 0;
                            SIHSHEECESS := 0;
                            SIHEXCISEAMT := 0;
                            PER := 0;

                       // END;
                    END;
                END;
                */
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
                    SIL_FormC := '';//Sales_IH."Form Code"; //PCPL/NSW/MIG  03Aug22
                    SIL_FormNo := '';// Sales_IH."Form No."; //PCPL/NSW/MIG  03Aug22
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

                Rec_Cust.RESET;
                Rec_Cust.SETRANGE(Rec_Cust."No.", "Sales Invoice Line"."Sell-to Customer No.");
                IF Rec_Cust.FINDFIRST THEN
                    C_CST := '';//Rec_Cust."C.S.T. No."; //PCPL/NSW/MIG  03Aug22
                C_VAT := '';//Rec_Cust."T.I.N. No."; //PCPL/NSW/MIG  03Aug22

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
                group(Control0001)
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
    }

    labels
    {
    }

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
        //PG: Record "Product Group";
        SILDES: Text[100];
        RSLDES: Text[100];
        CMLDES: Text[100];
        SIL_EXPER: Decimal;
        CML_EXPER: Decimal;
        Sale_SH: Record "Sales Shipment Header";
        FORMC: Code[20];
        FORMNO: Code[60];
        Sales_IH: Record "Sales Invoice Header";
        SIL_FormNo: Code[60];
        SIL_FormC: Code[20];
        Retrun_SH: Record "Return Shipment Header";
        RSL_FORMC: Code[20];
        RSL_FormNo: Code[60];
        Sales_CMH: Record "Sales Cr.Memo Header";
        SCML_FormC: Code[20];
        SCML_FormNo: Code[60];
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
        // EBPG: Record "Excise Bus. Posting Group";
        // EPPG: Record "Excise Prod. Posting Group";
        // EPS: Record "Excise Posting Setup";
        BEDP: Decimal;
        ECESSP: Decimal;
        SHECESSP: Decimal;
        PER: Decimal;
        SSBEDP: Decimal;
        SSECESSP: Decimal;
        SSSHECESSP: Decimal;
        SSPER: Decimal;
        // SSEPS: Record "Excise Posting Setup";
        RSBEDP: Decimal;
        RSECESSP: Decimal;
        RSSHECESSP: Decimal;
        RSPER: Decimal;
        //RSEPS: Record "Excise Posting Setup";
        SCMBEDP: Decimal;
        SCMECESSP: Decimal;
        SCMSHECESSP: Decimal;
        SCMPER: Decimal;
        //SCMEPS: Record "Excise Posting Setup";
        SalesInvLine1: Record "Sales Invoice Line";
        //ExciseEntry: Record "Excise Entry";
        SalesshpLine1: Record "Sales Shipment Line";
        returnship1: Record "Return Shipment Line";
        SalescrmLine1: Record "Sales Cr.Memo Line";
        //ExciseEntry2: Record "Excise Entry";
        SalesInvLine2: Record "Sales Invoice Line";
        BEDA: Decimal;
        ECESSA: Decimal;
        SHECESSA: Decimal;
        SHADC: Decimal;
        AMTCUS: Decimal;
}

