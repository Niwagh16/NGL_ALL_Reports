pageextension 50175 Posted_sales_inv_Ext_1_Report extends "Posted Sales Invoice"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,GITLEXIM,PCPL41-EINV|EWAY

    layout
    {



    }
    actions
    {

        addafter(Print)
        {
            action("Print Tax Invoice GST")
            {
                CaptionML = ENU = 'Print Tax Invoice GST',
                            ENN = 'Print Invoice';
                Image = Print;
                ApplicationArea = all;

                trigger OnAction();
                var
                // VPrint: DotNet DefaultPrinterNew;
                // NewpAth
                begin

                    //VPrint.SetDefaultPrinter('');
                    //Message('Done');
                    SalesInvHeader.RESET;
                    SalesInvHeader.SETRANGE("No.", rec."No.");
                    REPORT.RUNMODAL(REPORT::"Tax Invoice (Sales - Invoice)", TRUE, TRUE, SalesInvHeader); //NSW07

                end;
            }
            action("Mail send Testing ")
            {
                Caption = 'Mail send Testing ';
                Image = Email;
                ApplicationArea = all;
                Visible = false;
                trigger OnAction()
                var
                    Email: Codeunit "Email Test";
                begin
                    Email.Run();
                end;
            }
            action("<Action251>")
            {
                Caption = 'Inter-Unit Sale(Tax Invoice)';
                RunObject = Report 50053; //NSW07
            }

            action("Delivary Challan NGL-Local")
            {
                //RunObject = Report 50109;
            }
        }

    }





    var
        SalesInvHeader: Record 112;
        PostedApprovalEntries: Page 659;
        IncomingDocument: Record 130;
        CRMCouplingManagement: Codeunit 5331;
        ChangeExchangeRate: Page 511;
        CustLedgerEntry: Record 21;
        EINVDet: Record 50041;
        EINVGen: Boolean;
        EINVCan: Boolean;
    // gh: DotNet DefaultPrinterNew;




}

