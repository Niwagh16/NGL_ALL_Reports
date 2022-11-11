pageextension 50177 Posted_Purch_invoice_report extends "Posted Purchase Invoice"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067,GITLEXIM

    layout
    {


    }
    actions
    {
        addafter(IncomingDocAttachFile)
        {
            action("GRN Report")
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report 50027; //NSW07
                ApplicationArea = all;
            }
            action("Purchase Order- FA")
            {
                Caption = 'PO-FA';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report 50041; //NSW07
                ApplicationArea = all;
            }
            action("Purchase Order- RMPM")
            {
                Caption = 'PO-RMPM';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report 50035; //NSW07
                ApplicationArea = all;
            }
        }
    }



    var
        PostedApprovalEntries: Page 659;


}

