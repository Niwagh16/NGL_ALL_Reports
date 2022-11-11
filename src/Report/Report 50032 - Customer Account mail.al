report 50032 "Customer Account mail"
{
    // version KAR 1.0

    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            CalcFields = "Net Change (LCY)";
            DataItemTableView = WHERE("Balance Approval Mail" = FILTER(true));
            RequestFilterFields = "No.", "Date Filter";

            trigger OnAfterGetRecord();
            begin
                IF Customer."Balance Approval Mail" = TRUE THEN
                    SendEmail(Customer);
            end;

            trigger OnPreDataItem();
            begin
                Customer.SETRANGE("Balance Approval Mail", TRUE);

                CustFilter := Customer.GETFILTERS;
                CustDateFilter := Customer.GETFILTER("Date Filter");
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(ShowCheckNo; ShowCheckNo)
                {
                    Caption = 'Show Check No And  Balance Account No';
                    Visible = false;
                }
                field(ShowNarration; ShowNarration)
                {
                    Caption = 'Show Narration';
                    Visible = false;
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

    trigger OnPostReport();
    begin
        MESSAGE('done');
    end;

    var
        ConfirmationAccount: Label 'Given below is the details of your Accounts as standing in my/our Books of Accounts for the above mentioned period.Kindly return 3 copies stating your I.T. Permanent A/c No., duly signed and sealed, in confirmation of the same. Please note that if no replay is received from you within a fortnight, it will be assumed that you have accepted the balance shown below.';
        Address2: Label 'Head Office: 301, E-Square, Subhash Road, Vile Parle (East),Mumbai- 400 057, India.';
        PANNO: Label 'AACN4805H';
        AttmntFileName: Text;
        Attchmnt: Text;
        FileName: Text;
        Cust: Record Customer;
        ShowCheckNo: Code[10];
        ShowNarration: Text;
        CustDateFilter: Text;
        CustFilter: Text;
        OutStr: OutStream;
        InStr: InStream;
        Recref: RecordRef;
        TempBlob: Codeunit "Temp Blob";

        Emailmessage: Codeunit "Email Message";
        Email: Codeunit Email;
        BodyText: BigText;

    local procedure SendEmail(recCust: Record Customer);
    var
        //SMTPMailSetup: Record 409;
        Compinfo: Record "Company Information";
        VarEmailSender: Text;
        VarRecipaint: Text;
        VarRecipaint1: List of [text];
        VarRecipaint11: List of [text];
        // SMTP: Codeunit 400;
        Filepath: Text;
        RECCustomer: Record Customer;
    begin
        //SMTPMailSetup.GET;
        Compinfo.GET;
        //VarEmailSender := SMTPMailSetup."User ID";
        VarRecipaint := recCust."E-Mail";
        VarRecipaint1.Add(recCust."E-Mail");
        //SMTP.CreateMessage('', VarEmailSender, VarRecipaint1, 'Balance Confirmation', '', TRUE);
        RECCustomer.RESET;
        RECCustomer.SETRANGE(RECCustomer."No.", recCust."No.");
        RECCustomer.SETFILTER("Date Filter", CustDateFilter);    //PCPL-25
        IF RECCustomer.FINDFIRST THEN BEGIN
            FileName := '\\192.168.2.100\Document Attachment(DoNotDel)\Posted Inspection sheet\' + CONVERTSTR(FORMAT(RECCustomer."No."), '/', '_') + '.pdf';
            //REPORT.SAVEASPDF(50016, FileName, RECCustomer);
            //SMTP.AddAttachment(FileName, '');
            Recref.GetTable(RECCustomer);
            TempBlob.CreateOutStream(OutStr);
            Report.SaveAs(Report::"Customer Confirmation Account", '', ReportFormat::Pdf, OutStr, Recref);
            TempBlob.CreateInStream(InStr);
            //path := 'D:\New folder (2)';
            //SMTp.AddAttachment(pdfname1 + '.pdf', '');
            Emailmessage.AddAttachment('Balance Confirmation', '.pdf', InStr);
        END;

        BodyText.AddText('Dear Sir/Madam,');
        BodyText.AddText('<br><Br>');
        VarRecipaint11.Add('swati@nglfinechem.com;accounts@nglfinechem.com;shaileshmanek1958@gmail.com');
        //SMTP.AddCC(VarRecipaint11);
        BodyText.AddText('This is to inform you that the accounts of NGL Fine-Chem Limited are being audited by the auditors, M/s Manek & Associates,Chartered Accountants.'
        + ' As a part of the audit, a confirmation of balance payable or receivable by our company to you is required for the year ended 31st March 2022.');
        BodyText.AddText('<br><Br>');
        BodyText.AddText('We request you to issue your confirmation letter in the format attached herewith and mail directly to the auditors at their email ID'
          + ' shaileshmanek1958@gmail.com with a copy marked to swati@nglfinechem.com and accounts@nglfinechem.com.');
        BodyText.AddText('<br><Br>');
        BodyText.AddText('If your response is not received till 15-04-2022, it will be presumed that the balance is correct.');
        BodyText.AddText('<br><Br>');
        BodyText.AddText('Your early action in this regard will be highly appreciated.');
        BodyText.AddText('<br><Br>');
        BodyText.AddText('Thanks & Regards');
        BodyText.AddText('<br><Br>');
        BodyText.AddText(Compinfo.Name);
        //SMTP.Send;
        Emailmessage.Create(VarRecipaint1, 'Balance Confirmation', Format(BodyText), true, VarRecipaint11, VarRecipaint11);
        Email.Send(Emailmessage, Enum::"Email Scenario"::Default);
    end;
}

