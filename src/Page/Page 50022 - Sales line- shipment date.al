page 50022 "Sales line- shipment date"
{
    PageType = List;
    Permissions = TableData 37 = rimd;
    SourceTable = 37;
    SourceTableView = SORTING("Document Type", "Document No.", "Line No.")
                      ORDER(Descending)
                      WHERE("Document Type" = FILTER(Order));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; rec."Document Type")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("Sell-to Customer No."; rec."Sell-to Customer No.")
                {
                    ApplicationArea = ALL;
                }
                field(Custname; Custname)
                {
                    Caption = 'Customer Name';
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("Document No."; rec."Document No.")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field(Type; rec.Type)
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("No."; rec."No.")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field(Description; rec.Description)
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("Description 2"; rec."Description 2")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field(BuYReferenceNo; BuYReferenceNo)
                {
                    Caption = 'Buyer Reference No.';
                    ApplicationArea = ALL;
                }
                field("Location Code"; rec."Location Code")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field(Quantity; rec.Quantity)
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("Unit of Measure"; rec."Unit of Measure")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("Shipment Date"; rec."Shipment Date")
                {
                    ApplicationArea = ALL;
                }
                field("Promised Delivery Date"; rec."Promised Delivery Date")
                {
                    AccessByPermission = TableData 99000880 = R;
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("Mark and Containger No"; rec."Mark and Containger No")
                {
                    Caption = 'Remarks From HO';
                    ApplicationArea = ALL;
                }

                field("Outstanding Quantity"; rec."Outstanding Quantity")
                {
                    Editable = true;
                    ApplicationArea = ALL;
                }
                field("Assessee Code"; rec."Assessee Code")
                {
                    Editable = true;
                    Visible = false;
                    ApplicationArea = ALL;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            // Caption = 'General';
            group(Reports)
            {
                action("Order Comfirmation")
                {
                    // RunObject = Report 50002; //NSW07
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        IF Cust.GET(rec."Sell-to Customer No.")
        THEN
            Custname := Cust.Name;

        //PCPL-25 6jul20
        RecSalehead.RESET;
        RecSalehead.SETRANGE(RecSalehead."No.", rec."Document No.");
        RecSalehead.SETRANGE(RecSalehead."Document Type", rec."Document Type"::Order);
        IF RecSalehead.FINDFIRST THEN BEGIN
            BuYReferenceNo := RecSalehead."Buyer Reference No.";
        END;
        //PCPL-25 6jul20
    end;

    trigger OnOpenPage();
    begin
        //PCPL-0041-START-17012020
        rec.FILTERGROUP(1);
        IF UserSetup.GET(USERID) THEN;
        IF UserSetup."Location Code" <> '' THEN
            rec.SETFILTER("Location Code", UserSetup."Location Code");
        rec.FILTERGROUP(0);
        //PCPL-0041-END-17012020
    end;

    var
        Cust: Record 18;
        Custname: Text;
        UserSetup: Record 91;
        Refno: Record 36;
        "Buyrefno.": Code[20];
        RecSalehead: Record 36;
        BuYReferenceNo: Text;
}

