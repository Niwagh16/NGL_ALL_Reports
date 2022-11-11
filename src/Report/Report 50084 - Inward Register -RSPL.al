report 50084 "Inward Register -RSPL"
{
    // version KAR 1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Inward Register -RSPL.rdl';

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
            column(PR_PG; '')// PG.Description) //PCPL/NSW/MIG 09Aug22
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
            column(PR_LocationCode; "Purch. Rcpt. Line"."Location Code")
            {
            }
            column(Certificate_No; IDS."Certificate No.")
            {
            }
            column(COANO; COANO)
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
            column(PR_TaxPer; 0) //"Purch. Rcpt. Line"."Tax %") //PCPL-Deepak
            {
            }
            column(PR_FormCode; '') //PRH."Form Code") //PCPL-Deepak
            {
            }
            column(PR_FormNo; 0) //PRH."Form No.") //PCPL-Deepak
            {
            }
            column(PR_LRNo; 0) //PRH."LR No.") //PCPL-Deepak
            {
            }
            column(PR_LRDate; 0D) //PRH."LR Date") //PCPL-Deepak
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
            column(Order_No; PRH."Order No.")
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
            column(LOTNO; LOTNO)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF (Quantity * "Direct Unit Cost") <> 0 THEN
                    PR_ExcisePer := 0; //ROUND("Excise Amount"/(Quantity*"Direct Unit Cost")*100); //PCPL-Deepak

                //GUNJAN-START
                REC_PRH.RESET;
                REC_PRH.SETRANGE(REC_PRH."No.", "Purch. Rcpt. Line"."Document No.");
                IF REC_PRH.FINDFIRST THEN
                    CF := REC_PRH."Currency Factor";
                COANO := ''; //REC_PRH."COA No"; //PCPL-Deepak


                IF CF <> 0 THEN BEGIN
                    PRHDUC := "Purch. Rcpt. Line"."Unit Cost" / CF;
                    PRHBEDAMT := 0; //"Purch. Rcpt. Line"."BED Amount"/CF; //PCPL-Deepak
                    PRHADCVAT := 0; //"Purch. Rcpt. Line"."ADC VAT Amount"/CF; //PCPL-Deepak
                    PRHECESSAMT := 0; //"Purch. Rcpt. Line"."eCess Amount"/CF; //PCPL-Deepak
                    PRHSHEECESS := 0; //"Purch. Rcpt. Line"."SHE Cess Amount"/CF; //PCPL-Deepak
                    PRHEXCIEAMT := 0; //"Purch. Rcpt. Line"."Excise Amount"/CF; //PCPL-Deepak
                    PRKEXCISEPER := PR_ExcisePer / CF;
                    PRAMT := ("Purch. Rcpt. Line".Quantity * "Purch. Rcpt. Line"."Unit Cost") / CF;
                END
                ELSE BEGIN
                    PRHDUC := "Purch. Rcpt. Line"."Direct Unit Cost";
                    PRHBEDAMT := 0; //"Purch. Rcpt. Line"."BED Amount"; //PCPL-Deepak
                    PRHADCVAT := 0; //"Purch. Rcpt. Line"."ADC VAT Amount"; //PCPL-Deepak
                    PRHECESSAMT := 0; //"Purch. Rcpt. Line"."eCess Amount"; //PCPL-Deepak
                    PRHSHEECESS := 0; //"Purch. Rcpt. Line"."SHE Cess Amount"; //PCPL-Deepak
                    PRHEXCIEAMT := 0; //"Purch. Rcpt. Line"."Excise Amount"; //PCPL-Deepak
                                      //PRKEXCISEPER :=PR_ExcisePer; //PCPL-Deepak
                    PRAMT := ("Purch. Rcpt. Line".Quantity * "Purch. Rcpt. Line"."Unit Cost");
                END;
                //GUNJAN-END



                //IF PG.GET("Product Group Code") THEN;
                IF IC.GET("Item Category Code") THEN;

                PRH.RESET;
                PRH.SETRANGE(PRH."No.", "Document No.");
                IF PRH.FIND('-') THEN
                    //VRN := PRH."VAT Registration No.";
                    Vendor.GET(PRH."Buy-from Vendor No.");

                recShipmentAg.RESET;
                recPurchRH.GET("Purch. Rcpt. Line"."Document No.");


                //created by sanjay

                IDS.RESET;
                IDS.SETRANGE(IDS."GRN No.", "Purch. Rcpt. Line"."No.");
                IF IDS.FINDFIRST THEN;

                ILE.RESET;
                ILE.SETRANGE(ILE."Source No.", "Purch. Rcpt. Line"."No.");
                IF ILE.FINDFIRST THEN
                    LOTNO := ILE."Lot No.";
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
        IDS: Record "Inspection Data Sheet";
        COANO: Text;
        ILE: Record "Item Ledger Entry";
        LOTNO: Text;
}

