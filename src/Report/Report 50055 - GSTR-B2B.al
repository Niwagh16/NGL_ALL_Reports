report 50055 "GSTR-B2B"
{
    // version ysr140817_1620,PCPL-NS

    ProcessingOnly = true;

    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = SORTING("Document No.", "Document Line No.", "GST Component Code")
                                WHERE("Document Type" = CONST(Invoice),
                                      "Entry Type" = CONST("Initial Entry"),
                                      // "Nature of Supply" = CONST(B2B), //PCPL/NSW/MIG 05Aug22
                                      "GST Component Code" = FILTER(<> 'SGST'));
            RequestFilterFields = "Posting Date", "Source No.";

            trigger OnAfterGetRecord();
            begin
                InitializeRequest;
                IF recSalesInvhrd.GET("Detailed GST Ledger Entry"."Document No.") THEN;
                txtData[1] := "Buyer/Seller Reg. No.";
                IF NoBuyer <> "Buyer/Seller Reg. No." THEN BEGIN
                    NoOfRecipient := NoOfRecipient + 1;
                    NoBuyer := "Buyer/Seller Reg. No.";
                END;

                IF (GETFILTER("Transaction Type") = 'Sales') THEN BEGIN
                    IF "Document Type" = "Document Type"::Invoice THEN
                        txtData[2] := "Document No.";
                END ELSE
                    txtData[2] := "External Document No.";
                txtData[3] := FORMAT("Posting Date");
                //txtData[4] := FORMAT("Amount to Customer/Vendor");

                dectttlGSTAmt := 0;
                DetailedGSTLedgerEntry.RESET;
                DetailedGSTLedgerEntry.SETCURRENTKEY("Transaction Type", "Document Type", "Document No.", "Document Line No.");
                DetailedGSTLedgerEntry.SETRANGE("Transaction Type", "Transaction Type");
                DetailedGSTLedgerEntry.SETRANGE("Document Line No.", "Document Line No.");
                DetailedGSTLedgerEntry.SETRANGE("Document No.", "Document No.");
                IF DetailedGSTLedgerEntry.FINDSET THEN
                    REPEAT
                        //message(format(DetailedGSTLedgerEntry."GST Amount"));
                        dectttlGSTAmt += DetailedGSTLedgerEntry."GST Amount";
                    UNTIL DetailedGSTLedgerEntry.NEXT = 0;

                TotalAmount += ABS(dectttlGSTAmt);//ABS("GST Base Amount" + dectttlGSTAmt);
                txtData[4] := FORMAT(ABS("GST Base Amount" + dectttlGSTAmt));


                CASE "GST Place of Supply" OF
                    1:
                        BEGIN
                            IF recCustomer.GET("Source No.") THEN BEGIN
                                IF recState.GET(recCustomer."State Code") THEN;
                                txtData[5] := recState."State Code (GST Reg. No.)" + '-' + recState.Description;
                            END;
                            IF RecLocation.GET("Source No.") THEN BEGIN
                                IF recState.GET(RecLocation."State Code") THEN;
                                txtData[5] := recState."State Code (GST Reg. No.)" + '-' + recState.Description;
                            END;
                        END;
                    2:
                        BEGIN
                            recSalesInvhrd.GET("No.");
                            recShipToAdd.RESET;
                            recShipToAdd.SETRANGE(recShipToAdd."Customer No.", "Source No.");
                            recShipToAdd.SETRANGE(recShipToAdd.Code, recSalesInvhrd."Ship-to Code");
                            IF recShipToAdd.FINDFIRST THEN;
                            IF recState.GET(recShipToAdd.State) THEN;
                            txtData[5] := recState."State Code (GST Reg. No.)" + '-' + recState.Description;
                            IF RecLocation.GET("Source No.") THEN BEGIN
                                IF recState.GET(RecLocation."State Code") THEN;
                                txtData[5] := recState."State Code (GST Reg. No.)" + '-' + recState.Description;
                            END;

                        END;
                END;

                IF "Reverse Charge" THEN
                    txtData[6] := 'Y'
                ELSE
                    txtData[6] := 'N';

                txtData[7] := '';//FORMAT("Invoice Type"); //PCPL/NSW/MIG 05Aug22
                txtData[8] := '';// "e-Comm. Merchant Id"; //PCPL/NSW/MIG 05Aug22
                IF "Detailed GST Ledger Entry"."GST Jurisdiction Type" = "Detailed GST Ledger Entry"."GST Jurisdiction Type"::Intrastate THEN
                    txtData[9] := FORMAT("GST %" + "GST %")
                ELSE
                    txtData[9] := FORMAT("GST %");
                txtData[10] := FORMAT(ABS("GST Base Amount"));
                txtData[11] := '';//Cess Amt
                txtData[12] := '';//recSalesInvhrd.Port; //PCPL/NSW/MIG 05Aug22
                //txtData[13] := recSalesInvhrd."Shipping Bill No.";
                txtData[14] := FORMAT(recSalesInvhrd."Shipment Date");



                IF PrintToExcel THEN
                    MakeExcelDataBody;
                NoOfRecords := NoOfRecords + 1;
            end;

            trigger OnPostDataItem();
            begin
                ExcelBuf.NewRow;
                ExcelBuf.AddColumn('No. of Recipients', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn('No. of Invoices', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn('', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.AddColumn('Total Invoice Value', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
                ExcelBuf.NewRow;
                ExcelBuf.AddColumn(NoOfRecipient, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
                ExcelBuf.AddColumn(NoOfRecords, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
                ExcelBuf.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
                ExcelBuf.AddColumn(TotalAmount, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
            end;

            trigger OnPreDataItem();
            begin
                //IF "Transaction Type" = GETFILTER("Transaction Type"::Sales) THEN
                NoOfRecords := 0;
                NoOfRecipient := 1;
                TotalAmount := 0;
                IF (GETFILTER("Transaction Type") = 'Sales') THEN
                    "Detailed GST Ledger Entry".SETRANGE("Transaction Type", "Transaction Type"::Sales)
                ELSE
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
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport();
    begin

        PrintToExcel := TRUE
    end;

    trigger OnPostReport();
    begin
        IF PrintToExcel THEN
            CreateExcelbook;
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
        recVend: Record Vendor;
        RecLocation: Record Location;
        NoOfRecords: Integer;
        NoOfRecipient: Integer;
        NoBuyer: Text;
        TotalAmount: Decimal;
        DetailedGSTLedgerEntry: Record "Detailed GST Ledger Entry";
        dectttlGSTAmt: Decimal;

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
        ExcelBuf.AddColumn('GSTIN/UIN of Recipient', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Invoice Number', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Invoice Date', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Invoice Value', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Place Of Supply', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Reverse Charge', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Invoice Type', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('E-Commerce GSTIN', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Rate', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Taxable Value', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Cess Amount', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Port Code', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        //ExcelBuf.AddColumn('Shipping Bill Number',FALSE,'',TRUE,FALSE,TRUE,'',ExcelBuf."Cell Type"::Text);   //PCPLGST
        ExcelBuf.AddColumn('Shipping Bill Date', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
    end;

    procedure MakeExcelDataBody();
    var
        y: Integer;
    begin
        ExcelBuf.NewRow;
        FOR y := 1 TO 14 DO BEGIN
            IF y IN [3] THEN
                ExcelBuf.AddColumn(txtData[y], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Date)
            ELSE
                IF y IN [4, 9 .. 11] THEN
                    ExcelBuf.AddColumn(txtData[y], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number)
                ELSE
                    ExcelBuf.AddColumn(txtData[y], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        END;
    end;

    procedure CreateExcelbook();
    begin
        ExcelBuf.CreateBookAndOpenExcel('', 'GSTR1-B2B', 'GSTR1-B2B', COMPANYNAME, USERID);
        ERROR('');
    end;

    procedure InitializeRequest();
    var
        k: Integer;
    begin
        FOR k := 1 TO 40 DO BEGIN
            txtData[k] := '';
        END;
    end;
}

