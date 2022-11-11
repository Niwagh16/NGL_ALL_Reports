report 50071 "Vendor Account mail"
{
    // version KAR 1.0

    ProcessingOnly = true;

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            CalcFields = "Net Change (LCY)";
            DataItemTableView = WHERE("Balance Approval Mail" = FILTER(true));
            RequestFilterFields = "No.", "Date Filter";

            trigger OnAfterGetRecord();
            begin
                IF (serialno = 0) THEN BEGIN
                    vend.RESET;
                    vend.SETRANGE("Balance Approval Mail", TRUE);
                    vend.SETFILTER("Approval Date", '%1', 0D);
                    vend.SETFILTER("Approval Date 2", '%1', 0D);
                    IF vend.FINDFIRST THEN
                        REPEAT
                            vend."Approval Date" := GETRANGEMIN("Date Filter");
                            vend."Approval Date 2" := GETRANGEMAX("Date Filter");
                            vend.MODIFY;
                        UNTIL vend.NEXT = 0;
                    vend.RESET;
                    vend.SETRANGE("Balance Approval Mail", TRUE);
                    IF vend.FINDFIRST THEN BEGIN
                        cnt := vend.COUNT;
                    END;
                END;
                IF Vendor."Balance Approval Mail" = TRUE THEN
                    SendEmail(Vendor);
                serialno += 1;

                IF cnt = serialno THEN BEGIN
                    vend.RESET;
                    vend.SETRANGE("Balance Approval Mail", TRUE);
                    vend.SETFILTER("Approval Date", '<>%1', 0D);
                    vend.SETFILTER("Approval Date 2", '<>%1', 0D);
                    IF vend.FINDFIRST THEN
                        REPEAT
                            vend."Approval Date" := 0D;
                            vend."Approval Date 2" := 0D;
                            vend.MODIFY;
                        UNTIL vend.NEXT = 0;
                END;
            end;

            trigger OnPreDataItem();
            begin
                Vendor.SETRANGE("Balance Approval Mail", TRUE);
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

    trigger OnPreReport();
    begin
        TotalBal := 0;
        VendFilter := Vendor.GETFILTERS;
        VendDateFilter := Vendor.GETFILTER("Date Filter");
    end;

    var
        PIH: Record "Purch. Inv. Header";
        InvoiceNo: Text;
        PrintOnlyOnePerPage: Boolean;
        StartBalanceLCY: Decimal;
        VendDateFilter: Text[100];
        PrintAllHavingBal: Boolean;
        VendBalanceLCY: Decimal;
        VendFilter: Text[250];
        VendLedgEntryExists: Boolean;
        PrintAmountsInLCY: Boolean;
        VendAmount: Decimal;
        VendRemainAmount: Decimal;
        VendCurrencyCode: Code[10];
        VendEntryDueDate: Date;
        BankAccouLedgerEntry: Record "Bank Account Ledger Entry";
        Checkno: Code[20];
        test1: Text;
        glaccount1: Record "G/L Account";
        BankAccount: Record "Bank Account";
        purinvoicehead: Record "Purch. Inv. Header";
        opentds: Decimal;
        TotalBal: Decimal;
        CompanyInfo: Record "Company Information";
        ShowCheckNo: Boolean;
        ShowNarration: Boolean;
        ConfirmationAccount: Label 'Given below is the details of your Accounts as standing in my/our Books of Accounts for the above mentioned period.Kindly return 3 copies stating your I.T. Permanent A/c No., duly signed and sealed, in confirmation of the same. Please note that if no replay is received from you within a fortnight, it will be assumed that you have accepted the balance shown below.';
        Address2: Label 'Head Office: 301, E-Square, Subhash Road, Vile Parle (East),Mumbai- 400 057, India. ';
        PANNO: Label 'AACN4805H';
        Amtt: Decimal;
        serialno: Integer;
        cnt: Integer;
        AttmntFileName: Text;
        Attchmnt: Text;
        vendno: Text;
        retuvalue: Boolean;
        report50015: Report "Vendor Confirmation Account";
        FileName: Text;
        Date1: Date;
        DateFilter2: Date;
        vend: Record Vendor;
        OutStr: OutStream;
        InStr: InStream;
        Recref: RecordRef;
        TempBlob: Codeunit "Temp Blob";

        Emailmessage: Codeunit "Email Message";
        Email: Codeunit Email;
        BodyText: BigText;

    local procedure SendEmail(recvend: Record Vendor);
    var
        // SMTPMailSetup: Record "SMTP Mail Setup";
        Compinfo: Record "Company Information";
        VarEmailSender: Text;
        VarRecipaint: list of [Text];
        VarRecipaintCC: list of [Text];
        // SMTP: Codeunit "SMTP Mail";
        Filepath: Text;
        RECVendor: Record Vendor;
    begin
        //SMTPMailSetup.GET;
        Compinfo.GET;
        //VarEmailSender := SMTPMailSetup."User ID";
        //VarRecipaint := 'itmumbai@nglfinechem.com';

        //IF recvend."E-Mail" ='' THEN
        // CurrReport.SKIP;    //PCPL-BRB 20211014
        VarRecipaint.Add(recvend."E-Mail");//+';'+recvend."E-Mail1"+';'+recvend."E-Mail2";
                                           // SMTP.CreateMessage('', VarEmailSender, VarRecipaint, 'Balance Confirmation', '', TRUE);
        RECVendor.RESET;
        RECVendor.SETRANGE(RECVendor."No.", recvend."No.");
        IF RECVendor.FINDFIRST THEN BEGIN
            FileName := '\\192.168.2.100\Document Attachment(DoNotDel)\Posted Inspection sheet\' + CONVERTSTR(FORMAT(RECVendor."No."), '/', '_') + '.pdf';
            Recref.GetTable(RECVendor);
            TempBlob.CreateOutStream(OutStr);
            Report.SaveAs(Report::"Vendor Confirmation Account", '', ReportFormat::Pdf, OutStr, Recref);
            TempBlob.CreateInStream(InStr);
            Emailmessage.AddAttachment('Balance Confirmation', '.pdf', InStr);

        END;

        BodyText.AddText('Dear Sir/Madam,');
        BodyText.AddText('<br><Br>');
        VarRecipaintcc.Add('swati@nglfinechem.com;accounts@nglfinechem.com;shaileshmanek1958@gmail.com');
        //SMTP.AddCC(VarRecipaintcc);
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
        Emailmessage.Create(VarRecipaint, 'Balance Confirmation', Format(BodyText), true, VarRecipaintcc, VarRecipaintcc);
        Email.Send(Emailmessage, Enum::"Email Scenario"::Default);
    end;
}

