report 50019 "Purchase Register"
{
    // version KAR 1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Purchase Register.rdl';

    dataset
    {
        dataitem(Integer; Integer)
        {
            MaxIteration = 1;
            column(Comname; CompInfo.Name)
            {
            }
            column(add; CompInfo.Address)
            {
            }
            column(add2; CompInfo."Address 2")
            {
            }
            column(city; CompInfo.City)
            {
            }
            column(ReceiptHeader; ReceiptHeader)
            {
            }
            column(InvHeader; InvHeader)
            {
            }
            column(CreditmemoHeader; CreditmemoHeader)
            {
            }
            column(ShipmentHeader; ShipmentHeader)
            {
            }
            column(Summary; Summary)
            {
            }

            // trigger OnAfterGetRecord();
            // begin
            //     //BlnEdit:=TRUE;
            //     IF Summary = TRUE THEN BEGIN
            //         sum1 := TRUE;
            //         sum2 := TRUE;
            //     END
            //     ELSE BEGIN
            //         sum1 := FALSE;
            //         sum2 := FALSE;
            //     END;

            //     CompInfo.SETRANGE(CompInfo.Name);
            //     IF CompInfo.FIND('-') THEN
            // end;
        }
        dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
        {
            DataItemTableView = WHERE(Type = FILTER(<> ' '));
            RequestFilterFields = "Posting Date";
            column(PRH_VSN; PRH."Vendor Shipment No.")
            {
            }
            column(RequestedReceiptDate_PurchRcptLine; "Purch. Rcpt. Line"."Requested Receipt Date")
            {
            }
            column(PRH_DocDate; FORMAT(PRH."Document Date"))
            {
            }
            column(PRH_VRN; PRH."VAT Registration No.")
            {
            }
            column(T_I_C; PRH."Total Import Charges")
            {
            }
            column(sum1; sum1)
            {
            }
            column(PRL_CL_sum1; sum1)
            {
            }
            column(ln; "Purch. Rcpt. Line"."Line No.")
            {
            }
            column(PR_PG; '')//PG.Description) //PCPL/NSW/MIG  03Aug22
            {
            }
            column(PR_IC; IC.Description)
            {
            }
            column(PR_Postingdate; "Purch. Rcpt. Line"."Posting Date")
            {
            }
            column(PR_No; "Purch. Rcpt. Line"."Document No.")
            {
            }
            column(PR_VendorNo; Vendor.Name)
            {
            }
            column(PR_ItemNo; "Purch. Rcpt. Line"."No.")
            {
            }
            column(PR_ItemDesc; "Purch. Rcpt. Line".Description)
            {
            }
            column(PR_CurrCode; "Purch. Rcpt. Line"."Currency Code")
            {
            }
            column(PR_Qty; "Purch. Rcpt. Line".Quantity)
            {
            }
            column(PR_UOM; "Purch. Rcpt. Line"."Unit of Measure")
            {
            }
            column(PR_UnitCost; PRHDUC)
            {
            }
            column(PR_BEDAmt; PRHBEDAMT)
            {
            }
            column(PR_EcessAmt; PRHECESSAMT)
            {
            }
            column(PR_SCessAmt; PRHSHEECESS)
            {
            }
            column(PR_ADCVAT; PRHADCVAT)
            {
            }
            column(PR_TaxPer; '')//"Purch. Rcpt. Line"."Tax %")  //PCPL/NSW/MIG  03Aug22
            {
            }
            column(PR_FormCode; '')//PRH."Form Code") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(PR_FormNo; '')//PRH."Form No.") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(PR_LRNo; PRH."LR No.")
            {
            }
            column(PR_LRDate; PRH."LR Date")
            {
            }
            column(PR_Dim1; PRH."Shortcut Dimension 1 Code")
            {
            }
            column(PR_Dim2; PRH."Shortcut Dimension 2 Code")
            {
            }
            column(PR_Exciseamt; PRHEXCIEAMT)
            {
            }
            column(PR_DiscPer; "Purch. Rcpt. Line"."Line Discount %")
            {
            }
            column(PR_ExcisePer; PRKEXCISEPER)
            {
            }
            column(PRAMT; PRAMT)
            {
            }
            column(ShpAgRcpt; recShipmentAg.Name)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF (Quantity * "Direct Unit Cost") <> 0 THEN
                    PR_ExcisePer := ROUND(1/*"Excise Amount"*/ / (Quantity * "Direct Unit Cost") * 100);

                //GUNJAN-START
                REC_PRH.RESET;
                REC_PRH.SETRANGE(REC_PRH."No.", "Purch. Rcpt. Line"."Document No.");
                IF REC_PRH.FINDFIRST THEN
                    CF := REC_PRH."Currency Factor";

                IF CF <> 0 THEN BEGIN
                    PRHDUC := "Purch. Rcpt. Line"."Unit Cost" / CF;
                    PRHBEDAMT := 0;//"Purch. Rcpt. Line"."BED Amount" / CF; //PCPL/NSW/MIG  03Aug22
                    PRHADCVAT := 0;//"Purch. Rcpt. Line"."ADC VAT Amount" / CF; //PCPL/NSW/MIG  03Aug22
                    PRHECESSAMT := 0;// "Purch. Rcpt. Line"."eCess Amount" / CF; //PCPL/NSW/MIG  03Aug22
                    PRHSHEECESS := 0;//"Purch. Rcpt. Line"."SHE Cess Amount" / CF; //PCPL/NSW/MIG  03Aug22
                    PRHEXCIEAMT := 0;//"Purch. Rcpt. Line"."Excise Amount" / CF; //PCPL/NSW/MIG  03Aug22
                    PRKEXCISEPER := PR_ExcisePer / CF;
                    PRAMT := ("Purch. Rcpt. Line".Quantity * "Purch. Rcpt. Line"."Unit Cost") / CF;
                END
                ELSE BEGIN
                    PRHDUC := "Purch. Rcpt. Line"."Direct Unit Cost";
                    PRHBEDAMT := 0;//"Purch. Rcpt. Line"."BED Amount"; //PCPL/NSW/MIG  03Aug22
                    PRHADCVAT := 0;//"Purch. Rcpt. Line"."ADC VAT Amount"; //PCPL/NSW/MIG  03Aug22
                    PRHECESSAMT := 0;//"Purch. Rcpt. Line"."eCess Amount"; //PCPL/NSW/MIG  03Aug22
                    PRHSHEECESS := 0;//"Purch. Rcpt. Line"."SHE Cess Amount"; //PCPL/NSW/MIG  03Aug22
                    PRHEXCIEAMT := 0;//"Purch. Rcpt. Line"."Excise Amount"; //PCPL/NSW/MIG  03Aug22
                    PRKEXCISEPER := PR_ExcisePer;
                    PRAMT := ("Purch. Rcpt. Line".Quantity * "Purch. Rcpt. Line"."Unit Cost");
                END;
                //GUNJAN-END



                //IF PG.GET("Product Group Code") THEN; //PCPL/NSW/MIG  03Aug22
                IF IC.GET("Item Category Code") THEN;

                PRH.RESET;
                PRH.SETRANGE(PRH."No.", "Document No.");
                IF PRH.FIND('-') THEN
                    //VRN := PRH."VAT Registration No.";
                    Vendor.GET(PRH."Buy-from Vendor No.");
                IF state_.GET(Vendor."State Code") THEN;

                recShipmentAg.RESET;
                recPurchRH.GET("Purch. Rcpt. Line"."Document No.");
            end;
        }
        dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
        {
            column(PIH_DocDate; FORMAT(PIH."Document Date"))
            {
            }
            column(RectNo; RectNo)
            {
            }
            column(ReqrcpDate; ReqrcpDate)
            {
            }
            column(PoNo; PoNo)
            {
            }
            column(PoDate; PoDate)
            {
            }
            column(AppDate; AppDate)
            {
            }
            column(RectDate; RectDate)
            {
            }
            column(PIH_VIN; PIH."Vendor Invoice No.")
            {
            }
            column(PIH_VRN; PIH."VAT Registration No.")
            {
            }
            column(PI_ExcisePer; ROUND(PIEXEPER))
            {
            }
            column(sum2; sum1)
            {
            }
            column(ReceiptNo_PurchInvLine; "Purch. Inv. Line"."Receipt No.")
            {
            }
            column(PIL_CL_SUM2; sum1)
            {
            }
            column(curr_code; PIH."Currency Code")
            {
            }
            column(Location_Invoice; PIH."Location Code")
            {
            }
            column(DueDate_Invoice; FORMAT(PIH."Due Date"))
            {
            }
            column(PaymentTerms_Invoice; PIH."Payment Terms Code")
            {
            }
            column(HSNSACCode_PurchInvLine; "Purch. Inv. Line"."HSN/SAC Code")
            {
            }
            column(AmountToVendor_PurchInvLine; 0)//"Purch. Inv. Line"."Amount To Vendor") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(GSTof_Vendor; Vendor."GST Registration No.")
            {
            }
            column(StateName; recStateSup.Description)
            {
            }
            column(PlaceofSupply; state_."State Code (GST Reg. No.)" + '  ' + state_.Description)
            {
            }
            column(ReversedCharge; IsReversed)
            {
            }
            column(ItemType; "Purch. Inv. Line"."GST Group Type")
            {
            }
            column(GST_VendorType; DetailedGSTLedgerEntry."GST Vendor Type")
            {
            }
            column(IndentDate; IndentDate)
            {
            }
            column(PI_PG; '')//PG.Description) //PCPL/NSW/MIG  03Aug22
            {
            }
            column(PI_IC; IC.Description)
            {
            }
            column(PI_Postingdate; "Purch. Inv. Line"."Posting Date")
            {
            }
            column(PI_No; "Purch. Inv. Line"."Document No.")
            {
            }
            column(OrderDate_POrder; FORMAT(REC_PIH."Order Date"))
            {
            }
            column(DocumentNo_PurhcaseOrder; REC_PIH."No.")
            {
            }
            column(PI_VendorNo; Vendor.Name)
            {
            }
            column(PI_ItemNo; "Purch. Inv. Line"."No.")
            {
            }
            column(PI_ItemDesc; "Purch. Inv. Line".Description)
            {
            }
            column(PI_Qty; "Purch. Inv. Line".Quantity)
            {
            }
            column(PI_UOM; "Purch. Inv. Line"."Unit of Measure")
            {
            }
            column(IndentNo_PurchInvLine; "Purch. Inv. Line"."Indent No.")
            {
            }
            column(GST_PurchInvLine; GSTPer + GSTPer + IGSTPer)
            {
            }
            column(GSTPer; GSTPer)
            {
            }
            column(IGSTPer; IGSTPer)
            {
            }
            column(IGSTAmount; IGSTAmount)
            {
            }
            column(CGSTAmount; CGSTAmount)
            {
            }
            column(PI_UnitCost; PIHDUC)
            {
            }
            column(PI_BEDAmt; PIHBEDAMT)
            {
            }
            column(PI_EcessAmt; PIHECESSAMT)
            {
            }
            column(PI_SCessAmt; PIHSHEECESS)
            {
            }
            column(PI_TaxPer; 0)//"Purch. Inv. Line"."Tax %") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(PI_FormCode; '')// PIH."Form Code") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(PI_FormNo; '')// PIH."Form No.") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(PI_Dim1; PIH."Shortcut Dimension 1 Code")
            {
            }
            column(PI_Dim2; PIH."Shortcut Dimension 2 Code")
            {
            }
            column(PI_ExciseAmt; PIHEXCISEAMT)
            {
            }
            column(PI_TaxAmt; PIHTAXAMT)
            {
            }
            column(PI_Amttovendor; PIHATV)
            {
            }
            column(PI_Chargestovendor; PIHCTV)
            {
            }
            column(PI_TDSAmt; PIHTDS)
            {
            }
            column(PI_ServiceTaxAmt; PIHSTA)
            {
            }
            column(PI_ADCVAT; PIHADCVAT)
            {
            }
            column(PI_DiscAmt; "Purch. Inv. Line"."Line Discount Amount")
            {
            }
            column(PIHAmt; PIHAmt)
            {
            }
            column(ShpAgInv; recShipmentAg.Name)
            {
            }
            column(ImportValue; ImportValue)
            {
            }
            column(GenBusPostingGroup_PurchInvLine; "Purch. Inv. Line"."Gen. Bus. Posting Group")
            {
            }

            trigger OnAfterGetRecord();
            begin
                //GUNJAN-START
                REC_PIH.RESET;
                REC_PIH.SETRANGE(REC_PIH."No.", "Purch. Inv. Line"."Document No.");
                IF REC_PIH.FINDFIRST THEN
                    CF := REC_PIH."Currency Factor";

                //PCPL-25
                CLEAR(PoNo);
                CLEAR(PoDate);
                CLEAR(RectNo);
                CLEAR(RectDate);
                CLEAR(ReqrcpDate);
                recPurchRH.RESET;
                recPurchRH.SETRANGE(recPurchRH."No.", "Purch. Inv. Line"."Receipt No.");
                IF recPurchRH.FINDFIRST THEN BEGIN
                    PoNo := recPurchRH."Order No.";
                    PoDate := recPurchRH."Order Date";
                    RectNo := recPurchRH."No.";
                    RectDate := recPurchRH."Posting Date";
                    //PCPL-25
                    recPurchRHLine.RESET;
                    recPurchRHLine.SETRANGE(recPurchRHLine."Document No.", recPurchRH."No.");
                    IF recPurchRHLine.FINDFIRST THEN BEGIN
                        ReqrcpDate := recPurchRHLine."Requested Receipt Date";
                    END;
                    //PCPL-25

                END;

                CLEAR(AppDate);
                IndentLine.RESET;
                //IndentLine.SETRANGE(IndentLine."Document No.", "Purch. Inv. Line"."Indent No."); //PCPL-Deepak
                IF IndentLine.FINDFIRST THEN BEGIN
                    AppDate := IndentLine."Approved Date";
                END;
                //PCPL-25
                /*IF CF <> 0 THEN BEGIN
                    PIHDUC := "Purch. Inv. Line"."Unit Cost" / CF;
                    PIHAmt := ("Purch. Inv. Line".Quantity * "Purch. Inv. Line"."Unit Cost") / CF;
                    PIHBEDAMT := "Purch. Inv. Line"."BED Amount" / CF;
                    PIHADCVAT := "Purch. Inv. Line"."ADC VAT Amount" / CF;
                    PIHECESSAMT := "Purch. Inv. Line"."eCess Amount" / CF;
                    PIHSHEECESS := "Purch. Inv. Line"."SHE Cess Amount" / CF;
                    PIHEXCISEAMT := "Purch. Inv. Line"."Excise Amount" / CF;
                    PIHTAXAMT := "Purch. Inv. Line"."Tax Amount" / CF;
                    PIHATV := "Purch. Inv. Line"."Amount To Vendor" / CF;
                    PIHCTV := "Purch. Inv. Line"."Charges To Vendor" / CF;
                    PIHSTA := "Purch. Inv. Line"."Service Tax Amount" / CF;
                    PIHTDS := "Purch. Inv. Line"."TDS Amount" / CF;
                    PIEXEPER := PI_ExcisePer / CF;
                END
                ELSE BEGIN
                    PIHDUC := "Purch. Inv. Line"."Direct Unit Cost";
                    PIHBEDAMT := "Purch. Inv. Line"."BED Amount";
                    PIHADCVAT := "Purch. Inv. Line"."ADC VAT Amount";
                    PIHECESSAMT := "Purch. Inv. Line"."eCess Amount";
                    PIHSHEECESS := "Purch. Inv. Line"."SHE Cess Amount";
                    PIHEXCISEAMT := "Purch. Inv. Line"."Excise Amount";
                    PIHTAXAMT := "Purch. Inv. Line"."Tax Amount";
                    PIHATV := "Purch. Inv. Line"."Amount To Vendor";
                    PIHCTV := "Purch. Inv. Line"."Charges To Vendor";
                    PIHSTA := "Purch. Inv. Line"."Service Tax Amount";
                    PIHTDS := "Purch. Inv. Line"."TDS Amount";
                    PIEXEPER := PI_ExcisePer;
                    PIHAmt := ("Purch. Inv. Line".Quantity * "Purch. Inv. Line"."Unit Cost");
                END;*/ //PCPL-Deepak
                CLEAR(IndentDate);
                IndentHeader.RESET;
                // IndentHeader.SETRANGE("Document No.", "Indent No."); //PCPL-Deepak
                //IndentHeader.SETRANGE("Line No.", "Purch. Inv. Line"."Indent Line No."); //PCPL-Deepak
                IF IndentHeader.FINDFIRST THEN
                    IndentDate := IndentHeader.Date;
                //GUNJAN-END
                IF REC_PIH.GET("Purch. Inv. Line"."Document No.") THEN;
                IF PurchaseHeader.GET(PurchaseHeader."Document Type"::Order, REC_PIH."Order No.") THEN;

                IF (Quantity * "Direct Unit Cost") <> 0 THEN
                    PI_ExcisePer := ROUND(1/*"Excise Amount"*/ / (Quantity * "Direct Unit Cost") * 100);

                //IF PG.GET("Product Group Code") THEN;

                IF IC.GET("Item Category Code") THEN;

                PIH.RESET;
                PIH.SETRANGE(PIH."No.", "Document No.");
                IF PIH.FIND('-') THEN
                    Vendor.GET(PIH."Buy-from Vendor No.");
                IF recStateSup.GET(Vendor."State Code") THEN;
                recShipmentAg.RESET;
                recPurchIH.GET("Purch. Inv. Line"."Document No.");
                GSTPer := 0;
                IGSTPer := 0;
                CGSTAmount := 0;
                IGSTAmount := 0;
                DetailedGSTLedgerEntry.RESET;
                DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type", "Document Type", "Document No.", "Document Line No.");
                DetailedGSTLedgerEntry.SETRANGE("Transaction Type", DetailedGSTLedgerEntry."Transaction Type"::Purchase);
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
                            IGSTPer := DetailedGSTLedgerEntry."GST %";
                        END;
                    IF DetailedGSTLedgerEntry."Reverse Charge" THEN
                        IsReversed := 'Yes'
                    ELSE
                        IsReversed := 'No';
                END;

                //PCPL-0041-START-17012020
                CLEAR(ImportValue);
                ItemLedEntry.RESET;
                ItemLedEntry.SETRANGE("Document No.", RectNo);
                //ItemLedEntry.SETFILTER("Document No.",'%1','RCPT/19-20/K/3173');
                IF ItemLedEntry.FINDFIRST THEN BEGIN
                    ValueEntry.RESET;
                    ValueEntry.SETRANGE("Item Ledger Entry No.", ItemLedEntry."Entry No.");
                    ValueEntry.SETFILTER("Item Charge No.", '<>%1', '');
                    IF ValueEntry.FINDFIRST THEN
                        REPEAT
                            ImportValue += ValueEntry."Cost Amount (Actual)";
                        UNTIL ValueEntry.NEXT = 0;
                END;
                //PCPL-0041-END-17012020
            end;
        }
        dataitem("Purch. Cr. Memo Line"; "Purch. Cr. Memo Line")
        {
            column(PCH_VCMN; PCH."Vendor Cr. Memo No.")
            {
            }
            column(PCH_DocDate; FORMAT(PCH."Document Date"))
            {
            }
            column(PCH_VRN; PCH."VAT Registration No.")
            {
            }
            column(PC_ExcisePer; ROUND(PCEXEPER))
            {
            }
            column(sum3; sum1)
            {
            }
            column(PCML_CL_SUM3; sum1)
            {
            }
            column(PC_PG; '')//PG.Description) //PCPL/NSW/MIG  03Aug22
            {
            }
            column(PC_IC; IC.Description)
            {
            }
            column(PC_Postingdate; FORMAT("Purch. Cr. Memo Line"."Posting Date"))
            {
            }
            column(PC_No; "Purch. Cr. Memo Line"."Document No.")
            {
            }
            column(PC_VendorNo; Vendor.Name)
            {
            }
            column(PC_ItemNo; "Purch. Cr. Memo Line"."No.")
            {
            }
            column(PC_ItemDesc; "Purch. Cr. Memo Line".Description)
            {
            }
            column(PC_Qty; "Purch. Cr. Memo Line".Quantity)
            {
            }
            column(PC_UOM; "Purch. Cr. Memo Line"."Unit of Measure")
            {
            }
            column(PC_ADC; PCADCVAT)
            {
            }
            column(PC_UnitCost; PCDUC)
            {
            }
            column(PC_BEDAmt; PCBEDAMT)
            {
            }
            column(PC_EcessAmt; PCECESSAMT)
            {
            }
            column(PC_SCessAmt; PCSHEECESS)
            {
            }
            column(PC_TaxPer; 0)//"Purch. Cr. Memo Line"."Tax %") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(PC_FormCode; '')//PCH."Form Code") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(PC_FormNo; '')// PCH."Form No.") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(PC_Dim1; PCH."Shortcut Dimension 1 Code")
            {
            }
            column(PC_Dim2; PCH."Shortcut Dimension 2 Code")
            {
            }
            column(PC_ExciseAmt; PCEXCISEAMT)
            {
            }
            column(PC_TaxAmt; PCTAXAMT)
            {
            }
            column(PC_AmttoVendor; PCATV)
            {
            }
            column(PC_chargetovendor; PCCTV)
            {
            }
            column(PC_ServiceTaxAmt; PCSTA)
            {
            }
            column(PC_DiscAmt; "Purch. Cr. Memo Line"."Line Discount Amount")
            {
            }
            column(PCAmt; PCAmt)
            {
            }
            column(ShpAgCr; recShipmentAg.Name)
            {
            }

            trigger OnAfterGetRecord();
            begin
                //GUNJAN-START
                REC_PC.RESET;
                REC_PC.SETRANGE(REC_PC."No.", "Purch. Cr. Memo Line"."Document No.");
                IF REC_PC.FINDFIRST THEN
                    CF := REC_PC."Currency Factor";

                /*  IF CF <> 0 THEN BEGIN
                      PCDUC := "Purch. Cr. Memo Line"."Unit Cost" / CF;
                      PCAmt := ("Purch. Cr. Memo Line".Quantity * "Purch. Cr. Memo Line"."Unit Cost") / CF;
                      PCBEDAMT := "Purch. Cr. Memo Line"."BED Amount" / CF;
                      PCADCVAT := "Purch. Cr. Memo Line"."ADC VAT Amount" / CF;
                      PCECESSAMT := "Purch. Cr. Memo Line"."eCess Amount" / CF;
                      PCSHEECESS := "Purch. Cr. Memo Line"."SHE Cess Amount" / CF;
                      PCEXCISEAMT := "Purch. Cr. Memo Line"."Excise Amount" / CF;
                      PCTAXAMT := "Purch. Cr. Memo Line"."Tax Amount" / CF;
                      PCATV := "Purch. Cr. Memo Line"."Amount To Vendor" / CF;
                      PCCTV := "Purch. Cr. Memo Line"."Charges To Vendor" / CF;
                      PCSTA := "Purch. Cr. Memo Line"."Service Tax Amount" / CF;
                      PCEXEPER := PC_ExcisePer / CF;
                  END
                  ELSE BEGIN
                      PCDUC := "Purch. Cr. Memo Line"."Direct Unit Cost";
                      PCAmt := ("Purch. Cr. Memo Line".Quantity * "Purch. Cr. Memo Line"."Unit Cost");
                      PCBEDAMT := "Purch. Cr. Memo Line"."BED Amount";
                      PCADCVAT := "Purch. Cr. Memo Line"."ADC VAT Amount";
                      PCECESSAMT := "Purch. Cr. Memo Line"."eCess Amount";
                      PCSHEECESS := "Purch. Cr. Memo Line"."SHE Cess Amount";
                      PCEXCISEAMT := "Purch. Cr. Memo Line"."Excise Amount";
                      PCTAXAMT := "Purch. Cr. Memo Line"."Tax Amount";
                      PCATV := "Purch. Cr. Memo Line"."Amount To Vendor";
                      PCCTV := "Purch. Cr. Memo Line"."Charges To Vendor";
                      PCSTA := "Purch. Cr. Memo Line"."Service Tax Amount";
                      PCEXEPER := PC_ExcisePer;
                  END;*/  //PCPL-Deepak
                          //GUNJAN-END

                IF (Quantity * "Direct Unit Cost") <> 0 THEN
                    PC_ExcisePer := ROUND(1/*"Excise Amount"*/ / (Quantity * "Direct Unit Cost") * 100);

                // IF PG.GET("Product Group Code") THEN; //PCPL/NSW/MIG  03Aug22
                IF IC.GET("Item Category Code") THEN;

                PCH.RESET;
                PCH.SETRANGE(PCH."No.", "Document No.");
                IF PCH.FIND('-') THEN
                    Vendor.GET(PCH."Buy-from Vendor No.");

                recShipmentAg.RESET;
                recPurchCH.GET("Purch. Cr. Memo Line"."Document No.");
            end;
        }
        dataitem("Return Shipment Line"; "Return Shipment Line")
        {
            column(RSH_VRN; RSH."VAT Registration No.")
            {
            }
            column(RR_ExcisePer; ROUND(RSLEXEPER))
            {
            }
            column(sum4; sum1)
            {
            }
            column(RSL_CL_SUM4; sum1)
            {
            }
            column(RS_PG; '')//PG.Description) //PCPL/NSW/MIG  03Aug22
            {
            }
            column(RS_IC; IC.Description)
            {
            }
            column(RR_Postingdate; FORMAT("Return Shipment Line"."Posting Date"))
            {
            }
            column(RR_No; "Return Shipment Line"."Document No.")
            {
            }
            column(RR_VendorNo; Vendor.Name)
            {
            }
            column(RR_ItemNo; "Return Shipment Line"."No.")
            {
            }
            column(RR_ItemDesc; "Return Shipment Line".Description)
            {
            }
            column(RR_Qty; "Return Shipment Line".Quantity)
            {
            }
            column(RR_UOM; "Return Shipment Line"."Unit of Measure")
            {
            }
            column(RR_UnitCost; RSLDUC)
            {
            }
            column(RR_ADC; RSLADCVAT)
            {
            }
            column(RR_BEDAmt; RSLBEDAMT)
            {
            }
            column(RR_EcessAmt; RSLECESSAMT)
            {
            }
            column(RR_SCessAmt; RSLSHEECESS)
            {
            }
            column(RR_TaxPer; 0)// "Return Shipment Line"."Tax %") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(RR_FormCode; '')//RSH."Form Code") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(RR_FormNo; '')// RSH."Form No.") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(RR_Dim1; RSH."Shortcut Dimension 1 Code")
            {
            }
            column(RR_Dim2; RSH."Shortcut Dimension 2 Code")
            {
            }
            column(RS_ExciseAmt; RSLEXCISEAMT)
            {
            }
            column(RS_TaxAmt; RSLTAXAMT)
            {
            }
            column(RS_DiscPer; "Return Shipment Line"."Line Discount %")
            {
            }
            column(RSLAmt; RSLAmt)
            {
            }
            column(ShpAgReturn; recShipmentAg.Name)
            {
            }

            trigger OnAfterGetRecord();
            begin
                //GUNJAN-START
                REC_RSH.RESET;
                REC_RSH.SETRANGE(REC_RSH."No.", "Return Shipment Line"."Document No.");
                IF REC_RSH.FINDFIRST THEN
                    CF := REC_RSH."Currency Factor";

                /*  IF CF <> 0 THEN BEGIN
                      RSLDUC := "Return Shipment Line"."Unit Cost" / CF;
                      RSLAmt := ("Return Shipment Line".Quantity * "Return Shipment Line"."Unit Cost") / CF;
                      RSLBEDAMT := "Return Shipment Line"."BED Amount" / CF;
                      RSLADCVAT := "Return Shipment Line"."ADC VAT Amount" / CF;
                      RSLECESSAMT := "Return Shipment Line"."eCess Amount" / CF;
                      RSLSHEECESS := "Return Shipment Line"."SHE Cess Amount" / CF;
                      RSLEXCISEAMT := "Return Shipment Line"."Excise Amount" / CF;
                      RSLTAXAMT := "Return Shipment Line"."Tax Amount" / CF;
                      RSLEXEPER := RR_ExcisePer / CF;
                  END
                  ELSE BEGIN
                      RSLDUC := "Return Shipment Line"."Direct Unit Cost";
                      RSLAmt := ("Return Shipment Line".Quantity * "Return Shipment Line"."Unit Cost");
                      RSLBEDAMT := "Return Shipment Line"."BED Amount";
                      RSLADCVAT := "Return Shipment Line"."ADC VAT Amount";
                      RSLECESSAMT := "Return Shipment Line"."eCess Amount";
                      RSLSHEECESS := "Return Shipment Line"."SHE Cess Amount";
                      RSLEXCISEAMT := "Return Shipment Line"."Excise Amount";
                      RSLTAXAMT := "Return Shipment Line"."Tax Amount";
                      RSLEXEPER := RR_ExcisePer;
                  END;*/ //PCPL-Deepak
                         //GUNJAN-END



                IF (Quantity * "Direct Unit Cost") <> 0 THEN
                    RR_ExcisePer := ROUND(1/*"Excise Amount"*/ / (Quantity * "Direct Unit Cost") * 100);

                //IF PG.GET("Product Group Code") THEN; //PCPL/NSW/MIG  03Aug22
                IF IC.GET("Item Category Code") THEN;

                RSH.RESET;
                RSH.SETRANGE(RSH."No.", "Document No.");
                IF RSH.FIND('-') THEN
                    Vendor.GET(RSH."Buy-from Vendor No.");
                recShipmentAg.RESET;
                recReturnH.GET("Return Shipment Line"."Document No.");
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Option)
                {
                    field("Purchase Receipt "; ReceiptHeader)
                    {
                        Visible = false;

                        trigger OnValidate();
                        begin




                            IF (InvHeader = TRUE) OR (CreditmemoHeader = TRUE) OR (ShipmentHeader = TRUE) OR (Summary = TRUE) THEN BEGIN
                                //ReceiptHeader := FALSE;
                                ERROR('Select only One at a time');
                            END;
                        end;
                    }
                    field("Purchase Invoice"; InvHeader)
                    {

                        trigger OnValidate();
                        begin

                            IF (ReceiptHeader = TRUE) OR (CreditmemoHeader = TRUE) OR (ShipmentHeader = TRUE) OR (Summary = TRUE) THEN BEGIN
                                //InvHeader := FALSE;
                                ERROR('Select only One at a time');
                            END;
                        end;
                    }
                    field("Purchase Creditmemo"; CreditmemoHeader)
                    {
                        Visible = false;

                        trigger OnValidate();
                        begin

                            IF (ReceiptHeader = TRUE) OR (InvHeader = TRUE) OR (ShipmentHeader = TRUE) OR (Summary = TRUE) THEN BEGIN
                                //CreditmemoHeader := FALSE;
                                ERROR('Select only One at a time');
                            END;
                        end;
                    }
                    field("Purchase Shipment"; ShipmentHeader)
                    {
                        Visible = false;

                        trigger OnValidate();
                        begin

                            IF (ReceiptHeader = TRUE) OR (InvHeader = TRUE) OR (CreditmemoHeader = TRUE) OR (Summary = TRUE) THEN BEGIN
                                //ShipmentHeader := FALSE;
                                ERROR('Select only One at a time');
                            END;
                        end;
                    }
                    field(Summary; Summary)
                    {
                        Caption = 'Summary';

                        trigger OnValidate();
                        begin
                            /*
                            IF (ReceiptHeader = TRUE) OR (InvHeader=TRUE) OR (CreditmemoHeader=TRUE) OR (ShipmentHeader=TRUE) THEN BEGIN
                               //Summary := FALSE;
                               ERROR('Select only One at a time');
                            END;
                                    */

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
        PRH: Record "Purch. Rcpt. Header";
        PIH: Record "Purch. Inv. Header";
        PCH: Record "Purch. Cr. Memo Hdr.";
        RSH: Record "Return Shipment Header";
        Vendor: Record Vendor;
        ReceiptHeader: Boolean;
        InvHeader: Boolean;
        CreditmemoHeader: Boolean;
        ShipmentHeader: Boolean;
        CompInfo: Record "Company Information";
        IC: Record "Item Category";
        //PG: Record "Product Group";
        Summary: Boolean;
        sum1: Boolean;
        sum2: Boolean;
        PR_ExcisePer: Decimal;
        PI_ExcisePer: Decimal;
        PC_ExcisePer: Decimal;
        RR_ExcisePer: Decimal;
        VRN: Code[20];
        REC_PRH: Record "Purch. Rcpt. Header";
        CF: Decimal;
        PRHDUC: Decimal;
        PRHBEDAMT: Decimal;
        PRHECESSAMT: Decimal;
        PRHSHEECESS: Decimal;
        PRHADCVAT: Decimal;
        REC_PIH: Record "Purch. Inv. Header";
        PIHDUC: Decimal;
        PIHBEDAMT: Decimal;
        PIHECESSAMT: Decimal;
        PIHSHEECESS: Decimal;
        PIHEXCISEAMT: Decimal;
        PIHTAXAMT: Decimal;
        PIHATV: Decimal;
        PIHCTV: Decimal;
        PIHSTA: Decimal;
        PIHADCVAT: Decimal;
        PIHTDS: Decimal;
        REC_PC: Record "Purch. Cr. Memo Hdr.";
        PCDUC: Decimal;
        PCBEDAMT: Decimal;
        PCADCVAT: Decimal;
        PCECESSAMT: Decimal;
        PCSHEECESS: Decimal;
        PCEXCISEAMT: Decimal;
        PCTAXAMT: Decimal;
        PCATV: Decimal;
        PCCTV: Decimal;
        PCSTA: Decimal;
        REC_RSH: Record "Return Shipment Header";
        RSLDUC: Decimal;
        RSLBEDAMT: Decimal;
        RSLADCVAT: Decimal;
        RSLECESSAMT: Decimal;
        RSLSHEECESS: Decimal;
        RSLEXCISEAMT: Decimal;
        RSLTAXAMT: Decimal;
        PRHEXCIEAMT: Decimal;
        PRKEXCISEPER: Decimal;
        PRAMT: Decimal;
        PIEXEPER: Decimal;
        PIHAmt: Decimal;
        PCAmt: Decimal;
        PCEXEPER: Decimal;
        RSLAmt: Decimal;
        RSLEXEPER: Decimal;
        recPurchRH: Record "Purch. Rcpt. Header";
        recPurchIH: Record "Purch. Inv. Header";
        recPurchCH: Record "Purch. Cr. Memo Hdr.";
        recReturnH: Record "Return Shipment Header";
        recShipmentAg: Record "Shipping Agent";
        PurchaseHeader: Record "Purchase Header";
        IndentHeader: Record 50003;
        state_: Record "State";
        IndentDate: Date;
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        GSTPer: Decimal;
        IGSTPer: Decimal;
        IGSTAmount: Decimal;
        CGSTAmount: Decimal;
        IsReversed: Text;
        PoNo: Code[20];
        PoDate: Date;
        RectNo: Code[20];
        RectDate: Date;
        AppDate: Date;
        IndentLine: Record 50003;
        ItemLedEntry: Record "Item Ledger Entry";
        ValueEntry: Record "Value Entry";
        ImportValue: Decimal;
        recPurchRHLine: Record "Purch. Rcpt. Line";
        ReqrcpDate: Date;
        recStateSup: Record State;
}

