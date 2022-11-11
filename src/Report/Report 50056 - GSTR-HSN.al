report 50056 "GSTR-HSN"
{
    // version ysr140817_1620

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\GSTR-HSN.rdl';

    dataset
    {
        dataitem("Detailed GST Ledger Entry"; "Detailed GST Ledger Entry")
        {
            DataItemTableView = SORTING("HSN/SAC Code")
                                ORDER(Ascending)
                                WHERE("Document Type" = CONST(Invoice),
                                      "Entry Type" = CONST("Initial Entry"));
            //  "Nature of Supply" = CONST(B2B)); //PCPL/NSW/MIG 05Aug22
            RequestFilterFields = "Posting Date", "Source No.";
            column(HSN; txtData[1])
            {
            }
            column(Description; txtData[2])
            {
            }
            column(UQC; txtData[3])
            {
            }
            column(Total_Quantity; decData[1])
            {
            }
            column(Total_Value; decData[2])
            {
            }
            column(Taxable_Value; decData[3])
            {
            }
            column(Integrated_Tax_Amount; decData[4])
            {
            }
            column(Central_Tax_Amount; decData[5])
            {
            }
            column(State_UT_Tax_Amount; decData[6])
            {
            }
            column(Cess_Amount; decData[7])
            {
            }
            column(NoRecords; NoRecords)
            {
            }

            trigger OnAfterGetRecord();
            begin
                InitializeRequest;

                txtData[1] := "HSN/SAC Code";

                IF recItem.GET("No.") THEN
                    txtData[2] := recItem.Description
                ELSE
                    IF recGLAcc.GET("No.") THEN
                        txtData[2] := recItem.Description;

                txtData[3] := recItem."Base Unit of Measure"; //UCQ

                decData[1] := Quantity;
                decData[2] := 0;//"Amount to Customer/Vendor"; //PCPL/NSW/MIG 05Aug22
                decData[3] := "GST Base Amount";
                IF "GST Component Code" = 'IGST' THEN
                    decData[4] := "GST Amount"
                ELSE
                    IF "GST Component Code" = 'CGST' THEN
                        decData[5] := "GST Amount"
                    ELSE
                        IF "GST Component Code" = 'SGST' THEN
                            decData[6] := "GST Amount";

                IF "HSN/SAC Code" <> HSNo THEN BEGIN
                    HSNo := "HSN/SAC Code";
                    NoRecords := NoRecords + 1;
                END;
                decData[7] := 0;//Cess AMT

                IF PrintToExcel THEN
                    MakeExcelDataBody;
            end;

            trigger OnPreDataItem();
            begin
                NoRecords := 0;
                CLEAR(HSNo);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

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
        decData: array[255] of Decimal;
        PrintToExcel: Boolean;
        recCompanyInfo: Record "Company Information";
        recCustomer: Record Customer;
        recState: Record State;
        recShipToAdd: Record "Ship-to Address";
        recSalesInvhrd: Record "Sales Invoice Header";
        recVend: Record Vendor;
        recItem: Record Item;
        recGLAcc: Record "G/L Account";
        HSNo: Code[20];
        NoRecords: Integer;

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
    end;

    procedure MakeExcelDataBody();
    var
        y: Integer;
    begin
        ExcelBuf.NewRow;
        FOR y := 1 TO 25 DO BEGIN
            /*  IF y  IN  [5,7] THEN
                ExcelBuf.AddColumn(txtData[y],FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Date)
              ELSE IF y  IN  [8,11,13..18]  THEN
                ExcelBuf.AddColumn(txtData[y],FALSE,'',FALSE,FALSE,FALSE,'',ExcelBuf."Cell Type"::Number)
              ELSE
            */
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

