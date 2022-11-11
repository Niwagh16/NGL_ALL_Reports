report 50064 "Posted Sales Invoice Report"
{
    // version PCPL-NS

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Posted Sales Invoice Report.rdl';

    dataset
    {
        dataitem(Copyloop; Integer)
        {
            DataItemTableView = SORTING(Number)
                                ORDER(Ascending);
            column(OutputNo; OutputNo)
            {
            }
            column(ReType; ReType)
            {
            }
            dataitem("Sales Invoice Header"; "Sales Invoice Header")
            {
                DataItemTableView = SORTING("No.")
                                    ORDER(Ascending);
                RequestFilterFields = "No.";
                column(SelltoCustomerNo_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Customer No.")
                {
                }
                column(No_SalesInvoiceHeader; "Sales Invoice Header"."No.")
                {
                }
                column(PostingDate_SalesInvoiceHeader; "Sales Invoice Header"."Posting Date")
                {
                }
                column(BillofLadingDate; '')//PostexportInvoice."Bill of Lading Date") //PCPL/NSW/MIG 09Aug22
                {
                }
                column(CurrencyCode_SalesInvoiceHeader; "Sales Invoice Header"."Currency Code")
                {
                }
                column(PaymentTermsCode_SalesInvoiceHeader; PaymeTerms.Description)
                {
                }
                column(SelltoCustomerName_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Customer Name")
                {
                }
                column(SelltoCustomerName2_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Customer Name 2")
                {
                }
                column(SelltoAddress_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Address")
                {
                }
                column(SelltoAddress2_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Address 2")
                {
                }
                column(SelltoCity_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to City")
                {
                }
                column(SelltoContact_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Contact")
                {
                }
                column(State_SalesInvoiceHeader; "Sales Invoice Header".State)
                {
                }
                column(SelltoPostCode_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Post Code")
                {
                }
                column(SelltoCounty_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to County")
                {
                }
                column(SelltoCountryRegionCode_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Country/Region Code")
                {
                }
                column(Name_CountryName; CountryRegion.Name)
                {
                }
                column(Bank_Name; BankAcc.Name)
                {
                }
                column(BankAddress; BankAcc.Address + BankAcc."Address 2")
                {
                }
                column(BankCity_Postcode; BankAcc.City + ' ' + BankAcc."Post Code")
                {
                }
                column(txtAmtInWords; txtAmtInWords[1] + '  ' + txtAmtInWords[2])
                {
                }
                column(ExportInvoice_billofLanding; '')//PostexportInvoice."Bill of Lading No.") //PCPL/NSW/MIG 09Aug22
                {
                }
                column(ExportInvoice_billofLandingdate; '')//PostexportInvoice."Bill of Lading Date") //PCPL/NSW/MIG 09Aug22
                {
                }
                column(Invoice_No; SalesHeader."No.")
                {
                }
                column(BalAccountNo_SalesInvoiceHeader; "Sales Invoice Header"."Bal. Account No.")
                {
                }
                column(VesselFlightNo_SalesInvoiceHeader; '')//"Sales Invoice Header"."Vessel/Flight No.") //PCPL/NSW/MIG 09Aug22
                {
                }
                column(LineAmountTotal; LineAmountTotal)
                {
                }
                column(Comment; headerComment)
                {
                }
                column(Packingdetails; Packingdetails)
                {
                }
                dataitem("Sales Invoice Line"; "Sales Invoice Line")
                {
                    DataItemLink = "Document No." = FIELD("No.");
                    DataItemTableView = SORTING("Document No.", "Line No.")
                                        ORDER(Ascending);
                    column(DocumentNo_SalesInvoiceLine; "Sales Invoice Line"."Document No.")
                    {
                    }
                    column(LineNo_SalesInvoiceLine; "Sales Invoice Line"."Line No.")
                    {
                    }
                    column(Type_SalesInvoiceLine; "Sales Invoice Line".Type)
                    {
                    }
                    column(No_SalesInvoiceLine; "Sales Invoice Line"."No.")
                    {
                    }
                    column(LocationCode_SalesInvoiceLine; "Sales Invoice Line"."Location Code")
                    {
                    }
                    column(PostingGroup_SalesInvoiceLine; "Sales Invoice Line"."Posting Group")
                    {
                    }
                    column(ShipmentDate_SalesInvoiceLine; "Sales Invoice Line"."Shipment Date")
                    {
                    }
                    column(Description_SalesInvoiceLine; "Sales Invoice Line".Description)
                    {
                    }
                    column(Description2_SalesInvoiceLine; "Sales Invoice Line"."Description 2")
                    {
                    }
                    column(UnitofMeasure_SalesInvoiceLine; "Sales Invoice Line"."Unit of Measure")
                    {
                    }
                    column(AmounttoCustomer_SalesInvoiceHeader; "Sales Invoice Line"."Line Amount")
                    {
                    }
                }

                trigger OnAfterGetRecord();
                begin
                    CLEAR(txtAmtInWords);
                    CLEAR(LineAmountTotal);
                    //IF BankAcc.GET("Sales Invoice Header"."Bank Account") THEN;
                    //PostexportInvoice.RESET;
                    //PostexportInvoice.SETRANGE("Invoice No.", "No.");
                    //IF PostexportInvoice.FINDFIRST THEN;
                    //PCPL/BRB
                    IF Shiptoadd.GET("Sell-to Customer No.", "Ship-to Code") THEN
                        IF CountryRegion.GET(Shiptoadd."Country/Region Code") THEN
                            ShipCountryName := CountryRegion.Name;
                    IF Customer.GET("Sell-to Customer No.") THEN
                        IF CountryRegion.GET(Customer."Country/Region Code") THEN
                            //
                            IF PaymeTerms.GET("Sales Invoice Header"."Payment Terms Code") THEN;
                    SalesInvLine.RESET;
                    SalesInvLine.SETRANGE("Document No.", "No.");
                    SalesInvLine.SETFILTER(Quantity, '<>%1', 0);
                    IF SalesInvLine.FINDSET THEN
                        REPEAT
                            LineAmountTotal += SalesInvLine."Line Amount";
                        UNTIL SalesInvLine.NEXT = 0;
                    recCheck.InitTextVariable;
                    recCheck.FormatNoText(txtAmtInWords, ROUND(LineAmountTotal), "Sales Invoice Header"."Currency Code");
                end;
            }

            trigger OnAfterGetRecord();
            begin
                ReType := '';
                IF Number = 1 THEN
                    ReType := 'First';
                IF Number = 2 THEN
                    ReType := 'Second';
                OutputNo += 1;
            end;

            trigger OnPreDataItem();
            begin
                SETRANGE(Number, 1, 2);
                OutputNo := 1;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(Comment; headerComment)
                {
                }
                field("Packing Details"; Packingdetails)
                {
                }
                field("Bank Account"; BankDetails)
                {
                    DrillDownPageID = "Bank Account List";
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
        Exchange_Caption = 'Exchange'; No_Caption = 'No.'; For_Caption = 'For'; Date_Caption = 'Date'; Oftjis_Caption = 'of this'; billofExchange_Caption = 'Bill of Exchange'; payof_Caption = 'pay to the order of'; thesumof_Caption = 'the sum of'; valuereceive_Caption = 'value received and place the same to the account of'; packagesshipped_Caption = 'package shipped by S.S./Air'; Invoiceno_Caption = 'Invoice No.'; dt_caption = 'Dt.'; billair_Caption = 'B/L / Air Bill No.'; To_Caption = 'To,';
    }

    var
        SalesHeader: Record "Sales Header";
        recCheck: Report 1401;
        //PostexportInvoice: Record "Posted Export Payment Terms";
        txtAmtInWords: array[8] of Text;
        BankAcc: Record "Bank Account";
        Comment: Text[100];
        Packingdetails: Text[30];
        headerComment: Text[100];
        Numbersjh: Integer;
        OutputNo: Integer;
        ReType: Text;
        BankDetails: Code[20];
        Shiptoadd: Record "Ship-to Address";
        CountryRegion: Record "Country/Region";
        ShipCountryName: Text;
        Customer: Record Customer;
        PaymeTerms: Record "Payment Terms";
        SalesInvLine: Record "Sales Invoice Line";
        LineAmountTotal: Decimal;
}

