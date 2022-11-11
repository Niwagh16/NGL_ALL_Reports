pageextension 50170 Request_To_approve_report extends "Requests to Approve"
{
    // version NAVW19.00.00.47838

    actions
    {

        modify(Approve)
        {
            trigger OnAfterAction()
            var
                ApprovalEntry: Record "Approval Entry";
            begin
                varuserid := USERID;


                CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                recpurchheadr.RESET;
                recpurchheadr.SETRANGE(recpurchheadr."No.", ApprovalEntry."Document No.");
                IF recpurchheadr.FINDFIRST THEN BEGIN
                    IF recpurchheadr.Status = recpurchheadr.Status::"Pending Approval" THEN BEGIN
                        codeDocApp.SendMail(recpurchheadr."No.", varuserid);
                    END;
                END;

                //END;
                //pcpl0024--end

            end;
        }


    }

    var
        codeDocApp: Codeunit 50012;
        recpurchheadr: Record 38;
        vardocno: Code[50];
        varuserid: Code[50];
        //SMTP: Codeunit 400;
        RecPurchLinen: Record 39;
        RecVendorn: Record 23;
        txtLink: Text[1000];
        VarFinalDes: Text[150];
        VarFinalDesVariant: Text[150];
        RecVariantn: Record 5401;
        FinalAmount: Decimal;
        RecPurchHeadn: Record 38;
        Usersetup: Record 91;
        UserSetup5: Record 91;
        UserSetup4: Record 91;
        UserSetup3: Record 91;
        UserSetup2: Record 91;
        VarRecipaintMail: Text[50];
        VarRecipaintMail11: list of [Text];
        VarSenderMail: Text[50];
        RecUsers: Record 2000000120;
        recusersetupapp: Record 91;
        recpurchasehdapp: Record 38;
        recPaymentTerms: Record 3;
        VarPayment: Text[150];
        varuserapproval: Code[50];
        PurchaseHeader: Record 38;
        //Purchase_OrderNGL_T: Report 50035;
        PathDocPdf1: Text;
        path1: Text;
        //Purchase_OrderFA_T: Report 50036;
        name: Text[250];
        ToFile: Text[250];
        FileName: Text;
        FileName1: Text;
        name1: Text[250];
        recVend: Record 23;
        Varsendorname: Code[50];
        VerComment: Text[150];
        reccomment: Record 43;
        RecApprovecpmentline: Record 455;
        VerApprCommLine: Text[250];
        TEMP: Text[250];
        recpurchasehdappDE: Record 38;


}

