page 50062 "Purchaser Approval Vendor"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = 50033;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = all;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = all;
                }
                field(Selected; rec.Selected)
                {
                    ApplicationArea = all;
                }
                field("Indent Doc No"; rec."Indent Doc No")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            //Caption = 'Action';
            action("Send Mail")
            {
                Caption = 'Send For Quotation';
                Image = SendMail;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction();
                var
                    Vend: Record 23;
                    Itemrec: Record 27;
                    IndentLine: Record 50003;
                    ItemVendorCatalog: Record 50066;
                begin

                    //pcpl00242nov2018--start
                    IndentLine.RESET;
                    IndentLine.SETRANGE(Selected, TRUE);
                    IndentLine.SETRANGE("Mail Already Sent", FALSE);
                    IF IndentLine.FINDSET THEN BEGIN
                        REPEAT
                            recVend.SETRANGE(recVend."Indent Doc No", IndentLine."Document No.");
                            recVend.SETRANGE(recVend.Selected, TRUE);
                            IF recVend.FIND('-') THEN BEGIN
                                //IndentLine."Mail Already Sent" := TRUE;
                                //IndentLine.Selected:=FALSE;
                            END
                            ELSE BEGIN
                                ERROR('Selection is must Or No data Found');
                            END;
                        UNTIL IndentLine.NEXT = 0
                    END;
                    //pcpl0024-2nov2018--end

                    IndentLine.RESET;
                    IndentLine.SETRANGE(Selected, TRUE);
                    IndentLine.SETRANGE("Mail Already Sent", FALSE);
                    IF IndentLine.FINDSET THEN
                        REPEAT
                            recVend.RESET;
                            //recVend.SETRANGE(recVend."No.","No.");
                            recVend.SETRANGE(recVend."Indent Doc No", IndentLine."Document No.");
                            recVend.SETRANGE(recVend.Selected, TRUE);
                            IF recVend.FIND('-') THEN
                                REPEAT
                                    //IF Vend.GET(ItemVendorCatalog."Vendor No.") THEN;
                                    //IF Itemrec.GET("No.") THEN;

                                    vari := RecPurcAppLin.COUNT;
                                    IF RecPurcAppLin.FINDLAST THEN
                                        vari := RecPurcAppLin."Entry No";
                                    vari += 1;

                                    RecPurcAppLin.RESET;
                                    RecPurcAppLin.INIT;
                                    RecPurcAppLin."Entry No" := vari;
                                    RecPurcAppLin."Document No." := IndentLine."Document No.";
                                    RecPurcAppLin.Date := IndentLine.Date;
                                    RecPurcAppLin."No." := IndentLine."No.";
                                    RecPurcAppLin."Location Code" := IndentLine."Location Code";
                                    RecPurcAppLin.Quantity := IndentLine.Quantity;
                                    RecPurcAppLin."PO Qty" := IndentLine."PO Qty";
                                    RecPurcAppLin.Approved := IndentLine.Approved;
                                    RecPurcAppLin.Description := IndentLine.Description;
                                    RecPurcAppLin."Unit of Measure Code" := IndentLine."Unit of Measure Code";
                                    RecPurcAppLin.Closingqty := IndentLine.Closingqty;
                                    RecPurcAppLin."Vendor No." := recVend."No.";
                                    RecPurcAppLin."Vendor Name" := recVend.Name;
                                    RecPurcAppLin."Indent Closing Date" := IndentLine."Indent Closing Date";//pcpl002430oct
                                    RecPurcAppLin.Selected := IndentLine.Selected;
                                    RecPurcAppLin."Requirement Date" := IndentLine."Requirement Date";
                                    RecPurcAppLin."Lead Time" := FORMAT(IndentLine."Lead Time");
                                    RecPurcAppLin."Quotation Qty" := IndentLine."Quotation Qty";
                                    RecPurcAppLin."Line No." := IndentLine."Line No.";
                                    VarcompName := 'NGL Fine Chem Limited';
                                    RecPurcAppLin.INSERT;
                                    Loc.GET(IndentLine."Location Code");    //PCPL-25

                                    RecVendor.RESET();
                                    RecVendor.SETRANGE(RecVendor."No.", recVend."No.");
                                    RecVendor.SETRANGE(RecVendor.Selected, TRUE);
                                    IF RecVendor.FINDFIRST THEN
                                        REPEAT
                                        BEGIN
                                            IF recV.GET(RecVendor."No.") THEN;
                                            Varvenpass := recV.Password;
                                            //VarEmailSender:='purchase@nglfinechem.comrecV';
                                            VarEmailSender := 'donotreply@nglfinechem.com';
                                            VarRecipaint.add(recV."E-Mail");//1
                                            TempVarReceipt := recV."E-Mail";


                                            IF recV."E-Mail1" <> '' THEN begin
                                                VarRecipaint.Add(recV."E-Mail1");//2
                                                TempVarReceipt := recV."E-Mail1";
                                            end;

                                            IF recV."E-Mail2" <> '' THEN begin
                                                VarRecipaint.Add(recV."E-Mail2");//3
                                                TempVarReceipt := recV."E-Mail2";
                                            end;

                                            IF (recV."E-Mail" <> '') AND (recV."E-Mail1" <> '') THEN begin
                                                VarRecipaint.Add(recV."E-Mail" + ';' + recV."E-Mail1");//1&2
                                                TempVarReceipt := (recV."E-Mail" + ';' + recV."E-Mail1");
                                            end;

                                            IF (recV."E-Mail" <> '') AND (recV."E-Mail2" <> '') THEN begin
                                                VarRecipaint.add(recV."E-Mail" + ';' + recV."E-Mail2");//1&3
                                                TempVarReceipt := (recV."E-Mail" + ';' + recV."E-Mail2");
                                            end;

                                            IF (recV."E-Mail1" <> '') AND (recV."E-Mail2" <> '') THEN begin
                                                VarRecipaint.Add(recV."E-Mail1" + ';' + recV."E-Mail2");//2&3
                                                TempVarReceipt := (recV."E-Mail1" + ';' + recV."E-Mail2");
                                            end;
                                            IF (recV."E-Mail" <> '') AND (recV."E-Mail1" <> '') AND (recV."E-Mail2" <> '') THEN begin
                                                VarRecipaint.Add(recV."E-Mail" + ';' + recV."E-Mail1" + ';' + recV."E-Mail2");//123
                                                TempVarReceipt := (recV."E-Mail" + ';' + recV."E-Mail1" + ';' + recV."E-Mail2");
                                            end;
                                            //VarRecipaint:=recV."E-Mail"+';'+recV."E-Mail1"+';'+recV."E-Mail2";
                                        END;

                                        IF RecVendor.Selected = TRUE THEN BEGIN
                                            //IF VarRecipaint <> '' THEN BEGIN //PCPL/NSW/MIG 25July22
                                            IF TempVarReceipt <> '' THEN BEGIN //PCPL/NSW/MIG 25July22
                                                Varsubject := 'Request For Quote : ' + IndentLine.Description;
                                                // SMTp.CreateMessage('NGL Fine-Chem LTD.', VarEmailSender, VarRecipaint, Varsubject, '', TRUE);
                                                /*
                                                IF recV."E-Mail1"<>'' THEN
                                                  SMTPMail.AddRecipients(recV."E-Mail1");
                                                IF recV."E-Mail2"<>'' THEN
                                                  SMTPMail.AddRecipients(recV."E-Mail2");
                                                  */
                                                addspecificationatachment := '';
                                                BodyText.AddText('Dear Sir/Madam');
                                                BodyText.AddText('<br><Br>');
                                                BodyText.AddText('We request you to submit your quote for our following requirement. For details click on Web Link.');
                                                BodyText.AddText('<br><Br>');
                                                BodyText.AddText('<table border="0">');
                                                BodyText.AddText('<tr style= "color:#507CD1">');
                                                BodyText.AddText('<td style="text-align:center" colspan=8><b> ' + VarcompName + '</b></td>');
                                                BodyText.AddText('</tr>');
                                                //SMTp.AppendBody('<br><Br>');
                                                /*SMTp.AppendBody('<tr>');
                                                SMTp.AppendBody('<th> Vendor Name:'   + recV.Name   + '</th>');
                                                SMTp.AppendBody('</tr>');*/
                                                BodyText.AddText('<br><Br>');
                                                BodyText.AddText('<tr style="background-color:#507CD1; color:#fff">');
                                                BodyText.AddText('<th> Date           </th>');
                                                BodyText.AddText('<th> Indent No.     </th>');
                                                BodyText.AddText('<th> Item No.       </th>');
                                                BodyText.AddText('<th> Description    </th>');
                                                BodyText.AddText('<th> Quantity       </th>');
                                                BodyText.AddText('<th> UOM            </th>');
                                                BodyText.AddText('<th> Delivery Date  </th>');
                                                BodyText.AddText('<th> Last date for Quote Submission     </th>');
                                                BodyText.AddText('<th> Web Link </th>');
                                                BodyText.AddText('</tr>');
                                                BodyText.AddText('<tr style="background-color:#EFF3FB; color:black">');
                                                BodyText.AddText('<td>' + FORMAT(IndentLine.Date) + '</td>');
                                                BodyText.AddText('<td>' + FORMAT(IndentLine."Document No.") + '</td>');
                                                BodyText.AddText('<td>' + IndentLine."No." + '</td>');
                                                BodyText.AddText('<td>' + IndentLine.Description + '</td>');
                                                //SMTp.AppendBody('<td>'  + FORMAT(IndentLine.Quantity )+ '</td>');
                                                BodyText.AddText('<td>' + FORMAT(IndentLine."Quotation Qty") + '</td>');
                                                BodyText.AddText('<td>' + IndentLine."Unit of Measure Code" + '</td>');
                                                BodyText.AddText('<td>' + FORMAT(IndentLine."Requirement Date") + '</td>');
                                                BodyText.AddText('<td>' + FORMAT(IndentLine."Lead Time") + '</td>');
                                                //SMTp.AppendBody('<td>'  +' ' + '</td>');
                                                //txtLink:='http://43.250.208.210:81/Login'; //PCPL/NSW/07 16June22 New Code below Added
                                                txtLink := ' http://20.198.67.21/rfq/login';
                                                BodyText.AddText('<p><a href="' + txtLink + '"><b>Click To Submit Quotes </b></a></p>');
                                                BodyText.AddText('</tr>');
                                                BodyText.AddText('</tr>');
                                                BodyText.AddText('<tr>');
                                                BodyText.AddText('<td colspan=8 >');
                                                BodyText.AddText('</td>');
                                                BodyText.AddText('</tr>');
                                                BodyText.AddText('</table>');
                                                BodyText.AddText('<br><Br>');
                                                BodyText.AddText('<table border="0">');
                                                //PCPL-25
                                                BodyText.AddText('<tr>');
                                                BodyText.AddText('<th style="text-align:left"> <B> Ship To Address: ' + Loc.Code + '-' + Loc.Address + ' ' + Loc."Address 2" + '</th>');
                                                BodyText.AddText('</tr>');
                                                //PCPL-25
                                                BodyText.AddText('<tr>');
                                                BodyText.AddText('<th style="text-align:left"> <B> Vendor Name:' + recV.Name + '</th>');
                                                BodyText.AddText('</tr>');
                                                BodyText.AddText('<tr>');
                                                BodyText.AddText('<th style="text-align:left"> <B> Vendor User ID: ' + recV."No." + '</th>');
                                                BodyText.AddText('</tr>');
                                                IF recV."Mail count" = 0 THEN BEGIN    //PCPL-25
                                                    BodyText.AddText('<tr>');
                                                    BodyText.AddText('<th style="text-align:left"> <B> Vendor Password:' + Varvenpass + '</th>');
                                                    BodyText.AddText('</tr>');
                                                END;
                                                BodyText.AddText('<tr>');//5nov2018
                                                BodyText.AddText('<th style="text-align:left"> ' + addspecificationatachment + '</th>');//5nov2018
                                                BodyText.AddText('</tr>');//5nov2018
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
                                                sr1 += 1;
                                                pdfname1 := 'E:\Specification' + FORMAT(sr1);   //temp comment
                                                recitem1.RESET;
                                                recitem1.SETRANGE(recitem1."No.", IndentLine."No.");
                                                IF recitem1.FINDFIRST THEN BEGIN
                                                    recspecificationheader.RESET;
                                                    recspecificationheader.SETRANGE(recspecificationheader."Specs ID", recitem1."Specs ID");
                                                    IF recspecificationheader.FINDFIRST THEN BEGIN

                                                        /*
                                                        Purchase_OrderNGL_T1.SETTABLEVIEW(recspecificationheader);
                                                        Purchase_OrderNGL_T1.USEREQUESTPAGE(FALSE);
                                                        Purchase_OrderNGL_T1.SAVEASPDF(pdfname1 + '.pdf');
                                                        CLEAR(Purchase_OrderNGL_T1);
                                                        *///PCPL/NSW/07 Above code comment and below new code added

                                                        Recref.GetTable(recspecificationheader);
                                                        TempBlob.CreateOutStream(OutStr);
                                                        Report.SaveAs(Report::"Specification format", '', ReportFormat::Pdf, OutStr, Recref);
                                                        TempBlob.CreateInStream(InStr);
                                                        //path := 'D:\New folder (2)';
                                                        //SMTp.AddAttachment(pdfname1 + '.pdf', '');
                                                        Emailmessage.AddAttachment('Specification Data', '.pdf', InStr);
                                                        addspecificationatachment := 'Attachment: Item Specification';
                                                    END;
                                                END;
                                                // SMTp.Send;
                                                Emailmessage.Create(VarReceiptNew, Varsubject, Format(BodyText), true);
                                                Email.Send(Emailmessage, Enum::"Email Scenario"::Default);
                                            END;
                                            RecVendor.Selected := FALSE;
                                            RecVendor.MODIFY;

                                            //pccl0024--09oct2018--start
                                            addspecificationatachment := '';
                                            IF (recV."Broker Name" <> '') AND (recV."Broker Email ID" <> '') THEN BEGIN
                                                VarReceiptNew.add(recV."Broker Email ID");
                                                Varsubject := 'Request For Quote : ' + IndentLine.Description;
                                                //SMTp.CreateMessage('PO APPROVAL', VarEmailSender, VarReceiptNew, Varsubject, '', TRUE);
                                                /*
                                                IF recV."E-Mail1"<>'' THEN
                                                  SMTPMail.AddRecipients(recV."E-Mail1");
                                                IF recV."E-Mail2"<>'' THEN
                                                  SMTPMail.AddRecipients(recV."E-Mail2");
                                                  */
                                                BodyText.AddText('Dear Sir/Madam');
                                                BodyText.AddText('<br><Br>');
                                                BodyText.AddText('We request you to submit your quote for our following requirement. For details click on Web Link.');
                                                BodyText.AddText('<br><Br>');
                                                BodyText.AddText('<table border="0">');
                                                BodyText.AddText('<tr style= "color:#507CD1">');
                                                BodyText.AddText('<td style="text-align:center" colspan=8><b> ' + VarcompName + '</b></td>');
                                                BodyText.AddText('</tr>');
                                                /*SMTp.AppendBody('<tr>');
                                                SMTp.AppendBody('<th> Vendor Name:'   + recV.Name   + '</th>');
                                                SMTp.AppendBody('</tr>');*/
                                                BodyText.AddText('<br><Br>');
                                                BodyText.AddText('<tr style="background-color:#507CD1; color:#fff">');
                                                BodyText.AddText('<th> Date           </th>');
                                                BodyText.AddText('<th> Indent No.     </th>');
                                                BodyText.AddText('<th> Item No.       </th>');
                                                BodyText.AddText('<th> Description    </th>');
                                                BodyText.AddText('<th> Quantity       </th>');
                                                BodyText.AddText('<th> UOM            </th>');
                                                BodyText.AddText('<th> Delivery Date       </th>');
                                                //SMTp.AppendBody('<th> Lead Time      </th>');
                                                //SMTp.AppendBody('<th> Web Link </th>');
                                                BodyText.AddText('</tr>');
                                                BodyText.AddText('<tr style="background-color:#EFF3FB; color:black">');
                                                BodyText.AddText('<td>' + FORMAT(IndentLine.Date) + '</td>');
                                                BodyText.AddText('<td>' + FORMAT(IndentLine."Document No.") + '</td>');
                                                BodyText.AddText('<td>' + IndentLine."No." + '</td>');
                                                BodyText.AddText('<td>' + IndentLine.Description + '</td>');
                                                BodyText.AddText('<td>' + FORMAT(IndentLine."Quotation Qty") + '</td>');
                                                BodyText.AddText('<td>' + IndentLine."Unit of Measure Code" + '</td>');
                                                BodyText.AddText('<td>' + FORMAT(IndentLine."Requirement Date") + '</td>');
                                                //SMTp.AppendBody('<td>'  + FORMAT(IndentLine."Lead Time") + '</td>');
                                                //SMTp.AppendBody('<td>'  +' ' + '</td>');
                                                BodyText.AddText('</tr>');
                                                BodyText.AddText('</tr>');
                                                BodyText.AddText('<tr>');
                                                BodyText.AddText('<td colspan=8 >');
                                                BodyText.AddText('</td>');
                                                BodyText.AddText('</tr>');
                                                BodyText.AddText('</table>');
                                                // SMTp.AppendBody('<br><Br>');
                                                // SMTp.AppendBody('<br><Br>');
                                                // SMTp.AppendBody('<br><Br>');
                                                BodyText.AddText('<table border="0">');
                                                BodyText.AddText('<tr>');
                                                BodyText.AddText('<th> Broker Name:' + recV."Broker Name" + '</th>');
                                                BodyText.AddText('</tr>');
                                                //PCPL-25 24aug21
                                                BodyText.AddText('<tr>');
                                                BodyText.AddText('<th style="text-align:left"> <B> Ship To Address: ' + Loc.Code + '-' + Loc.Address + ' ' + Loc."Address 2" + '</th>');
                                                BodyText.AddText('</tr>');
                                                //PCPL-25 24aug21
                                                BodyText.AddText('<tr>');//5nov2018
                                                BodyText.AddText('<th style="text-align:left"> ' + addspecificationatachment + '</th>');//5nov2018
                                                BodyText.AddText('</tr>');//5nov2018
                                                BodyText.AddText('</table>');
                                                /*SMTp.AppendBody('<tr>');
                                                SMTp.AppendBody('<th style="text-align:left"> Vendor User ID: '   + ItemVendorCatalog."Vendor No."    + '</th>');
                                                SMTp.AppendBody('</tr>');
                                                SMTp.AppendBody('<tr>');
                                                SMTp.AppendBody('<th style="text-align:left"> Vendor Password:' + Varvenpass   + '</th>');
                                                SMTp.AppendBody('</tr>');*/
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
                                                sr += 1;
                                                //pdfname:='E:\Specification'+FORMAT(sr);   //temp comment
                                                recitem1.RESET;
                                                recitem1.SETRANGE(recitem1."No.", IndentLine."No.");
                                                IF recitem1.FINDFIRST THEN BEGIN
                                                    recspecificationheader.RESET;
                                                    recspecificationheader.SETRANGE(recspecificationheader."Specs ID", recitem1."Specs ID");
                                                    IF recspecificationheader.FINDFIRST THEN BEGIN
                                                        /* //NSW07
                                                        Purchase_OrderNGL_T.SETTABLEVIEW(recspecificationheader);
                                                        Purchase_OrderNGL_T.USEREQUESTPAGE(FALSE);
                                                        Purchase_OrderNGL_T.SAVEASPDF(pdfname + '.pdf');
                                                        CLEAR(Purchase_OrderNGL_T);
                                                        */ //NSW07
                                                        //path := 'D:\New folder (2)';
                                                        Recref.GetTable(recspecificationheader);
                                                        TempBlob.CreateOutStream(OutStr);
                                                        Report.SaveAs(Report::"Specification format", '', ReportFormat::Pdf, OutStr, Recref);
                                                        TempBlob.CreateInStream(InStr);
                                                        //path := 'D:\New folder (2)';
                                                        //SMTp.AddAttachment(pdfname1 + '.pdf', '');
                                                        Emailmessage.AddAttachment('Specification Data', '.pdf', InStr);
                                                        addspecificationatachment := 'Attachment: Item Specification';
                                                        //SMTp.AddAttachment(pdfname + '.pdf', '');
                                                        addspecificationatachment := 'Attachment: Item Specification';
                                                    END;
                                                END;
                                                // SMTp.Send;
                                                Emailmessage.Create(VarReceiptNew, Varsubject, Format(BodyText), true);
                                                Email.Send(Emailmessage, Enum::"Email Scenario"::Default);
                                                //pccl0024--09oct2018--start
                                            END;
                                        END;
                                        //PCPL-25
                                        recV."Mail count" += 1;
                                        recV.MODIFY;
                                        //PCPL-25
                                        UNTIL RecVendor.NEXT = 0;

                                //PCPL0024--End
                                UNTIL recVend.NEXT = 0;
                            /* //pcpl00242nov2018--start
                            recVend.SETRANGE(recVend."Indent Doc No",IndentLine."Document No.");
                            recVend.SETRANGE(recVend.Selected,TRUE);
                            IF recVend.FIND('-') THEN
                            BEGIN
                                IndentLine."Mail Already Sent" := TRUE;
                                //IndentLine.Selected:=FALSE;
                            END
                            ELSE
                            BEGIN
                            ERROR('Selection is must Or No data Found');
                            END;
                            //pcpl0024-2nov2018--end*/
                            IndentLine."Mail Already Sent" := TRUE;//pcpl002402nov2018
                            MESSAGE('Quotaion has been send to Respected Vendors');

                            IndentLine.MODIFY;
                        UNTIL IndentLine.NEXT = 0;

                    recVend.RESET;
                    recVend.SETRANGE(recVend."Indent Doc No", IndentLine."Document No.");
                    IF recVend.FINDFIRST THEN
                        REPEAT
                            recVend."Indent Doc No" := '';
                            recVend.Selected := FALSE;
                            recVend.MODIFY;
                        UNTIL recVend.NEXT = 0;
                    CurrPage.CLOSE;

                end;
            }
        }
    }

    var
        recVend: Record 50033;
        IndentHeader: Record 50002;
        //SMTPMail: Codeunit 400;
        //SMTPMailSetup: Record 409;
        RecPurcAppLin: Record 50028;
        vari: Integer;
        //SMTP: Codeunit 400;
        RecVendor: Record 50033;
        Companyinfo: Record 79;
        Varvenpass: Code[50];
        VarcompName: Text[150];
        VarEmailSender: Text[60];
        VarRecipaint: list of [Text];
        recItem: Record 27;
        recV: Record 23;
        Varsubject: Text[250];
        recitem1: Record 27;
        recspecificationheader: Record 50015;
        Purchase_OrderNGL_T: Report 50023; //NSW07
        sr: Integer;
        pdfname: Text[60];
        txtLink: Text[100];
        sr1: Integer;
        pdfname1: Text[60];
        Purchase_OrderNGL_T1: Report 50023; //NSW07
        addspecificationatachment: Text[150];
        Loc: Record 14;
        VarReceiptNew: list of [text];
        TempVarReceipt: Text;
        OutStr: OutStream;
        InStr: InStream;
        Recref: RecordRef;
        TempBlob: Codeunit "Temp Blob";

        Emailmessage: Codeunit "Email Message";
        Email: Codeunit Email;
        BodyText: BigText;

    procedure SendMailToBrokerFromPurchaserApproval();
    begin
    end;
}

