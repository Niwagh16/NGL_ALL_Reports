report 50006 "Generalized Of Preferences"
{
    // version PCPL-BRB

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Generalized Of Preferences.rdl';

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = SORTING(Number);
            dataitem("Sales Invoice Header"; "Sales Invoice Header")
            {
                DataItemTableView = SORTING("No.");
                //WHERE("Export Document"=CONST(Yes));
                RequestFilterFields = "No.";
                //ReqFilterHeading = 'Generalized System Of Preferences';
                column(txtShipToAddr_6_; txtShipToAddr[6])
                {
                }
                column(Sales_Invoice_Header__Pre_Carriage_; '')//"Pre-Carriage")
                {
                }
                column(Sales_Invoice_Header_Carriage; '')//Carriage)
                {
                }
                column(txtShipToAddr_5_; txtShipToAddr[5])
                {
                }
                column(txtShipToAddr_4_; txtShipToAddr[4])
                {
                }
                column(txtShipToAddr_3_; txtShipToAddr[3])
                {
                }
                column(txtShipToAddr_2_; txtShipToAddr[2])
                {
                }
                column(txtShipToAddr_1_; txtShipToAddr[1])
                {
                }
                column(txtCompanyAddr_6_; txtCompanyAddr[6])
                {
                }
                column(recCountry_Name; recCountry.Name)
                {
                }
                column(txtCompanyAddr_5_; txtCompanyAddr[5])
                {
                }
                column(txtCompanyAddr_4_; txtCompanyAddr[4])
                {
                }
                column(txtCompanyAddr_3_; txtCompanyAddr[3])
                {
                }
                column(txtCompanyAddr_2_; txtCompanyAddr[2])
                {
                }
                column(txtCompanyAddr_1_; txtCompanyAddr[1])
                {
                }
                column(V3__Means_of_transport_and_route___as_far_as_know__Caption; V3__Means_of_transport_and_route___as_far_as_know__CaptionLbl)
                {
                }
                column(V4__For_official_useCaption; V4__For_official_useCaptionLbl)
                {
                }
                column(country_Caption; country_CaptionLbl)
                {
                }
                column(V2__Goods_consigned_to_consignee_s_name__address_Caption; V2__Goods_consigned_to_consignee_s_name__address_CaptionLbl)
                {
                }
                column(Issued_InCaption; Issued_InCaptionLbl)
                {
                }
                column(FORM_ACaption; FORM_ACaptionLbl)
                {
                }
                column(Combined_declaration_and_certificate_Caption; Combined_declaration_and_certificate_CaptionLbl)
                {
                }
                column(OF_ORIGINCaption; OF_ORIGINCaptionLbl)
                {
                }
                column(GENERALIZED_SYSTEM_OF_PREFERENCES_CERTIFICATECaption; GENERALIZED_SYSTEM_OF_PREFERENCES_CERTIFICATECaptionLbl)
                {
                }
                column(name__address__country_Caption; name__address__country_CaptionLbl)
                {
                }
                column(V1__Goods_consigned_from__Exporters_business_Caption; V1__Goods_consigned_from__Exporters_business_CaptionLbl)
                {
                }
                column(Reference_No_Caption; Reference_No_CaptionLbl)
                {
                }
                column(GENERALIZED_SYSTEM_OF_PREFERENCES_CERTIFICATE_OF_ORIGINCaption; GENERALIZED_SYSTEM_OF_PREFERENCES_CERTIFICATE_OF_ORIGINCaptionLbl)
                {
                }
                column(Sales_Invoice_Header_No_; "No.")
                {
                }
                dataitem("Sales Invoice Line"; "Sales Invoice Line")
                {
                    DataItemLink = "Document No." = FIELD("No.");
                    DataItemTableView = SORTING("Document No.", "Line No.");
                    column(Sales_Invoice_Line__Gross_Weight_; "Gross Weight")
                    {
                    }
                    column(Sales_Invoice_Line_Description; Description)
                    {
                    }
                    column(Sales_Invoice_Line__No__; "No.")
                    {
                    }
                    column(codInvNo__; "codInvNo.")
                    {
                    }
                    column(datPostingDate; datPostingDate)
                    {
                    }
                    column(txtCountryName; txtCountryName)
                    {
                    }
                    column(intPackingListNo__; "intPackingListNo.")
                    {
                    }
                    column(txtCountryofOrigin; txtCountryofOrigin)
                    {
                    }
                    column(txtCountryofFinalDestination; txtCountryofFinalDestination)
                    {
                    }
                    column(of_InvoicesCaption; of_InvoicesCaptionLbl)
                    {
                    }
                    column(or_otherCaption; or_otherCaptionLbl)
                    {
                    }
                    column(weightCaption; weightCaptionLbl)
                    {
                    }
                    column(and_dateCaption; and_dateCaptionLbl)
                    {
                    }
                    column(see_noted_Overleaf__Caption; see_noted_Overleaf__CaptionLbl)
                    {
                    }
                    column(V8__Origin_CriterionCaption; V8__Origin_CriterionCaptionLbl)
                    {
                    }
                    column(V9__GrossCaption; V9__GrossCaptionLbl)
                    {
                    }
                    column(V10__NumberCaption; V10__NumberCaptionLbl)
                    {
                    }
                    column(V6__Number_and_Kind_of_Caption; V6__Number_and_Kind_of_CaptionLbl)
                    {
                    }
                    column(Packages__description_ofCaption; Packages__description_ofCaptionLbl)
                    {
                    }
                    column(goodsCaption; goodsCaptionLbl)
                    {
                    }
                    column(V7__Marks_andCaption; V7__Marks_andCaptionLbl)
                    {
                    }
                    column(Number_ofCaption; Number_ofCaptionLbl)
                    {
                    }
                    column(PackagesCaption; PackagesCaptionLbl)
                    {
                    }
                    column(V5__ItemCaption; V5__ItemCaptionLbl)
                    {
                    }
                    column(NumberCaption; NumberCaptionLbl)
                    {
                    }
                    column(of_InvoicesCaption_Control1280005; of_InvoicesCaption_Control1280005Lbl)
                    {
                    }
                    column(or_otherCaption_Control1280007; or_otherCaption_Control1280007Lbl)
                    {
                    }
                    column(weightCaption_Control1280009; weightCaption_Control1280009Lbl)
                    {
                    }
                    column(see_noted_Overleaf__Caption_Control1280010; see_noted_Overleaf__Caption_Control1280010Lbl)
                    {
                    }
                    column(and_dateCaption_Control1280011; and_dateCaption_Control1280011Lbl)
                    {
                    }
                    column(V8__Origin_CriterionCaption_Control1280014; V8__Origin_CriterionCaption_Control1280014Lbl)
                    {
                    }
                    column(V9__GrossCaption_Control1280015; V9__GrossCaption_Control1280015Lbl)
                    {
                    }
                    column(V10__NumberCaption_Control1280016; V10__NumberCaption_Control1280016Lbl)
                    {
                    }
                    column(V5__ItemCaption_Control1280024; V5__ItemCaption_Control1280024Lbl)
                    {
                    }
                    column(NumberCaption_Control1280025; NumberCaption_Control1280025Lbl)
                    {
                    }
                    column(PackagesCaption_Control1280013; PackagesCaption_Control1280013Lbl)
                    {
                    }
                    column(Number_ofCaption_Control1280017; Number_ofCaption_Control1280017Lbl)
                    {
                    }
                    column(Packages__description_ofCaption_Control1280018; Packages__description_ofCaption_Control1280018Lbl)
                    {
                    }
                    column(goodsCaption_Control1280019; goodsCaption_Control1280019Lbl)
                    {
                    }
                    column(V7__Marks_andCaption_Control1280020; V7__Marks_andCaption_Control1280020Lbl)
                    {
                    }
                    column(V6__Number_and_Kind_of_Caption_Control1280021; V6__Number_and_Kind_of_Caption_Control1280021Lbl)
                    {
                    }
                    column(Place_and_date_signature_and_stamp_ofCaption; Place_and_date_signature_and_stamp_ofCaptionLbl)
                    {
                    }
                    column(authorized_signatoryCaption; authorized_signatoryCaptionLbl)
                    {
                    }
                    column(of_Preferences_for_goods_exported_toCaption; of_Preferences_for_goods_exported_toCaptionLbl)
                    {
                    }
                    column(authorized_signatoryCaption_Control1280166; authorized_signatoryCaption_Control1280166Lbl)
                    {
                    }
                    column(Specified_for_those_goods_in_the_generalized_systemCaption; Specified_for_those_goods_in_the_generalized_systemCaptionLbl)
                    {
                    }
                    column(Place_and_date_signature_and_stamp_of_Caption; Place_and_date_signature_and_stamp_of_CaptionLbl)
                    {
                    }
                    column(And_that_they_comply_with_the_original_requirementsCaption; And_that_they_comply_with_the_original_requirementsCaptionLbl)
                    {
                    }
                    column(the_exporter_is_correct_Caption; the_exporter_is_correct_CaptionLbl)
                    {
                    }
                    column(were_Produced_inCaption; were_Produced_inCaptionLbl)
                    {
                    }
                    column(carried_out__that_the_declaration_by_Caption; carried_out__that_the_declaration_by_CaptionLbl)
                    {
                    }
                    column(details_and_statement_are_correct__that_all_the_goodsCaption; details_and_statement_are_correct__that_all_the_goodsCaptionLbl)
                    {
                    }
                    column(It_is_hereby_certified__on_the_basis_of_controlCaption; It_is_hereby_certified__on_the_basis_of_controlCaptionLbl)
                    {
                    }
                    column(The_undersigned_hereby_declare_that_the_above_Caption; The_undersigned_hereby_declare_that_the_above_CaptionLbl)
                    {
                    }
                    column(V11__CertificationCaption; V11__CertificationCaptionLbl)
                    {
                    }
                    column(V12__Declaration_by_the_exporterCaption; V12__Declaration_by_the_exporterCaptionLbl)
                    {
                    }
                    column(Sales_Invoice_Line_Document_No_; "Document No.")
                    {
                    }
                    column(Sales_Invoice_Line_Line_No_; "Line No.")
                    {
                    }
                    dataitem("Extended Text Line"; "Extended Text Line")
                    {
                        DataItemLink = "No." = FIELD("No.");
                        DataItemTableView = SORTING("Table Name", "No.", "Language Code", "Text No.", "Line No.");
                        column(Extended_Text_Line__Extended_Text_Line__Text; "Extended Text Line".Text)
                        {
                        }
                        column(Extended_Text_Line_Table_Name; "Table Name")
                        {
                        }
                        column(Extended_Text_Line_No_; "No.")
                        {
                        }
                        column(Extended_Text_Line_Language_Code; "Language Code")
                        {
                        }
                        column(Extended_Text_Line_Text_No_; "Text No.")
                        {
                        }
                        column(Extended_Text_Line_Line_No_; "Line No.")
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            recItem.SETRANGE(recItem."No.", "Extended Text Line"."No.");
                            IF recItem.FIND('-') THEN
                                IF NOT recItem."Automatic Ext. Texts" THEN
                                    CurrReport.SKIP;
                        end;
                    }

                    trigger OnAfterGetRecord();
                    begin
                        IF (Type = 0) AND (Quantity = 0) THEN
                            CurrReport.SKIP;
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    IF recCompanyInfo.GET(recCompanyInfo."Primary Key") THEN;
                    // cduFormatAddr.Company(txtCompanyAddr, recCompanyInfo); //PCPL/NSW/MIG 09Aug22

                    //  cduFormatAddr.SalesInvShipTo(txtShipToAddr,"Sales Invoice Header"); //PCPL-Deepak

                    //cduExim.fctTotalPkgs("Packing List No.","intPackingListNo."); //PCPL-Deepak

                    //added from 2009 report section
                    //added from 2009 report section
                    /*IF recCountry.GET(recCompanyInfo."Country/Region Code") THEN;

                    IF recCountry.GET("Country of Final Destination") THEN
                      txtCountryofFinalDestination := recCountry.Name;

                    IF recCountry.GET("Country of Origin of Goods") THEN
                      txtCountryofOrigin := recCountry.Name;

                    IF recCountry.GET(recCompanyInfo."Country/Region Code") THEN
                      txtCountryName := recCountry.Name;*/ //PCPL-Deepak

                    "codInvNo." := "Sales Invoice Header"."No.";
                    datPostingDate := "Posting Date";
                end;
            }

            trigger OnPreDataItem();
            begin
                intNoOfLoops := ABS(intNoOfCopies) + 1;
                SETRANGE(Number, 1, intNoOfLoops);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(General)
                {
                    field("No of Copies"; intCtr)
                    {

                        trigger OnValidate();
                        begin
                            intNoOfCopies := intCtr;
                            IF intNoOfCopies = 0 THEN
                                intNoOfCopies := 1
                            ELSE
                                intNoOfCopies := intNoOfCopies - 1;
                        end;
                    }
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

    var
        recItem: Record Item;
        recCompanyInfo: Record "Company Information";
        recCountry: Record "Country/Region";
        //cduExim: Codeunit "33001004";
        // cduFormatAddr: Codeunit 365;
        txtCompanyAddr: array[8] of Text[50];
        txtShipToAddr: array[8] of Text[50];
        intNoOfCopies: Integer;
        intNoOfLoops: Integer;
        intCtr: Integer;
        "codInvNo.": Code[20];
        datPostingDate: Date;
        "intPackingListNo.": Integer;
        txtCountryofFinalDestination: Text[50];
        txtCountryofOrigin: Text[50];
        txtCountryName: Text[50];
        V3__Means_of_transport_and_route___as_far_as_know__CaptionLbl: Label '3. Means of transport and route ( as far as know )';
        V4__For_official_useCaptionLbl: Label '4. For official use';
        country_CaptionLbl: Label 'country)';
        V2__Goods_consigned_to_consignee_s_name__address_CaptionLbl: Label '2. Goods consigned to consignee''s name, address,';
        Issued_InCaptionLbl: Label 'Issued In';
        FORM_ACaptionLbl: Label 'FORM A';
        Combined_declaration_and_certificate_CaptionLbl: Label '(Combined declaration and certificate)';
        OF_ORIGINCaptionLbl: Label 'OF ORIGIN';
        GENERALIZED_SYSTEM_OF_PREFERENCES_CERTIFICATECaptionLbl: Label 'GENERALIZED SYSTEM OF PREFERENCES CERTIFICATE';
        name__address__country_CaptionLbl: Label 'name, address, country)';
        V1__Goods_consigned_from__Exporters_business_CaptionLbl: Label '"1. Goods consigned from (Exporters business "';
        Reference_No_CaptionLbl: Label 'Reference No.';
        GENERALIZED_SYSTEM_OF_PREFERENCES_CERTIFICATE_OF_ORIGINCaptionLbl: Label 'GENERALIZED SYSTEM OF PREFERENCES CERTIFICATE OF ORIGIN';
        of_InvoicesCaptionLbl: Label 'of Invoices';
        or_otherCaptionLbl: Label 'or other';
        weightCaptionLbl: Label 'weight';
        and_dateCaptionLbl: Label 'and date';
        see_noted_Overleaf__CaptionLbl: Label '( see noted Overleaf )';
        V8__Origin_CriterionCaptionLbl: Label '8. Origin Criterion';
        V9__GrossCaptionLbl: Label '9. Gross';
        V10__NumberCaptionLbl: Label '10. Number';
        V6__Number_and_Kind_of_CaptionLbl: Label '"6. Number and Kind of "';
        Packages__description_ofCaptionLbl: Label '"Packages; description of"';
        goodsCaptionLbl: Label 'goods';
        V7__Marks_andCaptionLbl: Label '7. Marks and';
        Number_ofCaptionLbl: Label '" Number of"';
        PackagesCaptionLbl: Label 'Packages';
        V5__ItemCaptionLbl: Label '5. Item';
        NumberCaptionLbl: Label 'Number';
        of_InvoicesCaption_Control1280005Lbl: Label 'of Invoices';
        or_otherCaption_Control1280007Lbl: Label 'or other';
        weightCaption_Control1280009Lbl: Label 'weight';
        see_noted_Overleaf__Caption_Control1280010Lbl: Label '( see noted Overleaf )';
        and_dateCaption_Control1280011Lbl: Label 'and date';
        V8__Origin_CriterionCaption_Control1280014Lbl: Label '8. Origin Criterion';
        V9__GrossCaption_Control1280015Lbl: Label '9. Gross';
        V10__NumberCaption_Control1280016Lbl: Label '10. Number';
        V5__ItemCaption_Control1280024Lbl: Label '5. Item';
        NumberCaption_Control1280025Lbl: Label 'Number';
        PackagesCaption_Control1280013Lbl: Label 'Packages';
        Number_ofCaption_Control1280017Lbl: Label '" Number of"';
        Packages__description_ofCaption_Control1280018Lbl: Label '"Packages; description of"';
        goodsCaption_Control1280019Lbl: Label 'goods';
        V7__Marks_andCaption_Control1280020Lbl: Label '7. Marks and';
        V6__Number_and_Kind_of_Caption_Control1280021Lbl: Label '"6. Number and Kind of "';
        Place_and_date_signature_and_stamp_ofCaptionLbl: Label 'Place and date signature and stamp of';
        authorized_signatoryCaptionLbl: Label 'authorized signatory';
        of_Preferences_for_goods_exported_toCaptionLbl: Label '" of Preferences for goods exported to"';
        authorized_signatoryCaption_Control1280166Lbl: Label 'authorized signatory';
        Specified_for_those_goods_in_the_generalized_systemCaptionLbl: Label 'Specified for those goods in the generalized system';
        Place_and_date_signature_and_stamp_of_CaptionLbl: Label '"Place and date signature and stamp of "';
        And_that_they_comply_with_the_original_requirementsCaptionLbl: Label 'And that they comply with the original requirements';
        the_exporter_is_correct_CaptionLbl: Label 'the exporter is correct.';
        were_Produced_inCaptionLbl: Label 'were Produced in';
        carried_out__that_the_declaration_by_CaptionLbl: Label '"carried out, that the declaration by "';
        details_and_statement_are_correct__that_all_the_goodsCaptionLbl: Label '"details and statement are correct; that all the goods"';
        It_is_hereby_certified__on_the_basis_of_controlCaptionLbl: Label 'It is hereby certified, on the basis of control';
        The_undersigned_hereby_declare_that_the_above_CaptionLbl: Label '"The undersigned hereby declare that the above "';
        V11__CertificationCaptionLbl: Label '11. Certification';
        V12__Declaration_by_the_exporterCaptionLbl: Label '12. Declaration by the exporter';
}

