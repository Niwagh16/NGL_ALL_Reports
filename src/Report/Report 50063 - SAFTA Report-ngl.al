report 50063 "SAFTA Report-ngl"
{
    // version sanjay Ngl

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\SAFTA Report-ngl.rdl';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            column(UPPERCASE_txtComapnyAddress1_; UPPERCASE(txtComapnyAddress1))
            {
            }
            column(UPPERCASE_txtCompanyName_; UPPERCASE(txtCompanyName))
            {
            }
            column(Location_Name; RecLocation.Name)
            {
            }
            column(Location_Address; RecLocation.Address + ',' + RecLocation.City + ',' + RecLocation."Post Code" + ',' + RecLocation."Country/Region Code")
            {
            }
            column(Customer_Name; RecCustomer.Name)
            {
            }
            column(Customer_Address; RecCustomer.Address + ',' + RecCustomer."Address 2" + ',' + RecCustomer.City + ',' + RecCustomer."Post Code" + ',' + RecCustomer."Country/Region Code")
            {
            }
            column(Port_Of_Discharge; '')//"Sales Header"."Port of Discharge") //PCPL/NSW/MIG 09Aug22
            {
            }
            column(Port_finalDestination; '')// "Sales Header"."Final Destination") //PCPL/NSW/MIG 09Aug22
            {
            }
            column(Country_Origin; '')//"Sales Header"."Country of Origin of Goods") //PCPL/NSW/MIG 09Aug22
            {
            }
            column(Country_Destination; '')//"Sales Header"."Country of Final Destination") //PCPL/NSW/MIG 09Aug22
            {
            }
            column(Invoice_No; RecSalesHeader."No.")
            {
            }
            column(Posting_Date; "Sales Header"."Posting Date")
            {
            }
            column(Carraige; '')//"Sales Header".Carriage) //PCPL/NSW/MIG 09Aug22
            {
            }
            column(Port_Discharge; PortOfDischarge)
            {
            }
            column(Port_Loading; PortOfLoading)
            {
            }
            column(CountryofOrigin; Country)
            {
            }
            column(ImportedCountry; ImportedCountry)
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                column(Item_Description; "Sales Line".Description)
                {
                }
                column(Item_Qty; "Sales Line".Quantity)
                {
                }
                column(Gross_Weight; "Sales Line"."Gross Weight")
                {
                }
                column(Net_Weight; "Sales Line"."Net Weight")
                {
                }
                column(Markandnumber; "Sales Line"."Mark and Containger No")
                {
                }
                column(Item_No; "Sales Line"."No.")
                {
                }
                column(inv_no; "Sales Line"."Document No.")
                {
                }
                column(Srno; Srno)
                {
                }
                column(Amount; 0)//"Sales Line"."Amount To Customer") //PCPL/NSW/MIG 09Aug22
                {
                }

                trigger OnAfterGetRecord();
                var
                //StructureLineDetails : Record "13795"; //PCPL-Deepak
                begin
                    Srno += 1;

                    /*StructureLineDetails.RESET;
                    StructureLineDetails.SETRANGE(Type,StructureLineDetails.Type::Sale);
                    StructureLineDetails.SETRANGE("Document Type","Document Type");
                    StructureLineDetails.SETRANGE("Document No.","Document No.");
                    StructureLineDetails.SETRANGE("Item No.","No.");
                    StructureLineDetails.SETRANGE("Line No.","Line No.");
                    IF StructureLineDetails.FIND('-') THEN
                      REPEAT
                        IF NOT StructureLineDetails."Payable to Third Party" THEN BEGIN
                          IF StructureLineDetails."Tax/Charge Type" = StructureLineDetails."Tax/Charge Type"::Charges THEN
                            Charges_Amount := Charges_Amount + ROUND(StructureLineDetails.Amount);
                        END;
                      UNTIL StructureLineDetails.NEXT = 0; */ //PCPL-Deepak
                end;
            }

            trigger OnAfterGetRecord();
            begin
                recCompanyInfo.GET;
                BEGIN
                END;

                IF RecLocation.GET("Sales Header"."Location Code") THEN;

                IF RecCustomer.GET("Sales Header"."Bill-to Customer No.") THEN;
                //Sanjay Port of Loading Name
                // recPort.RESET;
                // //recPort.SETRANGE(recPort.Code, "Sales Header".Port); //PCPL/NSW/MIG 09Aug22
                // IF recPort.FINDFIRST THEN
                //     PortOfLoading := recPort."Port Name";



                //   Sanjay Port of Discharge NAme
                // recpot1.RESET;
                // recpot1.SETRANGE(recpot1.Code, "Sales Header"."Port of Discharge");
                // IF recpot1.FINDFIRST THEN
                //     PortOfDischarge := recpot1."Port Name";

                //Sanjay country of origin name

                // recCountry.RESET;
                // recCountry.SETRANGE(recCountry.Code, "Sales Header"."Country of Origin of Goods");
                // IF recCountry.FINDFIRST THEN
                //     Country := recCountry.Name;

                // //Sanjay country of final destination
                // recCountry1.RESET;
                // recCountry1.SETRANGE(recCountry1.Code, "Sales Header"."Country of Final Destination");
                // IF recCountry1.FINDFIRST THEN
                //     ImportedCountry := recCountry1.Name;
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
        txtCompanyName: Text[30];
        txtComapnyAddress1: Text[150];
        txtComapnyAddress2: Text[150];
        recCompanyInfo: Record "Company Information";
        recItem: Record Item;
        //recPort: Record Port;
        recCountry: Record "Country/Region";
        recPostCode: Record "Post Code";
        recPaymentTerm: Record "Payment Terms";
        RecLocation: Record Location;
        RecCustomer: Record "Customer";
        RecSalesHeader: Record "Sales Header";
        RecSalesLine: Record "Sales Line";
        Charges_Amount: Decimal;
        PortOfDischarge: Text;
        PortOfLoading: Text;
        // recpot1: Record "Port";
        Country: Text;
        ImportedCountry: Text;
        recCountry1: Record "Country/Region";
        Srno: Integer;
}

