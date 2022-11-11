report 50070 "Indent List Report_"
{
    // version pcpl0024_05dec2018

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Indent List Report_.rdl';

    dataset
    {
        dataitem("Portal Vend Updated Purch Rec"; "Portal Vend Updated Purch Rec")
        {
            RequestFilterFields = "Document No.";
            column(Quantity_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec".Quantity)
            {
            }
            column(DocumentNo_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec"."Document No.")
            {
            }
            column(Description2_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec"."Description 2")
            {
            }
            column(UnitofMeasureCode_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec"."Unit of Measure Code")
            {
            }
            column(PaymentTermsPortalUse_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec"."Payment Terms Portal Use")
            {
            }
            column(LocationCode_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec"."Location Code")
            {
            }
            column(VendorUnitPrice_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec"."Vendor Unit_ Price")
            {
            }
            column(VendorDiscount_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec"."Vendor Discount %")
            {
            }
            column(LeadTime_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec"."Lead Time")
            {
            }
            column(Availability_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec".Availability)
            {
            }
            column(VendorNo_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec"."Vendor No.")
            {
            }
            column(VendorName_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec"."Vendor Name")
            {
            }
            column(SubmitDate_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec"."Submit Date")
            {
            }
            column(FreightCharges_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec"."Freight Charges")
            {
            }
            column(PackingForwardingCharges_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec"."Packing & Forwarding Charges")
            {
            }
            column(GST_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec"."GST %")
            {
            }
            column(Brand_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec".Brand)
            {
            }
            column(Description_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec".Description)
            {
            }
            column(No_PortalVendUpdatedPurchRec; "Portal Vend Updated Purch Rec"."No.")
            {
            }
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
}

