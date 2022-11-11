report 50077 "Customer - Order Detail-NGL-2"
{
    // version NAVW17.10

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Customer - Order Detail-NGL-2.rdl';
    CaptionML = ENU = 'Customer - Order Detail',
                ENN = 'Customer - Order Detail';

    dataset
    {
        dataitem(Customer; Customer)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Search Name", Priority;
            column(ShipmentPeriodDate; STRSUBSTNO(Text000, PeriodText))
            {
            }
            column(CompanyName; COMPANYNAME)
            {
            }
            column(PrintAmountsInLCY; PrintAmountsInLCY)
            {
            }
            column(CustTableCapCustFilter; TABLECAPTION + ': ' + CustFilter)
            {
            }
            column(CustFilter; CustFilter)
            {
            }
            column(SalesOrderLineFilter; STRSUBSTNO(Text001, SalesLineFilter))
            {
            }
            column(SalesLineFilter; SalesLineFilter)
            {
            }
            column(No_Customer; "No.")
            {
                IncludeCaption = true;
            }
            column(Name_Customer; Name)
            {
            }
            column(PageGroupNo; PageGroupNo)
            {
            }
            column(CustOrderDetailCaption; CustOrderDetailCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(AllAmtAreInLCYCaption; AllAmtAreInLCYCaptionLbl)
            {
            }
            column(ShipmentDateCaption; ShipmentDateCaptionLbl)
            {
            }
            column(QtyOnBackOrderCaption; QtyOnBackOrderCaptionLbl)
            {
            }
            column(OutstandingOrdersCaption; OutstandingOrdersCaptionLbl)
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Bill-to Customer No." = FIELD("No."),
                               "Shortcut Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                               "Shortcut Dimension 2 Code" = FIELD("Global Dimension 2 Filter");
                DataItemTableView = SORTING("Document Type", "Bill-to Customer No.", "Currency Code")
                                    WHERE("Document Type" = CONST(Order),
                                          "Outstanding Quantity" = FILTER(<> 0));
                RequestFilterFields = "Shipment Date";
                RequestFilterHeadingML = ENU = 'Sales Order Line',
                                         ENN = 'Sales Order Line';
                column(SalesHeaderNo; SalesHeader."No.")
                {
                }
                column(SalesHeaderOrderDate; SalesHeader."Order Date")
                {
                }
                column(Location; SalesHeader."Location Code")
                {
                }
                column(Final_Destination; '') //SalesHeader."Final Destination") //PCPL-Deepak
                {
                }
                column(Description_SalesLine; Description)
                {
                    IncludeCaption = true;
                }
                column(No_SalesLine; "No.")
                {
                    IncludeCaption = true;
                }
                column(Type_SalesLine; Type)
                {
                    IncludeCaption = true;
                }
                column(ShipmentDate_SalesLine; FORMAT("Shipment Date"))
                {
                }
                column(shimpmentmonth; FORMAT("Sales Line"."Shipment Date", 10, '<Month Text,10>'))
                {
                }
                column(Quantity_SalesLine; Quantity)
                {
                    IncludeCaption = true;
                }
                column(OutStandingQty_SalesLine; "Outstanding Quantity")
                {
                    IncludeCaption = true;
                }
                column(BackOrderQty; BackOrderQty)
                {
                    DecimalPlaces = 0 : 5;
                }
                column(UnitPrice_SalesLine; "Unit Price")
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 2;
                    IncludeCaption = true;
                }
                column(LineDiscAmt_SalesLine; "Line Discount Amount")
                {
                    IncludeCaption = true;
                }
                column(InvDiscAmt_SalesLine; "Inv. Discount Amount")
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 2;
                    IncludeCaption = true;
                }
                column(SalesOrderAmount; SalesOrderAmount)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(SalesHeaderCurrCode; SalesHeader."Currency Code")
                {
                }
                column(BuyerRefNo; 0) //SalesHeader."Buyer Reference No.") //PCPL-Deepak
                {
                }
                column(PromisedDeliveryDate_SalesLine; FORMAT("Sales Line"."Promised Delivery Date"))
                {
                }
                column(MarkandContaingerNo_SalesLine; 0) //"Sales Line"."Mark and Containger No") //PCPL-Deepak
                {
                }
                column(IdentificationMark_SalesLine; '') //"Sales Line"."Identification Mark") //PCPL-Deepak
                {
                }

                trigger OnAfterGetRecord();
                begin
                    NewOrder := "Document No." <> SalesHeader."No.";
                    IF NewOrder THEN
                        SalesHeader.GET(1, "Document No.");
                    IF "Shipment Date" <= WORKDATE THEN
                        BackOrderQty := "Outstanding Quantity"
                    ELSE
                        BackOrderQty := 0;
                    Currency.InitRoundingPrecision;
                    IF "VAT Calculation Type" IN ["VAT Calculation Type"::"Normal VAT", "VAT Calculation Type"::"Reverse Charge VAT"] THEN
                        SalesOrderAmount :=
                          ROUND(
                            (Amount + "VAT Base Amount" * "VAT %" / 100) * "Outstanding Quantity" / Quantity / (1 + "VAT %" / 100),
                            Currency."Amount Rounding Precision")
                    ELSE
                        SalesOrderAmount :=
                          ROUND(
                            "Outstanding Amount" / (1 + "VAT %" / 100),
                            Currency."Amount Rounding Precision");
                    SalesOrderAmountLCY := SalesOrderAmount;
                    IF SalesHeader."Currency Code" <> '' THEN BEGIN
                        IF SalesHeader."Currency Factor" <> 0 THEN
                            SalesOrderAmountLCY :=
                              ROUND(
                                CurrExchRate.ExchangeAmtFCYToLCY(
                                  WORKDATE, SalesHeader."Currency Code",
                                  SalesOrderAmountLCY, SalesHeader."Currency Factor"));
                        IF PrintAmountsInLCY THEN BEGIN
                            "Unit Price" :=
                              ROUND(
                                CurrExchRate.ExchangeAmtFCYToLCY(
                                  WORKDATE, SalesHeader."Currency Code",
                                  "Unit Price", SalesHeader."Currency Factor"));
                            SalesOrderAmount := SalesOrderAmountLCY;
                        END;
                    END;
                    IF SalesHeader."Prices Including VAT" THEN BEGIN
                        "Unit Price" := "Unit Price" / (1 + "VAT %" / 100);
                        "Inv. Discount Amount" := "Inv. Discount Amount" / (1 + "VAT %" / 100);
                    END;
                    "Inv. Discount Amount" := "Inv. Discount Amount" * "Outstanding Quantity" / Quantity;
                    CurrencyCode2 := SalesHeader."Currency Code";
                    IF PrintAmountsInLCY THEN
                        CurrencyCode2 := '';
                    CurrencyTotalBuffer.UpdateTotal(
                      CurrencyCode2,
                      SalesOrderAmount,
                      Counter1,
                      Counter1);

                    IF PrintToExcel THEN
                        MakeExcelDataBody;
                end;

                trigger OnPreDataItem();
                begin
                    CurrReport.CREATETOTALS(SalesOrderAmountLCY, SalesOrderAmount);
                end;
            }
            dataitem(Integer; Integer)
            {
                DataItemTableView = SORTING(Number)
                                    WHERE(Number = FILTER(1 ..));
                column(TotalAmt_CurrTotalBuff; CurrencyTotalBuffer."Total Amount")
                {
                    AutoFormatExpression = CurrencyTotalBuffer."Currency Code";
                    AutoFormatType = 1;
                }
                column(CurrCode_CurrTotalBuff; CurrencyTotalBuffer."Currency Code")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    IF Number = 1 THEN
                        OK := CurrencyTotalBuffer.FIND('-')
                    ELSE
                        OK := CurrencyTotalBuffer.NEXT <> 0;
                    IF NOT OK THEN
                        CurrReport.BREAK;

                    CurrencyTotalBuffer2.UpdateTotal(
                      CurrencyTotalBuffer."Currency Code",
                      CurrencyTotalBuffer."Total Amount",
                      Counter1,
                      Counter1);
                end;

                trigger OnPostDataItem();
                begin
                    CurrencyTotalBuffer.DELETEALL;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                IF PrintOnlyOnePerPage THEN
                    PageGroupNo := PageGroupNo + 1;
            end;

            trigger OnPreDataItem();
            begin
                PageGroupNo := 1;
                CurrReport.NEWPAGEPERRECORD := PrintOnlyOnePerPage;
                CurrReport.CREATETOTALS(SalesOrderAmountLCY);
            end;
        }
        dataitem(Integer2; Integer)
        {
            DataItemTableView = SORTING(Number)
                                WHERE(Number = FILTER(1 ..));
            column(TotalAmt_CurrTotalBuff2; CurrencyTotalBuffer2."Total Amount")
            {
                AutoFormatExpression = CurrencyTotalBuffer2."Currency Code";
                AutoFormatType = 1;
            }
            column(CurrCode_CurrTotalBuff2; CurrencyTotalBuffer2."Currency Code")
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }

            trigger OnAfterGetRecord();
            begin
                IF Number = 1 THEN
                    OK := CurrencyTotalBuffer2.FIND('-')
                ELSE
                    OK := CurrencyTotalBuffer2.NEXT <> 0;
                IF NOT OK THEN
                    CurrReport.BREAK;
            end;

            trigger OnPostDataItem();
            begin
                CurrencyTotalBuffer2.DELETEALL;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    CaptionML = ENU = 'Options',
                                ENN = 'Options';
                    field(ShowAmountsInLCY; PrintAmountsInLCY)
                    {
                        CaptionML = ENU = 'Show Amounts in LCY',
                                    ENN = 'Show Amounts in LCY';
                    }
                    field(NewPagePerCustomer; PrintOnlyOnePerPage)
                    {
                        CaptionML = ENU = 'New Page per Customer',
                                    ENN = 'New Page per Customer';
                    }
                    field(PrintToExcel; PrintToExcel)
                    {
                        CaptionML = ENU = 'Print to Excel',
                                    ENN = 'Print to Excel';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage();
        begin
            PrintToExcel := FALSE;
        end;
    }

    labels
    {
        label(OrderNoCaption; ENU = 'Order No.',
                             ENN = 'Order No.')
    }

    trigger OnPostReport();
    begin
        IF PrintToExcel THEN
            CreateExcelbook;
    end;

    trigger OnPreReport();
    begin
        CustFilter := Customer.GETFILTERS;
        SalesLineFilter := "Sales Line".GETFILTERS;
        PeriodText := "Sales Line".GETFILTER("Shipment Date");
        IF PrintToExcel THEN
            MakeExcelInfo;
    end;

    var
        Text000: TextConst ENU = 'Shipment Date: %1', ENN = 'Shipment Date: %1';
        Text001: TextConst ENU = 'Sales Order Line: %1', ENN = 'Sales Order Line: %1';
        CurrExchRate: Record "Currency Exchange Rate";
        CurrencyTotalBuffer: Record "Currency Total Buffer" temporary;
        CurrencyTotalBuffer2: Record "Currency Total Buffer" temporary;
        SalesHeader: Record "Sales Header";
        ExcelBuf: Record "Excel Buffer" temporary;
        Currency: Record Currency;
        CustFilter: Text;
        SalesLineFilter: Text;
        SalesOrderAmount: Decimal;
        SalesOrderAmountLCY: Decimal;
        PrintAmountsInLCY: Boolean;
        PeriodText: Text[30];
        PrintOnlyOnePerPage: Boolean;
        BackOrderQty: Decimal;
        NewOrder: Boolean;
        OK: Boolean;
        Counter1: Integer;
        CurrencyCode2: Code[10];
        PrintToExcel: Boolean;
        Text002: TextConst ENU = 'Data', ENN = 'Data';
        Text003: TextConst ENU = 'Customer - Order Detail', ENN = 'Customer - Order Detail';
        Text004: TextConst ENU = 'Company Name', ENN = 'Company Name';
        Text005: TextConst ENU = 'Report No.', ENN = 'Report No.';
        Text006: TextConst ENU = 'Report Name', ENN = 'Report Name';
        Text007: TextConst ENU = 'User ID', ENN = 'User ID';
        Text008: TextConst ENU = 'Date', ENN = 'Date';
        Text009: TextConst ENU = 'Customer Filters', ENN = 'Customer Filters';
        Text010: TextConst ENU = 'Sales Order Lines Filters', ENN = 'Sales Order Lines Filters';
        Text011: TextConst ENU = 'Quantity on Back Order', ENN = 'Quantity on Back Order';
        Text012: TextConst ENU = 'Outstanding Orders', ENN = 'Outstanding Orders';
        Text013: TextConst ENU = 'All amounts are in LCY', ENN = 'All amounts are in LCY';
        Text014: TextConst ENU = ' ,G/L Account,Item,Resource,Fixed Asset,Charge (Item)', ENN = ' ,G/L Account,Item,Resource,Fixed Asset,Charge (Item)';
        Text015: TextConst ENU = 'Item', ENN = 'Item';
        Text016: TextConst ENU = 'Order', ENN = 'Order';
        PageGroupNo: Integer;
        CustOrderDetailCaptionLbl: TextConst ENU = 'Customer - Order Detail', ENN = 'Customer - Order Detail';
        PageCaptionLbl: TextConst ENU = 'Page', ENN = 'Page';
        AllAmtAreInLCYCaptionLbl: TextConst ENU = 'All amounts are in LCY', ENN = 'All amounts are in LCY';
        ShipmentDateCaptionLbl: TextConst ENU = 'Shipment Date', ENN = 'Shipment Date';
        QtyOnBackOrderCaptionLbl: TextConst ENU = 'Quantity on Back Order', ENN = 'Quantity on Back Order';
        OutstandingOrdersCaptionLbl: TextConst ENU = 'Outstanding Orders', ENN = 'Outstanding Orders';
        TotalCaptionLbl: TextConst ENU = 'Total', ENN = 'Total';

    procedure MakeExcelInfo();
    begin
        ExcelBuf.SetUseInfoSheet;
        ExcelBuf.AddInfoColumn(FORMAT(Text004), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(COMPANYNAME, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text006), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(FORMAT(Text003), FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text005), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(REPORT::"Customer - Order Detail", FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text007), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(USERID, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text008), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(TODAY, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Date);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text009), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn(Customer.GETFILTERS, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.NewRow;
        ExcelBuf.AddInfoColumn(FORMAT(Text010), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddInfoColumn("Sales Line".GETFILTERS, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        IF PrintAmountsInLCY THEN BEGIN
            ExcelBuf.NewRow;
            ExcelBuf.AddInfoColumn(FORMAT(Text013), FALSE, TRUE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
            ExcelBuf.AddInfoColumn(PrintAmountsInLCY, FALSE, FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        END;
        ExcelBuf.ClearNewRow;
        MakeExcelDataHeader;
    end;

    local procedure MakeExcelDataHeader();
    begin
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Customer.FIELDCAPTION("No."), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Customer.FIELDCAPTION(Name), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(
          FORMAT(Text016 + '  ' + SalesHeader.FIELDCAPTION("No.")), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(SalesHeader.FIELDCAPTION("Order Date"), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Line".FIELDCAPTION("Shipment Date"), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        //PCPL-0041-START-17012020
        ExcelBuf.AddColumn("Sales Line".FIELDCAPTION("Promised Delivery Date"), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Remarks From HO', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn('Remarks From Factory', FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        //PCPL-0041-END-17012020
        ExcelBuf.AddColumn("Sales Line".FIELDCAPTION(Type), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(
          FORMAT(Text015 + ' ' + "Sales Line".FIELDCAPTION("No.")), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Line".FIELDCAPTION(Description), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Line".FIELDCAPTION(Quantity), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Line".FIELDCAPTION("Outstanding Quantity"), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text011), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Line".FIELDCAPTION("Unit Price"), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Line".FIELDCAPTION("Line Discount Amount"), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Line".FIELDCAPTION("Inv. Discount Amount"), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(FORMAT(Text012), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
        IF NOT PrintAmountsInLCY THEN
            ExcelBuf.AddColumn(SalesHeader.FIELDCAPTION("Currency Code"), FALSE, '', TRUE, FALSE, TRUE, '', ExcelBuf."Cell Type"::Text);
    end;

    procedure MakeExcelDataBody();
    begin
        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Customer."No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(Customer.Name, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(SalesHeader."No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(SalesHeader."Order Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Date);
        ExcelBuf.AddColumn("Sales Line"."Shipment Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Date);
        //PCPL-0041-START-17012020
        ExcelBuf.AddColumn("Sales Line"."Promised Delivery Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Date);
        ExcelBuf.AddColumn("Sales Line"."Mark and Containger No", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn(''/*"Sales Line"."Identification Mark"*/, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text); //PCPL/NSW/MIG 09Aug22
        //PCPL-0041-END-17012020
        ExcelBuf.AddColumn(FORMAT(SELECTSTR("Sales Line".Type + 1, Text014)), FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Line"."No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Line".Description, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
        ExcelBuf.AddColumn("Sales Line".Quantity, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn("Sales Line"."Outstanding Quantity", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(BackOrderQty, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn("Sales Line"."Unit Price", FALSE, '', FALSE, FALSE, FALSE, '#,##0.00', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn("Sales Line"."Line Discount Amount", FALSE, '', FALSE, FALSE, FALSE, '#,##0.00', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn("Sales Line"."Inv. Discount Amount", FALSE, '', FALSE, FALSE, FALSE, '#,##0.00', ExcelBuf."Cell Type"::Number);
        ExcelBuf.AddColumn(SalesOrderAmount, FALSE, '', FALSE, FALSE, FALSE, '#,##0.00', ExcelBuf."Cell Type"::Number);
        IF NOT PrintAmountsInLCY THEN
            ExcelBuf.AddColumn(SalesHeader."Currency Code", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuf."Cell Type"::Text);
    end;

    procedure CreateExcelbook();
    begin
        ExcelBuf.CreateBookAndOpenExcel('', Text002, Text003, COMPANYNAME, USERID);
        ERROR('');
    end;

    procedure InitializeRequest(ShowAmountInLCY: Boolean; NewPagePerCustomer: Boolean; SetPrintToExcel: Boolean);
    begin
        PrintAmountsInLCY := ShowAmountInLCY;
        PrintOnlyOnePerPage := NewPagePerCustomer;
        PrintToExcel := SetPrintToExcel;
    end;
}

