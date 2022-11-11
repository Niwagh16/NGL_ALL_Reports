page 50061 "Request For Quotes"
{
    // version PCPL/BRB/006

    PageType = List;
    SourceTable = 50003;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = ALL;
                }
                field(Date; rec.Date)
                {
                    ApplicationArea = ALL;
                }
                field("Indent Closing Date"; rec."Indent Closing Date")
                {
                    ApplicationArea = ALL;
                }
                field("No."; rec."No.")
                {
                    ApplicationArea = ALL;
                }
                field("Location Code"; rec."Location Code")
                {
                    ApplicationArea = ALL;
                }
                field("Quotation Qty"; rec."Quotation Qty")
                {
                    ApplicationArea = ALL;
                }
                field(Quantity; rec.Quantity)
                {
                    ApplicationArea = ALL;
                }
                field("PO Qty"; rec."PO Qty")
                {
                    ApplicationArea = ALL;
                }
                field("Variant Code"; rec."Variant Code")
                {
                    ApplicationArea = ALL;
                }
                field(Approved; rec.Approved)
                {
                    ApplicationArea = ALL;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = ALL;
                }
                field("Unit of Measure Code"; rec."Unit of Measure Code")
                {
                    ApplicationArea = ALL;
                }
                field(Closingqty; rec.Closingqty)
                {
                    Visible = false;
                    ApplicationArea = ALL;
                }
                field(Selected; rec.Selected)
                {
                    ApplicationArea = ALL;
                }
                field("Vendor No."; rec."Vendor No.")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                }
                field("Vendor Name"; rec."Vendor Name")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                }
                field("Comment for Close"; rec."Comment for Close")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                }
                field("Vendor Unit_ Price"; rec."Vendor Unit_ Price")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                }
                field("Vendor Discount %"; rec."Vendor Discount %")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                }
                field("Lead Time"; rec."Lead Time")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                }
                field(Availability; rec.Availability)
                {
                    Visible = false;
                    ApplicationArea = ALL;
                }
                field("Self Life"; rec."Self Life")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                }
                field(Observation; rec.Observation)
                {
                    Visible = false;
                    ApplicationArea = ALL;
                }
                field("Mail Already Sent"; rec."Mail Already Sent")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                }
                field("Create PO"; rec."Create PO")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                }
                field("PO Created"; rec."PO Created")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                }
                field("Line No."; rec."Line No.")
                {
                    ApplicationArea = ALL;
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
                    /*IndentLine.RESET;//azhar
                    IndentLine.SETRANGE(Selected,TRUE);
                    IndentLine.SETRANGE("Mail Already Sent",FALSE);
                    IF IndentLine.FINDSET THEN  REPEAT
                      IF recItem.GET(IndentLine."No.") THEN;
                      IF (recItem."Inventory Posting Group"='RM') OR (recItem."Inventory Posting Group"='PM') THEN BEGIN
                        ItemVendorCatalog.RESET;
                        ItemVendorCatalog.SETRANGE("Item No.",IndentLine."No.");
                        ItemVendorCatalog.SETRANGE("Send Mail",TRUE);
                        IF ItemVendorCatalog.FINDSET THEN  REPEAT
                          IF Vend.GET(ItemVendorCatalog."Vendor No.") THEN;
                          IF Itemrec.GET("No.") THEN;
                    
                        vari:=RecPurcAppLin.COUNT;
                        IF RecPurcAppLin.FINDLAST THEN
                        vari:=RecPurcAppLin."Entry No";
                        vari+=1;
                    
                        RecPurcAppLin.RESET;
                        RecPurcAppLin.INIT;
                        RecPurcAppLin."Entry No":=vari;
                        RecPurcAppLin."Document No.":=IndentLine."Document No.";
                        RecPurcAppLin.Date:=IndentLine.Date;
                        RecPurcAppLin."No.":=IndentLine."No.";
                        RecPurcAppLin."Location Code":=IndentLine."Location Code";
                        RecPurcAppLin .Quantity:=IndentLine.Quantity;
                        RecPurcAppLin."PO Qty":=IndentLine."PO Qty";
                        RecPurcAppLin .Approved:=IndentLine.Approved;
                        RecPurcAppLin.Description:=IndentLine.Description;
                        RecPurcAppLin."Unit of Measure Code":=IndentLine."Unit of Measure Code";
                        RecPurcAppLin.Closingqty:=IndentLine.Closingqty;
                        RecPurcAppLin."Vendor No.":=ItemVendorCatalog."Vendor No.";
                        RecPurcAppLin."Vendor Name":= ItemVendorCatalog."Vendor Name";
                        RecPurcAppLin.Selected:= IndentLine.Selected;
                        RecPurcAppLin."Requirement Date":=IndentLine."Requirement Date";
                        RecPurcAppLin."Lead Time" := FORMAT(IndentLine."Lead Time");
                        RecPurcAppLin."Quotation Qty" := IndentLine."Quotation Qty";
                        VarcompName:='NGL Fine Chem Limited';
                        RecPurcAppLin.INSERT;
                               RecVendor.RESET();
                               RecVendor.SETRANGE(RecVendor."No.",ItemVendorCatalog."Vendor No.");
                               IF RecVendor.FINDFIRST THEN
                                    BEGIN
                                      Varvenpass:= RecVendor.Password;
                                      VarEmailSender:='purchase@nglfinechem.com';
                                      VarRecipaint:=RecVendor."E-Mail";//+';'+RecVendor."E-Mail1"+';'+RecVendor."E-Mail2";
                                    END;
                                                   { Varsubject:='Request For Quote : '+IndentLine.Description;
                                                    SMTp.CreateMessage('Purchase Team',VarEmailSender,VarRecipaint,Varsubject,'',TRUE);
                                                    SMTPMail.AddRecipients(RecVendor."E-Mail1");
                                                    SMTPMail.AddRecipients(RecVendor."E-Mail2");
                                                    SMTp.AppendBody('Dear Sir/Madam');
                                                    SMTp.AppendBody('<br><Br>');
                                                    //SMTp.AppendBody('Kindly Update Your Quote Price.');
                                                    SMTp.AppendBody('We request you to submit your quote for our following requirement. For details click on Web Link.');
                                                    SMTp.AppendBody('<br><Br>');
                                                    SMTp.AppendBody('<table border="0">');
                                                    {SMTp.AppendBody('<tr style= "color:#507CD1">');
                                                    SMTp.AppendBody('<td style="text-align:center" colspan=8><b> '   +    VarcompName+ '</b></td>');
                                                    SMTp.AppendBody('</tr>');
                                                    SMTp.AppendBody('<tr>');
                                                    SMTp.AppendBody('<th> Vendor Name:'   + ItemVendorCatalog."Vendor Name"   + '</th>');
                                                    SMTp.AppendBody('</tr>');
                                                    }
                                                    SMTp.AppendBody('<br><Br>');
                                                    SMTp.AppendBody('<tr style="background-color:#507CD1; color:#fff">');
                                                    SMTp.AppendBody('<th> Date           </th>');
                                                    SMTp.AppendBody('<th> Indent No.     </th>');
                                                    SMTp.AppendBody('<th> Item No.       </th>');
                                                    SMTp.AppendBody('<th> Description    </th>');
                                                    SMTp.AppendBody('<th> Quantity       </th>');
                                                    SMTp.AppendBody('<th> UOM            </th>');
                                                    SMTp.AppendBody('<th> Req Date       </th>');
                                                    SMTp.AppendBody('<th> Lead Time      </th>');
                                                    SMTp.AppendBody('<th> Web Link </th>');
                                                    SMTp.AppendBody('</tr>');
                                                    SMTp.AppendBody('<tr style="background-color:#EFF3FB; color:black">');
                                                    SMTp.AppendBody('<td>'  + FORMAT(IndentLine.Date) + '</td>');
                                                    SMTp.AppendBody('<td>'  + FORMAT(IndentLine."Document No.") + '</td>');
                                                    SMTp.AppendBody('<td>'  + IndentLine."No." + '</td>');
                                                    SMTp.AppendBody('<td>'  + IndentLine.Description + '</td>');
                                                    SMTp.AppendBody('<td>'  + FORMAT(IndentLine.Quantity )+ '</td>');
                                                    SMTp.AppendBody('<td>'  + IndentLine."Unit of Measure Code"  + '</td>');
                                                    SMTp.AppendBody('<td>'  + FORMAT(IndentLine."Requirement Date" ) + '</td>');
                                                    SMTp.AppendBody('<td>'  + FORMAT(IndentLine."Lead Time") + '</td>');
                                                    SMTp.AppendBody('<td>'  +' ' + '</td>');
                                                    SMTp.AppendBody('</tr>');
                                                    SMTp.AppendBody('</tr>');
                                                    SMTp.AppendBody('<tr>');
                                                    SMTp.AppendBody('<td colspan=8 >');
                                                    SMTp.AppendBody('</td>');
                                                    SMTp.AppendBody('</tr>');
                                                    {
                                                    SMTp.AppendBody('<tr>');
                                                    SMTp.AppendBody('<th style="text-align:left"> Vendor User ID: '   + ItemVendorCatalog."Vendor No."    + '</th>');
                                                    SMTp.AppendBody('</tr>');
                                                    SMTp.AppendBody('<tr>');
                                                    SMTp.AppendBody('<th style="text-align:left"> Vendor Password:' + Varvenpass   + '</th>');
                                                    SMTp.AppendBody('</tr>');
                                                    }
                                                    SMTp.AppendBody('</table>');
                                                   // SMTp.AppendBody('<br><Br>');
                                                   // SMTp.AppendBody('<br><Br>');
                                                   // SMTp.AppendBody('<br><Br>');
                                                    SMTp.AppendBody('<table border="0">');
                                                    SMTp.AppendBody('<tr>');
                                                    SMTp.AppendBody('<th> Vendor Name:'   + ItemVendorCatalog."Vendor Name"   + '</th>');
                                                    SMTp.AppendBody('</tr>');
                                                    SMTp.AppendBody('<tr>');
                                                    SMTp.AppendBody('<th style="text-align:left"> Vendor User ID: '   + ItemVendorCatalog."Vendor No."    + '</th>');
                                                    SMTp.AppendBody('</tr>');
                                                    SMTp.AppendBody('<tr>');
                                                    SMTp.AppendBody('<th style="text-align:left"> Vendor Password:' + Varvenpass   + '</th>');
                                                    SMTp.AppendBody('</tr>');
                                                    SMTp.AppendBody('</table>');
                                                     SMTp.AppendBody('<br><Br>');
                                                    SMTp.AppendBody('<br><Br>');
                                                    SMTp.AppendBody('<br><Br>');
                                                    SMTp.AppendBody('<table border="0">');
                                                    SMTp.AppendBody('<tr>');
                                                    SMTp.AppendBody('<td style="text-align:left" colspan=8><b>'+'Thanks & Regards'+'</b></td>');
                                                    SMTp.AppendBody('</tr>');
                                                    SMTp.AppendBody('<tr>');
                                                    SMTp.AppendBody('<td style="text-align:left" colspan=8><b>'+'Purchase Team' +'</b></td>');
                                                    SMTp.AppendBody('</tr>');
                                                    SMTp.AppendBody('<tr style= "color:#507CD1">');
                                                    SMTp.AppendBody('<td style="text-align:left" colspan=8><b> '   +VarcompName+ '</b></td>');
                                                    SMTp.AppendBody('</tr>');
                                                    SMTp.AppendBody('</table>');
                                                    SMTp.Send;}
                              //PCPL0024--End
                           UNTIL ItemVendorCatalog.NEXT =0;
                           //IndentLine."Mail Already Sent" := TRUE;//azhar
                           //IndentLine.Selected:=FALSE;
                          // MESSAGE('Quotaion has been send to Respected Vendors');
                    
                       IndentLine.MODIFY;
                       //38 PCPL Start
                    
                       END ELSE BEGIN*///azhar
                                       //azhar-start
                    IndentLine.RESET;//azhar
                    IndentLine.SETRANGE(Selected, TRUE);
                    IndentLine.SETRANGE("Mail Already Sent", FALSE);
                    IF IndentLine.FINDSET THEN
                        REPEAT
                            //azhar--end
                            recPAVendor.DELETEALL;
                            IndentLine.TESTFIELD("Quotation Qty"); //PPCPL/BRB
                                                                   /*
                                                                        RecVendor.RESET;
                                                                        IF RecVendor.FINDSET THEN REPEAT
                                                                         RecVendor."Indent Doc No":=IndentLine."Document No.";
                                                                         RecVendor.MODIFY;
                                                                        UNTIL RecVendor.NEXT=0;
                                                                    */
                            ItemVendorCatalog.RESET;
                            ItemVendorCatalog.SETRANGE("Item No.", IndentLine."No.");
                            ItemVendorCatalog.SETRANGE("Send Mail", TRUE);
                            ItemVendorCatalog.SETRANGE(Location, IndentLine."Location Code");
                            IF ItemVendorCatalog.FINDSET THEN
                                REPEAT
                                    recVen.RESET;
                                    recVen.SETRANGE("No.", ItemVendorCatalog."Vendor No.");
                                    IF recVen.FINDSET THEN
                                        REPEAT
                                            IF NOT recPAVendor.GET(recVen."No.") THEN BEGIN
                                                recPAVendor.INIT;
                                                recPAVendor."No." := recVen."No.";
                                                recPAVendor.Name := recVen.Name;
                                                recPAVendor."Indent Doc No" := IndentLine."Document No.";
                                                recPAVendor.INSERT;
                                            END;
                                        UNTIL recVen.NEXT = 0;
                                UNTIL ItemVendorCatalog.NEXT = 0;
                        //recVendList.SETTABLEVIEW(recPAVendor);
                        // recVendList.RUN;

                        //END;//azhar
                        //38 PCPL End
                        UNTIL IndentLine.NEXT = 0;//azhar
                    PAGE.RUN(50062);

                end;
            }
            action("Create PO.")
            {
                Caption = 'Create PO';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction();
                begin
                    rec.PurchaseOrderCreate;
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        // IF IndentHeader.GET("Document No.") THEN;
    end;

    var
        //IndentHeader : Record 50002;
        //SMTPMail: Codeunit 400;
        //SMTPMailSetup: Record 409;
        RecPurcAppLin: Record 50028;
        vari: Integer;
        //SMTp: Codeunit 400;
        RecVendor: Record 23;
        Companyinfo: Record 79;
        Varvenpass: Code[50];
        VarcompName: Text[150];
        VarEmailSender: Text[60];
        VarRecipaint: Text[60];
        recItem: Record 27;
        recVendList: Page 50062;
        recVen: Record 23;
        recPAVendor: Record 50033;
        Varsubject: Text[150];
}

