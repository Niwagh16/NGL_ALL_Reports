report 50034 "Approved Status Label"
{
    // version PCPL-25

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Approved Status Label.rdl';

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = WHERE("Entry Type" = FILTER(Purchase | Transfer),
                                      "Document Type" = FILTER("Purchase Receipt" | "Transfer Receipt"),
                                      Quantity = FILTER(<> 0),
                                      "QC Status" = FILTER(Approved | WIP));
            RequestFilterFields = "Lot No.", "Document No.";
            column(CertificateNo_ItemLedgerEntry; "Item Ledger Entry"."Certificate No")
            {
            }
            column(Approved; Approved)
            {
            }
            column(Test; Test)
            {
            }
            column(ItemDescription_ItemLedgerEntry; "Item Ledger Entry"."Item Description")
            {
            }
            column(Sr; Sr)
            {
            }
            column(DocumentNo_ItemLedgerEntry; "Item Ledger Entry"."Document No.")
            {
            }
            column(Item_Ledger_ItemNo; "Item Ledger Entry"."Item No.")
            {
            }
            column(Batch_No; "Item Ledger Entry"."Lot No.")
            {
            }
            column(ExpirationDate_ItemLedgerEntry; "Item Ledger Entry"."Expiration Date")
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

                    INT := FORMAT(Integer.Number) + '/' + FORMAT(ContainerNo);

                    //PCPL-25 9jul20
                    IF (Integer.Number = ContainerNo) AND (LooseQty > 0) THEN
                        ContainerNoTxt := FORMAT(LooseQty) + ' ' + "Item Ledger Entry"."Unit of Measure Code";
                    //PCPL-25 9jul20
                end;

                trigger OnPreDataItem();
                begin

                    //PCPL-0041-START-17012020
                    IF (LooseQty = 0) THEN BEGIN
                        EVALUATE(ContainerQ, ContainerQty);
                        ContainerNo := (("Item Ledger Entry".Quantity / "Item Ledger Entry"."Qty. per Unit of Measure") - LooseQty) / ContainerQ;
                        ContainerNoTxt := FORMAT(ContainerQty) + ' ' + "Item Ledger Entry"."Unit of Measure Code"; //PCPL-40
                        ContainerNo := ROUND(ContainerNo, 1);      //PCPL-25 9jul20
                        Integer.SETRANGE(Number, 1, ContainerNo);
                    END ELSE
                        IF (LooseQty > 0) THEN BEGIN
                            EVALUATE(ContainerQ, ContainerQty);
                            ContainerNo := (("Item Ledger Entry".Quantity / "Item Ledger Entry"."Qty. per Unit of Measure") - LooseQty) / ContainerQ + 1;
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
                    Barcodedetail := "Item Ledger Entry"."Document No." + FORMAT("Item Ledger Entry"."Posting Date");//+ "Item Ledger Entry"."External Lot No." + "Item Ledger Entry"."Lot No."  + FORMAT(Qty);
                END ELSE//PCPL-0041-15012020
                    CurrReport.BREAK;//PCPL-0041-15012020

                IF (Approved) THEN //AND ("Item Ledger Entry"."QC Status" = "Item Ledger Entry"."QC Status" <> Approved) THEN
                    "Item Ledger Entry".TESTFIELD("Item Ledger Entry"."QC Status", "Item Ledger Entry"."QC Status"::Approved);

                IF Test THEN
                    "Item Ledger Entry".TESTFIELD("Item Ledger Entry"."QC Status", "Item Ledger Entry"."QC Status"::WIP);
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
                        Visible = false;
                    }
                    field("Exp. Date"; ExpDate)
                    {
                        Visible = false;
                    }
                    field(LotNoInformation; LotNoInformation)
                    {
                        Caption = 'LotNoInformation';
                        TableRelation = "Lot No. Information"."Lot No.";
                    }
                    field("Aproved Label"; Approved)
                    {
                    }
                    field("Test Label"; Test)
                    {
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
        IF (Approved = FALSE) AND (Test = FALSE) THEN
            ERROR('Atleast one tickmark is mandatory for approved or Test');

        IF (Approved) AND (Test) THEN
            ERROR('At time two tickmark is not allowed');
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
        // TempBlob1: Record "TempBlob";
        RecItem: Record "Item";
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
        Approved: Boolean;
        Test: Boolean;

    local procedure CreateQRCodeInput(Name: Text[80]; No: Text[80]; Postdate: Text[80]; ExtNo: Code[80]; LotNo: Code[80]; totQty: Decimal; ContQty: Code[80]) QRCodeInput: Text[1024];
    var
        IBarCodeProvider: DotNet BarcOdeProvider;
    begin
        //QRCodeInput := 'Material Name:' + Name + ';' + 'GRN NO.'+ No +';' + 'GRN Date'+ Postdate + ';' + 'Lot no.' + ExtNo + '/'+ 'Batch No.' + LotNo + ';' + 'Total Qty.' +FORMAT(totQty)+';' + 'Container Qty.'+ContQty+';';
        QRCodeInput := 'Item:' + Name + ';' + No + ';' + Postdate + ';' + ExtNo + '/' + LotNo + ';' + FORMAT(totQty) + ';' + ContQty + ';';
    end;

    local procedure GetQRCode(QRCodeInput: Text[1024]) QRCodeFileName: Text[1024];
    var
        IBarCodeProvider: DotNet BarcOdeProvider;//"'Microsoft.Dynamics.Nav.MX, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.MX.BarcodeProviders.IBarcodeProvider" RUNONCLIENT;
    begin
        GetBarCodeProvider(IBarCodeProvider);
        QRCodeFileName := IBarCodeProvider.GetBarcode(QRCodeInput);
    end;

    local procedure GetBarCodeProvider(IBarCodeProvider: DotNet QRProvider/*"'Microsoft.Dynamics.Nav.MX, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.MX.BarcodeProviders.IBarcodeProvider"*/);
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

