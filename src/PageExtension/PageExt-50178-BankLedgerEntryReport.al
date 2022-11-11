pageextension 50178 Bank_acc_Led_Entry_report extends "Bank Account Ledger Entries"
{
    // version NAVW19.00.00.46621,NAVIN9.00.00.46621\\pcpl0024_FILE GEN

    layout
    {


    }
    actions
    {


        addafter("&Navigate")
        {
            action("<Action50>")
            {
                Caption = 'ChequePrinting';
                Image = PrintCheck;
                RunObject = Report 50011; //NSW07
                ApplicationArea = all;
            }
        }
    }

    //Unsupported feature: PropertyChange. Please convert manually.

}

