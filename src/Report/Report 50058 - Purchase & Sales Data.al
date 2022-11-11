report 50058 "Purchase & Sales Data"
{
    // version sanjay Ngl

    ProcessingOnly = true;

    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = SORTING("Document No.", "Document Line No.", "GST Component Code")
                                ORDER(Ascending)
                                WHERE("Document Type" = CONST(Invoice),
                                      "Entry Type" = CONST("Initial Entry"));
            RequestFilterFields = "Posting Date", "Transaction Type";

            trigger OnAfterGetRecord();
            begin
                IF "Detailed GST Ledger Entry"."GST Component Code" = 'SGST' THEN
                    CurrReport.SKIP;
                InitializeRequest;
                //PCPLGST
                //IF recSalesInvhrd.GET("Detailed GST Ledger Entry"."Document No.") THEN BEGIN
                //IF recSalesInvhrd."Debit Note" THEN
                //CurrReport.SKIP;
                //END;   //PCPLGST
                IF NoBuyer <> "Buyer/Seller Reg. No." THEN BEGIN
                    NoOfRecipient := NoOfRecipient + 1;
                    NoBuyer := "Buyer/Seller Reg. No.";
                END;

                IF (GETFILTER("Transaction Type") = 'Sales') THEN BEGIN
                    IF "Document Type" = "Document Type"::Invoice THEN
                        txtData[2] := "Document No.";
                END ELSE
                    txtData[2] := "External Document No.";
                IF PurchInvHeader.GET("Detailed GST Ledger Entry"."Document No.") THEN BEGIN
                    txtData[3] := FORMAT(PurchInvHeader."Buy-from Vendor Name");
                    txtData[36] := PurchInvHeader."Buy-from Address";

                    txtData[1] := FORMAT(PurchInvHeader."Document Date");
                    IF recVend.GET(PurchInvHeader."Buy-from Vendor No.") THEN BEGIN
                        txtData[37] := recVend.City;
                        IF recState.GET(recVend."State Code") THEN;
                        txtData[5] := recState."State Code (GST Reg. No.)" + '-' + recState.Description;
                    END;
                    //txtData[25] := FORMAT(PurchInvHeader."Document Date");
                END ELSE
                    IF recSalesInvhrd.GET("Detailed GST Ledger Entry"."Document No.") THEN BEGIN
                        CustLedgerEntry.RESET;
                        CustLedgerEntry.SETRANGE("Document Type", CustLedgerEntry."Document Type"::Payment);
                        CustLedgerEntry.SETRANGE("Document No.", recSalesInvhrd."Applies-to Doc. No.");
                        CustLedgerEntry.SETRANGE("GST on Advance Payment", TRUE);
                        IF CustLedgerEntry.FINDFIRST THEN BEGIN
                            txtData[21] := FORMAT(CustLedgerEntry."Posting Date");
                            txtData[22] := (CustLedgerEntry."Document No.");
                            txtData[23] := FORMAT(CustLedgerEntry.Amount);
                        END;
                        txtData[1] := FORMAT(recSalesInvhrd."Document Date");
                        txtData[3] := FORMAT(recSalesInvhrd."Sell-to Customer Name");
                        txtData[36] := recSalesInvhrd."Sell-to Address";

                        IF recCustomer.GET("Source No.") THEN BEGIN
                            txtData[37] := recCustomer.City;
                            IF recState.GET(recCustomer."State Code") THEN;
                            txtData[5] := recState."State Code (GST Reg. No.)" + '-' + recState.Description;
                        END;
                        //txtData[25] := FORMAT(recSalesInvhrd."Document Date");
                    END;
                //txtData[4] := FORMAT("Amount to Customer/Vendor");
                txtData[4] := FORMAT("Detailed GST Ledger Entry"."Buyer/Seller Reg. No.");

                IF "Reverse Charge" THEN
                    txtData[23] := 'Y'
                ELSE
                    txtData[23] := 'N';
                txtData[6] := FORMAT("Detailed GST Ledger Entry"."GST Group Type");

                IF SalesInvoiceLine.GET("Document No.", "Document Line No.") THEN BEGIN
                    txtData[7] := SalesInvoiceLine.Description;
                    txtData[10] := SalesInvoiceLine."Unit of Measure Code";
                    txtData[11] := FORMAT(SalesInvoiceLine."Unit Price");
                    txtData[12] := FORMAT(SalesInvoiceLine."Line Discount Amount");
                END
                ELSE
                    IF PurchInvLine.GET("Document No.", "Document Line No.") THEN BEGIN
                        txtData[7] := PurchInvLine.Description;
                        txtData[10] := PurchInvLine."Unit of Measure Code";
                        txtData[11] := FORMAT(PurchInvLine."Direct Unit Cost");
                        txtData[12] := FORMAT(PurchInvLine."Line Discount Amount");

                    END;

                txtData[8] := "Detailed GST Ledger Entry"."HSN/SAC Code";
                txtData[9] := FORMAT(ABS(Quantity));
                TotalQty := TotalQty + ABS(Quantity);


                txtData[13] := FORMAT(ABS("GST Base Amount"));
                IF "Detailed GST Ledger Entry"."GST Component Code" = 'CGST' THEN BEGIN
                    txtData[14] := FORMAT(ABS("GST %"));
                    txtData[15] := FORMAT(ABS("GST Amount"));
                    txtData[16] := FORMAT(ABS("GST %"));
                    txtData[17] := FORMAT(ABS("GST Amount"));
                    TotalCGST := TotalCGST + ABS("GST Amount");
                    txtData[20] := FORMAT(ABS("GST Base Amount") + ABS("GST Amount" * 2)); //Cess rate
                    TotalAmount := TotalAmount + ABS("GST Base Amount" + "GST Amount" * 2);
                END ELSE BEGIN
                    txtData[18] := FORMAT(ABS("GST %"));
                    txtData[19] := FORMAT(ABS("GST Amount"));
                    TotalIGST := TotalIGST + ABS("GST Amount");
                    txtData[20] := FORMAT(ABS("GST Base Amount") + ABS("GST Amount")); //Cess rate
                    TotalAmount := TotalAmount + ABS("GST Base Amount" + "GST Amount");
                END;

                //Totalamt := Totalamt + TotalAmount;

                //txtData[21] := ''; //Cess Amt
                //txtData[22] := '';
                //txtData[24] := ''; //nill rated
                //txtData[25] := '';
                //txtData[26] := '';
                //txtData[27] := '';
                //txtData[28] := '';

                //IF "Invoice Type" = "Detailed GST Ledger Entry"."Invoice Type"::Export THEN BEGIN PCPL/NSW/MIG 09Aug22
                IF "Detailed GST Ledger Entry"."GST Without Payment of Duty" THEN
                    txtData[24] := 'Export Without Payment of GST';
                //ELSE
                //  txtData[24] := 'Export With Payment of GST'; PCPL/NSW/MIG 09Aug22
                //END; PCPL/NSW/MIG 09Aug22
                txtData[25] := '';  //Shipping port code
                txtData[26] := '';
                txtData[27] := '';
                //IF "Detailed GST Ledger Entry"."GST Amount" <> 0 THEN
                txtData[28] := '';
                txtData[29] := "Detailed GST Ledger Entry"."Location  Reg. No.";
                txtData[30] := '';//"Detailed GST Ledger Entry"."Buyer/Seller State Code"; PCPL/NSW/MIG 09Aug22
                txtData[31] := '';
                IF "GST Vendor Type" <> "Detailed GST Ledger Entry"."GST Vendor Type"::" " THEN
                    txtData[32] := FORMAT("Detailed GST Ledger Entry"."GST Vendor Type")
                ELSE
                    txtData[32] := FORMAT("Detailed GST Ledger Entry"."GST Customer Type");
                txtData[33] := FORMAT("Detailed GST Ledger Entry"."No.");
                txtData[34] := '';//FORMAT("Detailed GST Ledger Entry"."Gen. Bus. Posting Group"); PCPL/NSW/MIG 09Aug22
                                  //IF GenProductPostingGroup.GET("Detailed GST Ledger Entry"."Gen. Prod. Posting Group") THEN
                txtData[35] := GenProductPostingGroup.Description;

                IF PrintToExcel THEN
                    MakeExcelDataBody;
                NoOfRecords := NoOfRecords + 1;
            end;

            trigger OnPostDataItem();
            begin
                // ExcelBuf.NewRow;

                // ExcelBuf.AddColumn('No. of Invoices',FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
                // ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
                // ExcelBuf.AddColumn('Total Invoice Value',FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
                // ExcelBuf.NewRow;
                // ExcelBuf.AddColumn(NoOfRecipient,FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Number);
                // ExcelBuf.AddColumn(NoOfRecords,FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Number);
                // ExcelBuf.AddColumn('',FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Number);
                // ExcelBuf.AddColumn(TotalAmount,FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Number);
            end;

            trigger OnPreDataItem();
            begin
                //IF "Transaction Type" = GETFILTER("Transaction Type"::Sales) THEN
                NoOfRecords := 0;
                NoOfRecipient := 1;
                TotalAmount := 0;
                Totalamt := 0;
                IF (GETFILTER("Transaction Type") = 'Sales') THEN BEGIN//PCPL0041-14022020
                    "Detailed GST Ledger Entry".SETRANGE("Transaction Type", "Transaction Type"::Sales);
                    //"Detailed GST Ledger Entry".SETFILTER("Amount to Customer/Vendor", '<>%1', 0)//PCPL0041-14022020 PCPL/NSW/MIG 09Aug22
                END ELSE//PCPL0041-14022020
                    "Detailed GST Ledger Entry".SETRANGE("Transaction Type", "Transaction Type"::Purchase);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(PrintToExcel; PrintToExcel)
                {
                    Caption = 'Print To Excel';
                }
                field(Sendmailbool; Sendmailbool)
                {
                    Caption = 'Send Mail';
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage();
        begin
            PrintToExcel := TRUE;
        end;
    }

    labels
    {
    }

    trigger OnPostReport();
    begin
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Total', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(TotalQty, FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(TotalCGST, FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(TotalCGST, FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(TotalIGST, FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(TotalAmount, FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        IF PrintToExcel THEN
            CreateExcelbook;
        //IF Sendmailbool THEN
        // SendMail("Detailed GST Ledger Entry");
    end;

    trigger OnPreReport();
    begin
        IF PrintToExcel THEN
            MakeExcelInfo;
        recCompanyInfo.GET();
    end;

    var
        ExcelBuf: Record "Excel Buffer" temporary;
        txtData: array[255] of Text[200];
        PrintToExcel: Boolean;
        recCompanyInfo: Record "Company Information";
        recCustomer: Record Customer;
        recState: Record State;
        recShipToAdd: Record "Ship-to Address";
        recSalesInvhrd: Record "Sales Invoice Header";
        SalesInvoiceLine: Record "Sales Invoice Line";
        PurchInvHeader: Record "Purch. Inv. Header";
        PurchInvLine: Record "Purch. Inv. Line";
        recVend: Record Vendor;
        RecLocation: Record Location;
        Item: Record Item;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        GenProductPostingGroup: Record "Gen. Product Posting Group";
        NoOfRecords: Integer;
        NoOfRecipient: Integer;
        NoBuyer: Text;
        TotalAmount: Decimal;
        //SMTP: Codeunit "SMTP Mail";
        CurrTime: Text;
        SalesCrHeader: Record "Detailed GST Ledger Entry";
        SalseCrRep: Report "Purchase & Sales Data";
        Sendmailbool: Boolean;
        TotalQty: Decimal;
        TotalCGST: Decimal;
        TotalIGST: Decimal;
        TotalBaseAmt: Decimal;
        Totalamt: Decimal;

    procedure MakeExcelInfo();
    begin
        ExcelBuf.SetUseInfoSheet;
        ExcelBuf.AddInfoColumn(COMPANYNAME, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(USERID, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(TODAY, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Date);
        ExcelBuf.NewRow;
        ExcelBuf.ClearNewRow;
        MakeExcelDataHeader;
    end;

    procedure MakeExcelDataHeader();
    begin
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('Invoice Date', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Invoice Number', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Customer/Vendor Billing Name', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Customer/Vendor Billing GSTIN', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Place Of Supply', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Item Type(Goods/Services)', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Item Description', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('HSN/SAC Code', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Item Quantity', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Item Unit of Measurement', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Item Rate', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Total Item Disc. Amount', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Taxable Value', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('CGST Rate', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('CGST Amount', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('SGST Rate', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('SGST Amount', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('IGST Rate', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('IGST Amount', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Total Value', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('Cess Amount',FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('Is this Bill of Supply',FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Is Reverse Charge Applicable', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('Is this on Nill Rated/Exempt/NonGST Item',FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('Original Invoice Date(In case of amendment)',FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);


        //ExcelBuf.AddColumn('Original Invoice No.(In case of amendment)',FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('Original Customer/Vendor Billing GSTIN(In case of amendment)',FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('GSTTIn of E-commerce Marketplace',FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('Date of Linked of Advanced Receipt',FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('Voucher No. of Linked of Advanced Receipt',FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('Adjustment Amount of the Linked of Advanced Receipt',FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Type of Export', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Shipping Port Code-Export', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Shipping Bill No.-Export', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Shipping Bill Date-Export', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Has GST/IDT TDS been deducted', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('My GSTTIN', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Customer/Vendor Billing Address', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Customer/Vendor Billing City', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Customer/Vendor Billing State', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Is this document cancelled', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Customer/Vendor Type', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Item/GL No.', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Gen. Business Posting Group', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Gen. Product Posting Group Description', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Address', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('City', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
    end;

    procedure MakeExcelDataBody();
    var
        y: Integer;
    begin
        ExcelBuf.NewRow;
        FOR y := 1 TO 45 DO BEGIN
            IF y IN [1, 25, 29, 35] THEN
                ExcelBuf.AddColumn(txtData[y], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Date)
            ELSE
                IF y IN [2, 9, 11 .. 21, 31] THEN
                    ExcelBuf.AddColumn(txtData[y], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number)
                ELSE
                    ExcelBuf.AddColumn(txtData[y], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        END;
    end;

    procedure CreateExcelbook();
    begin
        //ExcelBuf.CreateBookAndOpenExcel('C:\ExcelFile\GSTR1-B2B.xlsx','GSTR1-B2B','',COMPANYNAME,USERID);
        //ERROR('');
        ExcelBuf.CreateBookAndOpenExcel('', 'GSTR1-B2B', 'GSTR1-B2B', COMPANYNAME, USERID);
        //ERROR('');
    end;

    procedure InitializeRequest();
    var
        k: Integer;
    begin
        FOR k := 1 TO 42 DO BEGIN
            txtData[k] := '';
        END;
    end;

    local procedure SendMail(DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry");
    var
        Varrecipt: List of [Text];
    begin
        CurrTime := FORMAT(CURRENTDATETIME);
        CurrTime := DELCHR(CurrTime, '=', '/');
        CurrTime := DELCHR(CurrTime, '=', ' ');
        CurrTime := DELCHR(CurrTime, '=', 'PM');
        CurrTime := DELCHR(CurrTime, '=', 'AM');
        CurrTime := DELCHR(CurrTime, '=', ':');
        //SalesCrHeader.RESET;
        //SalesCrHeader.SETRANGE(SalesCrHeader."Document No.",DetailedGSTLedgerEntry."Document No.");
        //IF SalesCrHeader.FINDFIRST THEN;
        Varrecipt.Add('itmumbai@nglfinechem.com');

        SalseCrRep.SETTABLEVIEW(DetailedGSTLedgerEntry);
        SalseCrRep.USEREQUESTPAGE(FALSE);
        //SalseCrRep.SAVEASPDF('C:\'+FORMAT(CurrTime)+'.xl');
        SalseCrRep.SAVEASEXCEL('\\192.168.2.100\sales report\' + FORMAT(CurrTime) + '.xls');
        // SMTP.CreateMessage('NGL-Fine Chem', 'sandeep.m@pacificconsulting.in', Varrecipt, 'Sales Invoice Data', '', TRUE);
        // SMTP.AddAttachment('\\192.168.2.100\sales report\' + FORMAT(CurrTime) + '.xls', '');
        // SMTP.Send;
    end;
}

