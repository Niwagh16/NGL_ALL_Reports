codeunit 50012 DocApproval
{
    // version pcpl0024,PCPL/NSW/07 01June22

    // 


    trigger OnRun();
    var
        VarRec: List of [text];
    begin
        VarRec.Add('itmumbai@nglfinechem.com');
        //ApproveDoc('PO/18-19/01/0199','NGLHO\JOLLANI');
        //SendMail('PO/18-19/02/0110','NGLHO\JOLLANI');
        //SMTP.CreateMessage('test','bhagwan.borse@pacificconsulting.in','sagar.hiratkar@pacificconsulting.in','Purchase Approval Process','',TRUE);
        //SMTP.CreateMessage('PO Approval', 'itmumbai@nglfinechem.com', VarRec, 'Purchase Approval Process', '', TRUE);

        BodyText.AddText('Dear Sir/Madam');
        BodyText.AddText('<br><Br>');
        Emailmessage.Create(VarRec, 'Purchase Approval Process', Format(BodyText), true);
        Email.Send(Emailmessage, Enum::"Email Scenario"::Default);
        //SMTP.Send;
        //MESSAGE('Done');
    end;

    var
        OutStr: OutStream;
        InStr: InStream;
        Recref: RecordRef;
        TempBlob: Codeunit "Temp Blob";

        Emailmessage: Codeunit "Email Message";
        Email: Codeunit Email;
        BodyText: BigText;
        ApprovalEntry: Record 454;
        PurchRcptHeader: Record 120;
        PurchRcptLine: Record 121;
        "-------------QC--------------": Integer;
        QCSetup: Record 50010;
        QSInsertion: Codeunit 50003;
        ApprovalMgt: Codeunit 1535;
        item: Record 27;
        RecVendor: Record 23;
        SalesHeader1: Record 38;
        UserSetup5: Record 91;
        UserSetup4: Record 91;
        UserSetup3: Record 91;
        UserSetup2: Record 91;
        UserSetup: Record 91;
        //SMTP: Codeunit 400;
        RecPurchLinen: Record 39;
        RecVendorn: Record 23;
        txtLink: Text[1000];
        VarFinalDes: Text[150];
        VarFinalDesVariant: Text[150];
        RecVariantn: Record 5401;
        FinalAmount: Decimal;
        recPaymentTerms: Record 3;
        VarPayment: Text[150];
        VarRecipaintMail: Text[50];
        VarRecipaintMail11: List of [Text];
        VarSenderMail: Text[50];
        RecUsers: Record 2000000120;
        PurchaseHeader: Record 38;
        recVend: Record 23;
        //Purchase_OrderNGL_T: Report 50035;
        Attachpdf: Text;
        PdfDocPath: Text;
        path: Text;
        PdfDocPath1: Text;
        Path1: Text;
        // Purchase_OrderFA_T: Report 50036;
        recusersetupapp: Record 91;
        recpurchasehdapp: Record 38;
        varapplimiamt: Decimal;
        result: Code[150];
        Varsendorname: Code[150];
        VerComment: Text[250];
        reccomment: Record 43;
        recpurchseline: Record 39;
        recquatationrec: Record 50032;
        sr: Integer;
        pdfname: Text[250];
        repindent: Report 50070; //NSW07
        RecApprovecpmentline: Record 455;
        VerApprCommLine: Text[250];
        TEMP: Text[250];
        COD: codeunit 50000;

    procedure ApproveDoc(DocumentNo: Code[20]; user: Code[50]): Code[150];
    var
        ApprovalEntry: Record 454;
        ApprovalsMgmt: Codeunit 1535;
        PurchHEader: Record 38;
    begin

        //pcpl0024--start--1oct2018
        ApprovalEntry.RESET;
        ApprovalEntry.SETRANGE(ApprovalEntry."Document No.", DocumentNo);
        ApprovalEntry.SETRANGE(Status, ApprovalEntry.Status::Open);
        IF ApprovalEntry.FINDFIRST THEN BEGIN

        END
        ELSE BEGIN
            ApprovalEntry.RESET;
            ApprovalEntry.SETRANGE(ApprovalEntry."Document No.", DocumentNo);
            ApprovalEntry.SETRANGE("Approver ID", UPPERCASE(user));
            ApprovalEntry.SETRANGE(Status, ApprovalEntry.Status::Approved);
            IF ApprovalEntry.FINDFIRST THEN BEGIN
                result := 'PO Already Approved';//pcpl0024--04oct2018
            END;
        END;

        ApprovalEntry.RESET;
        ApprovalEntry.SETRANGE(ApprovalEntry."Document No.", DocumentNo);
        ApprovalEntry.SETRANGE("Approver ID", UPPERCASE(user));
        IF ApprovalEntry.FINDFIRST THEN BEGIN
            //MESSAGE('PO Already Approved');
        END
        ELSE BEGIN
            result := 'PO is Deligated';
        END;
        //pcpl0024--end--1oct2018

        ApprovalEntry.RESET;
        ApprovalEntry.SETRANGE(ApprovalEntry."Document No.", DocumentNo);
        ApprovalEntry.SETRANGE(Status, ApprovalEntry.Status::Open);
        ApprovalEntry.SETRANGE("Approver ID", UPPERCASE(user));
        IF ApprovalEntry.FINDFIRST THEN BEGIN
            //ApprovalsMgmt.ApproveApprovalRequests(ApprovalEntry);//pcpl0024_20dec2018_commented
            //ApprovalsMgmt.ApproveApprovalRequestsWeb(ApprovalEntry, UPPERCASE(user));//pcpl0024_20dec2018 //PCPL/NSW/MIG 01AUg22 Code comment
            COD.ApproveApprovalRequestsWeb(ApprovalEntry, UPPERCASE(user));//pcpl0024_20dec2018 //PCPL/NSW/MIG 01AUg22 New Code add
            result := 'PO Approved'//pcpl0024--04oct2018
        END;

        //pcpl0024---start
        recusersetupapp.RESET;
        recusersetupapp.SETRANGE(recusersetupapp."User ID", user);
        IF recusersetupapp.FINDFIRST THEN BEGIN
            varapplimiamt := recusersetupapp."Purchase Amount Approval Limit";
        END;

        PurchHEader.RESET;
        PurchHEader.SETRANGE(PurchHEader."No.", DocumentNo);
        IF PurchHEader.FINDFIRST THEN BEGIN

            IF PurchHEader.Status = PurchHEader.Status::"Pending Approval" THEN//AND (PurchHEader.Amount>varapplimiamt) THEN
              BEGIN
                recusersetupapp.RESET;
                recusersetupapp.SETRANGE(recusersetupapp."User ID", user);
                IF recusersetupapp.FINDFIRST THEN BEGIN
                    IF recusersetupapp."Approver ID" <> '' THEN BEGIN
                        SendMail(DocumentNo, user); ///PCPL-BRB
                    END;
                END;
            END;
        END;
        //pcpl0024---end
        IF result <> '' THEN BEGIN
            EXIT(result);
        END
        ELSE BEGIN
            result := 'Kindly Share PO No. and Web URL With System Administrator';
            EXIT(result);
        END;
    end;

    procedure RejectDoc(DocumentNo: Code[20]; user: Code[50]; Remarks: Text[150]): Code[150];
    var
        ApprovalEntry: Record 454;
        ApprovalsMgmt: Codeunit 1535;
        PurchHEader: Record 38;
    begin
        ApprovalEntry.RESET;
        ApprovalEntry.SETRANGE(ApprovalEntry."Document No.", DocumentNo);
        ApprovalEntry.SETRANGE(Status, ApprovalEntry.Status::Open);
        ApprovalEntry.SETRANGE("Approver ID", UPPERCASE(user));
        IF ApprovalEntry.FINDFIRST THEN BEGIN
            ApprovalsMgmt.RejectApprovalRequests(ApprovalEntry);
        END;

        //pcpl0024---start
        PurchHEader.RESET;
        PurchHEader.SETRANGE(PurchHEader."No.", DocumentNo);
        IF PurchHEader.FINDFIRST THEN BEGIN
            IF PurchHEader."Rjected Remarks" <> '' THEN//pcpl0024--04oct2018
               BEGIN
                PurchHEader."Rjected Remarks" := Remarks;
                PurchHEader.MODIFY;
                result := 'PO Rejected';
            END//pcpl0024--04oct2018
            ELSE//pcpl0024--04oct2018
               BEGIN//pcpl0024--04oct2018
                result := 'PO is Already Rejected';//pcpl0024--04oct2018
            END;//pcpl0024--04oct2018
        END;
        //pcpl0024---end
        IF result <> '' THEN BEGIN
            EXIT(result);
        END
        ELSE BEGIN
            result := 'Kindly Share PO No. and Web URL With System Administrator';
            EXIT(result);
        END;
    end;

    local procedure Notification(DocNo: Code[20]) Bool: Boolean;
    var
        SalesHEader: Record 36;
        PurchHEader: Record 38;
    begin
        SalesHEader.RESET;
        SalesHEader.SETRANGE(SalesHEader."No.", DocNo);
        IF SalesHEader.FINDFIRST THEN BEGIN
            IF SalesHEader.Status = SalesHEader.Status::Released THEN
                EXIT(TRUE)
            ELSE
                EXIT(FALSE)
        END ELSE BEGIN
            PurchHEader.RESET;
            PurchHEader.SETRANGE(PurchHEader."No.", DocNo);
            IF PurchHEader.FINDFIRST THEN BEGIN
                IF PurchHEader.Status = PurchHEader.Status::Released THEN
                    EXIT(TRUE)
                ELSE
                    EXIT(FALSE)
            END;
        END;
    end;

    procedure SendMail(DocumentNo: Code[20]; user: Code[50]);
    begin
        recpurchasehdapp.RESET;
        recpurchasehdapp.SETRANGE(recpurchasehdapp."No.", DocumentNo);
        IF recpurchasehdapp.FINDFIRST THEN BEGIN
            //To Catch Approvar Mail ID--Start
            UserSetup2.RESET;
            UserSetup2.SETRANGE(UserSetup2."User ID", user);

            IF UserSetup2.FINDFIRST THEN BEGIN
                VarSenderMail := UserSetup2."E-Mail";
                /*
                UserSetup3.RESET;
                UserSetup3.SETRANGE(UserSetup3."User ID",UserSetup2."Approver ID");
                IF UserSetup3.FINDFIRST THEN
                  BEGIN
                  VarRecipaintMail:=UserSetup3."E-Mail";
                  END;
                  */
            END;

            ApprovalEntry.RESET;
            ApprovalEntry.SETRANGE(ApprovalEntry."Document No.", DocumentNo);
            ApprovalEntry.SETRANGE(ApprovalEntry.Status, ApprovalEntry.Status::Open);
            IF ApprovalEntry.FINDFIRST THEN BEGIN
                UserSetup3.RESET;
                UserSetup3.SETRANGE(UserSetup3."User ID", ApprovalEntry."Approver ID");
                IF UserSetup3.FINDFIRST THEN BEGIN
                    VarRecipaintMail := UserSetup3."E-Mail";
                    VarRecipaintMail11.Add(UserSetup3."E-Mail");
                END;
            END;
            //To Catch Approvar Mail ID--End


            UserSetup.RESET;
            UserSetup.SETRANGE(UserSetup."User ID", user);
            IF UserSetup.FINDFIRST THEN;
            Varsendorname := 'PO Approval Process' + recpurchasehdapp."No.";
            //SMTP.CreateMessage(Varsendorname, VarSenderMail, VarRecipaintMail11, 'Purchase Approval Process', '', TRUE);
            //SMTP.CreateMessage('PO Approval','itmumbai@nglfinechem.com','itmumbai@nglfinechem.com','Purchase Approval Process','',TRUE);
            BodyText.AddText('Dear Sir/Madam');
            BodyText.AddText('<br><Br>');
            BodyText.AddText('Kindly apporve below mentioned Purchase Order.');
            BodyText.AddText('<br><Br>');
            //pcpl0024_08Feb2019
            RecApprovecpmentline.RESET;
            RecApprovecpmentline.SETRANGE(RecApprovecpmentline."Table ID", 38);
            RecApprovecpmentline.SETRANGE(RecApprovecpmentline."Record ID to Approve", recpurchasehdapp.RECORDID);
            IF RecApprovecpmentline.FINDFIRST THEN BEGIN
                REPEAT
                    //VerApprCommLine:=
                    BodyText.AddText('Approval Comment (' + FORMAT(RecApprovecpmentline."Date and Time") + ')' + ': ' + RecApprovecpmentline.Comment);
                    BodyText.AddText('<br><Br>');
                UNTIL RecApprovecpmentline.NEXT = 0;
            END;
            //pcpl0024_08Feb2019
            BodyText.AddText('<table border="1">');
            BodyText.AddText('<tr>');
            BodyText.AddText('<th> Purchase Order No. ' + '</th>');
            BodyText.AddText('<th> Vendor Name  </th>');
            BodyText.AddText('<th> Item No.  </th>');
            BodyText.AddText('<th> Item Description  </th>');
            //SMTP.AppendBody('<th> Variant Description  </th>');
            BodyText.AddText('<th> Quantity  </th>');
            BodyText.AddText('<th> UOM </th>');//PCPL0024--10Dec2018
            BodyText.AddText('<th> Rate </th>');
            BodyText.AddText('<th> Amount </th>');
            BodyText.AddText('<th> Gst% </th>');
            BodyText.AddText('<th> Total value  </th>');
            BodyText.AddText('<th> Payment Terms  </th>');
            BodyText.AddText('<th> Delivery Date  </th>');
            BodyText.AddText('<th> Location </th>');//PCPL0024--10Dec2018
            BodyText.AddText('<th> Comment </th>');//PCPL0024--10Dec2018
            BodyText.AddText('<th> Indent No. </th>');//PCPL0024--10Dec2018
            BodyText.AddText('</tr>');
            BodyText.AddText('<tr>');

            recPaymentTerms.RESET;
            recPaymentTerms.SETRANGE(recPaymentTerms.Code, recpurchasehdapp."Payment Terms Code");
            IF recPaymentTerms.FINDFIRST THEN
                VarPayment := recPaymentTerms.Description;


            RecPurchLinen.RESET;
            RecPurchLinen.SETRANGE("Document No.", recpurchasehdapp."No.");
            IF RecPurchLinen.FINDSET THEN
                REPEAT

                    FinalAmount := 0;
                    VarFinalDes := RecPurchLinen.Description + RecPurchLinen."Description 2";
                    FinalAmount := RecPurchLinen.Quantity * RecPurchLinen."Unit Cost";
                    //To Catch Variant Code
                    RecVariantn.RESET;
                    RecVariantn.SETRANGE(RecVariantn.Code, RecPurchLinen."Variant Code");
                    IF RecVariantn.FINDFIRST THEN BEGIN
                        VarFinalDesVariant := RecVariantn.Description + RecVariantn."Description 2";
                    END;

                    BodyText.AddText('<td>' + recpurchasehdapp."No." + '</td>');
                    BodyText.AddText('<td>' + recpurchasehdapp."Buy-from Vendor Name" + '</td>');
                    BodyText.AddText('<td>' + FORMAT(RecPurchLinen."No.") + '</td>');
                    BodyText.AddText('<td>' + VarFinalDes + '</td>');
                    //SMTP.AppendBody('<td>'  + VarFinalDesVariant+'</td>');
                    BodyText.AddText('<td>' + FORMAT(RecPurchLinen.Quantity) + '</td>');
                    BodyText.AddText('<td>' + FORMAT(RecPurchLinen."Unit of Measure Code") + '</td>');//pcpl0024-10dec2018
                    BodyText.AddText('<td>' + FORMAT(RecPurchLinen."Unit Cost") + '</td>');
                    BodyText.AddText('<td>' + FORMAT(FinalAmount) + '</td>');
                    // SMTP.AppendBody('<td>'  +FORMAT( RecPurchLinen."GST %")+'</td>');
                    //SMTP.AppendBody('<td>'  +FORMAT( RecPurchLinen."Amount To Vendor")+'</td>');
                    BodyText.AddText('<td>' + VarPayment + '</td>');
                    BodyText.AddText('<td>' + FORMAT(RecPurchLinen."Expected Receipt Date") + '</td>');
                    BodyText.AddText('<td>' + FORMAT(RecPurchLinen."Location Code") + '</td>');//pcpl0024-10dec2018
                                                                                               //pcpl0024-10dec2018--start
                    VerComment := '';
                    reccomment.RESET;
                    reccomment.SETRANGE(reccomment."No.", recpurchasehdapp."No.");
                    reccomment.SETRANGE(reccomment."Document Line No.", 0);
                    IF reccomment.FINDSET THEN BEGIN
                        REPEAT
                            VerComment += reccomment.Comment;
                        UNTIL reccomment.NEXT = 0;
                    END;
                    //pcpl0024-10dec2018--End

                    //pcpl0024-29oct2018--start
                    //IF USERID ='NGLHO\ADMINISTRATOR' THEN
                    //BEGIN
                    recpurchseline.RESET;
                    recpurchseline.SETRANGE(recpurchseline."Document No.", DocumentNo);
                    IF recpurchseline.FINDSET THEN BEGIN
                        REPEAT
                            recquatationrec.RESET;
                            recquatationrec.SETRANGE(recquatationrec."Document No.", recpurchseline."Indent No.");
                            recquatationrec.SETRANGE(recquatationrec."No.", recpurchseline."No.");//pcpl0024_24jan2019
                            IF recquatationrec.FINDFIRST THEN BEGIN
                                sr += 1;
                                //pdfname:='D:\IndentList'+FORMAT(sr);
                                pdfname := 'C:\Comparison' + FORMAT(sr);//pcpl0024_24jan2019
                                /* //<<PCPL/NSW/07  04Nov22
                                repindent.SETTABLEVIEW(recquatationrec);
                                repindent.USEREQUESTPAGE(FALSE);
                                repindent.SAVEASEXCEL(pdfname + '.xls');
                                CLEAR(repindent);
                                *///>>PCPL/NSW/07  04Nov22
                                //<<PCPL/NSW/07  04Nov22 New Code Added
                                Recref.GetTable(recquatationrec);
                                TempBlob.CreateOutStream(OutStr);
                                Report.SaveAs(Report::"Indent List Report_", '', ReportFormat::Excel, OutStr, Recref);
                                TempBlob.CreateInStream(InStr);
                                EmailMessage.AddAttachment('Indent List', '.xls', InStr);
                            END;
                        UNTIL recpurchseline.NEXT = 0
                    END;
                    //END;
                    //pcpl0024-29oct2018--End
                    BodyText.AddText('<td>' + FORMAT(VerComment) + '</td>');//pcpl0024-10dec2018
                    BodyText.AddText('<td>' + FORMAT(RecPurchLinen."Indent No.") + '</td>');//pcpl0024-10dec2018
                    BodyText.AddText('</tr>');

                UNTIL RecPurchLinen.NEXT = 0;
            BodyText.AddText('</table>');
            BodyText.AddText('<br><Br>');
            //txtLink :=  'http://192.168.2.100:81/ApprovalPage.aspx?documentNo=""&user=""'+"No."+'&user='+FORMAT(UserSetup."Approver ID");

            IF COMPANYNAME = 'Macrotech Polychem Pvt. Ltd.' THEN
                txtLink := 'http://43.250.208.210:82/ApprovalPage.aspx?documentNo=' + recpurchasehdapp."No." + '&user=' + FORMAT(ApprovalEntry."Approver ID")
            ELSE
                txtLink := 'http://20.198.67.21/webapproval/approvalpage.aspx?documentNo=' + recpurchasehdapp."No." + '&user=' + FORMAT(ApprovalEntry."Approver ID"); //PCPL/NSW/07 01June22 New code add and below code original comment
                                                                                                                                                                      //txtLink :='http://43.250.208.210/ApprovalPage.aspx?documentNo='+recpurchasehdapp."No."+'&user='+FORMAT(ApprovalEntry."Approver ID"); //PCPL/NSW/07 01June22
            BodyText.AddText('<p><a href="' + txtLink + '"><b>Click To Approve</b></a></p>');
            //SMTP.Send;
            Emailmessage.Create(VarRecipaintMail11, Varsendorname, Format(BodyText), true);
            Email.Send(Emailmessage, Enum::"Email Scenario"::Default);
            /*
            //
            PurchaseHeader.RESET;
            PurchaseHeader.SETRANGE(PurchaseHeader."No.","No.");
            IF PurchaseHeader.FINDFIRST THEN BEGIN
              recVend.RESET;
              recVend.SETRANGE(recVend."No.",PurchaseHeader."Buy-from Vendor No.");
              IF recVend.FINDFIRST THEN
                IF recVend."Vendor Posting Group" = 'CR-RM' THEN BEGIN
                  //Attechpdf := FORMAT(Report.SAVEASPDF(50035,'Desktop:MyReportsreport50035Demo.pdf',PurchaseHeader));
                  //SMTP.AddAttachment(Attachpdf,);
                  PdfDocPath := 'Purchase_OrderNGL_T.pdf';
                  path := 'Desktop:'+PdfDocPath;
                  CLEAR(Purchase_OrderNGL_T);
                  SMTP.AddAttachment(path,PdfDocPath);
                  SMTP.Send;
                END
              ELSE
                PdfDocPath1 := 'Purchase_OrderFA_T.pdf';
                Path1 := 'Desktop:' + PdfDocPath1;
                CLEAR(Purchase_OrderFA_T);
                SMTP.AddAttachment(Path1,PdfDocPath1);
                SMTP.Send;
            END;
            //
            */

        END;

    end;
}

