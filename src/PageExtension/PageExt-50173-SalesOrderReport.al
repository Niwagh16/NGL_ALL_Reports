pageextension 50173 Sales_Order_Report extends "Sales Order"
{
    // version NAVW19.00.00.48316,NAVIN9.00.00.48316,GITLEXIM,PCPL-25/proofExp

    layout
    {

    }
    actions
    {
        //Unsupported feature: CodeModification on "SendApprovalRequest(Action 250).OnAction". Please convert manually.
        addfirst("&Print")
        {
            action("Order Confirmation")
            {
                CaptionML = ENU = 'Order Confirmation',
                            ENN = 'Order Confirmation';
                Ellipsis = true;
                Image = Print;
                ApplicationArea = all;

                trigger OnAction();
                begin
                    //DocPrint.PrintSalesOrder(Rec,Usage::"Order Confirmation");
                    SH.RESET;
                    SH.SETRANGE(SH."No.", Rec."No.");
                    IF SH.FINDFIRST THEN
                        REPORT.RUNMODAL(50002, TRUE, TRUE, SH);
                end;
            }

            action("<Action226>")
            {
                Caption = 'Performa Invoice-Local';
                Image = Print;
                RunObject = Report 50026; //NSW07
            }
            group(Printing)
            {
                Caption = 'Printing';
                action("<Action227>")
                {
                    Caption = 'Performa Invoice';
                    Image = Print;
                    RunObject = Report 50026; //NSW07
                }
            }
        }
    }



    var
        ApprovalMgt: Codeunit 1535;
        PurchaseHeader: Record 38;
        Text000: TextConst ENU = 'Unable to execute this function while in view only mode.', ENN = 'Unable to execute this function while in view only mode.';
        SH: Record 36;
        Customer: Record 18;
        REcCust: Record 18;
        SalesInvoiceHeader: Record 112;
        SalesInvoiceLine: Record 113;
        NoofDays: Integer;
        SalesLine: Record 37;

    procedure UpdateAllowed(): Boolean;
    begin
        IF CurrPage.EDITABLE = FALSE THEN
            ERROR(Text000);
        EXIT(TRUE);
    end;

}

