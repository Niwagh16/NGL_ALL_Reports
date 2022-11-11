report 50050 "Status Label"
{
    // version //PCPL-0041

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Status Label.rdl';
    Permissions = TableData 121 = rm;

    dataset
    {
        dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
        {
            DataItemTableView = WHERE(Type = CONST(Item),
                                      Quantity = FILTER(<> 0));
            column(DocumentNo_PurchRcptLine; "Purch. Rcpt. Line"."Document No.")
            {
            }
            column(Mfgdate; MfgdateText)
            {
            }
            column(ExpDate; ExpDateText)
            {
            }
            column(Username; Username)
            {
            }
            column(ContainerQty; ContainerQty)
            {
            }
            column(LineNo_PurchRcptLine; "Purch. Rcpt. Line"."Line No.")
            {
            }
            column(No_PurchRcptLine; "Purch. Rcpt. Line"."No.")
            {
            }
            column(Desc; Desc)
            {
            }
            column(LocationCode_PurchRcptLine; "Purch. Rcpt. Line"."Location Code")
            {
            }
            column(QrCode; "Purch. Rcpt. Line"."QR Code")
            {
            }
            column(Description_PurchRcptLine; "Purch. Rcpt. Line".Description)
            {
            }
            column(Quantity_PurchRcptLine; "Purch. Rcpt. Line".Quantity)
            {
            }
            column(UnitofMeasure_PurchRcptLine; "Purch. Rcpt. Line"."Unit of Measure")
            {
            }
            column(PostingDate_PurchRcptLine; PostingDate)
            {
            }
            column(ImageCompany; comapnyInfo.Picture)
            {
            }
            column(Name_companyInfo; comapnyInfo.Name)
            {
            }
            column(PaytoName; PurchRcptHeader."Pay-to Name")
            {
            }
            column(VarManName; VarManName)
            {
            }
            column(LabelForNum; LabelForNum)
            {
            }
            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                RequestFilterFields = "Lot No.";
                column(ItemDescription_ItemLedgerEntry; "Item Ledger Entry"."Item Description")
                {
                }
                column(Sr; Sr)
                {
                }
                column(Item_Ledger_ItemNo; "Item Ledger Entry"."Item No.")
                {
                }
                column(Batch_No; "Item Ledger Entry"."Lot No.")
                {
                }
                column(Item_Ledger_Qty; "Item Ledger Entry".Quantity / "Item Ledger Entry"."Qty. per Unit of Measure")
                {
                }
                column(Ext_Lot_No; "Item Ledger Entry"."External Lot No.")
                {
                }
                column(Barcodedetail; Barcodedetail)
                {
                }
                dataitem(Integer; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    column(Number_Integer; Integer.Number)
                    {
                    }
                    column(LoseQty; LooseQty)
                    {
                    }
                    column(ContainerNo; ContainerNo)
                    {
                    }
                    column(ContainerNoTxt; ContainerNoTxt)
                    {
                    }
                    column(INT; INT)
                    {
                    }
                    column(LotNoInformation; LotNoInformation)
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin

                        //PCPL-0041-START-15012020
                        INT := FORMAT(Integer.Number) + '/' + FORMAT(ContainerNo);
                        //MESSAGE(INT);
                        //PCPL-0041-END-15012020

                        //PCPL-25 9jul20
                        IF (Integer.Number = ContainerNo) AND (LooseQty > 0) THEN
                            ContainerNoTxt := FORMAT(LooseQty) + ' ' + "Item Ledger Entry"."Unit of Measure Code";
                        //PCPL-25 9jul20

                        //PCPL-25 26mar21
                        conNo := FORMAT(Integer.Number);

                        CLEAR(QRCodeInput);
                        //IF ThreeTierMgt.ClientFileExists(QRCodeFileName) THEN //PCPL/NSW/07 04Nov22 
                        //ThreeTierMgt.DeleteClientFile(QRCodeFileName); //PCPL/NSW/07 04Nov22


                        QRCodeInput := CreateQRCodeInput("Purch. Rcpt. Line".Description, "Purch. Rcpt. Line"."No.", PostingDate, ExtNo1, LotNo1, Qty1, ContainerQty, conNo);
                        QRCodeFileName := GetQRCode(QRCodeInput);
                        QRCodeFileName := MoveToMagicPath(QRCodeFileName);

                        CLEAR(TempBlob11);
                        TempBlob11.CreateInStream(Ints);
                        ThreeTierMgt.BLOBImport(TempBlob11, QRCodeFileName);
                        IF TempBlob11.HASVALUE THEN BEGIN
                            "Purch. Rcpt. Line"."QR Code".CreateOutStream(OutS);
                            CopyStream(Outs, IntS);
                            "Purch. Rcpt. Line".MODIFY;
                        END;

                        IF NOT ISSERVICETIER THEN
                            IF EXISTS(QRCodeFileName) THEN
                                ERASE(QRCodeFileName);
                        //PCPL-25 26mar21
                    end;

                    trigger OnPreDataItem();
                    begin

                        //PCPL-0041-START-17012020
                        IF (LooseQty = 0) THEN BEGIN
                            EVALUATE(ContainerQ, ContainerQty);
                            ContainerNo := (("Item Ledger Entry".Quantity / "Item Ledger Entry"."Qty. per Unit of Measure") - LooseQty) / ContainerQ;
                            //ContainerNoTxt := FORMAT(ContainerNo)+' '+"Item Ledger Entry"."Unit of Measure Code";
                            ContainerNoTxt := FORMAT(ContainerQty) + ' ' + "Item Ledger Entry"."Unit of Measure Code"; //PCPL-40
                            ContainerNo := ROUND(ContainerNo, 1);      //PCPL-25 9jul20
                            Integer.SETRANGE(Number, 1, ContainerNo);
                        END ELSE
                            IF (LooseQty > 0) THEN BEGIN
                                EVALUATE(ContainerQ, ContainerQty);
                                ContainerNo := (("Item Ledger Entry".Quantity / "Item Ledger Entry"."Qty. per Unit of Measure") - LooseQty) / ContainerQ + 1;
                                //ContainerNoTxt := FORMAT(ContainerNo)+' '+"Item Ledger Entry"."Unit of Measure Code";
                                ContainerNoTxt := FORMAT(ContainerQty) + ' ' + "Item Ledger Entry"."Unit of Measure Code"; //PCPL-40
                                ContainerNo := ROUND(ContainerNo, 1);      //PCPL-25 9jul20
                                Integer.SETRANGE(Number, 1, ContainerNo);
                            END;
                        //PCPL-0041-END-17012020
                    end;
                }

                trigger OnAfterGetRecord();
                begin

                    IF "Item Ledger Entry"."Lot No." = LotNoInformation THEN BEGIN//PCPL-0041-15012020
                        Sr := Sr + 1;
                        Qty := ("Item Ledger Entry".Quantity / "Item Ledger Entry"."Qty. per Unit of Measure");
                        //Barcodedetail:="Item Ledger Entry"."Item Description" + "Item Ledger Entry"."Document No." + FORMAT("Item Ledger Entry"."Posting Date") + "Item Ledger Entry"."External Lot No." + "Item Ledger Entry"."Lot No."  + FORMAT(Qty);
                        // << Saravanan.P, Karya, 04/07/2014
                        Barcodedetail := "Item Ledger Entry"."Document No." + FORMAT("Item Ledger Entry"."Posting Date");//+ "Item Ledger Entry"."External Lot No." + "Item Ledger Entry"."Lot No."  + FORMAT(Qty);
                    END ELSE//PCPL-0041-15012020
                        CurrReport.BREAK;//PCPL-0041-15012020
                end;
            }

            trigger OnAfterGetRecord();
            begin

                IF Location.GET("Purch. Rcpt. Line"."Location Code") THEN;
                IF PurchRcptHeader.GET("Purch. Rcpt. Line"."Document No.") THEN;
                RecPoWhseRecLine.RESET;
                RecPoWhseRecLine.SETRANGE(RecPoWhseRecLine."Posted Source No.", "Purch. Rcpt. Line"."Document No.");
                IF RecPoWhseRecLine.FINDFIRST THEN BEGIN
                    RecPoWhseReHead.RESET;
                    RecPoWhseReHead.SETRANGE(RecPoWhseReHead."No.", RecPoWhseRecLine."No.");
                    IF RecPoWhseReHead.FINDFIRST THEN BEGIN
                        VarManName := RecPoWhseReHead."Manufacturer Name";
                    END;
                END;
                PostingDate := FORMAT("Purch. Rcpt. Line"."Posting Date", 10, '<Day,2>/<Month,2>/<year4>');

                //PCPL-25
                CLEAR(Username);
                RecUser.RESET;
                RecUser.SETRANGE(RecUser."User Name", PurchRcptHeader."User ID");
                IF RecUser.FINDFIRST THEN BEGIN
                    Username := RecUser."Full Name";
                END;
                CLEAR(Desc);
                Desc := Location.Description;
                ItemLedgerEntry.RESET;
                ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Document No.", "Purch. Rcpt. Line"."Document No.");
                ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Item No.", "Purch. Rcpt. Line"."No.");
                IF ItemLedgerEntry.FINDFIRST THEN BEGIN
                    ItemLedgerEntry.CALCFIELDS(ItemLedgerEntry."External Lot No.");
                    ExtNo1 := ItemLedgerEntry."External Lot No.";
                    LotNo1 := ItemLedgerEntry."Lot No.";
                    Qty1 := ItemLedgerEntry.Quantity / ItemLedgerEntry."Qty. per Unit of Measure";
                END;

                /*
                CLEAR(QRCodeInput);
                IF ThreeTierMgt.ClientFileExists(QRCodeFileName) THEN
                  ThreeTierMgt.DeleteClientFile(QRCodeFileName);
                
                QRCodeInput := CreateQRCodeInput("Purch. Rcpt. Line".Description,"Purch. Rcpt. Line"."No.",PostingDate,ExtNo1,LotNo1,Qty1,ContainerQty);
                QRCodeFileName := GetQRCode(QRCodeInput);
                QRCodeFileName := MoveToMagicPath(QRCodeFileName);
                
                CLEAR(TempBlob1);
                ThreeTierMgt.BLOBImport(TempBlob1,QRCodeFileName);
                IF TempBlob1.Blob.HASVALUE THEN BEGIN
                    "Purch. Rcpt. Line"."QR Code" := TempBlob1.Blob;
                    "Purch. Rcpt. Line".MODIFY;
                END;
                
                IF NOT ISSERVICETIER THEN
                  IF EXISTS(QRCodeFileName) THEN
                    ERASE(QRCodeFileName);
                //PCPL-25
                */
                //PCPL0041-Start-28012020
                IF Mfgdate <> 0D THEN
                    MfgdateText := FORMAT(Mfgdate, 10, '<Day,2>/<Month,2>/<Year4>');

                IF ExpDate <> 0D THEN
                    ExpDateText := FORMAT(ExpDate, 10, '<Day,2>/<Month,2>/<Year4>');
                //PCPL0041-End-28012020

                //PCPL0041-Start-28012020
                IF Location.GET("Purch. Rcpt. Line"."Location Code") THEN
                    LabelForNum := ''; //Location."Label Format No."; //PCPL-Deepak
                //PCPL0041-End-28012020

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Control001)
                {
                    field("Container Qty."; ContainerQty)
                    {
                    }
                    field("Loose Qty."; LooseQty)
                    {
                    }
                    field("Mfg. Date"; Mfgdate)
                    {
                    }
                    field("Exp. Date"; ExpDate)
                    {
                    }
                    field(LotNoInformation; LotNoInformation)
                    {
                        Caption = 'LotNoInformation';
                        TableRelation = "Lot No. Information"."Lot No.";
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport();
    begin

        comapnyInfo.GET;
    end;

    var
        comapnyInfo: Record "Company Information";
        Location: Record Location;
        RecPoWhseRecLine: Record "Posted Whse. Receipt Line";
        RecPoWhseReHead: Record "Posted Whse. Receipt Header";
        PurchRcptHeader: Record "Purch. Rcpt. Header";
        VarManName: Text;
        Sr: Integer;
        ContainerQty: Code[20];
        PostingDate: Text;
        Qty: Decimal;
        Barcodedetail: Text;
        QrCode: Text;
        QRCodeInput: Text[1024];
        QRCodeFileName: Text[1024];
        ThreeTierMgt: Codeunit "File Management";
        //TempBlob1: Record TempBlob;
        TempBlob11: Codeunit "Temp Blob";
        RecItem: Record Item;
        QrCode1: Text[1024];
        ItemLedgerEntry: Record "Item Ledger Entry";
        ExtNo1: Code[80];
        LotNo1: Code[80];
        Qty1: Decimal;
        Desc: Code[10];
        Mfgdate: Date;
        ExpDate: Date;
        RecUser: Record User;
        Username: Text[250];
        LooseQty: Decimal;
        ContainerNo: Decimal;
        ContainerNoTxt: Text;
        ContainerQ: Decimal;
        INT: Text[250];
        LotNoInformation: Code[35];
        MfgdateText: Text;
        ExpDateText: Text;
        LabelForNum: Code[20];
        conNo: Code[10];
        IntS: InStream;
        OutS: OutStream;

    local procedure CreateQRCodeInput(Name: Text[80]; No: Text[80]; Postdate: Text[80]; ExtNo: Code[80]; LotNo: Code[80]; totQty: Decimal; ContQty: Code[80]; NoofCon: Code[10]) QRCodeInput: Text[1024];
    var
        IBarCodeProvider: DotNet BarcOdeProvider;//"'Microsoft.Dynamics.Nav.MX, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.MX.BarcodeProviders.IBarcodeProvider";
    begin
        //QRCodeInput := 'Item:' + Name + ';'+ No +';' + Postdate + ';'+ ExtNo + '/'+ LotNo + ';' + FORMAT(totQty)+';' + ContQty+';';
        QRCodeInput := 'Item:' + Name + ';' + No + ';' + Postdate + ';' + ExtNo + '/' + LotNo + ';' + FORMAT(totQty) + ';' + ContQty + ';' + NoofCon + ';';
    end;

    local procedure GetQRCode(QRCodeInput: Text[1024]) QRCodeFileName: Text[1024];
    var
        IBarCodeProvider: DotNet BarcOdeProvider;//"'Microsoft.Dynamics.Nav.MX, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.MX.BarcodeProviders.IBarcodeProvider" RUNONCLIENT;
    begin
        GetBarCodeProvider(IBarCodeProvider);
        QRCodeFileName := IBarCodeProvider.GetBarcode(QRCodeInput);
    end;

    local procedure GetBarCodeProvider(IBarCodeProvider: DotNet BarcOdeProvider/*"'Microsoft.Dynamics.Nav.MX, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.MX.BarcodeProviders.IBarcodeProvider"*/);
    var
        QRCodeProvider: DotNet QRProvider;//"'Microsoft.Dynamics.Nav.MX, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.MX.BarcodeProviders.QRCodeProvider" RUNONCLIENT;
    begin
        QRCodeProvider := QRCodeProvider.QRCodeProvider;
        IBarCodeProvider := QRCodeProvider;
    end;

    local procedure MoveToMagicPath(SourceFileName: Text[1024]) DestinationFileName: Text[1024];
    var
    // FileSystemObject: Automation "{F935DC20-1CF0-11D0-ADB9-00C04FD58A0B} 1.0:{0D43FE01-F093-11CF-8940-00A0C9054228}:'Windows Script Host Object Model'.FileSystemObject";
    begin
        //DestinationFileName := ThreeTierMgt.ClientTempFileName('');

        //IF ISCLEAR(FileSystemObject) THEN
        //  CREATE(FileSystemObject, TRUE, TRUE);


        //FileSystemObject.MoveFile(SourceFileName, DestinationFileName);
    end;
}

