codeunit 50009 "Get Entry No"
{
    // version PCPL/AN/0026/12082018

    Permissions = TableData 50032 = rimd;

    trigger OnRun();
    begin
    end;

    var
        RecPurchPayable: Record 312;

    procedure GetEntryNo(): Integer;
    var
        PortalVendUpdatedPurchRec: Record 50032;
        EntryNo: Integer;
    begin
        PortalVendUpdatedPurchRec.RESET;
        IF PortalVendUpdatedPurchRec.FINDLAST THEN
            EntryNo := PortalVendUpdatedPurchRec."Entry No"
        ELSE
            EntryNo := 0;
        EXIT(EntryNo);
    end;

    procedure GetQuotationNo(): Code[30];
    var
        QuotationNo: Code[30];
        PortalVendUpdatedPurchRec1: Record 50032;
        Noserias: Record 308;
        LineNoSerias: Record 309;
        NoSsriesManagent: Codeunit 396;
    begin
        RecPurchPayable.GET;
        QuotationNo := NoSsriesManagent.GetNextNo(RecPurchPayable."Quotation No", WORKDATE, TRUE);
        EXIT(QuotationNo);
    end;
}

