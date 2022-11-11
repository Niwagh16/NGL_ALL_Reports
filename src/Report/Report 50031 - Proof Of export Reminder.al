report 50031 "Proof Of export Reminder"
{
    // version PCPL-25/proofExp

    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {

            trigger OnAfterGetRecord();
            var
                recSaleSetup: Record "Sales & Receivables Setup";
            begin
                CLEAR(SRNo);
                CLEAR(DueDat);
                CLEAR(noofdays);
                CLEAR(DocNo);
                SIL.RESET;
                SIL.SETRANGE("Proof of Export", TRUE);
                SIL.SETRANGE("Sell-to Customer No.", "No.");
                IF SIL.FINDFIRST THEN BEGIN
                    REPEAT

                        IF SIH.GET(SIL."Document No.") THEN;



                        IF SIH."Currency Code" = '' THEN BEGIN
                            CLEAR(DueDat);
                            CLEAR(OverDueDays);
                            CLEAR(noofdays);
                            IF TODAY > SIL."Posting Date" THEN
                                noofdays := TODAY - SIL."Posting Date";
                            IF noofdays >= 60 THEN BEGIN
                                DueDat := (SIL."Posting Date" + 90);
                                IF DueDat < SIL."Posting Date" THEN
                                    OverDueDays := DueDat - SIL."Posting Date";
                                // SMTPMailSetup.GET;
                                recSaleSetup.GET;
                                VarEmailSender := '';//SMTPMailSetup."User ID";
                                //VarRecipaint := 'itmumbai@nglfinechem.com';
                                VarRecipaint := Customer."E-Mail";    //PCPL-BRB
                                VarRecipaint1.add(Customer."E-Mail");
                                VarRecipaint11.Add(recSaleSetup."Over Due Mail CC");

                                // SMTP.CreateMessage('Proof of export', VarEmailSender, VarRecipaint1, 'Proof of export documents', '', TRUE);
                                // SMTP.AddCC(VarRecipaint11);

                                IF DocNo <> SIH."No." THEN BEGIN
                                    DocNo := SIH."No.";
                                    BodyText.AddText('Dear Sir/Madam');
                                    BodyText.AddText('<br><Br>');
                                    BodyText.AddText('Kindly email us the Proof of export documents against below bill');
                                    BodyText.AddText('<br><Br>');
                                    BodyText.AddText('<table border="1">');
                                    BodyText.AddText('<tr>');
                                    BodyText.AddText('<th> Date' + '</th>');
                                    BodyText.AddText('<th> Invoice No.</th>');
                                    BodyText.AddText('<th> Customer Name </th>');
                                    BodyText.AddText('<th> Currency Code  </th>');
                                    BodyText.AddText('<th> Buyer Reference No  </th>');
                                    BodyText.AddText('<th> Amount </th>');
                                    BodyText.AddText('<th> Due Date for POE </th>');
                                    BodyText.AddText('<th> Due Date  </th>');
                                    BodyText.AddText('<th> Overdue Days  </th>');
                                    BodyText.AddText('</tr>');
                                    BodyText.AddText('<br><Br>');
                                END;
                                SRNo += 1;
                                IF SRNo <> 0 THEN BEGIN
                                    BodyText.AddText('<tr>');
                                    BodyText.AddText('<td>' + FORMAT(SIL."Posting Date") + '</td>');
                                    BodyText.AddText('<td>' + SIL."Document No." + '</td>');
                                    BodyText.AddText('<td>' + SIH."Sell-to Customer Name" + '</td>');
                                    BodyText.AddText('<td>' + 'INR' + '</td>');
                                    BodyText.AddText('<td>' + SIH."Buyer Reference No." + '</td>');
                                    BodyText.AddText('<td>' + FORMAT(SIL.Amount) + '</td>');
                                    BodyText.AddText('<td>' + '90 Days' + '</td>');
                                    BodyText.AddText('<td>' + FORMAT(DueDat) + '</td>');
                                    BodyText.AddText('<td>' + FORMAT(OverDueDays) + '</td>');
                                    BodyText.AddText('</tr>');
                                END;
                            END;
                        END;

                        IF SRNo <> 0 THEN BEGIN
                            BodyText.AddText('</table>');
                            BodyText.AddText('<br><Br>');
                            BodyText.AddText('Please note that');
                            BodyText.AddText('<br><Br>');
                            BodyText.AddText('LET export copy of S/bill and AWB/BL copy is required as Proof of Exports');
                            BodyText.AddText('<br><Br>');
                            BodyText.AddText('LET export date must be within 90 days from the date of Invoice.  Otherwise not eligible for 0.1% GST');
                            BodyText.AddText('<br><Br>');
                            BodyText.AddText('Shipping Bill must be prepared as per  CIRCULAR NO.42/2017-CUSTOMS Dated 7 th November, 2017 of CBEC');
                            BodyText.AddText('<br><Br>');
                            BodyText.AddText('If Export not done as per above, please remit the GST amount with interest to us immediately');
                            BodyText.AddText('<br><Br>');
                            BodyText.AddText('“If you have already given, kindly email the same at our email: info@nglfinechem.com');
                            BodyText.AddText('<br><Br>');
                            BodyText.AddText('“Regards');
                            BodyText.AddText('<br><Br>');
                            BodyText.AddText('“Manager');
                            BodyText.AddText('<br><Br>');
                            BodyText.AddText('NGL Fine Chem Limited');
                            BodyText.AddText('<br>');
                            BodyText.AddText('301, E Square,');
                            BodyText.AddText('<br>');
                            BodyText.AddText('Subhash Road,Vileparle (E), Mumbai 400 057, India');
                            BodyText.AddText('<br>');
                            BodyText.AddText('Phone +91 22 40842250 (Board)');
                            BodyText.AddText('<br>');
                            BodyText.AddText('Email:info@nglfinechem.com');
                            BodyText.AddText('<br>');
                            BodyText.AddText('URL: www.nglfinechem.com');
                            BodyText.AddText('<br>');

                            //SMTP.Send;
                            Emailmessage.Create(VarRecipaint1, 'Proof of export documents', Format(BodyText), true, VarRecipaint11, VarRecipaint11);
                            Email.Send(Emailmessage, Enum::"Email Scenario"::Default);
                        END;
                    UNTIL SIL.NEXT = 0;
                END;
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
        VarEmailSender: Text;
        VarRecipaint: Text;
        //SMTP: Codeunit "SMTP Mail";
        // SMTPMailSetup: Record "SMTP Mail Setup";
        SIL: Record "Sales Invoice Line";
        SRNo: Integer;
        noofdays: Integer;
        SIH: Record "Sales Invoice Header";
        DueDat: Date;
        OverDueDays: Integer;
        DocNo: Code[20];
        VarRecipaint1: list of [text];
        VarRecipaint11: list of [text];
        OutStr: OutStream;
        InStr: InStream;
        Recref: RecordRef;
        TempBlob: Codeunit "Temp Blob";

        Emailmessage: Codeunit "Email Message";
        Email: Codeunit Email;
        BodyText: BigText;
}

