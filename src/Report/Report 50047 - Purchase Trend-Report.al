report 50047 "Purchase Trend-Report"
{
    // version KAR 1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Purchase Trend-Report.rdl';

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

            trigger OnAfterGetRecord();
            begin
                //BlnEdit:=TRUE;
                IF Summary = TRUE THEN BEGIN
                    sum1 := TRUE;
                    sum2 := TRUE;
                END
                ELSE BEGIN
                    sum1 := FALSE;
                    sum2 := FALSE;
                END;

                CompInfo.SETRANGE(CompInfo.Name);
                IF CompInfo.FIND('-') THEN;
            end;
        }
        dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
        {
            DataItemTableView = WHERE(Type = FILTER(<> ' '));
            RequestFilterFields = "Posting Date", "Location Code", "Gen. Bus. Posting Group";
            column(PRH_VSN; PRH."Vendor Shipment No.")
            {
            }
            column(PRH_DocDate; PRH."Document Date")
            {
            }
            column(PRH_VRN; PRH."VAT Registration No.")
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
            column(PR_PG; '')// PG.Description) //PCPL/NSW/MIG 05Aug22
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
            column(PR_TaxPer; 0)//"Purch. Rcpt. Line"."Tax %") //PCPL/NSW/MIG 05Aug22
            {
            }
            column(PR_FormCode; '')// PRH."Form Code") //PCPL/NSW/MIG 05Aug22
            {
            }
            column(PR_FormNo; '')//PRH."Form No.") //PCPL/NSW/MIG 05Aug22
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
            column(Local_Import; Saletype)
            {
            }
            column(Locaton_Code2; "Purch. Rcpt. Line"."Location Code")
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF (Quantity * "Direct Unit Cost") <> 0 THEN
                    PR_ExcisePer := 0;//ROUND("Excise Amount" / (Quantity * "Direct Unit Cost") * 100); //PCPL/NSW/MIG 05Aug22

                //GUNJAN-START
                REC_PRH.RESET;
                REC_PRH.SETRANGE(REC_PRH."No.", "Purch. Rcpt. Line"."Document No.");
                IF REC_PRH.FINDFIRST THEN
                    CF := REC_PRH."Currency Factor";

                IF CF <> 0 THEN BEGIN
                    PRHDUC := "Purch. Rcpt. Line"."Unit Cost" / CF;
                    PRHBEDAMT := 0;//"Purch. Rcpt. Line"."BED Amount" / CF;
                    PRHADCVAT := 0;//"Purch. Rcpt. Line"."ADC VAT Amount" / CF;
                    PRHECESSAMT := 0;//"Purch. Rcpt. Line"."eCess Amount" / CF;
                    PRHSHEECESS := 0;//"Purch. Rcpt. Line"."SHE Cess Amount" / CF;
                    PRHEXCIEAMT := 0;//"Purch. Rcpt. Line"."Excise Amount" / CF;
                    PRKEXCISEPER := PR_ExcisePer / CF;
                    PRAMT := ("Purch. Rcpt. Line".Quantity * "Purch. Rcpt. Line"."Unit Cost") / CF;
                END
                ELSE BEGIN
                    PRHDUC := "Purch. Rcpt. Line"."Direct Unit Cost";
                    PRHBEDAMT := 0;//"Purch. Rcpt. Line"."BED Amount";
                    PRHADCVAT := 0;//"Purch. Rcpt. Line"."ADC VAT Amount";
                    PRHECESSAMT := 0;//"Purch. Rcpt. Line"."eCess Amount";
                    PRHSHEECESS := 0;//"Purch. Rcpt. Line"."SHE Cess Amount";
                    PRHEXCIEAMT := 0;//"Purch. Rcpt. Line"."Excise Amount";
                    PRKEXCISEPER := PR_ExcisePer;
                    PRAMT := ("Purch. Rcpt. Line".Quantity * "Purch. Rcpt. Line"."Unit Cost");
                END;
                //GUNJAN-END



                // IF PG.GET("Product Group Code") THEN; //PCPL/NSW/MIG 05Aug22
                IF IC.GET("Item Category Code") THEN;

                PRH.RESET;
                PRH.SETRANGE(PRH."No.", "Document No.");
                IF PRH.FIND('-') THEN
                    //VRN := PRH."VAT Registration No.";
                    Vendor.GET(PRH."Buy-from Vendor No.");

                recShipmentAg.RESET;
                recPurchRH.GET("Purch. Rcpt. Line"."Document No.");

                //--  sanjay start
                Rec_Vend.RESET;
                Rec_Vend.SETRANGE(Rec_Vend."No.", "Purch. Rcpt. Line"."Buy-from Vendor No.");
                IF Rec_Vend.FINDFIRST THEN BEGIN


                    Saletype := Rec_Vend."Gen. Bus. Posting Group";
                END;

                //--sanjay End
            end;
        }
        dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
        {
            RequestFilterFields = "Posting Date", "Location Code", "Gen. Bus. Posting Group", "Gen. Prod. Posting Group";
            column(PIH_DocDate; PIH."Document Date")
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
            column(PIL_CL_SUM2; sum1)
            {
            }
            column(curr_code; PIH."Currency Code")
            {
            }
            column(PI_PG; '')// PG.Description) //PCPL/NSW/MIG 05Aug22
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
            column(PI_TaxPer; 0)//"Purch. Inv. Line"."Tax %") //PCPL/NSW/MIG 05Aug22
            {
            }
            column(PI_FormCode; '')//PIH."Form Code") //PCPL/NSW/MIG 05Aug22
            {
            }
            column(PI_FormNo; '')//PIH."Form No.") //PCPL/NSW/MIG 05Aug22
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
            column(Amount_Vendor; 0)//"Purch. Inv. Line"."Amount To Vendor")//PCPL/NSW/MIG 05Aug22
            {
            }
            column(Local_Import2; Saletype)
            {
            }
            column(Location_Name; "Purch. Inv. Line"."Location Code")
            {
            }

            trigger OnAfterGetRecord();
            begin
                //GUNJAN-START
                REC_PIH.RESET;
                REC_PIH.SETRANGE(REC_PIH."No.", "Purch. Inv. Line"."Document No.");
                IF REC_PIH.FINDFIRST THEN
                    CF := REC_PIH."Currency Factor";

                IF CF <> 0 THEN BEGIN
                    /* PIHDUC :="Purch. Inv. Line"."Unit Cost"/CF;
                     PIHAmt := ("Purch. Inv. Line".Quantity*"Purch. Inv. Line"."Unit Cost")/CF;
                     PIHBEDAMT :="Purch. Inv. Line"."BED Amount"/CF;
                     PIHADCVAT := "Purch. Inv. Line"."ADC VAT Amount"/CF;
                     PIHECESSAMT :="Purch. Inv. Line"."eCess Amount"/CF;
                     PIHSHEECESS :="Purch. Inv. Line"."SHE Cess Amount"/CF;
                     PIHEXCISEAMT :="Purch. Inv. Line"."Excise Amount"/CF;
                     PIHTAXAMT :="Purch. Inv. Line"."Tax Amount"/CF;
                     PIHATV :="Purch. Inv. Line"."Amount To Vendor"/CF;
                     PIHCTV :="Purch. Inv. Line"."Charges To Vendor"/CF;
                     PIHSTA :="Purch. Inv. Line"."Service Tax Amount"/CF;
                     PIHTDS :="Purch. Inv. Line"."TDS Amount"/CF;
                     PIEXEPER :=PI_ExcisePer/CF;
                     END
                     ELSE BEGIN
                     PIHDUC :="Purch. Inv. Line"."Direct Unit Cost";
                     PIHBEDAMT :="Purch. Inv. Line"."BED Amount";
                     PIHADCVAT := "Purch. Inv. Line"."ADC VAT Amount";
                     PIHECESSAMT :="Purch. Inv. Line"."eCess Amount";
                     PIHSHEECESS :="Purch. Inv. Line"."SHE Cess Amount";
                     PIHEXCISEAMT :="Purch. Inv. Line"."Excise Amount";
                     PIHTAXAMT :="Purch. Inv. Line"."Tax Amount";
                     PIHATV :="Purch. Inv. Line"."Amount To Vendor";
                     PIHCTV :="Purch. Inv. Line"."Charges To Vendor";
                     PIHSTA :="Purch. Inv. Line"."Service Tax Amount";
                     PIHTDS :="Purch. Inv. Line"."TDS Amount";
                     PIEXEPER :=PI_ExcisePer;
                     PIHAmt := ("Purch. Inv. Line".Quantity*"Purch. Inv. Line"."Unit Cost");*/ //PCPL-Deepak
                END;

                //GUNJAN-END



                IF (Quantity * "Direct Unit Cost") <> 0 THEN
                    //PI_ExcisePer := ROUND("Excise Amount"/(Quantity*"Direct Unit Cost")*100); //PCPL-Deepak

                    //IF PG.GET("Product Group Code") THEN; //PCPL-Deepak

                    IF IC.GET("Item Category Code") THEN;

                PIH.RESET;
                PIH.SETRANGE(PIH."No.", "Document No.");
                IF PIH.FIND('-') THEN
                    Vendor.GET(PIH."Buy-from Vendor No.");

                recShipmentAg.RESET;
                recPurchIH.GET("Purch. Inv. Line"."Document No.");

                //--  sanjay start
                Rec_Vend.RESET;
                Rec_Vend.SETRANGE(Rec_Vend."No.", "Purch. Inv. Line"."Buy-from Vendor No.");
                IF Rec_Vend.FINDFIRST THEN BEGIN


                    Saletype := Rec_Vend."Gen. Bus. Posting Group";
                END;

                //--sanjay End
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
        // PG: Record "Product Group";
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
        Rec_Vend: Record Vendor;
        Saletype: Text;
}

