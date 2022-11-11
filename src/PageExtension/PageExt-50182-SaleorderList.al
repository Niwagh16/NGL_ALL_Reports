pageextension 50182 Sales_Orer_list_report extends "Sales Order List"
{
    // version NAVW19.00.00.45778,GITLEXIM

    layout
    {

        //Unsupported feature: PropertyDeletion on "IncomingDocAttachFactBox(Control 20)". Please convert manually.


    }
    actions
    {


        addfirst("&Print")
        {
            action("Order Confirmation")
            {
                CaptionML = ENU = 'Order Confirmation',
                            ENN = 'Order Confirmation';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report 50002; //NSW07
                ApplicationArea = all;

                // trigger OnAction();
                // begin
                //     DocPrint.PrintSalesOrder(Rec, Usage::"Order Confirmation");
                // end;
            }
        }

    }

    var
        PurchaseHeader: Record 38;
        RecUser: Record 91;
        TmpLocCode: Code[100];






}

