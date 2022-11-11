pageextension 50176 Posted_Purcase_Receipt_report extends "Posted Purchase Receipt"
{
    // version NAVW19.00.00.48067,NAVIN9.00.00.48067,GITLEXIM

    layout
    {

    }
    actions
    {

        addafter("&Print")
        {
            action("Goods Receipts Note")
            {
                Caption = 'Goods Receipts Note1';
                Enabled = false;
                Image = Print;
                RunObject = Report 50000; //NSW07
                Visible = false;
                ApplicationArea = all;

                trigger OnAction();
                begin

                    PurchRcptHeader.RESET;
                    PurchRcptHeader.SETRANGE(PurchRcptHeader."No.", Rec."No.");
                    IF PurchRcptHeader.FINDFIRST THEN
                        PurchRcptLine.RESET;
                    PurchRcptLine.SETRANGE(PurchRcptLine."Document No.", PurchRcptHeader."No.");
                    PurchRcptLine.SETFILTER(PurchRcptLine."No.", '<>%1', '');

                    //Given below code comment by sanjay for multiple line grn allow.    15/07/2015

                    // IF PurchRcptLine.COUNT > 1 THEN
                    //   ERROR('ITEM CONTAINS MORE THAN ONE')
                    //  ELSE

                    // REPORT.RUNMODAL(REPORT::"Goods Receipts Note-KAR",TRUE,TRUE,PurchRcptHeader);
                end;
            }
            action("<Action50>")
            {
                Caption = 'GRN- Engineering';

                trigger OnAction();
                begin
                    PurchRcptHeader.RESET;
                    PurchRcptHeader.SETRANGE(PurchRcptHeader."No.", Rec."No.");
                    IF PurchRcptHeader.FINDFIRST THEN BEGIN
                        REPORT.RUNMODAL(50012, TRUE, FALSE, PurchRcptHeader);
                    END
                end;
            }
        }
        addafter("&Navigate")
        {
            action("<Action52>")
            {
                Caption = 'GRN Report-Revised';
                ApplicationArea = all;

                trigger OnAction();
                begin
                    PurchRcptHeader.RESET;
                    PurchRcptHeader.SETRANGE(PurchRcptHeader."No.", Rec."No.");
                    IF PurchRcptHeader.FINDFIRST THEN
                        REPORT.RUNMODAL(50027, TRUE, FALSE, PurchRcptHeader);
                end;
            }
            action("Status Label")
            {
                Caption = 'Status Label';

                trigger OnAction();
                begin
                    /*PurchRcptHeader.RESET;
                    PurchRcptHeader.SETRANGE(PurchRcptHeader."No.","No.");
                    IF PurchRcptHeader.FINDFIRST THEN BEGIN
                      REPORT.RUNMODAL(50050,TRUE,FALSE,PurchRcptHeader);
                    END;*/
                    PurchRcptHeader.RESET;
                    PurchRcptHeader.SETRANGE(PurchRcptHeader."No.", Rec."No.");
                    IF PurchRcptHeader.FINDFIRST THEN BEGIN
                        PurchRcptLine.RESET;
                        PurchRcptLine.SETRANGE(PurchRcptLine."Document No.", PurchRcptHeader."No.");
                        IF PurchRcptLine.FINDFIRST THEN BEGIN
                            REPORT.RUNMODAL(50050, TRUE, FALSE, PurchRcptLine);
                        END;
                    END;

                end;
            }
            action("Approved/Test Label")
            {
                Caption = 'Approved/Test Label';

                trigger OnAction();
                begin
                    PurchRcptHeader.RESET;
                    PurchRcptHeader.SETRANGE(PurchRcptHeader."No.", Rec."No.");
                    IF PurchRcptHeader.FINDFIRST THEN BEGIN
                        ILE.RESET;
                        ILE.SETRANGE(ILE."Document No.", PurchRcptHeader."No.");
                        IF ILE.FINDFIRST THEN BEGIN
                            REPORT.RUNMODAL(50034, TRUE, FALSE, ILE);
                        END;
                    END;
                end;
            }

        }
    }

    var
        PurchRcptLine: Record 121;
        HasIncomingDocument: Boolean;
        IncomingDocument: Record 130;
        ILE: Record 32;
        PurchRcptHeader: Record "Purch. Rcpt. Header";



}

