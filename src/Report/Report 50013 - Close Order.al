report 50013 "Close Order"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = WHERE("Document Type" = CONST(Order));

            trigger OnAfterGetRecord();
            begin
                CLEAR(OutSum);
                PurchaseLine.RESET;
                PurchaseLine.SETRANGE("Document No.", "Purchase Header"."No.");
                PurchaseLine.SETRANGE("Document Type", PurchaseLine."Document Type"::Order);
                IF PurchaseLine.FINDFIRST THEN
                    REPEAT
                        OutSum += PurchaseLine."Outstanding Quantity";
                    UNTIL PurchaseLine.NEXT = 0;
                IF OutSum = 0 THEN BEGIN
                    "Purchase Header"."Closed PO" := TRUE;
                    "Purchase Header".MODIFY;
                    COMMIT;
                END;
            end;
        }
        dataitem("Indent Line"; "Indent Line")
        {
            RequestFilterFields = "Document No.", Date;
            dataitem("Indent Header"; "Indent Header")
            {
                DataItemLink = "No." = FIELD("Document No.");

                trigger OnAfterGetRecord();
                begin
                    CLEAR(OutSum0);
                    IF "Indent Header".Status = "Indent Header".Status::Released THEN BEGIN
                        IndentLine.RESET;
                        IndentLine.SETRANGE("Document No.", "Indent Header"."No.");
                        IF IndentLine.FINDFIRST THEN
                            REPEAT
                                IndentLine.CALCFIELDS("PO Qty");
                                OutSum0 += (IndentLine.Quantity) - (IndentLine."PO Qty");
                            UNTIL IndentLine.NEXT = 0;
                        IF OutSum0 <= 0 THEN BEGIN
                            "Indent Header".Status := "Indent Header".Status::Closed;
                            "Indent Header".MODIFY;
                        END;
                    END;

                    //PCPL-25 28jun21
                    IF "Indent Header".Status = "Indent Header".Status::Closed THEN BEGIN
                        IndentLine.RESET;
                        IndentLine.SETRANGE("Document No.", "Indent Header"."No.");
                        IF IndentLine.FINDFIRST THEN
                            REPEAT
                                IndentLine.VALIDATE(Close, TRUE);
                                IndentLine.MODIFY;
                            UNTIL IndentLine.NEXT = 0;
                        //PCPL-25 28jun21
                    END;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                IndentHeader.RESET;
                IndentHeader.SETRANGE("No.", "Indent Line"."Document No.");
                IF NOT IndentHeader.FINDFIRST THEN BEGIN
                    "Indent Line".VALIDATE(Close, TRUE);
                    "Indent Line".MODIFY;
                END;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport();
    begin
        MESSAGE('Done');
    end;

    var
        PurchaseLine: Record "Purchase Line";
        IndentLine: Record 50003;
        OutSum: Decimal;
        OutSum0: Decimal;
        IndentHeader: Record 50002;
}

