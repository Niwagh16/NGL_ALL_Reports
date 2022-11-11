report 50062 "Quarterly Declaration Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Quarterly Declaration Report.rdl';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            // DataItemTableView = WHERE("Export Document" = CONST(true)); //PCPL/NSW/MIG 09Aug22
            column(BilltoName_SalesInvoiceHeader; "Sales Invoice Header"."Bill-to Name")
            {
            }
            column(BilltoName2_SalesInvoiceHeader; "Sales Invoice Header"."Bill-to Name 2")
            {
            }
            column(BilltoAddress_SalesInvoiceHeader; "Sales Invoice Header"."Bill-to Address")
            {
            }
            column(No_SalesInvoiceHeader; "Sales Invoice Header"."No.")
            {
            }
            column(PostingDate_SalesInvoiceHeader; "Sales Invoice Header"."Posting Date")
            {
            }
            column(ShipmentDate_SalesInvoiceHeader; "Sales Invoice Header"."Shipment Date")
            {
            }
            column(Compname; CompanyInformation.Name)
            {
            }
            column(srno; srno)
            {
            }
            column(PdateC; PdateC)
            {
            }
            column(yearInt; yearInt)
            {
            }
            column(StartDate; StartDate)
            {
            }
            column(EndDate; EndDate)
            {
            }
            column(SippNo; SippNo)
            {
            }
            column(SellCity; "Sales Invoice Header"."Sell-to City")
            {
            }
            column(AMT; AMT)
            {
            }
            column(CalcDay; CalcDay)
            {
            }
            column(DueDate_SalesInvoiceHeader; "Sales Invoice Header"."Due Date")
            {
            }
            column(AppliedDate; AppliedDate)
            {
            }
            column(Totalamt; Totalamt)
            {
            }
            column(PayTermCode; PayTermCode)
            {
            }
            column(Rem; Rem)
            {
            }
            column(contrname; contrname)
            {
            }
            column(policyno; '')//CompanyInformation."RBI CODE") //PCPL/NSW/MIG 09Aug22
            {
            }

            trigger OnAfterGetRecord();
            begin
                srno += 1;
                yearInt := DATE2DMY(StartDate, 3);
                monthInt := DATE2DMY(StartDate, 2);
                monthIntTo := DATE2DMY(EndDate, 2);

                CLEAR(SippNo);
                CLEAR(AMT);
                //PCPL/NSW/MIG 09Aug22
                // ExportPayTerms.RESET;
                // ExportPayTerms.SETRANGE(ExportPayTerms."Invoice No.", "Sales Invoice Header"."No.");
                // IF ExportPayTerms.FINDFIRST THEN BEGIN
                //     SippNo := ExportPayTerms."Bill of Exchange No.";
                //     CalcDay := ExportPayTerms."Calculation Period"
                // END;

                CLEAR(AppliedDate);
                CLEAR(AppDate1);
                CLEAR(Totalamt);
                CLEAR(AMT);
                CustLedgerEntry.RESET;
                CustLedgerEntry.SETRANGE(CustLedgerEntry."Document No.", "Sales Invoice Header"."No.");
                IF CustLedgerEntry.FINDFIRST THEN BEGIN
                    CustLedgerEntry.CALCFIELDS(CustLedgerEntry."Original Amt. (LCY)");
                    AMT += CustLedgerEntry."Original Amt. (LCY)";

                    /*IF  Totalamt = 0 THEN BEGIN
                      Rem := 'NA';
                    END;
                    IF (Totalamt <> 0)  AND (CustLedgerEntry."Due Date" < EndDate) THEN BEGIN
                      Rem := 'CUSTOMER WILL ARRANGE';
                    END;
                    IF CustLedgerEntry."Due Date" > EndDate THEN BEGIN
                      Rem := 'NOT DUE';
                    END;*/
                END;

                CustLedgerEntry.RESET;
                CustLedgerEntry.SETRANGE(CustLedgerEntry."Document No.", "Sales Invoice Header"."No.");
                IF CustLedgerEntry.FINDFIRST THEN BEGIN
                    CustLedgerEntry.CALCFIELDS(CustLedgerEntry."Original Amt. (LCY)");
                    CustLedgerEntry.CALCFIELDS(CustLedgerEntry."Remaining Amount");
                    IF CustLedgerEntry."Closed by Entry No." = 0 THEN BEGIN
                        AppliedCustomerEntry.RESET;
                        AppliedCustomerEntry.SETRANGE(AppliedCustomerEntry."Closed by Entry No.", CustLedgerEntry."Entry No.");
                        IF AppliedCustomerEntry.FINDFIRST THEN BEGIN
                            AppDate1 := AppliedCustomerEntry."Posting Date";
                            IF AppliedCustomerEntry."Posting Date" < EndDate THEN
                                AppliedDate := AppliedCustomerEntry."Posting Date";
                        END;
                    END
                    ELSE BEGIN
                        AppliedCustomerEntry.RESET;
                        AppliedCustomerEntry.SETRANGE(AppliedCustomerEntry."Entry No.", CustLedgerEntry."Closed by Entry No.");
                        IF AppliedCustomerEntry.FINDFIRST THEN BEGIN
                            AppDate1 := AppliedCustomerEntry."Posting Date";
                            IF AppliedCustomerEntry."Posting Date" < EndDate THEN
                                AppliedDate := AppliedCustomerEntry."Posting Date";
                        END;
                    END;
                    IF (CustLedgerEntry."Remaining Amount" <> 0) OR (AppDate1 > EndDate) THEN
                        Totalamt := CustLedgerEntry."Original Amt. (LCY)";
                    IF Totalamt = 0 THEN BEGIN
                        Rem := 'NA';
                    END;
                    IF (Totalamt <> 0) AND (CustLedgerEntry."Due Date" < EndDate) THEN BEGIN
                        Rem := 'CUSTOMER WILL ARRANGE';
                    END;
                    IF CustLedgerEntry."Due Date" > EndDate THEN BEGIN
                        Rem := 'NOT DUE';
                    END;
                END;

                CLEAR(PayTermCode);
                SalesHeader.RESET;
                SalesHeader.SETRANGE(SalesHeader."No.", "Sales Invoice Header"."No.");
                IF SalesHeader.FINDFIRST THEN BEGIN
                    PayTermCode := SalesHeader."Payment Terms Code";
                END;

                CountryRegion.RESET;
                //  CountryRegion.SETRANGE(CountryRegion.Code, "Sales Invoice Header"."Country of Final Destination"); //PCPL/NSW/MIG 09Aug22
                IF CountryRegion.FINDFIRST THEN BEGIN
                    contrname := CountryRegion.Name;
                END;

            end;

            trigger OnPreDataItem();
            begin
                "Sales Invoice Header".SETRANGE("Sales Invoice Header"."Posting Date", StartDate, EndDate);
                srno := 0;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(contro001)
                {
                }
                field("Start Date"; StartDate)
                {

                    trigger OnValidate();
                    begin
                        PdateC := FORMAT(StartDate, 0, '<Month,2> <Year,2>');
                    end;
                }
                field("End Date"; EndDate)
                {
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
        CompanyInformation.GET;
    end;

    var
        srno: Integer;
        EndDate: Date;
        StartDate: Date;
        SalesInvoiceHeader: Record "Sales Invoice Header";
        CompanyInformation: Record "Company Information";
        PDate: Date;
        PdateC: Text;
        yearInt: Integer;
        monthText: Text;
        monthInt: Integer;
        monthIntTo: Integer;
        //ExportPayTerms: Record "Posted Export Payment Terms"; //PCPL/NSW/MIG 09Aug22
        SippNo: Code[30];
        SalesInvoiceLine: Record "Sales Invoice Line";
        AMT: Decimal;
        PaymentTerms: Record "Payment Terms";
        CalcDay: DateFormula;
        CustLedgerEntry: Record "Cust. Ledger Entry";
        AppliedCustomerEntry: Record "Cust. Ledger Entry";
        AppliedDate: Date;
        Totalamt: Decimal;
        SalesHeader: Record "Sales Header";
        PayTermCode: Code[30];
        Rem: Code[30];
        CountryRegion: Record "Country/Region";
        contrname: Text[50];
        AppDate1: Date;
}

