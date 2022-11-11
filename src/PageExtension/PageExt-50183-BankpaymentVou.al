pageextension 50183 Bank_Payment_Voucher_Report extends "Bank Payment Voucher"
{
    // version NAVIN7.10\\pcpl0024_FILE GEN

    layout
    {




    }
    actions
    {



        addafter("Print Check")
        {
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
        GenJournalLine: Record 81;
        recVendor: Record 23;



}

