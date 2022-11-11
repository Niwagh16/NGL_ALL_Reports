page 50197 "Quotes Received2"
{
    // version pcpl002430oct

    PageType = List;
    SourceTable = 50032;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = all;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = all;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = all;
                    Editable = true;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = all;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = all;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                }
                field("PO Qty"; Rec."PO Qty")
                {
                    ApplicationArea = all;
                }
                field(Approved; Rec.Approved)
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = all;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = all;
                }
                field("Requisition Line No."; Rec."Requisition Line No.")
                {
                    ApplicationArea = all;
                }
                field("Requisition Templet Name"; Rec."Requisition Templet Name")
                {
                    ApplicationArea = all;
                }
                field("Requisition Batch Name"; Rec."Requisition Batch Name")
                {
                    ApplicationArea = all;
                }
                field("Outstanding True"; Rec."Outstanding True")
                {
                    ApplicationArea = all;
                }
                field(Close; Rec.Close)
                {
                    ApplicationArea = all;
                }
                field("Description 3"; Rec."Description 3")
                {
                    ApplicationArea = all;
                }
                field("Material Requisitioned"; Rec."Material Requisitioned")
                {
                    ApplicationArea = all;
                }
                field(Remark; Rec.Remark)
                {
                    ApplicationArea = all;
                }
                field("USER ID"; Rec."USER ID")
                {
                    ApplicationArea = all;
                }
                field("Selected For PO"; Rec."Selected For PO")
                {
                    ApplicationArea = all;
                }
                field("FA Component Category"; Rec."FA Component Category")
                {
                    ApplicationArea = all;
                }
                field("Requirement Date"; Rec."Requirement Date")
                {
                    ApplicationArea = all;
                }
                field("Product Group Code"; Rec."Product Group Code")
                {
                    ApplicationArea = all;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = all;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = all;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = all;
                }
                field("Approved Date"; Rec."Approved Date")
                {
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = all;
                }
                field("PO Created"; Rec."PO Created")
                {
                    ApplicationArea = all;
                }
                field("Cost Allocation Dimension"; Rec."Cost Allocation Dimension")
                {
                    ApplicationArea = all;
                }
                field("Release Date and Time"; Rec."Release Date and Time")
                {
                    ApplicationArea = all;
                }
                field("Releaser User ID"; Rec."Releaser User ID")
                {
                    ApplicationArea = all;
                }
                field("Approved Date and Time"; Rec."Approved Date and Time")
                {
                    ApplicationArea = all;
                }
                field("End Use"; Rec."End Use")
                {
                    ApplicationArea = all;
                }
                field("Close UserID"; Rec."Close UserID")
                {
                    ApplicationArea = all;
                }
                field("Comment for Close"; Rec."Comment for Close")
                {
                    ApplicationArea = all;
                }
                field(Closingqty; Rec.Closingqty)
                {
                    ApplicationArea = all;
                }
                field("Vendor Unit_ Price"; Rec."Vendor Unit_ Price")
                {
                    ApplicationArea = all;
                    Caption = 'Vendor Quote Unit Price';
                }
                field("Vendor Discount %"; Rec."Vendor Discount %")
                {
                    ApplicationArea = all;
                }
                field("Lead Time"; Rec."Lead Time")
                {
                    ApplicationArea = all;
                }
                field(Availability; Rec.Availability)
                {
                    ApplicationArea = all;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = all;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = all;
                }
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = all;
                }
                field("Mail Already Sent"; Rec."Mail Already Sent")
                {
                    ApplicationArea = all;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = all;
                }
                field("Submit Status"; Rec."Submit Status")
                {
                    ApplicationArea = all;
                }
                field("Submit Date"; Rec."Submit Date")
                {
                    ApplicationArea = all;
                    Caption = 'Quotation Submit Date';
                }
                field("Submit Time"; Rec."Submit Time")
                {
                    ApplicationArea = all;
                }
                field("PO Status"; Rec."PO Status")
                {
                    ApplicationArea = all;
                }
                field("Quotation No"; Rec."Quotation No")
                {
                    ApplicationArea = all;
                }
                field("GST %"; Rec."GST %")
                {
                    ApplicationArea = all;
                }
                field("Freight Included"; Rec."Freight Included")
                {
                    ApplicationArea = all;
                }
                field("Freight Charges"; Rec."Freight Charges")
                {
                    ApplicationArea = all;
                }
                field("Packing & Forwarding"; Rec."Packing & Forwarding")
                {
                    ApplicationArea = all;
                }
                field("Packing & Forwarding Charges"; Rec."Packing & Forwarding Charges")
                {
                    ApplicationArea = all;
                }
                field("Quotation Qty"; Rec."Quotation Qty")
                {
                    ApplicationArea = all;
                }
                field(Brand; Rec.Brand)
                {
                    ApplicationArea = all;
                }
                field("Indent Closing Date"; Rec."Indent Closing Date")
                {
                    ApplicationArea = all;
                }
                field("Payment Terms Portal Use"; Rec."Payment Terms Portal Use")
                {
                    ApplicationArea = all;
                }
                field("PO No"; Rec."PO No")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            // Caption = 'Action';
            action(CreatePO)
            {
                Caption = 'Create PO';
                Image = ReleaseDoc;
                ApplicationArea = all;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction();
                begin
                    recpurcha.RESET;
                    recpurcha.SETRANGE(recpurcha."Selected For PO", TRUE);
                    recpurcha.SETRANGE(recpurcha."PO Created", FALSE);
                    IF recpurcha.FINDFIRST THEN BEGIN
                        fvend := recpurcha."Vendor No.";
                        floca := recpurcha."Location Code";
                    END;

                    recpurchb.RESET;
                    recpurchb.SETRANGE(recpurchb."Selected For PO", TRUE);
                    recpurchb.SETRANGE(recpurchb."PO Created", FALSE);
                    IF recpurchb.FINDSET THEN BEGIN
                        REPEAT
                            IF (recpurchb."Vendor No." <> fvend) OR (recpurchb."Location Code" <> floca) THEN BEGIN
                                ERROR('Mismatch Enties selected');
                            END;
                        UNTIL recpurchb.NEXT = 0
                    END;

                    Rec.PurchaseOrderCreation;
                end;
            }
        }
    }

    var
        recpurcha: Record 50032;
        recpurchb: Record 50032;
        fvend: Code[30];
        floca: Code[30];
}

