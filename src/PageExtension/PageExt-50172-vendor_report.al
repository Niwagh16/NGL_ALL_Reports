pageextension 50172 Vendor_list_report extends "Vendor List"
{
    // version NAVW19.00.00.45778

    layout
    {

    }
    actions
    {
        addafter("Vendor - Detail Trial Balance")
        {
            action("Balance Approval Mail")
            {
                RunObject = Report 50071; //NSW07
                ApplicationArea = all;
            }
        }
    }


}

