tableextension 50199 Purchase_Header_report extends "Purchase Header"
{
    fields
    {

    }
    procedure sendmailtovendor(docno: Code[60])
    var
        RUser: Record 91;
    begin
        Recpurchaserheader.RESET;
        Recpurchaserheader.SETRANGE(Recpurchaserheader."No.", docno);
        //  Recpurchaserheader.SETRANGE(Recpurchaserheader."Import Document", FALSE); //PCPL/NSW/MIG  01Aug22
        //PurchaseHeader.SETRANGE(PurchaseHeader."Import Document",FALSE);//4jan
        //Recpurchaserheader.SETRANGE(Recpurchaserheader.Status,Recpurchaserheader.Status::Released);//10dec2018
        IF Recpurchaserheader.FINDFIRST THEN BEGIN
            RecVendor.RESET();
            RecVendor.SETRANGE(RecVendor."No.", Recpurchaserheader."Buy-from Vendor No.");
            IF RecVendor.FINDFIRST THEN BEGIN
                IF RecVendor."E-Mail" <> '' THEN
                    // VarRecipaint := RecVendor."E-Mail";//1  //PCPL/NSW/MIG 11July22 Old code Comment not work in BC18
                    VarRecipaint.Add(RecVendor."E-Mail");       //PCPL/NSW/MIG 11July22 New Code add 

                IF RecVendor."E-Mail1" <> '' THEN
                    //VarRecipaint := RecVendor."E-Mail1";//2 //PCPL/NSW/MIG 11July22 Old code Comment not work in BC18
                     VarRecipaint.Add(RecVendor."E-Mail1");       //PCPL/NSW/MIG 11July22 New Code add 

                IF RecVendor."E-Mail2" <> '' THEN
                    //VarRecipaint := RecVendor."E-Mail2";//3 //PCPL/NSW/MIG 11July22 Old code Comment not work in BC18
                     VarRecipaint.Add(RecVendor."E-Mail2");       //PCPL/NSW/MIG 11July22 New Code add 

                IF (RecVendor."E-Mail" <> '') AND (RecVendor."E-Mail1" <> '') THEN
                    //VarRecipaint := RecVendor."E-Mail" + ';' + RecVendor."E-Mail1";//1&2 //PCPL/NSW/MIG 11July22 Old code Comment not work in BC18
                    VarRecipaint.Add(RecVendor."E-Mail" + ';' + RecVendor."E-Mail1");       //PCPL/NSW/MIG 11July22 New Code add 

                IF (RecVendor."E-Mail" <> '') AND (RecVendor."E-Mail2" <> '') THEN
                    //VarRecipaint := RecVendor."E-Mail" + ';' + RecVendor."E-Mail2";  //PCPL/NSW/MIG 11July22 Old code Comment not work in BC18
                    VarRecipaint.Add(RecVendor."E-Mail" + ';' + RecVendor."E-Mail2");       //PCPL/NSW/MIG 11July22 New Code add 

                IF (RecVendor."E-Mail1" <> '') AND (RecVendor."E-Mail2" <> '') THEN
                    //VarRecipaint := RecVendor."E-Mail1" + ';' + RecVendor."E-Mail2";//2&3  //PCPL/NSW/MIG 11July22 Old code Comment not work in BC18
                    VarRecipaint.Add(RecVendor."E-Mail1" + ';' + RecVendor."E-Mail2");       //PCPL/NSW/MIG 11July22 New Code add 

                IF (RecVendor."E-Mail" <> '') AND (RecVendor."E-Mail1" <> '') AND (RecVendor."E-Mail2" <> '') THEN
                    //VarRecipaint := RecVendor."E-Mail" + ';' + RecVendor."E-Mail1" + ';' + RecVendor."E-Mail2";//123 //PCPL/NSW/MIG 11July22 Old code Comment not work in BC18
                    VarRecipaint.Add(RecVendor."E-Mail1" + ';' + RecVendor."E-Mail1");       //PCPL/NSW/MIG 11July22 New Code add 
            END;
            //END;

            IF (Recpurchaserheader.Status = Recpurchaserheader.Status::Released) OR (Recpurchaserheader.Status = Recpurchaserheader.Status::"Pending Approval") THEN//pcpl0024_10dec2018
            BEGIN //pcpl0024_10dec2018
                //IF VarRecipaint <> '' THEN BEGIN  //PCPL/NSW/MIG 11July22 Old code Comment not work in BC18
                IF Not VarRecipaint.Contains('') then begin //PCPL/NSW/MIG 11July22 New Code add 
                    Recpurchaserheader.RESET;
                    Recpurchaserheader.SETRANGE(Recpurchaserheader."No.", docno);
                    IF Recpurchaserheader.FINDFIRST THEN BEGIN
                        RecVendor.RESET();
                        RecVendor.SETRANGE(RecVendor."No.", Recpurchaserheader."Buy-from Vendor No.");
                        IF RecVendor.FINDFIRST THEN BEGIN
                            //----------------------------------------------------MAIL TO VENDOR START--------------------------------------------------------------------------
                            //VarEmailSender:='purchase@nglfinechem.com';
                            VarEmailSender := 'donotreply@nglfinechem.com';
                            //VarRecipaint:=RecVendor."E-Mail"+';'+RecVendor."E-Mail1"+';'+RecVendor."E-Mail2";
                            VarcompName := 'NGL Fine Chem Limited';
                            Varsubject := 'PO No: ' + Recpurchaserheader."No." + 'for supply to Location' + Recpurchaserheader."Location Code";//+IndentLine.Description;
                                                                                                                                               // SMTP.CreateMessage('Purchase Team', VarEmailSender, VarRecipaint, Varsubject, '', TRUE);
                                                                                                                                               //SMTP.CreateMessage('Purchase Team',VarEmailSender,'azharuddin@pacificconsulting.in',Varsubject,'',TRUE);
                            BodyText.AddText('Dear Sir/Madam');
                            BodyText.AddText('<br><Br>');
                            BodyText.AddText('Based on the quotation submitted by you, we are pleased to place the Purchase Order No. ' + '<b>' + docno + '</b>' + ', a copy of which is attached to this email. Please supply within the timelines provided');
                            BodyText.AddText('<br><Br>');
                            BodyText.AddText('<table border="0">');
                            BodyText.AddText('<br><Br>');
                            BodyText.AddText('<tr style="background-color:#507CD1; color:#fff">');
                            BodyText.AddText('<th> Date           </th>');
                            BodyText.AddText('<th> PO No.     </th>');
                            BodyText.AddText('<th> Item No.       </th>');
                            BodyText.AddText('<th> Description    </th>');
                            BodyText.AddText('<th> Quantity       </th>');
                            BodyText.AddText('<th> UOM            </th>');
                            BodyText.AddText('<th> Req Date       </th>');
                            BodyText.AddText('</tr>');
                            sr := 0;
                            recpurchashline.RESET;
                            recpurchashline.SETRANGE(recpurchashline."Document No.", docno);
                            IF recpurchashline.FINDFIRST THEN BEGIN
                                REPEAT
                                    sr += 1;
                                    pdfname := 'C:\Specification' + FORMAT(sr);
                                    BodyText.AddText('<tr style="background-color:#EFF3FB; color:black">');
                                    BodyText.AddText('<td>' + FORMAT(TODAY, 0, '<Day,2>-<Month,2>-<Year4>') + '</td>');
                                    BodyText.AddText('<td>' + FORMAT(recpurchashline."Document No.") + '</td>');
                                    BodyText.AddText('<td>' + recpurchashline."No." + '</td>');
                                    BodyText.AddText('<td>' + recpurchashline.Description + '</td>');
                                    BodyText.AddText('<td>' + FORMAT(recpurchashline.Quantity) + '</td>');
                                    BodyText.AddText('<td>' + recpurchashline."Unit of Measure" + '</td>');
                                    BodyText.AddText('<td>' + FORMAT(recpurchashline."Expected Receipt Date", 0, '<Day,2>-<Month,2>-<Year4>') + '</td>');
                                    BodyText.AddText('</tr>');
                                UNTIL recpurchashline.NEXT = 0;
                            END;
                            BodyText.AddText('</table>');
                            BodyText.AddText('<table border="0">');
                            BodyText.AddText('<tr>');
                            //SMTP.AppendBody('<th> Vendor Name:'   +RecVendor.Name + '</th>');
                            BodyText.AddText('</tr>');
                            BodyText.AddText('</table>');
                            BodyText.AddText('<br><Br>');
                            BodyText.AddText('<br><Br>');
                            BodyText.AddText('<br><Br>');
                            BodyText.AddText('<table border="0">');
                            BodyText.AddText('<tr>');
                            BodyText.AddText('<td style="text-align:left" colspan=8><b>' + 'Thanks & Regards' + '</b></td>');
                            BodyText.AddText('</tr>');
                            BodyText.AddText('<tr>');
                            BodyText.AddText('<td style="text-align:left" colspan=8><b>' + 'Purchase Team' + '</b></td>');
                            BodyText.AddText('</tr>');
                            BodyText.AddText('<tr style= "color:#507CD1">');
                            BodyText.AddText('<td style="text-align:left" colspan=8><b> ' + VarcompName + '</b></td>');
                            BodyText.AddText('</tr>');
                            BodyText.AddText('</table>');
                            //PCPL-0025
                            PurchaseHeader.RESET;
                            PurchaseHeader.SETRANGE(PurchaseHeader."No.", docno);
                            IF PurchaseHeader.FINDSET THEN BEGIN
                                recVend.RESET;
                                recVend.SETRANGE(recVend."No.", PurchaseHeader."Buy-from Vendor No.");
                                IF recVend.FINDFIRST THEN
                                    IF recVend."Vendor Posting Group" = 'CR-RM' THEN BEGIN
                                        /*
                                        Purchase_OrderNGL_T.SETTABLEVIEW(PurchaseHeader);
                                        Purchase_OrderNGL_T.USEREQUESTPAGE(FALSE);
                                        Purchase_OrderNGL_T.SAVEASPDF('C:\Purchase_Order' + '.pdf');
                                        CLEAR(Purchase_OrderNGL_T);
                                        */
                                        Recref.GetTable(recVend);
                                        TempBlob.CreateOutStream(OutStr);
                                        Report.SaveAs(Report::"Purchase_Order - NGL_T", '', ReportFormat::Pdf, OutStr, Recref);
                                        TempBlob.CreateInStream(InStr);
                                        Emailmessage.AddAttachment('Purchase_Order - NGL_T', '.pdf', InStr);
                                        //path := 'D:\New folder (2)';
                                        //SMTP.AddAttachment('C:\Purchase_Order' + '.pdf', '');
                                        // SMTP.Send;
                                        // MESSAGE('succussful');

                                    END
                                    ELSE BEGIN
                                        /*
                                        Purchase_OrderFA_T.SETTABLEVIEW(PurchaseHeader);
                                        Purchase_OrderFA_T.USEREQUESTPAGE(FALSE);
                                        Purchase_OrderFA_T.SAVEASPDF('C:\Purchase_Order' + '.pdf');
                                        CLEAR(Purchase_OrderFA_T);
                                        */

                                        Recref.GetTable(recVend);
                                        TempBlob.CreateOutStream(OutStr);
                                        Report.SaveAs(Report::"Purchase_Order - FA_T", '', ReportFormat::Pdf, OutStr, Recref);
                                        TempBlob.CreateInStream(InStr);
                                        Emailmessage.AddAttachment('Purchase_Order - FA_T', '.pdf', InStr);
                                        //SMTP.AddAttachment('C:\Purchase_Order' + '.pdf', '');
                                        //SMTP.Send;
                                        //MESSAGE('Successful');

                                        //<<PCPL/NSW/07 14June22
                                        IF PurchaseHeader."Assigned User ID" <> '' THEN BEGIN
                                            IF RUser.GET(PurchaseHeader."Assigned User ID") THEN BEGIN
                                                IF RUser."E-Mail" <> '' THEN
                                                    UserReceipt.Add(RUser."E-Mail"); //PCPL/NSW/MIG 11July22 New Code added 
                                                                                     // SMTP.AddCC(UserReceipt); //PCPL/NSW/MIG 11July22 New Code added 
                                            END;
                                        END;
                                        //>>PCPL/NSW/07 14June22
                                    END;
                            END;
                            //PCPL-0025
                            NewReceipt.Add('purchase@nglfinechem.com,project@nglfinechem.com');   //PCPL/NSW/MIG 11July22 New Code added 
                                                                                                  // SMTP.AddCC(NewReceipt); //PCPL/NSW/MIG 11July22 New Code added 

                            //SMTP.Send;
                            Emailmessage.Create(VarRecipaint, Varsubject, Format(BodyText), true, UserReceipt, NewReceipt);
                            Email.Send(Emailmessage, Enum::"Email Scenario"::Default);
                        END;
                    END;
                END
                ELSE BEGIN
                    MESSAGE('No Email Found For this Vendor');
                END;

            END;
        END;//pcpl0024_10Dec2018
    end;

    var
        NewReceipt: List of [Text];//PCPL/NSW/MIG 
        UserReceipt: List of [Text]; //PCPL/NSW/MIG 
        VendorISDErr: TextConst Comment = '%1 = Location Code, %2 = GST Vendor Type, %3 = GST Vendor Type, %4 = GST Vendor Type', ENU = 'You cannot select Input Service Distribution Location %1 for Vendor Types %2, %3, %4.', ENN = 'You cannot select Input Service Distribution Location %1 for Vendor Types %2, %3, %4.';
        recUserSetup: Record "User Setup";

        // recEximSetup: Record 33000990; //PCPL/NSW/MIG  11July22
        //cduEximPurchMgmt: Codeunit 33000998; //PCPL/NSW/MIG  11July22
        PurchSubpage: Page 54;

        Recpurchaserheader: Record 38;
        RecVendor: Record 23;
        VarEmailSender: Text[150];
        VarRecipaint: List of [Text];
        VarcompName: Text[150];
        Varsubject: Text[150];
        //SMTP: Codeunit 400;
        sr: Integer;
        recpurchashline: Record 39;
        pdfname: Text[150];
        recitem: Record 27;
        recspecificationheader: Record 50015;
        Purchase_OrderNGL_T1: Report 50023; //NSW07
        PurchaseHeader: Record 38;
        recVend: Record 23;
        Purchase_OrderNGL_T: Report 50035; //NSW07
        Purchase_OrderFA_T: Report 50036; //NSW07
        RUser: Record 91;
        OutStr: OutStream;
        InStr: InStream;
        Recref: RecordRef;
        TempBlob: Codeunit "Temp Blob";

        Emailmessage: Codeunit "Email Message";
        Email: Codeunit Email;
        BodyText: BigText;



}