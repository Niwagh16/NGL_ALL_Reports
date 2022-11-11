report 50053 "IMC Report Final"
{
    // version Indian Merchant commerce report Sanjay 30/04/2015

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\IMC Report Final.rdl';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            column(UPPERCASE_txtComapnyAddress1_; UPPERCASE(txtComapnyAddress1))
            {
            }
            column(UPPERCASE_txtCompanyName_; UPPERCASE(txtCompanyName))
            {
            }
            column(Location_Name; RecLocation.Name)
            {
            }
            column(Location_Address; RecLocation.Address + ', ' + RecLocation."Address 2" + ',' + RecLocation.City + ',' + RecLocation."Post Code" + ',' + txtLocCountryname)
            {
            }
            column(Customer_Name; RecCustomer.Name)
            {
            }
            column(Customer_Address; RecCustomer.Address + ',' + RecCustomer."Address 2" + ',' + RecCustomer.City + ',' + RecCustomer."Post Code" + ',' + recCountry.Name)
            {
            }
            column(Port_Of_Discharge; '')//"Sales Header"."Port of Discharge") //PCPL/NSW/MIG 05Aug22
            {
            }
            column(Port_finalDestination; '')//"Sales Header"."Final Destination") //PCPL/NSW/MIG 05Aug22
            {
            }
            column(Country_Origin; txtCountryOfOriginOfGoods)
            {
            }
            column(Country_FinalDestination; txtCountryOfFinalDest)
            {
            }
            column(PackingList_No; "Sales Header"."Package Tracking No.")
            {
            }
            column(Place_dateIMC; RecLocation.City + ' ' + FORMAT(datPostingDate, 0, 4))
            {
            }
            column(Origin_Criterion; 'RecLocation."Origin Criterion"')
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                column(ItemCode; "Sales Line"."No.")
                {
                }
                column(Item_Description; "Sales Line".Description)
                {
                }
                column(MarkNo; "Sales Line"."Mark and Containger No")
                {
                }
                column(Gross_Weight; "Sales Line"."Gross Weight" * "Sales Line".Quantity)
                {
                }
                column(Invoice_No; codPostedInvNo + '    ' + FORMAT(datPostingDate, 0, 4))
                {
                }
                column(Posting_Date; "Sales Line"."Posting Date")
                {
                }
                column(Net_Weight; "Sales Line"."Net Weight")
                {
                }
                column(FOB_Values; "Sales Line".Amount)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    txtmarkno := "Sales Line"."Mark and Containger No";
                end;
            }

            trigger OnAfterGetRecord();
            begin
                recCompanyInfo.GET;
                BEGIN
                END;


                codPostedInvNo := "Sales Header"."No.";
                datPostingDate := "Sales Header"."Posting Date";



                IF RecLocation.GET("Sales Header"."Location Code") THEN;

                recCountry.RESET;
                recCountry.SETFILTER(recCountry.Code, RecLocation."Country/Region Code");
                IF recCountry.FIND('-') THEN
                    txtLocCountryname := recCountry.Name;



                IF RecCustomer.GET("Sales Header"."Bill-to Customer No.") THEN;


                recCountry.RESET;
                recCountry.SETFILTER(recCountry.Code, "Sales Header"."Ship-to Country/Region Code");
                IF recCountry.FIND('-') THEN
                    txtShipToCustCountry := recCountry.Name;
                /*
                recCountry.RESET;
                recCountry.SETFILTER(recCountry.Code, "Sales Header"."Country of Origin of Goods");
                IF recCountry.FIND('-') THEN
                    txtCountryOfOriginOfGoods := recCountry.Name;

                recCountry.RESET;
                recCountry.SETFILTER(recCountry.Code, "Sales Header"."Country of Final Destination");
                IF recCountry.FIND('-') THEN
                    txtCountryOfFinalDest := recCountry.Name;
                    */ //PCPL/NSW/MIG 05Aug22
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
        // recPort: Record Port;
        recCountry: Record "Country/Region";
        recPostCode: Record "Post Code";
        recPaymentTerm: Record "Payment Terms";
        RecLocation: Record Location;
        RecCustomer: Record Customer;
        RecSalesHeader: Record "Sales Header";
        RecSalesLine: Record "Sales Line";
        txtCountryOfOriginOfGoods: Text[15];
        txtCountryOfFinalDest: Text[15];
        txtShipToCustCountry: Text[15];
        txtLocCountryname: Text[15];
        codPostedInvNo: Code[20];
        datPostingDate: Date;
        txtmarkno: Text[20];
}

