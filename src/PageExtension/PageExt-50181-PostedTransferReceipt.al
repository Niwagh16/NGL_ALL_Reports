pageextension 50181 Posted_Transfer_Receipt_report extends "Posted Transfer Receipt"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778,SUBCON1.0

    layout
    {


    }
    actions
    {
        addafter("Attached Gate Entry")
        {
            action("Transfer Note")
            {
                ApplicationArea = all;
                trigger OnAction();
                begin
                    PostedTR.RESET;
                    PostedTR.SETRANGE(PostedTR."No.", Rec."No.");
                    IF PostedTR.FINDFIRST THEN
                        REPORT.RUNMODAL(50147, TRUE, FALSE, PostedTR);
                end;
            }
            action("Inter Unit Transfer Receipt.")
            {

                trigger OnAction();
                begin
                    //PCPL-25
                    TransRcptHeader.RESET;
                    TransRcptHeader.SETRANGE(TransRcptHeader."No.", Rec."No.");
                    IF TransRcptHeader.FINDFIRST THEN BEGIN
                        REPORT.RUNMODAL(50079, TRUE, TRUE, TransRcptHeader);
                    END;
                    //PCPL-25
                end;
            }
        }
        addafter("&Navigate")
        {
            action("Inter Unit Transfer Receipt")
            {
                //AccessByPermission = Report 50079 = X; //NSW07
                Caption = 'Inter Unit Transfer Receipt';
                Promoted = true;
                PromotedCategory = Process;
            }
            action("Approved/Test Label")
            {
                Caption = 'Approved/Test Label';

                trigger OnAction();
                begin
                    TransferReceiptHeader.RESET;
                    TransferReceiptHeader.SETRANGE(TransferReceiptHeader."No.", Rec."No.");
                    IF TransferReceiptHeader.FINDFIRST THEN BEGIN
                        ILE.RESET;
                        ILE.SETRANGE(ILE."Document No.", TransferReceiptHeader."No.");
                        IF ILE.FINDFIRST THEN BEGIN
                            REPORT.RUNMODAL(50034, TRUE, FALSE, ILE);
                        END;
                    END;
                end;
            }
            action("Transfer Status Label")
            {
                Caption = 'Transfer Status Label';

                trigger OnAction();
                begin
                    TransferReceiptHeader.RESET;
                    TransferReceiptHeader.SETRANGE(TransferReceiptHeader."No.", Rec."No.");
                    IF TransferReceiptHeader.FINDFIRST THEN BEGIN
                        TransferReceiptLine.RESET;
                        TransferReceiptLine.SETRANGE(TransferReceiptLine."Document No.", TransferReceiptHeader."No.");
                        IF TransferReceiptLine.FINDFIRST THEN BEGIN
                            REPORT.RUNMODAL(50054, TRUE, FALSE, TransferReceiptLine);
                        END;
                    END;
                end;
            }
        }
    }

    var
        PostedTR: Record 5746;
        TransRcptHeader: Record 5746;
        TransferReceiptHeader: Record 5746;
        TransferReceiptLine: Record 5747;
        ILE: Record 32;

    //Unsupported feature: PropertyChange. Please convert manually.

}

