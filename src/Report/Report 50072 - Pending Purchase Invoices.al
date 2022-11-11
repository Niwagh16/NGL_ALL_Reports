report 50072 "Pending Purchase Invoices"
{
    // version KAR 1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Pending Purchase Invoices.rdl';

    dataset
    {
        dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
        {
            DataItemTableView = SORTING("Document No.", "Line No.")
                                ORDER(Ascending)
                                WHERE("Qty. Rcd. Not Invoiced" = FILTER(<> 0));
            RequestFilterFields = "Posting Date", "Location Code", "Buy-from Vendor No.";
            column(PO_No; "Purch. Rcpt. Line"."Order No.")
            {
            }
            column(GRN_No; "Purch. Rcpt. Line"."Document No.")
            {
            }
            column(ItemCodeNo; "Purch. Rcpt. Line"."No.")
            {
            }
            column(ItemDescription; "Purch. Rcpt. Line".Description)
            {
            }
            column(Location; "Purch. Rcpt. Line"."Location Code")
            {
            }
            column(QtyRcd_NotInvoiced; "Purch. Rcpt. Line"."Qty. Rcd. Not Invoiced")
            {
            }
            column(Vendor_No; "Purch. Rcpt. Line"."Buy-from Vendor No.")
            {
            }
            column(VendorName; VendorName)
            {
            }
            column(Posting_Date; "Purch. Rcpt. Line"."Posting Date")
            {
            }

            trigger OnAfterGetRecord();
            begin

                //
                //RecPurchRcp.RESET;
                //RecPurchRcp.SETRANGE(RecPurchRcp."Order No.","Document No.");
                //RecPurchRcp.SETFILTER(RecPurchRcp."Qty. Rcd. Not Invoiced",'<>%1',0);
                //IF RecPurchRcp.FINDFIRST THEN
                //GRNNo:=RecPurchRcp."Document No."
                //ELSE GRNNo:=' ';


                //SH.RESET;
                //SH.SETRANGE(SH."Document Type","Document Type");
                //SH.SETRANGE(SH."No.","Document No.");
                //IF SH.FINDFIRST THEN
                //PostingDate := SH."Posting Date";


                //Vendor Name
                RecVendor.RESET;
                RecVendor.SETRANGE(RecVendor."No.", "Purch. Rcpt. Line"."Buy-from Vendor No.");
                IF RecVendor.FINDFIRST THEN
                    VendorName := RecVendor.Name;
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

    var
        GRNNo: Code[20];
        RecPurchRcp: Record "Purch. Rcpt. Line";
        SH: Record "Sales Header";
        PostingDate: Date;
        RecVendor: Record "Vendor";
        VendorName: Text[100];
}

