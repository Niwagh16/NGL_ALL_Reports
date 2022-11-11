report 50038 "Over Due Mail"
{
    // version //PCPL 38

    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            // DataItemTableView = WHERE("VAT Exempted" = FILTER(false)); //PCPL/NSW/MIG  03Aug22

            trigger OnAfterGetRecord();
            begin
                recSaleSetup.GET;
                IF "Currency Code" = '' THEN
                    SendMailToCust(Customer."No.")
                //ELSE //PCPL/NSW/MIG  03Aug22
                //SendMailToCustExport(Customer."No.");//PCPL/NSW/MIG  03Aug22
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

    trigger OnPostReport();
    begin
        MESSAGE('Done');
    end;

    var
        recCust: Record Customer;
        vDate: Date;
        VarEmailSender: Text;
        VarRecipaint: Text;
        VarRecipaint11: list of [text];
        VarRecipaint11CC: list of [text];
        // SMTP: Codeunit "SMTP Mail";
        recSaleSetup: Record "Sales & Receivables Setup";
        vDue: Text;
        vOverDue: Integer;
        recSIH: Record "Sales Invoice Header";
        //PostedExportPayterms: Record "Posted Export Payment Terms";
        PayExpDate: Date;
        NoofDate: Integer;
        currcode: Code[10];
        PaymentTerms: Record "Payment Terms";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        PayMail: Boolean;
        REcCust12: Record Customer;
        CustLedgEntry: Record "Cust. Ledger Entry";
        ExportAttmntFileName: Text;
        ExportAttchmnt: Text;
        ExportSaleNo: Text;
        AttmntFileName: Text;
        Attchmnt: Text;
        SaleNo: Text;

    procedure SendMailToCust(CustNo: Code[20]);
    var
        Customer: Record Customer;
        CustLedgEntry: Record "Cust. Ledger Entry";
        SalesPerson: Record "Salesperson/Purchaser";
        // SMTPMail: Codeunit "SMTP Mail";
        //SMTPSetup: Record "SMTP Mail Setup";
        intDays: Integer;
        blSendMail: Boolean;
        decTtlOrgAmt: Decimal;
        decRemAmt: Decimal;
        recCompany: Record Company;
        decTtlOvlOrgAmt: Decimal;
        decTtlRemAmt: Decimal;
        CompanyInfo: Record "Company Information";
        OutStr: OutStream;
        InStr: InStream;
        Recref: RecordRef;
        TempBlob: Codeunit "Temp Blob";

        Emailmessage: Codeunit "Email Message";
        Email: Codeunit Email;
        BodyText: BigText;
    begin
        //SMTPSetup.GET;
        recCust.GET(CustNo);
        CustLedgEntry.RESET;
        CustLedgEntry.SETCURRENTKEY(Open, "Due Date");
        CustLedgEntry.SETRANGE(CustLedgEntry."Customer No.", CustNo);
        CustLedgEntry.SETRANGE(Open, TRUE);
        CustLedgEntry.SETRANGE(CustLedgEntry."Document Type", CustLedgEntry."Document Type"::Invoice);
        CustLedgEntry.SETFILTER("Due Date", '<%1', TODAY);
        CustLedgEntry.SETAUTOCALCFIELDS("Amount (LCY)", "Remaining Amt. (LCY)");
        CustLedgEntry.SETASCENDING("Due Date", TRUE);
        IF CustLedgEntry.FINDLAST THEN BEGIN
            //CLEAR(vOverDue);//PCPL0041-13022020
            IF CustLedgEntry."Due Date" <> 0D THEN
                //vOverDue:=(TODAY-CustLedgEntry."Due Date") MOD 7;//PCPL0041-13022020
                recSIH.RESET;
            recSIH.SETRANGE("No.", CustLedgEntry."Document No.");
            IF recSIH.FINDFIRST THEN BEGIN
                PaymentTerms.RESET;
                PaymentTerms.SETRANGE(Code, recSIH."Payment Terms Code");
                PaymentTerms.SETRANGE("PDC Mail", FALSE);
                IF PaymentTerms.FINDFIRST THEN BEGIN
                    //IF vOverDue=0 THEN BEGIN//PCPL0041-13022020
                    currcode := 'INR';
                    VarEmailSender := '';
                    VarRecipaint := recCust."E-Mail";//PCPL0041-13022020
                    VarRecipaint11.Add(recCust."E-Mail");
                    //VarRecipaint := 'monali.patil@pacificconsulting.in'+';'+'abhijith.nair@pacificconsulting.in'+';'+'itmumbai@nglfinechem.com';
                    //SMTP.CreateMessage('NGL Fine Chem Limited', recSaleSetup."Over Due Mail", VarRecipaint11, 'Pending Payment', '', TRUE);
                    VarRecipaint11CC.Add(recSaleSetup."Over Due Mail CC");
                    // SMTP.AddCC(VarRecipaint11CC);

                    BodyText.AddText('Dear Sir/Madam,');
                    BodyText.AddText('<br><br>');
                    BodyText.AddText('Kindly arrange to release the below pending payment at the earliest.');
                    BodyText.AddText('<br><br>');

                    BodyText.AddText('<table border="1">');
                    BodyText.AddText('<br><br>');
                    BodyText.AddText('<tr style="background-color:#507CD1; color:#fff">');
                    BodyText.AddText('<th><p align="center">Date</p></th>');
                    BodyText.AddText('<th>Invoice No.</th>');
                    BodyText.AddText('<th>Customer Name</th>');
                    BodyText.AddText('<th>Currency Code</th>');
                    BodyText.AddText('<th>Buyer refe. No.</th>');
                    BodyText.AddText('<th>Amount</th>');
                    BodyText.AddText('<th>Credit Period</th>');
                    BodyText.AddText('<th>Due Date</th>');
                    BodyText.AddText('<th>Due Month</th>');
                    BodyText.AddText('<th>Overdue days</th>');
                    BodyText.AddText('</tr>');
                    CustLedgEntry.RESET;
                    CustLedgEntry.SETCURRENTKEY(Open, "Due Date");
                    CustLedgEntry.SETRANGE(CustLedgEntry."Customer No.", CustNo);
                    CustLedgEntry.SETRANGE(Open, TRUE);
                    CustLedgEntry.SETRANGE(CustLedgEntry."Document Type", CustLedgEntry."Document Type"::Invoice);
                    CustLedgEntry.SETFILTER("Due Date", '<%1', TODAY);
                    CustLedgEntry.SETAUTOCALCFIELDS("Amount (LCY)", "Remaining Amt. (LCY)", Amount, "Remaining Amount");
                    CustLedgEntry.SETASCENDING("Due Date", TRUE);
                    IF CustLedgEntry.FINDSET THEN
                        REPEAT
                            recSIH.RESET;
                            recSIH.SETRANGE("No.", CustLedgEntry."Document No.");
                            IF recSIH.FINDFIRST THEN;
                            BodyText.AddText('<tr>');
                            BodyText.AddText('<td>' + FORMAT(CustLedgEntry."Posting Date", 0, '<Day,2>/<Month,2>/<Year4>') + '</td>');
                            BodyText.AddText('<td>' + FORMAT(CustLedgEntry."Document No.") + '</td>');
                            BodyText.AddText('<td>' + recCust.Name + '</td>');
                            BodyText.AddText('<td>' + FORMAT(currcode) + '</td>');
                            BodyText.AddText('<td>' + recSIH."Buyer Reference No." + '</td>');
                            //SMTP.AppendBody('<td>' + FORMAT(CustLedgEntry.Amount) + '</td>');
                            BodyText.AddText('<td>' + FORMAT(CustLedgEntry."Remaining Amount") + '</td>');
                            BodyText.AddText('<td>' + recSIH."Payment Terms Code" + '</td>');
                            BodyText.AddText('<td>' + FORMAT(CustLedgEntry."Due Date", 0, '<Day,2>/<Month,2>/<Year4>') + '</td>');
                            BodyText.AddText('<td>' + FORMAT(CustLedgEntry."Due Date", 0, '<MONTH TEXT>,<YEAR4>') + '</td>');
                            BodyText.AddText('<td>' + FORMAT(ABS(CustLedgEntry."Due Date" - TODAY)) + '</td>');
                            BodyText.AddText('</tr>');

                        /*//PCPL-25 28dec20
                        SaleNo := CONVERTSTR(FORMAT(recSIH."No."),'/','_');
                        AttmntFileName := SaleNo+'.pdf';
                        Attchmnt := 'D:\Report Attchment\Local Sale\'+SaleNo+'.pdf';
                        REPORT.SAVEASPDF(50095,Attchmnt,recSIH);
                        SMTP.AddAttachment(Attchmnt,AttmntFileName);
                       //PCPL-25 28dec20
                       */
                        UNTIL (CustLedgEntry.NEXT = 0);

                    BodyText.AddText('</table>');
                    BodyText.AddText('<br>');
                    BodyText.AddText('<br>');
                    BodyText.AddText('<br><br>');
                    BodyText.AddText('<HR>');
                    BodyText.AddText('“If you have already paid, kindly ignore this payment reminder.”');
                    BodyText.AddText('<br><br>');
                    BodyText.AddText('Regards,');
                    BodyText.AddText('<br>');
                    BodyText.AddText('Manager  ');
                    BodyText.AddText('<br>');
                    BodyText.AddText('NGL Fine Chem Limited ');
                    BodyText.AddText('<br>');
                    BodyText.AddText('301, E Square,');
                    BodyText.AddText('<br>');
                    BodyText.AddText('Subhash Road,Vileparle (E), Mumbai 400 057, India');
                    BodyText.AddText('<br>');
                    BodyText.AddText('Phone  +91 22 26636450 (Board)');
                    BodyText.AddText('<br>');
                    BodyText.AddText('Email:info@nglfinechem.com');
                    BodyText.AddText('<br>');
                    BodyText.AddText('URL: www.nglfinechem.com');
                    BodyText.AddText('<br><br>');

                    //SMTP.Send;
                    Emailmessage.Create(VarRecipaint11, 'Pending Payment', Format(BodyText), true, VarRecipaint11CC, VarRecipaint11CC);
                    Email.Send(Emailmessage, Enum::"Email Scenario"::Default);
                    //END;//PCPL0041-13022020
                END;
            END;
        END;

    end;
    /* //PCPL/NSW/MIG  03Aug22
    procedure SendMailToCustExport(CustNo: Code[20]);
    var
        Customer: Record customer;
        CustLedgEntry: Record "Cust. Ledger Entry";
        SalesPerson: Record "Salesperson/Purchaser";
        SMTPMail: Codeunit "SMTP Mail";
        SMTPSetup: Record "SMTP Mail Setup";
        intDays: Integer;
        blSendMail: Boolean;
        decTtlOrgAmt: Decimal;
        decRemAmt: Decimal;
        recCompany: Record Company;
        decTtlOvlOrgAmt: Decimal;
        decTtlRemAmt: Decimal;
        CompanyInfo: Record "Company Information";
    begin
        SMTPSetup.GET;
        recCust.GET(CustNo);
        CustLedgEntry.RESET;
        CustLedgEntry.SETCURRENTKEY(Open, "Due Date");
        CustLedgEntry.SETRANGE(CustLedgEntry."Customer No.", CustNo);
        CustLedgEntry.SETRANGE(Open, TRUE);
        CustLedgEntry.SETRANGE(CustLedgEntry."Document Type", CustLedgEntry."Document Type"::Invoice);
        //CustLedgEntry.SETFILTER("Due Date", '<%1', TODAY);
        CustLedgEntry.SETAUTOCALCFIELDS("Amount (LCY)", "Remaining Amt. (LCY)");
        CustLedgEntry.SETASCENDING("Due Date", TRUE);
        IF CustLedgEntry.FINDFIRST THEN BEGIN
            REPEAT
                PostedExportPayterms.RESET;
                PostedExportPayterms.SETRANGE(PostedExportPayterms."Invoice No.", CustLedgEntry."Document No.");
                PostedExportPayterms.SETFILTER("Due Date", '<%1', TODAY);
                IF PostedExportPayterms.FINDLAST THEN BEGIN
                    recSIH.RESET;
                    recSIH.SETRANGE("No.", CustLedgEntry."Document No.");
                    IF recSIH.FINDFIRST THEN BEGIN
                        PaymentTerms.RESET;
                        PaymentTerms.SETRANGE(Code, recSIH."Payment Terms Code");
                        PaymentTerms.SETRANGE("PDC Mail", FALSE);
                        IF PaymentTerms.FINDFIRST THEN BEGIN
                            PostedExportPayterms.RESET;
                            PostedExportPayterms.SETRANGE(PostedExportPayterms."Invoice No.", CustLedgEntry."Document No.");
                            IF PostedExportPayterms.FINDFIRST THEN BEGIN
                                PayExpDate := PostedExportPayterms."Due Date";
                                IF (PostedExportPayterms."Due Date" = 0D) OR (PostedExportPayterms."Due Date" = TODAY) THEN
                                    CurrReport.SKIP;
                                CLEAR(NoofDate);
                                IF (TODAY > PayExpDate) AND (PayExpDate <> 0D) THEN BEGIN
                                    NoofDate := TODAY - PayExpDate;
                                END;
                            END;
                            //CLEAR(vOverDue);//PCPL0041-13022020
                            IF PostedExportPayterms."Due Date" <> 0D THEN
                                IF PostedExportPayterms."Due Date" <> TODAY THEN
                                    //vOverDue:=(TODAY-PostedExportPayterms."Due Date") MOD 7;//PCPL0041-13022020
                                    //IF vOverDue=0 THEN BEGIN//PCPL0041-13022020
                                    VarRecipaint := recCust."E-Mail";//PCPL0041-13022020
                                                   // VarRecipaint := 'monali.patil@pacificconsulting.in'+';'+'abhijith.nair@pacificconsulting.in'+';'+'itmumbai@nglfinechem.com'; //pcpl-25
                            SMTP.CreateMessage('NGL Fine Chem Limited', recSaleSetup."Over Due Mail", VarRecipaint, 'Pending Payment', '', TRUE);
                            SMTP.AddCC(recSaleSetup."Over Due Mail CC");

                            SMTP.AppendBody('Dear Sir/Madam,');
                            SMTP.AppendBody('<br><br>');
                            SMTP.AppendBody('Kindly arrange to release the below pending payment at the earliest.');
                            SMTP.AppendBody('<br><br>');
                            SMTP.AppendBody('<table border="1">');
                            SMTP.AppendBody('<br><br>');
                            SMTP.AppendBody('<tr style="background-color:#507CD1; color:#fff">');
                            SMTP.AppendBody('<th> <center> Date </center> </th>');
                            SMTP.AppendBody('<th>Invoice No.</th>');
                            SMTP.AppendBody('<th>Customer Name</th>');
                            SMTP.AppendBody('<th>Currency Code</th>');
                            SMTP.AppendBody('<th>Buyer refe. No.</th>');
                            SMTP.AppendBody('<th>Amount</th>');
                            SMTP.AppendBody('<th>Credit Period</th>');
                            SMTP.AppendBody('<th>Due Date</th>');
                            SMTP.AppendBody('<th>Due Month</th>');
                            SMTP.AppendBody('<th>Overdue days</th>');
                            SMTP.AppendBody('</tr>');

                            CustLedgEntry.RESET;
                            CustLedgEntry.SETCURRENTKEY(Open, "Due Date");
                            CustLedgEntry.SETRANGE(CustLedgEntry."Customer No.", CustNo);
                            CustLedgEntry.SETRANGE(Open, TRUE);
                            CustLedgEntry.SETRANGE(CustLedgEntry."Document Type", CustLedgEntry."Document Type"::Invoice);
                            //CustLedgEntry.SETFILTER("Due Date", '<%1', TODAY);
                            CustLedgEntry.SETAUTOCALCFIELDS("Amount (LCY)", "Remaining Amt. (LCY)", Amount, "Remaining Amount");
                            CustLedgEntry.SETASCENDING("Due Date", TRUE);
                            IF CustLedgEntry.FINDSET THEN
                                REPEAT
                                    PostedExportPayterms.RESET;
                                    PostedExportPayterms.SETRANGE(PostedExportPayterms."Invoice No.", CustLedgEntry."Document No.");
                                    IF PostedExportPayterms.FINDFIRST THEN BEGIN
                                        PayExpDate := PostedExportPayterms."Due Date";
                                        IF PostedExportPayterms."Due Date" = 0D THEN
                                            CurrReport.SKIP;
                                        CLEAR(NoofDate);
                                        IF (TODAY > PayExpDate) AND (PayExpDate <> 0D) THEN BEGIN
                                            NoofDate := TODAY - PayExpDate;
                                        END;
                                    END;
                                    IF PayExpDate < TODAY THEN BEGIN//PCPL0041-13022020
                                        recSIH.RESET;
                                        recSIH.SETRANGE("No.", CustLedgEntry."Document No.");
                                        IF recSIH.FINDFIRST THEN;
                                        SMTP.AppendBody('<tr>');
                                        SMTP.AppendBody('<td>' + FORMAT(CustLedgEntry."Posting Date", 0, '<Day,2>/<Month,2>/<Year4>') + '</td>');
                                        SMTP.AppendBody('<td>' + FORMAT(CustLedgEntry."Document No.") + '</td>');
                                        SMTP.AppendBody('<td>' + recCust.Name + '</td>');
                                        SMTP.AppendBody('<td>' + FORMAT(CustLedgEntry."Currency Code") + '</td>');
                                        SMTP.AppendBody('<td>' + recSIH."Buyer Reference No." + '</td>');
                                        //SMTP.AppendBody('<td>' + FORMAT(CustLedgEntry.Amount) + '</td>');
                                        SMTP.AppendBody('<td>' + FORMAT(CustLedgEntry."Remaining Amount") + '</td>');
                                        SMTP.AppendBody('<td>' + recSIH."Payment Terms Code" + '</td>');
                                        SMTP.AppendBody('<td>' + FORMAT(PayExpDate, 0, '<Day,2>/<Month,2>/<Year4>') + '</td>');//FORMAT("Due Date") + '</td>');
                                        SMTP.AppendBody('<td>' + FORMAT(PayExpDate, 0, '<MONTH TEXT>,<YEAR4>') + '</td>');//FORMAT("Due Date",0,'<MONTH TEXT>,<YEAR4>') + '</td>');
                                        SMTP.AppendBody('<td>' + FORMAT(ABS(NoofDate)) + '</td>');//FORMAT("Due Date"-TODAY) + '</td>');
                                        SMTP.AppendBody('</tr>');
                                        //PCPL-25 28dec20
                                        ExportSaleNo := CONVERTSTR(FORMAT(recSIH."No."), '/', '_');//DELCHR(recSIH."No.",'=','/\');
                                        ExportAttmntFileName := ExportSaleNo + '.pdf';
                                        ExportAttchmnt := 'C:\Report Attachment\Export Sale\' + ExportSaleNo + '.pdf';
                                        REPORT.SAVEASPDF(50000, ExportAttchmnt, recSIH);
                                        SMTP.AddAttachment(ExportAttchmnt, ExportAttmntFileName);
                                        //PCPL-25 28dec20
                                    END;//PCPL0041-13022020
                                UNTIL (CustLedgEntry.NEXT = 0);

                            SMTP.AppendBody('</table>');
                            SMTP.AppendBody('<br>');
                            SMTP.AppendBody('<br>');
                            SMTP.AppendBody('<br><br>');
                            SMTP.AppendBody('<HR>');
                            SMTP.AppendBody('“If you have already paid, kindly ignore this payment reminder.”');
                            SMTP.AppendBody('<br><br>');
                            SMTP.AppendBody('Regards,');
                            SMTP.AppendBody('<br>');
                            SMTP.AppendBody('Manager  ');
                            SMTP.AppendBody('<br>');
                            SMTP.AppendBody('NGL Fine Chem Limited ');
                            SMTP.AppendBody('<br>');
                            SMTP.AppendBody('301, E Square,');
                            SMTP.AppendBody('<br>');
                            SMTP.AppendBody('Subhash Road,Vileparle (E), Mumbai 400 057, India');
                            SMTP.AppendBody('<br>');
                            SMTP.AppendBody('Phone  +91 22 26636450 (Board)');
                            SMTP.AppendBody('<br>');
                            SMTP.AppendBody('Email:info@nglfinechem.com');
                            SMTP.AppendBody('<br>');
                            SMTP.AppendBody('URL: www.nglfinechem.com');
                            SMTP.AppendBody('<br><br>');
                            SMTP.Send;
                            //END;//PCPL0041-13022020
                        END;
                    END;
                END;
            UNTIL CustLedgEntry.NEXT = 0;
        END;
    end;
    *///PCPL/NSW/MIG  03Aug22
}

