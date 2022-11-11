pageextension 50179 Item_Reclass_journal extends "Item Reclass. Journal"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778

    layout
    {

    }
    actions
    {

        addafter("Ledger E&ntries")
        {
            action("Material issue- F-11")
            {
                Caption = 'Material issue- F-11';
                //RunObject = Report 50086; //NSW07
                ApplicationArea = all;
            }
        }
    }

    var
}

