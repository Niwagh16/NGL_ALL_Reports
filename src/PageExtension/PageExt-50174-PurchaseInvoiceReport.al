pageextension 50174 Purch_invoice_Report extends "Purchase Invoice"
{
    // version NAVW19.00.00.48466,NAVIN9.00.00.48466,GITLEXIM,//PCPLTDS194Q

    layout
    {

    }
    actions
    {
        addafter(Reopen)
        {
            action("Check PO List")
            {
                Caption = 'Check PO List';
                RunObject = Page 50085;
                ApplicationArea = all;
            }
        }
        addafter("Attached Gate Entry")
        {
            action("GRN Report")
            {
                Caption = 'GRN- RMPM';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                RunObject = Report 50027; //NSW07
            }
            action("<Action50>")
            {
                Caption = 'GRN- Others';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                RunObject = Report 50012; //NSW07
            }
            action("Purchase Order- FA")
            {
                Caption = 'PO-FA';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                RunObject = Report 50041; //NSW07
            }
            action("Purchase Order- RMPM")
            {
                Caption = 'PO-RMPM';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                RunObject = Report 50035; //NSW07
            }
        }
    }



    var

        JobQueueVisible: Boolean;


        usersetup: Record 91;
        Vendor: Record 23;
        //NODNOCHeader: Record "13786";
        //NODNOCLines: Record "13785";
        PL: Record 39;
        recVendor: Record 23;
        PurchRcptHeader: Record 120;
        PurchaseHeader: Record 38;
        Text50001: Label 'Purchase Invoice %1 %2 must be same %3';
        PurchLine: Record 39;



    local procedure CheckPaymentTerms();
    begin
        PurchLine.RESET;
        PurchLine.SETRANGE("Document Type", PurchaseHeader."Document Type"::Invoice);
        PurchLine.SETRANGE("Document No.", Rec."No.");
        PurchLine.SETFILTER(Type, '<>%1', 0);
        IF PurchLine.FINDFIRST THEN BEGIN
            PurchRcptHeader.RESET;
            PurchRcptHeader.SETRANGE("No.", PurchLine."Receipt No.");
            IF PurchRcptHeader.FINDFIRST THEN BEGIN
                PurchaseHeader.RESET;
                PurchaseHeader.SETRANGE("Document Type", PurchLine."Document Type"::Order);
                PurchaseHeader.SETRANGE("No.", PurchRcptHeader."Order No.");
                IF PurchaseHeader.FINDFIRST THEN
                    IF PurchaseHeader."Payment Terms Code" <> Rec."Payment Terms Code" THEN
                        ERROR(Text50001, Rec.FIELDCAPTION("Payment Terms Code"), Rec."Payment Terms Code", PurchaseHeader."Payment Terms Code");
            END;

        END;
    end;


}

