codeunit 50045 Mailsend_release_purc_Docu
{
    trigger OnRun()
    begin

    end;
    //>>Codeunit START-415
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnAfterReleasePurchaseDoc', '', false, false)]
    local procedure OnAfterReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; var LinesWereModified: Boolean)
    var
        az: Integer;
        Recapprovalentry: Record 454;
        mailtovendveriable: Integer;
        recpurchaseheader: record 38;
    begin
        //pcpl0024--19 april 2019--Statrt
        az := 0;
        Recapprovalentry.RESET;
        Recapprovalentry.SETRANGE(Recapprovalentry."Document No.", PurchaseHeader."No.");
        IF Recapprovalentry.FINDSET THEN BEGIN
            REPEAT
                IF Recapprovalentry.Status = Recapprovalentry.Status::Open THEN
                    az := 1;
            UNTIL Recapprovalentry.NEXT = 0;
        END;


        IF az <> 1 THEN //pcpl0024--19 april 2019
          BEGIN //pcpl0024--19 april 2019
                //ppl0024_20Dec2018
            IF (PurchaseHeader.Status = PurchaseHeader.Status::Released) AND (PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order) THEN BEGIN
                IF mailtovendveriable <> 1 THEN
                    recpurchaseheader.sendmailtovendor(PurchaseHeader."No.");
            END;
            //pcpl0024_20Dec2018
        END;//pcpl0024--19 april 2019

    end;
    //>>Codeunit END-415

    var
        myInt: Integer;
}