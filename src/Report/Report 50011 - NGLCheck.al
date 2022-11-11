report 50011 NGLCheck
{
    // version KAR 1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\NGLCheck.rdl';

    dataset
    {
        dataitem("Gen. Journal Line"; "Gen. Journal Line")
        {
            RequestFilterFields = "Document No.";
            column(Gen_Amount1; "Gen. Journal Line".Amount - 0)//"Gen. Journal Line"."TDS/TCS Amount") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(TDSTCSAmount_GenJournalLine; 0)//"Gen. Journal Line"."TDS/TCS Amount") //PCPL/NSW/MIG  03Aug22
            {
            }
            column(Posting_Date; "Gen. Journal Line"."Cheque Date")
            {
            }
            column(Payee_name; "Gen. Journal Line".Description)
            {
            }
            column(d1; DateStringArray[1])
            {
            }
            column(d2; DateStringArray[2])
            {
            }
            column(m1; DateStringArray[3])
            {
            }
            column(m2; DateStringArray[4])
            {
            }
            column(y1; DateStringArray[5])
            {
            }
            column(y2; DateStringArray[6])
            {
            }
            column(y3; DateStringArray[7])
            {
            }
            column(y4; DateStringArray[8])
            {
            }
            column(AmountInWords1; NumberText[1] + NumberText[2])
            {
            }
            column(AmountInWords2; NumberText[2])
            {
            }
            column(TotAmt; TotAmt)
            {
            }
            column(AccountType_GenJournalLine; "Gen. Journal Line"."Account Type")
            {
            }

            trigger OnAfterGetRecord();
            var
                String1: Text[20];
                String2: Text[20];
                String3: Text[20];
                workString: Text[20];
                TmpString2: Text[20];
            begin
                DateString := FORMAT("Gen. Journal Line"."Posting Date");
                //MESSAGE('%1',DateString);

                workString := CONVERTSTR(DateString, '/', ',');
                String1 := SELECTSTR(1, workString);
                String2 := SELECTSTR(2, workString);
                String3 := SELECTSTR(3, workString);

                TmpString := INSSTR(String1, '-', 2);
                TmpString2 := CONVERTSTR(TmpString, '-', ',');

                DateStringArray[1] := SELECTSTR(1, TmpString2);
                DateStringArray[2] := SELECTSTR(2, TmpString2);

                TmpString := INSSTR(String2, '-', 2);
                TmpString2 := CONVERTSTR(TmpString, '-', ',');

                DateStringArray[3] := SELECTSTR(1, TmpString2);
                DateStringArray[4] := SELECTSTR(2, TmpString2);
                DateStringArray[5] := '2';
                DateStringArray[6] := '0';

                TmpString := INSSTR(String3, '-', 2);
                TmpString2 := CONVERTSTR(TmpString, '-', ',');

                DateStringArray[7] := SELECTSTR(1, TmpString2);
                DateStringArray[8] := SELECTSTR(2, TmpString2);

                //PCPl-25
                CLEAR(AmtDeb);
                CLEAR(TDSAmt);
                GenJournalLine.RESET;
                GenJournalLine.SETRANGE(GenJournalLine."Document No.", "Document No.");
                IF GenJournalLine.FINDSET THEN BEGIN
                    REPEAT
                        AmtDeb += GenJournalLine."Debit Amount";
                        TDSAmt += 0;  //GenJournalLine."TDS/TCS Amount"; //PCPL-Deepak
                    UNTIL GenJournalLine.NEXT = 0;
                END;
                TotAmt := AmtDeb - TDSAmt;
                //PCPl-25
                CheckReport.InitTextVariable;
                //CheckReport.FormatNoText(NumberText,"Gen. Journal Line".Amount-"Gen. Journal Line"."TDS/TCS Amount","Gen. Journal Line"."Currency Code");  //Temp Comment
                CheckReport.FormatNoText(NumberText, AmtDeb - TDSAmt, "Gen. Journal Line"."Currency Code");

                //MESSAGE('%1',NumberText[1]);
                //MESSAGE('%1%2%3%4%5%6%7%8',DateStringArray[1],DateStringArray[2],DateStringArray[3],DateStringArray[4],DateStringArray[5],DateStringArray[6],DateStringArray[7],DateStringArray[8]);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Numer_Date: array[10] of Text[2];
        Number_Month: Text[2];
        Number_year: Text[4];
        DateString: Text[20];
        TmpString: Text[20];
        DateStringArray: array[8] of Text[16];
        CheckReport: Report 1401;
        NumberText: array[2] of Text[100];
        GenJournalLine: Record "Gen. Journal Line";
        AmtDeb: Decimal;
        TDSAmt: Decimal;
        TotAmt: Decimal;
}

