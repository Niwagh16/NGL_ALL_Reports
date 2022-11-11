report 50087 "Purch. Credit Memo - NGL"
{
    // version RSPL/NGL/REPORT-3

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Purch. Credit Memo - NGL.rdl';

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
            dataitem("Purch. Cr. Memo Hdr."; "Purch. Cr. Memo Hdr.")
            {
                DataItemTableView = SORTING("No.")
                                    ORDER(Ascending);
                RequestFilterFields = "No.";
                column(SIH_No; "Purch. Cr. Memo Hdr."."No.")
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
                column(Comp_Email; Rec_Comp."E-Mail")
                {
                }
                column(Date_Removal; CURRENTDATETIME)
                {
                }
                column(ExciseProdDesc; '') //recExciseProdSetup.Description) //PCPL-Deepak
                {
                }
                column(ChapterNo; '') //recExciseProdSetup."Chapter No.") //PCPL-Deepak
                {
                }
                column(HeadingNo; '') //recExciseProdSetup."Heading No") //PCPL-Deepak
                {
                }
                column(buyFromName; "Purch. Cr. Memo Hdr."."Buy-from Vendor Name")
                {
                }
                column(paytoAddress; "Purch. Cr. Memo Hdr."."Pay-to Address" + ' ' + "Purch. Cr. Memo Hdr."."Pay-to Address 2" + ' ' + "Purch. Cr. Memo Hdr."."Pay-to City" + ' ' + "Purch. Cr. Memo Hdr."."Pay-to Post Code")
                {
                }
                column(ShiptoAddress; "Purch. Cr. Memo Hdr."."Ship-to Address" + ' ' + "Purch. Cr. Memo Hdr."."Ship-to Address 2" + ' ' + "Purch. Cr. Memo Hdr."."Ship-to City" + ' ' + "Purch. Cr. Memo Hdr."."Ship-to Post Code")
                {
                }
                column(ShipToName; "Purch. Cr. Memo Hdr."."Ship-to Name")
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
                    column(SIH_Doc_Date; "Purch. Cr. Memo Hdr."."Document Date")
                    {
                    }
                    column(buyFromVendor; "Purch. Cr. Memo Hdr."."Buy-from Vendor No.")
                    {
                    }
                    dataitem("Purch. Cr. Memo Line"; "Purch. Cr. Memo Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Purch. Cr. Memo Hdr.";
                        DataItemTableView = SORTING("Document No.", "Line No.");
                        column(SIL_Quantity; "Purch. Cr. Memo Line".Quantity)
                        {
                        }
                        column(Item; "Purch. Cr. Memo Line"."No.")
                        {
                        }
                        column(SIL_Des; "Purch. Cr. Memo Line".Description)
                        {
                        }
                        column(SIL_Amount; "Purch. Cr. Memo Line".Amount)
                        {
                        }
                        column(CF; CF)
                        {
                        }
                        column(SIL_ecess; 0) //"Purch. Cr. Memo Line"."eCess Amount") //PCPL-Deepak
                        {
                        }
                        column(SIL_SheEcess; 0) //"Purch. Cr. Memo Line"."SHE Cess Amount") //PCPL-Deepak
                        {
                        }
                        column(SIL_Disc; "Purch. Cr. Memo Line"."Line Discount Amount")
                        {
                        }
                        column(SIL_ExciseAmount; 0) //"Purch. Cr. Memo Line"."BED Amount") //PCPL-Deepak
                        {
                        }
                        column(ADC_Vat; 0) //"Purch. Cr. Memo Line"."ADC VAT Amount") //PCPL-Deepak
                        {
                        }
                        column(SIL_TaxAmount; 0) //"Purch. Cr. Memo Line"."Tax Amount") //PCPL-Deepak
                        {
                        }
                        column(SrNo; SrNo)
                        {
                        }
                        column(Sub_Total; "Purch. Cr. Memo Line".Amount) //+"Purch. Cr. Memo Line"."Excise Amount"+"Purch. Cr. Memo Line"."Tax Amount") //PCPL-Deepak
                        {
                        }
                        column(TaxableAmt; "Purch. Cr. Memo Line".Amount) //+"Purch. Cr. Memo Line"."Excise Amount") //PCPL-Deepak
                        {
                        }
                        column(NoText; NoText[1])
                        {
                        }
                        column(SIL_UPP; "Purch. Cr. Memo Line"."Units per Parcel")
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
                            sil1.SETRANGE(sil1."Document No.", "Purch. Cr. Memo Hdr."."No.");
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
                            // IF ExcisePosSetup.FINDFIRST THEN
                            // BEGIN //PCPL-Deepak
                            ExPer := 0; //ExcisePosSetup."BED %"; //PCPL-Deepak
                            eCessPer := 0; //ExcisePosSetup."eCess %"; //PCPL-Deepak
                            sheCessPer := 0; //ExcisePosSetup."SHE Cess %"; //PCPL-Deepak
                            ADCper := 0; //ExcisePosSetup."ADC VAT %"; //PCPL-Deepak
                            //END; //PCPL-Deepak
                            //Amt:=Amt+"Purch. Cr. Memo Line".Amount;
                            IF "Purch. Cr. Memo Line"."Tax Group Code" = 'VAT5' THEN BEGIN
                                VatAmount := 0; //(("Purch. Cr. Memo Line"."Tax Amount"*4)/5)/Line; //PCPL-Deepak
                                AddVatAmount := 0; //(("Purch. Cr. Memo Line"."Tax Amount"*2)/5)/Line; //PCPL-Deepak
                                VatPer := 4 / Line;
                                TaxPer := 5;
                                TaxType := 'VAT';
                                addVatPer := 1 / Line;
                            END
                            ELSE
                                IF "Purch. Cr. Memo Line"."Tax Group Code" = 'VAT8' THEN BEGIN
                                    VatAmount := 0; //(("Purch. Cr. Memo Line"."Tax Amount"*8)/8)/Line; //PCPL-Deepak
                                    VatPer := 4 / Line;
                                    TaxPer := 8;
                                    TaxType := 'VAT';
                                END
                                ELSE
                                    IF "Purch. Cr. Memo Line"."Tax Group Code" = 'VAT125' THEN BEGIN
                                        VatAmount := 0; //(("Purch. Cr. Memo Line"."Tax Amount"*12.5)/12.5)/Line; //PCPL-Deepak
                                        VatPer := 12.5 / Line;
                                        TaxPer := 12.5;
                                        TaxType := 'VAT';
                                    END
                                    ELSE
                                        IF "Purch. Cr. Memo Line"."Tax Group Code" = 'CST5' THEN BEGIN
                                            CSTper := 5 / Line;
                                            TaxPer := 5;
                                            TaxType := 'CST';
                                        END
                                        ELSE
                                            IF "Purch. Cr. Memo Line"."Tax Group Code" = 'CST2' THEN BEGIN
                                                CSTper := 2 / Line;
                                                TaxPer := 2;
                                                TaxType := 'CST';

                                            END
                                            ELSE
                                                IF "Purch. Cr. Memo Line"."Tax Group Code" = 'CST12.5' THEN BEGIN
                                                    CSTper := 1 / Line;
                                                    TaxPer := 12.5;
                                                    TaxType := 'CST';
                                                END;


                            RepCheck.InitTextVariable;
                            //RepCheck.FormatNoText(NoText,ROUND((("Purch. Cr. Memo Line".Amount+"Purch. Cr. Memo Line"."Excise Amount"+"Purch. Cr. Memo Line"."Tax Amount"*/)/CF),1,'='),''); //PCPL-Deepak

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
                        Rec_loc.SETRANGE(Rec_loc.Code, "Purch. Cr. Memo Hdr."."Location Code");
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
                        Rec_Cust.SETRANGE(Rec_Cust."No.", "Purch. Cr. Memo Hdr."."Sell-to Customer No.");
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
                        //IF recExciseProdSetup.GET(recItem."Excise Prod. Posting Group") THEN; //PCPL-Deepak
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
        CTIN: Code[20];
        CCST: Code[20];
        CLST: Code[20];
        CECC: Code[20];
        CPAN: Code[20];
        SrNo: Integer;
        RepCheck: Report 1401;
        NoText: array[2] of Text;
        Rec_loc: Record Location;
        CRAN: Code[20];
        CDIV: Code[20];
        CCOMM: Code[20];
        VACU: Code[20];
        TIN: Code[20];
        text: array[4] of Text;
        test: array[2] of Text;
        teft: array[2] of Text;
        tent: array[2] of Text;
        Amt: Decimal;
        sil1: Record "Purch. Cr. Memo Line";
        ecess: Decimal;
        Excise: Decimal;
        tax: Decimal;
        she: Decimal;
        recIL: Record "Purch. Cr. Memo Line";
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

