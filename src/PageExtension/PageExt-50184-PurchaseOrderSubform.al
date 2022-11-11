pageextension 50184 Purch_order_Subform_report extends "Purchase Order Subform"
{
    // version NAVW19.00.00.48316,NAVIN9.00.00.48316,GITLEXIM,PCPL/QC/V3/001

    layout
    {


    }
    actions
    {

        addafter(OrderTracking)
        {
            action("Comparison Report")
            {
                Image = "Report";

                trigger OnAction();
                var
                    recquatationrec: Record 50032;
                begin
                    // recpurchseline.RESET;
                    // recpurchseline.SETRANGE("Document No.","No.");
                    // IF recpurchseline.FINDSET THEN REPEAT
                    recquatationrec.RESET;
                    recquatationrec.SETRANGE(recquatationrec."Document No.", Rec."Indent No.");
                    recquatationrec.SETRANGE(recquatationrec."No.", Rec."No.");//pcpl0024_24jan2019
                    recquatationrec.SETRANGE(recquatationrec."Line No.", Rec."Quatation recieved Line No.");//PCPL0024_12Feb2019
                    IF recquatationrec.FINDFIRST THEN
                        REPORT.RUNMODAL(50070, TRUE, FALSE, recquatationrec);
                    //UNTIL recpurchseline.NEXT=0
                end;
            }
        }

    }



    var

        PurchHeader1: Record 38;
        Qty: Integer;


}

