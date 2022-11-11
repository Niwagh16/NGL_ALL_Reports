codeunit 50010 "NAV CRM Integration"
{
    // version pcpl002430oct2018


    trigger OnRun();
    begin
        GenerateInvoiceNo('PO/18-19/08/0018');
        //GenerateVehicleTracking('CD/1617/00007');
    end;

    procedure GenerateInvoiceNo(InvoiceNo: Code[20]): Text[100];
    var
        SalesSetup: Record 311;
        SalesInvHeader: Record 38;
        HTMLPath: Text[150];
        i: Integer;
        // CSTRep: Report "Purchase_Order - FA_T"; //NSW07
        SalesSetup1: Record 312;
        PurchaseHeader: Record 38;
        recVend: Record 23;
    //Purchase_OrderNGL_T: Report 50035; //NSW07
    //Purchase_OrderFA_T: Report 50036; //NSW07
    begin
        SalesSetup1.GET();
        IF SalesSetup1."WO Sales Invoice Path" = '' THEN
            ERROR('Define the HTML file path in Sales Setup.');

        SalesInvHeader.SETRANGE("No.", InvoiceNo);
        IF SalesInvHeader.FINDFIRST THEN BEGIN
            IF COPYSTR(SalesSetup1."WO Sales Invoice Path", STRLEN(SalesSetup1."WO Sales Invoice Path"), 1) <> '\' THEN
                HTMLPath := SalesSetup1."WO Sales Invoice Path" + '\'
            ELSE
                HTMLPath := SalesSetup1."WO Sales Invoice Path";

            FOR i := 1 TO STRLEN(InvoiceNo) DO BEGIN
                IF (InvoiceNo[i] = '/') OR
                   (InvoiceNo[i] = '\') OR
                   (InvoiceNo[i] = '-') OR
                   (InvoiceNo[i] = '.') THEN
                    InvoiceNo[i] := '_';
            END;

            IF EXISTS(HTMLPath + InvoiceNo + '.pdf') THEN
                ERASE(HTMLPath + InvoiceNo + '.pdf');
            /*
              CLEAR(CSTRep);
              CSTRep.USEREQUESTPAGE := FALSE;
              CSTRep.SETTABLEVIEW(SalesInvHeader);
              CSTRep.SAVEASPDF(HTMLPath + InvoiceNo +'.pdf');*/

            //PCPL-0024 30oct2018
            PurchaseHeader.RESET;
            PurchaseHeader.SETRANGE(PurchaseHeader."No.", SalesInvHeader."No.");
            IF PurchaseHeader.FINDSET THEN BEGIN
                recVend.RESET;
                recVend.SETRANGE(recVend."No.", PurchaseHeader."Buy-from Vendor No.");
                IF recVend.FINDFIRST THEN
                    IF recVend."Vendor Posting Group" = 'CR-RM' THEN BEGIN
                        /* //NSW07
                        Purchase_OrderNGL_T.SETTABLEVIEW(PurchaseHeader);
                        Purchase_OrderNGL_T.USEREQUESTPAGE(FALSE);
                        Purchase_OrderNGL_T.SAVEASPDF(HTMLPath + InvoiceNo + '.pdf');
                        CLEAR(Purchase_OrderNGL_T);
                        */ //NSW07

                    END
                    ELSE BEGIN
                        /* //NSW07
                            Purchase_OrderFA_T.SETTABLEVIEW(PurchaseHeader);
                            Purchase_OrderFA_T.USEREQUESTPAGE(FALSE);
                            Purchase_OrderFA_T.SAVEASPDF(HTMLPath + InvoiceNo + '.pdf');
                            CLEAR(Purchase_OrderFA_T);
                            */ //NSW07

                    END;
            END;
            //PCPL-0025 30oct2018

        END;

        EXIT(InvoiceNo + '.pdf');

    end;
}

