report 50051 "Pro-forma Invoice"
{
    // version KAR1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Pro-forma Invoice.rdl';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.")
                                WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "Quote No.";
            column(Company_Name; CompanyInfo.Name)
            {
            }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(Buyer_Name; "Bill-to Name" + ' ' + "Bill-to Name 2")
            {
            }
            column(Buyer_Address; "Sales Header"."Bill-to Address" + ',' + "Sales Header"."Bill-to Address 2")
            {
            }
            column(BUyercity_Postcode; "Sales Header"."Bill-to City" + ',' + "Sales Header"."Sell-to Post Code")
            {
            }
            column(Buyer_Drug_Lic_No; RecCustomer."Drug Lic. No. 1")
            {
            }
            column(Buyer_Ecc_No; '')//RecCustomer."E.C.C. No.") //PCPL/NSW/MIG 05Aug22
            {
            }
            column(Buyer_Tin_No; '')//RecCustomer."T.I.N. No.")//PCPL/NSW/MIG 05Aug22
            {
            }
            column(Consignee_Name; "Sales Header"."Ship-to Name" + ' ' + "Ship-to Name 2")
            {
            }
            column(Consignee_Address; "Sales Header"."Bill-to Address" + ',' + "Sales Header"."Bill-to Address 2")
            {
            }
            column(Buyer_Reference_No; "Sales Header"."Buyer Reference No.")
            {
            }
            column(Buyer_Reference_Date; "Sales Header"."Document Date")
            {
            }
            column(Payment_Terms; "Sales Header"."Payment Terms Code")
            {
            }
            column(Shipment_Method; "Sales Header"."Shipment Method Code")
            {
            }
            column(Final_Destination; '')//"Sales Header"."Final Destination") //PCPL/NSW/MIG 05Aug22
            {
            }
            column(Place_Discharge; '')//"Sales Header"."Port of Discharge") //PCPL/NSW/MIG 05Aug22
            {
            }
            column(Country_Of_Origin; '')//"Sales Header"."Country of Origin of Goods") //PCPL/NSW/MIG 05Aug22
            {
            }
            column(DescriptionPayment; PaymentTerms.Description)
            {
            }
            column(Corresp; Corresp)
            {
            }
            column(Corresp1; Corresp1)
            {
            }
            column(Corresp2; Corresp2)
            {
            }
            column(port; port1)
            {
            }
            column(ShipCountryName; "Sales Header"."Sell-to County")
            {
            }
            column(Quote_No; "Sales Header"."No.")
            {
            }
            column(Quote_Date; "Sales Header"."Order Date")
            {
            }
            column(Ship_Code; "Sales Header"."Ship-to Code")
            {
            }
            column(Ship_Address; "Sales Header"."Ship-to Address" + ',' + "Sales Header"."Ship-to Address 2")
            {
            }
            column(Ship_City; "Sales Header"."Ship-to City")
            {
            }
            column(ShipToPostal; "Sales Header"."Ship-to City" + ',' + "Sales Header"."Ship-to Post Code")
            {
            }
            column(Remarks; "Sales Header".Comment)
            {
            }
            column(IndianBank_Details; "Sales Header".Incoterms)
            {
            }
            column(OverseasBank_Details; "Sales Header"."Overseas Bank Details")
            {
            }
            column(PaymentTerm_Desc; PaymentTermDesc)
            {
            }
            column(Company_PanNo; CompanyInfo."P.A.N. No.")
            {
            }
            column(Company_Vat_RegNo; CompanyInfo."VAT Registration No.")
            {
            }
            column(Company_CE_Reg_No; '')//CompanyInfo."C.E. Registration No.") //PCPL/NSW/MIG 05Aug22
            {
            }
            column(Range; '')//CompanyInfo."C.E. Range") //PCPL/NSW/MIG 05Aug22
            {
            }
            column(Division; '')//CompanyInfo."C.E. Division") //PCPL/NSW/MIG 05Aug22
            {
            }
            column(Commision_Rate; '')//CompanyInfo."C.E. Commissionerate") //PCPL/NSW/MIG 05Aug22
            {
            }
            column(Bank_Account_No; CompanyInfo."Bank Account No.")
            {
            }
            column(Bank_Name; CompanyInfo."Bank Name")
            {
            }
            column(Bank_Branch; CompanyInfo."Bank Branch No.")
            {
            }
            column(Swift_Code; CompanyInfo."SWIFT Code")
            {
            }
            column(IEC_CodeNo; CompanyInfo."IEC CODE No.")
            {
            }
            column(Drug_License_No; RecLocation."Drug license No.")
            {
            }
            column(Location_ECC_No; '')//RecLocation."E.C.C. No.") //PCPL/NSW/MIG 05Aug22
            {
            }
            column(Head_Off_Caption_Lbl; Head_Off_CaptionLbl)
            {
            }
            column(TelNo_Caption_Lbl; TelNo_CaptionLbl)
            {
            }
            column(Country_buyto; ShipCountryName)
            {
            }
            column(Country_Of_Final_Destination; CountryRegion.Name)
            {
            }
            column(RegOff_Caption_Lbl; RegOff_CaptionLbl)
            {
            }
            column(Website_Caption_Lbl; Website_CaptionLbl)
            {
            }
            column(BuyerName_Caption_Lbl; BuyerName_CaptionLbl)
            {
            }
            column(Druglicense_Caption_Lbl; Druglicense_CaptionLbl)
            {
            }
            column(ECC_Caption_Lbl; ECC_CaptionLbl)
            {
            }
            column(Name_Address_Caption_Lbl; Name_Address_CaptionLbl)
            {
            }
            column(Buyer_Tinno_Caption_Lbl; Buyer_Tinno_CaptionLbl)
            {
            }
            column(BuyerRefNo_Caption_Lbl; BuyerRefNo_CaptionLbl)
            {
            }
            column(BuyerRefDate_Caption_Lbl; BuyerRefDate_CaptionLbl)
            {
            }
            column(PaymentTerms_Caption_Lbl; PaymentTerms_CaptionLbl)
            {
            }
            column(Shippmethod_Caption_Lbl; Shippmethod_CaptionLbl)
            {
            }
            column(DeliveryTerms_Caption_Lbl; DeliveryTerms_CaptionLbl)
            {
            }
            column(PlaceofDischarge_Caption_Lbl; PlaceofDischarge_CaptionLbl)
            {
            }
            column(CountryFD_Caption_Lbl; CountryFD_CaptionLbl)
            {
            }
            column(QuoteNo_Caption_Lbl; QuoteNo_CaptionLbl)
            {
            }
            column(Date_Caption_Lbl; Date_CaptionLbl)
            {
            }
            column(TermsofDP_Caption_Lbl; TermsofDP_CaptionLbl)
            {
            }
            column(SupplyfromLoc_Caption_Lbl; SupplyfromLoc_CaptionLbl)
            {
            }
            column(ItemCode_Caption_Lbl; ItemCode_CaptionLbl)
            {
            }
            column(Desc_Caption_Lbl; Desc_CaptionLbl)
            {
            }
            column(SchedDateofShipp_Caption_Lbl; SchedDateofShipp_CaptionLbl)
            {
            }
            column(TotalQty_Caption_Lbl; TotalQty_CaptionLbl)
            {
            }
            column(UOM_Caption_Lbl; UOM_CaptionLbl)
            {
            }
            column(CurrCode_Caption_Lbl; CurrCode_CaptionLbl)
            {
            }
            column(UnitPrice_Caption_Lbl; UnitPrice_CaptionLbl)
            {
            }
            column(Amount_Caption_Lbl; Amount_CaptionLbl)
            {
            }
            column(ExciseAmount_Caption_Lbl; ExciseAmount_CaptionLbl)
            {
            }
            column(TaxAmount_Caption_Lbl; TaxAmount_CaptionLbl)
            {
            }
            column(ServiceTaxAmount_Caption_Lbl; ServiceTaxAmount_CaptionLbl)
            {
            }
            column(ServiceTaxeCessAmount_Caption_Lbl; ServiceTaxeCessAmount_CaptionLbl)
            {
            }
            column(ServiceTaxSHECessAmount_Caption_Lbl; ServiceTaxSHECessAmount_CaptionLbl)
            {
            }
            column(OtherTaxesAmount_Caption_Lbl; OtherTaxesAmount_CaptionLbl)
            {
            }
            column(ChargesAmount_Caption_Lbl; ChargesAmount_CaptionLbl)
            {
            }
            column(TCSAmount_Caption_Lbl; TCSAmount_CaptionLbl)
            {
            }
            column(TotalInclTaxes_Caption_Lbl; TotalInclTaxes_CaptionLbl)
            {
            }
            column(Remark_Caption_Lbl; Remark_CaptionLbl)
            {
            }
            column(OurRegInfo_Caption_Lbl; OurRegInfo_CaptionLbl)
            {
            }
            column(PANno_Caption_Lbl; PANno_CaptionLbl)
            {
            }
            column(VATRegnNo_Caption_Lbl; VATRegnNo_CaptionLbl)
            {
            }
            column(ECCRegnNo_CaptionLbl; ECCRegnNo_CaptionLbl)
            {
            }
            column(Range_Caption_Lbl; Range_CaptionLbl)
            {
            }
            column(Division_Caption_Lbl; Division_CaptionLbl)
            {
            }
            column(Commissionerate_Caption_Lbl; Commissionerate_CaptionLbl)
            {
            }
            column(BankDet_Caption_Lbl; BankDet_CaptionLbl)
            {
            }
            column(NameofBank_Caption_Lbl; NameofBank_CaptionLbl)
            {
            }
            column(BranchAdd_Caption_Lbl; BranchAdd_CaptionLbl)
            {
            }
            column(SwiftCode_Caption_Lbl; SwiftCode_CaptionLbl)
            {
            }
            column(AccountNo_Caption_Lbl; AccountNo_CaptionLbl)
            {
            }
            column(DrugLicenseNo_Caption_Lbl; DrugLicenseNo_CaptionLbl)
            {
            }
            column(NGLFineChemLtd_Caption_Lbl; NGLFineChemLtd_CaptionLbl)
            {
            }
            column(AuthorizedSignatory_Caption_Lbl; AuthorizedSignatory_CaptionLbl)
            {
            }
            column(FooterComment_Caption_Lbl; FooterComment_CaptionLbl)
            {
            }
            column(HDFCBank_CaptionLbl; BankAccount.Name + ': ' + BankAccount.Address + ' ' + BankAccount."Address 2" + BankAccount.City + '-' + BankAccount."Post Code" + ' ' + BankAccount."Country/Region Code" + ' ' + 'A/c No.' + BankAccount."Bank Account No." + ', ' + 'Swift Code:' + BankAccount."SWIFT Code")
            {
            }
            column(CorrBank_CaptionLbl; BankAccount."correspondence Bank")
            {
            }
            column(Delivery_Terms; "Sales Header"."Delivery Terms")
            {
            }
            column(ShipmentLocation_Name; RecLocation.Name)
            {
            }
            column(ShipmentLocation_Address; RecLocation.Address)
            {
            }
            column(ShipmentLocation_Address2; RecLocation."Address 2" + ' ,' + RecLocation.City + ' , ' + CountryName)
            {
            }
            column(ShipmentLocation_City; RecLocation.City)
            {
            }
            column(PortName; PortName)
            {
            }
            dataitem("Sales Comment Line"; "Sales Comment Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"),
                               "No." = FIELD("No.");
                column(Sales_Comments; "Sales Comment Line".Comment)
                {
                }
            }
            dataitem("<Sales Line>"; "Sales Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"),
                               "Document No." = FIELD("No.");
                column(DocumentNo_SalesLine; "<Sales Line>"."Document No.")
                {
                }
                column(Item_Code; "No.")
                {
                }
                column(Item_Description; Description)
                {
                }
                column(Scheduled_Shipment_Date; "Shipment Date")
                {
                }
                column(Total_Qty; Quantity)
                {
                }
                column(UOM; "Unit of Measure")
                {
                }
                column(Currency_Code; "Currency Code")
                {
                }
                column(Unit_Price; "Unit Price")
                {
                }
                column(Amount; Amount)
                {
                }
                column(Tax_Amount; 0)//"Tax Amount") //PCPL/NSW/MIG 05Aug22
                {
                }
                column(Excise_Amount; 0)//"Excise Amount") //PCPL/NSW/MIG 05Aug22
                {
                }
                column(Service_tax_Amount; 0)//"Service Tax Amount") //PCPL/NSW/MIG 05Aug22
                {
                }
                column(Service_tax_excess_Amount; 0)//"Service Tax eCess Amount") //PCPL/NSW/MIG 05Aug22
                {
                }
                column(Service_Tax_Shess_Amount; 0)// "Service Tax SHE Cess Amount") //PCPL/NSW/MIG 05Aug22
                {
                }
                column(TCS_Amount; 0)//"Total TDS/TCS Incl. SHE CESS")
                {
                }
                column(Charges_Amount; Charges_Amount)
                {
                }

                trigger OnAfterGetRecord();
                var
                //StructureLineDetails : Record "13795"; //PCPL-Deepak
                begin
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
                      UNTIL StructureLineDetails.NEXT = 0;*/ //PCPL-Deepak
                end;
            }

            trigger OnAfterGetRecord();
            var
                Strpos_: Integer;
                StrLength: Text;
                Strpos_1: Integer;
            begin

                IF CompanyInfo.GET THEN
                    CompanyInfo.CALCFIELDS(CompanyInfo.Picture);

                IF RecLocation.GET("Sales Header"."Location Code") THEN;

                IF RecCustomer.GET("Sales Header"."Bill-to Customer No.") THEN;
                //PCPL/BRB
                IF Shiptoadd.GET("Sell-to Customer No.", "Ship-to Code") THEN
                    IF CountryRegion.GET(Shiptoadd."Country/Region Code") THEN
                        ShipCountryName := CountryRegion.Name;

                //IF CountryRegion.GET("Sales Header"."Country of Final Destination") THEN;
                //IF PaymentTerms.GET("Sales Header"."Payment Terms Code") THEN;

                //port name instead of port code;  sanjay 26/12/2014
                PostCode.RESET;
                PostCode.SETRANGE("Country/Region Code", "Sales Header"."Sell-to Post Code");
                IF PostCode.FINDFIRST THEN;
                /* //PCPL/NSW/MIG 05Aug22
                RecPort.RESET;
                RecPort.SETRANGE(RecPort.Code, "Sales Header"."Port of Discharge");
                IF RecPort.FINDFIRST THEN
                    PortName := RecPort."Port Name"
                ELSE
                */ //PCPL/NSW/MIG 05Aug22
                PortName := ' ';

                //   sanjay 17 aug 2016 . add code for port
                // IF BankAccount.GET("Sales Header"."Bank Account") THEN;
                Strpos_ := STRPOS(BankAccount."correspondence Bank", '2)');
                Strpos_1 := STRPOS(BankAccount."correspondence Bank", '1)');
                IF Strpos_1 <> 0 THEN BEGIN
                    Corresp := COPYSTR(BankAccount."correspondence Bank", 1, Strpos_1 - 1);
                    Corresp1 := COPYSTR(BankAccount."correspondence Bank", Strpos_1, Strpos_ - Strpos_1);
                    Corresp2 := COPYSTR(BankAccount."correspondence Bank", Strpos_);
                END;
                //Recport1.RESET;
                //Recport1.SETRANGE(Recport1.Code, "Sales Header".Port);
                //IF Recport1.FINDFIRST THEN
                //  port1 := Recport1."Port Name"

                //ELSE //PCPL/NSW/MIG 05Aug22
                port1 := ' ';

                //   sanjay 17 aug 2016 . add code for port


                //Payment Term Description
                RecPaymentTerm.RESET;
                RecPaymentTerm.SETRANGE(RecPaymentTerm.Code, "Sales Header"."Payment Terms Code");
                IF RecPaymentTerm.FINDFIRST THEN
                    PaymentTermDesc := RecPaymentTerm.Description;


                //Country Name
                RecCountry.RESET;
                RecCountry.SETRANGE(RecCountry.Code, RecLocation."Country/Region Code");
                IF RecCountry.FINDFIRST THEN
                    CountryName := RecCountry.Name

                ELSE
                    CountryName := ' ';
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

    trigger OnInitReport();
    begin
        CompanyInfo.GET;
    end;

    trigger OnPreReport();
    begin
        //IF  "Sales Header".GETFILTER("Sales Header"."No.")  = '' THEN
        //  ERROR(ERR_TXT);
    end;

    var
        CompanyInfo: Record "Company Information";
        RecCustomer: Record Customer;
        Charges_Amount: Decimal;
        Head_Off_CaptionLbl: Label 'HO (Sales Office): 301,E-Square, Subhash Road, Vile Parle East, Mumbai 400057, India';
        TelNo_CaptionLbl: Label 'Tel.: (+91 22) 26636450 Fax: (+91 22) 26108030 Email: info@nglfinechem.com';
        RegOff_CaptionLbl: Label 'Regd Office: 301,E-Square, Subhash Road, Vile Parle East, Mumbai 400057, India';
        Website_CaptionLbl: Label 'Website: www.nglfinechem.com CIN: L24110MH1981PLC025884';
        BuyerName_CaptionLbl: Label 'Name & Address of Buyer';
        Druglicense_CaptionLbl: Label 'Buyer Drug License No.';
        ECC_CaptionLbl: Label 'Buyer ECC No.';
        Name_Address_CaptionLbl: Label 'Name & Address of Consignee';
        Buyer_Tinno_CaptionLbl: Label 'Buyer TIN No.';
        BuyerRefNo_CaptionLbl: Label 'Buyer''s Reference No.';
        BuyerRefDate_CaptionLbl: Label 'Buyer''s Reference Date';
        PaymentTerms_CaptionLbl: Label 'Payment Terms';
        Shippmethod_CaptionLbl: Label 'Shipment Method';
        DeliveryTerms_CaptionLbl: Label 'Delivery Terms';
        PlaceofDischarge_CaptionLbl: Label 'Place of discharge';
        CountryFD_CaptionLbl: Label 'Country of final destination';
        QuoteNo_CaptionLbl: Label 'Order No:';
        Date_CaptionLbl: Label 'Date:';
        TermsofDP_CaptionLbl: Label 'Terms of delivery and payment';
        SupplyfromLoc_CaptionLbl: Label 'Supply from Location';
        ItemCode_CaptionLbl: Label 'Item Code';
        Desc_CaptionLbl: Label 'Description of Goods';
        SchedDateofShipp_CaptionLbl: Label 'Scheduled date of shipment';
        TotalQty_CaptionLbl: Label 'Total Quantity';
        UOM_CaptionLbl: Label 'Unit of Measure';
        CurrCode_CaptionLbl: Label 'Currency Code';
        UnitPrice_CaptionLbl: Label 'Unit Price';
        Amount_CaptionLbl: Label 'Amount';
        ExciseAmount_CaptionLbl: Label 'Excise Amount';
        TaxAmount_CaptionLbl: Label 'Tax Amount';
        ServiceTaxAmount_CaptionLbl: Label 'Service Tax Amount';
        ServiceTaxeCessAmount_CaptionLbl: Label 'Service Tax eCess Amount';
        ServiceTaxSHECessAmount_CaptionLbl: Label 'Service Tax SHECess Amount';
        OtherTaxesAmount_CaptionLbl: Label 'Other Taxes Amount';
        ChargesAmount_CaptionLbl: Label 'Charges Amount';
        TCSAmount_CaptionLbl: Label 'TCS Amount';
        TotalInclTaxes_CaptionLbl: Label 'Total Incl Taxes';
        Remark_CaptionLbl: Label 'Remarks:';
        OurRegInfo_CaptionLbl: Label 'Our registration information';
        PANno_CaptionLbl: Label 'PAN No:';
        VATRegnNo_CaptionLbl: Label 'IEC CODE No:';
        ECCRegnNo_CaptionLbl: Label 'ECC Regn No:';
        Range_CaptionLbl: Label 'Range:';
        Division_CaptionLbl: Label 'Division:';
        Commissionerate_CaptionLbl: Label 'Commissionerate:';
        BankDet_CaptionLbl: Label 'Bank details';
        NameofBank_CaptionLbl: Label 'Name of bank:';
        BranchAdd_CaptionLbl: Label 'Branch address:';
        SwiftCode_CaptionLbl: Label 'Swift Code:';
        AccountNo_CaptionLbl: Label 'Account No:';
        DrugLicenseNo_CaptionLbl: Label 'Drug License no:';
        NGLFineChemLtd_CaptionLbl: Label 'For NGL Fine Chem Limited';
        AuthorizedSignatory_CaptionLbl: Label 'Authorized Signatory';
        FooterComment_CaptionLbl: Label 'This is a computer generated confirmation and does not require a signature';
        ERR_TXT: Label 'Please Enter Order No.';
        RecLocation: Record "Location";
        // RecPort: Record Port;
        PortName: Text;
        HDFCBank_CaptionLbl: Label 'HDFC BANK LTD :- Manek Smruti, TPS 2, Nehru Rd, Vile Parle(E), Mumbai-400057, India, Current A/C No: 50200014898569, SWIFT CODE: HDFCINBB';
        CorrBank_CaptionLbl: Label '"Correspondance Bank in USA is Bank of New York, New York, SWIFT: IRVTUS3N, HDFC ACCOUNT: V801-890-0330-937 FEDWIRE ABA: 021000018 OR JPMorgan Chase Bank, NEW YORK, SWIFT: CHASUS33, HDFC ACCOUNT: 001-1-406717; CHIPS ABA : 0002"';
        CountryName: Text;
        RecCountry: Record "Country/Region";
        CountryRegion: Record "Country/Region";
        RecPaymentTerm: Record "Payment Terms";
        PaymentTermDesc: Text;
        port1: Text;
        //  Recport1: Record Port;
        Shiptoadd: Record "Ship-to Address";
        ShipCountryName: Text;
        BankAccount: Record "Bank Account";
        PostCode: Record "Post Code";
        Corresp: Text;
        Corresp1: Text;
        Corresp2: Text;
        PaymentTerms: Record "Payment Terms";
}

