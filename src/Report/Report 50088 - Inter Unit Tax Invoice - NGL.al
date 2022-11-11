report 50088 "Inter Unit Tax Invoice - NGL"
{
    // version RSPL/NGL/REPORT-2

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Inter Unit Tax Invoice - NGL.rdl';

    dataset
    {
        dataitem(Pageloop; Integer)
        {
            DataItemTableView = SORTING(Number)
                                ORDER(Ascending)
                                WHERE(Number = FILTER(1 .. 5));
            column(RType; RType)
            {
            }
            column(Number; Number)
            {
            }
            dataitem("Sales Invoice Header"; "Sales Invoice Header")
            {
                DataItemTableView = SORTING("No.")
                                    ORDER(Ascending);
                RequestFilterFields = "No.";
                column(SIH_No; "Sales Invoice Header"."No.")
                {
                }
                column(Comp_Name; Rec_Comp.Name)
                {
                }
                column(Comp_Pic; Rec_Comp.Picture)
                {
                }
                column(Comp_Address; Rec_Comp.Address + ' ' + Rec_Comp."Address 2" + ' ' + Rec_Comp.City + ' ' + Rec_Comp."Post Code" + ' ' + Rec_Comp."Country/Region Code")
                {
                }
                column(Comp_Addres; Rec_Comp."Address 2")
                {
                }
                column(Comp_city; Rec_Comp.City)
                {
                }
                column(Comp_PC; Rec_Comp."Post Code")
                {
                }
                column(Comp_CRC; Rec_Comp."Country/Region Code")
                {
                }
                column(Comp_Phone_no; Rec_Comp."Phone No.")
                {
                }
                column(Comp_Fax_no; Rec_Comp."Fax No.")
                {
                }
                column(Comp_CSTNo; 0)  //Rec_Comp."C.S.T No.") //PCPL-Deepak
                {
                }
                column(Comp_VATRegistrationNo; Rec_Comp."VAT Registration No.")
                {
                }
                column(Comp_TINNo; 0) //Rec_Comp."T.I.N. No.") //PCPL-Deepak
                {
                }
                column(Comp_Email; Rec_Comp."E-Mail")
                {
                }
                column(Rec_address; Rec_Loati.Address + ' ' + Rec_Loati."Address 2" + ' ' + Rec_Loati.City + ' ' + Rec_Loati."Post Code" + ' ' + Rec_Loati."Country/Region Code")
                {
                }
                column(Rec_addres; Rec_Loati."Address 2")
                {
                }
                column(Rec_city; Rec_Loati.City)
                {
                }
                column(Rec_PC; Rec_Loati."Post Code")
                {
                }
                column(Rec_CRC; Rec_Loati."Country/Region Code")
                {
                }
                column(Rec_Phone_no; Rec_Loati."Phone No.")
                {
                }
                column(Rec_Fax_no; Rec_Loati."Fax No.")
                {
                }
                column(Rec_TINNo; 0) //Rec_Loati."T.I.N. No.") //PCPL-Deepak
                {
                }
                column(Rec_CSTNo; 0) //Rec_Loati."C.S.T No.") //PCPL-Deepak
                {
                }
                column(SIH_Time_of_Removal; "Sales Invoice Header"."Time of Removal")
                {
                }
                column(Date_Removal; CURRENTDATETIME)
                {
                }
                column(Posting_Date; "Sales Invoice Header"."Posting Date")
                {
                }
                column(ExciseProdDesc; '') //recExciseProdSetup.Description) //PCPL-Deepak
                {
                }
                column(ChapterNo; 0) //recExciseProdSetup."Chapter No.") //PCPL-Deepak
                {
                }
                column(HeadingNo; 0) //recExciseProdSetup."Heading No") //PCPL-Deepak
                {
                }
                column(RG23A; 0) //"Sales Invoice Header"."RG 23 A Entry No.") //PCPL-Deepak
                {
                }
                column(RG23C; 0) //"Sales Invoice Header"."RG 23 C Entry No.") //PCPL-Deepak
                {
                }
                dataitem(Integer; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        ORDER(Ascending);
                    MaxIteration = 1;
                    column(CTIN; CTIN)
                    {
                    }
                    column(CCST; CCST)
                    {
                    }
                    column(CLST; CLST)
                    {
                    }
                    column(CECC; CECC)
                    {
                    }
                    column(CPAN; CPAN)
                    {
                    }
                    column(CRAN; CRAN)
                    {
                    }
                    column(CDIV; CDIV)
                    {
                    }
                    column(CCOMM; CCOMM)
                    {
                    }
                    column(VACU; VACU)
                    {
                    }
                    column(TIN; TIN)
                    {
                    }
                    column(SIH_Billtoname; "Sales Invoice Header"."Bill-to Name")
                    {
                    }
                    column(SIH_BiiltoAddress; "Sales Invoice Header"."Bill-to Address")
                    {
                    }
                    column(SIH_BilltoAddress2; "Sales Invoice Header"."Bill-to Address 2" + ' ' + "Sales Invoice Header"."Bill-to City" + ' ' + "Sales Invoice Header"."Bill-to Post Code" + ' ' + "Sales Invoice Header"."Bill-to Country/Region Code")
                    {
                    }
                    column(SIH_BilltoCity; "Sales Invoice Header"."Bill-to City")
                    {
                    }
                    column(SIH_BPC; "Sales Invoice Header"."Bill-to Post Code")
                    {
                    }
                    column(SIH_BCRC; "Sales Invoice Header"."Bill-to Country/Region Code")
                    {
                    }
                    column(SIH_SelltoCusName; "Sales Invoice Header"."Sell-to Customer Name")
                    {
                    }
                    column(SIH_SelltoAddress; "Sales Invoice Header"."Sell-to Address")
                    {
                    }
                    column(SIH_SelltoAddress2; "Sales Invoice Header"."Sell-to Address 2" + ' ' + "Sales Invoice Header"."Sell-to City" + ' ' + "Sales Invoice Header"."Sell-to Post Code" + ' ' + "Sales Invoice Header"."Sell-to Country/Region Code")
                    {
                    }
                    column(SIH_SelltoCity; "Sales Invoice Header"."Sell-to City")
                    {
                    }
                    column(SIH_SPC; "Sales Invoice Header"."Sell-to Post Code")
                    {
                    }
                    column(SIH_SCRC; "Sales Invoice Header"."Sell-to Country/Region Code")
                    {
                    }
                    column(SIH_PO_No; "Sales Invoice Header"."Order No.")
                    {
                    }
                    column(SIH_Doc_Date; "Sales Invoice Header"."Document Date")
                    {
                    }
                    column(SIH_MOT; "Sales Invoice Header"."Mode of Transport")
                    {
                    }
                    column(SIH_LrNo; "Sales Invoice Header"."LR/RR No.")
                    {
                    }
                    column(SIH_LrDate; "Sales Invoice Header"."LR/RR Date")
                    {
                    }
                    column(SIH_VechicleNo; "Sales Invoice Header"."Vehicle No.")
                    {
                    }
                    column(SIH_DespatchThrough; "Sales Invoice Header"."Mode of Transport")
                    {
                    }
                    dataitem("Sales Invoice Line"; "Sales Invoice Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemTableView = SORTING("Document No.", "Line No.")
                                            WHERE(Type = FILTER(Item));
                        column(SIL_Quantity; "Sales Invoice Line".Quantity)
                        {
                        }
                        column(Item; "Sales Invoice Line"."No.")
                        {
                        }
                        column(SIL_Des; "Sales Invoice Line".Description)
                        {
                        }
                        column(SIL_UnitCost; "Sales Invoice Line"."Unit Price")
                        {
                        }
                        column(SIL_Amount; "Sales Invoice Line".Amount)
                        {
                        }
                        column(CF; CF)
                        {
                        }
                        column(SIL_ecess; 0) //"Sales Invoice Line"."eCess Amount") //PCPL-Deepak
                        {
                        }
                        column(SIL_SheEcess; 0) //"Sales Invoice Line"."SHE Cess Amount") //PCPL-Deepak
                        {
                        }
                        column(SIL_Disc; "Sales Invoice Line"."Line Discount Amount")
                        {
                        }
                        column(SIL_ExciseAmount; 0) //"Sales Invoice Line"."BED Amount") //PCPL-Deepak
                        {
                        }
                        column(ADC_Vat; 0) //"Sales Invoice Line"."ADC VAT Amount") //PCPL-Deepak
                        {
                        }
                        column(SIL_TaxAmount; 0) //"Sales Invoice Line"."Tax Amount") //PCPL-Deepak
                        {
                        }
                        column(SrNo; SrNo)
                        {
                        }
                        column(SIL_Charges; 0) //"Sales Invoice Line"."Charges To Customer") //PCPL-Deepak
                        {
                        }
                        column(Sub_Total; "Sales Invoice Line".Amount) //+"Sales Invoice Line"."Excise Amount"+"Sales Invoice Line"."Tax Amount"+"Sales Invoice Line"."Charges To Customer") //PCPL-Deepak
                        {
                        }
                        column(TaxableAmt; "Sales Invoice Line".Amount) //+"Sales Invoice Line"."Excise Amount") //PCPL-Deepak
                        {
                        }
                        column(NoText; NoText[1])
                        {
                        }
                        column(SIL_UPP; "Sales Invoice Line"."Units per Parcel")
                        {
                        }
                        column(text; text[1])
                        {
                        }
                        column(test; test[1])
                        {
                        }
                        column(teft; teft[1])
                        {
                        }
                        column(tent; tent[1])
                        {
                        }
                        column(Amt; Amt)
                        {
                        }
                        column(ExPer; ExPer)
                        {
                        }
                        column(eCessPer; eCessPer)
                        {
                        }
                        column(sheCessPer; sheCessPer)
                        {
                        }
                        column(VatPer; VatPer)
                        {
                        }
                        column(TaxPer; TaxPer)
                        {
                        }
                        column(TaxType; TaxType)
                        {
                        }
                        column(addVatPer; addVatPer)
                        {
                        }
                        column(ADCPer; ADCper)
                        {
                        }
                        column(CSTper; CSTper)
                        {
                        }
                        column(VatAmount; VatAmount)
                        {
                        }
                        column(AddVatAmount; AddVatAmount)
                        {
                        }
                        column(CSTAmount; CSTAmount)
                        {
                        }
                        column(cnt; cnt)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            SrNo := SrNo + 1;
                            sil1.RESET;
                            sil1.SETRANGE(sil1."Document No.", "Sales Invoice Header"."No.");
                            IF sil1.FINDFIRST THEN
                                REPEAT
                                    Amt := Amt + sil1.Amount;
                                    ecess := ecess; //+sil1."eCess Amount"; //PCPL-Deepak
                                    tax := tax; //+sil1."Tax Amount"; //PCPL-Deepak
                                    Excise := Excise; //+sil1."Excise Amount"; //PCPL-Deepak
                                    she := she; //+sil1."SHE Cess Amount"; //PCPL-Deepak
                                UNTIL sil1.NEXT = 0;

                            // ExcisePosSetup.RESET;
                            // ExcisePosSetup.SETRANGE(ExcisePosSetup."Excise Bus. Posting Group","Excise Bus. Posting Group");
                            // ExcisePosSetup.SETRANGE(ExcisePosSetup."Excise Prod. Posting Group","Excise Prod. Posting Group");
                            // IF ExcisePosSetup.FINDFIRST THEN //PCPL-Deepak
                            //BEGIN
                            ExPer := 0; //ExcisePosSetup."BED %"; //PCPL-Deepak
                            eCessPer := 0; //ExcisePosSetup."eCess %"; //PCPL-Deepak
                            sheCessPer := 0; //ExcisePosSetup."SHE Cess %"; //PCPL-Deepak
                            ADCper := 0; //ExcisePosSetup."ADC VAT %"; //PCPL-Deepak
                            //END;
                            //Amt:=Amt+"Sales Invoice Line".Amount;
                            IF "Sales Invoice Line"."Tax Group Code" = 'VAT5' THEN BEGIN
                                VatAmount := 0; //(("Sales Invoice Line"."Tax Amount"*4)/5)/Line; //PCPL-Deepak
                                AddVatAmount := 0; //(("Sales Invoice Line"."Tax Amount"*2)/5)/Line; //PCPL-Deepak
                                VatPer := 4 / Line;
                                TaxPer := 5;
                                TaxType := 'VAT';
                                addVatPer := 1 / Line;
                            END
                            ELSE
                                IF "Sales Invoice Line"."Tax Group Code" = 'VAT8' THEN BEGIN
                                    VatAmount := 0; //(("Sales Invoice Line"."Tax Amount"*8)/8)/Line; //PCPL-Deepak
                                    VatPer := 4 / Line;
                                    TaxPer := 8;
                                    TaxType := 'VAT';
                                END
                                ELSE
                                    IF "Sales Invoice Line"."Tax Group Code" = 'VAT125' THEN BEGIN
                                        VatAmount := 0; //(("Sales Invoice Line"."Tax Amount"*12.5)/12.5)/Line; //PCPL-Deepak
                                        VatPer := 12.5 / Line;
                                        TaxPer := 12.5;
                                        TaxType := 'VAT';
                                    END
                                    ELSE
                                        IF "Sales Invoice Line"."Tax Group Code" = 'CST5' THEN BEGIN
                                            CSTper := 5 / Line;
                                            TaxPer := 5;
                                            TaxType := 'CST';
                                        END
                                        ELSE
                                            IF "Sales Invoice Line"."Tax Group Code" = 'CST2' THEN BEGIN
                                                CSTper := 2 / Line;
                                                TaxPer := 2;
                                                TaxType := 'CST';

                                            END
                                            ELSE
                                                IF "Sales Invoice Line"."Tax Group Code" = 'CST12.5' THEN BEGIN
                                                    CSTper := 1 / Line;
                                                    TaxPer := 12.5;
                                                    TaxType := 'CST';
                                                END;


                            RepCheck.InitTextVariable;
                            //RepCheck.FormatNoText(NoText,ROUND((("Sales Invoice Line".Amount+"Sales Invoice Line"."Excise Amount"+"Sales Invoice Line"."Tax Amount"+"Sales Invoice Line"."Charges To Customer")/CF),1,'='),''); //PCPL-Deepak

                            RepCheck.InitTextVariable;
                            RepCheck.FormatNoText(text, ROUND((ecess / CF), 1, '='), '');

                            RepCheck.InitTextVariable;
                            RepCheck.FormatNoText(test, ROUND((tax / CF), 1, '='), '');

                            RepCheck.InitTextVariable;
                            RepCheck.FormatNoText(teft, ROUND(((Excise - ecess - she) / CF), 1, '='), '');

                            RepCheck.InitTextVariable;
                            RepCheck.FormatNoText(tent, ROUND((she / CF), 1, '='), '');
                        end;
                    }

                    trigger OnAfterGetRecord();
                    begin
                        Rec_loc.RESET;
                        Rec_loc.SETRANGE(Rec_loc.Code, "Sales Invoice Header"."Location Code");
                        IF Rec_loc.FINDFIRST THEN BEGIN
                            CTIN := ''; //Rec_loc."T.I.N. No."; //PCPL-Deepak
                            CCST := ''; //Rec_loc."C.S.T No."; //PCPL-Deepak
                            CLST := ''; //Rec_loc."L.S.T. No."; //PCPL-Deepak
                            CECC := ''; //Rec_loc."E.C.C. No."; //PCPL-Deepak
                            CPAN := ''; //Rec_loc."Service Tax Registration No."; //PCPL-Deepak
                            CRAN := ''; //Rec_loc."C.E. Range"; //PCPL-Deepak
                            CDIV := ''; //Rec_loc."C.E. Division"; //PCPL-Deepak
                            CCOMM := ''; //Rec_loc."C.E. Commissionerate"; //PCPL-Deepak
                        END;

                        Rec_Cust.RESET;
                        Rec_Cust.SETRANGE(Rec_Cust."No.", "Sales Invoice Header"."Sell-to Customer No.");
                        IF Rec_Cust.FINDFIRST THEN BEGIN
                            VACU := ''; //Rec_Cust."C.S.T. No."; //PCPL-Deepak
                            TIN := ''; //Rec_Cust."T.I.N. No."; //PCPL-Deepak
                        END;
                    end;
                }
                dataitem(Blank; Integer)
                {
                    DataItemTableView = SORTING(Number)
                                        ORDER(Ascending);
                    column(Num; Blank.Number)
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin
                        SETRANGE(Number, 1, (5 - Line));
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    Rec_Comp.GET;
                    Rec_Comp.CALCFIELDS(Rec_Comp.Picture);
                    recIL.RESET;
                    recIL.SETRANGE(recIL."Document No.", "No.");
                    recIL.SETFILTER(recIL."Quantity (Base)", '<>%1', 0);
                    IF recIL.FINDSET THEN BEGIN
                        Line := recIL.COUNT;
                        IF recItem.GET(recIL."No.") THEN;
                        // IF recExciseProdSetup.GET(recItem."Excise Prod. Posting Group") THEN; //PCPL-Deepak
                    END;
                    IF "Currency Factor" <> 0 THEN
                        CF := "Currency Factor";
                end;

                trigger OnPreDataItem();
                begin
                    CF := 1;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                IF Number >= 1 THEN BEGIN
                    //CopyText := Text003;


                    IF Number = 1 THEN
                        RType := 'ORIGINAL FOR BUYER';

                    /*
IF  (Number = 1) OR (RType='') THEN
CurrReport.SKIP;
       */

                    IF Number = 2 THEN
                        RType := 'DUPLICATE FOR TRANSPORTER';
                    IF Number = 3 THEN
                        RType := 'TRIPLICATE FOR ASSESSEE';
                    IF Number = 4 THEN
                        RType := 'QUADRUPLICATE FOR ACCOUNTS';
                    IF Number = 5 THEN
                        RType := 'EXTRA COPY';

                    OutputNo += 1;
                END;
                CurrReport.PAGENO := 1;
                CLEAR(Amt);
                CLEAR(ecess);
                CLEAR(tax);
                CLEAR(Excise);
                CLEAR(she);
                SrNo := 0;

            end;

            trigger OnPreDataItem();
            begin
                noofloops := ABS(noofcopies) + 1;
                IF noofloops <= 0 THEN
                    noofloops := 1;
                //CopyText := '';
                SETRANGE(Number, 1, noofloops);
                OutputNo := 1;
                cnt := 1;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(General)
                {
                    field(noofcopies; noofcopies)
                    {
                        Caption = 'noofcopies';
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
        Rec_Comp: Record "Company Information";
        Rec_Cust: Record Customer;
        Rec_Loati: Record Location;
        CTIN: Code[20];
        CCST: Code[20];
        CLST: Code[20];
        CECC: Code[20];
        CPAN: Code[20];
        SrNo: Integer;
        RepCheck: Report 1401;
        NoText: array[2] of Text;
        Rec_loc: Record Location;
        CRAN: Code[50];
        CDIV: Code[50];
        CCOMM: Code[50];
        VACU: Code[20];
        TIN: Code[20];
        text: array[4] of Text;
        test: array[2] of Text;
        teft: array[2] of Text;
        tent: array[2] of Text;
        Amt: Decimal;
        sil1: Record "Sales Invoice Line";
        ecess: Decimal;
        Excise: Decimal;
        tax: Decimal;
        she: Decimal;
        recIL: Record "Sales Invoice Line";
        Line: Integer;
        RType: Code[150];
        noofloops: Integer;
        noofcopies: Integer;
        OutputNo: Integer;
        ExPer: Decimal;
        eCessPer: Decimal;
        sheCessPer: Decimal;
        VatPer: Decimal;
        addVatPer: Decimal;
        CSTper: Decimal;
        VatAmount: Decimal;
        AddVatAmount: Decimal;
        CSTAmount: Decimal;
        //ExcisePosSetup : Record "13711"; //PCPL-Deepak
        ADCper: Decimal;
        TaxableAmt: Decimal;
        cnt: Integer;
        TaxPer: Decimal;
        TaxType: Text[30];
        //recExciseProdSetup : Record "13710"; //PCPL-Deepak
        recItem: Record Item;
        CF: Decimal;
}

