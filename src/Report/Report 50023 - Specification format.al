report 50023 "Specification format"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Specification format.rdl';

    dataset
    {
        dataitem("Specification Header"; "Specification Header")
        {
            RequestFilterFields = "Specs ID";
            column(SpecsID_SpecificationHeader; "Specification Header"."Specs ID")
            {
            }
            column(Description_SpecificationHeader; "Specification Header".Description)
            {
            }
            column(VersionNos_SpecificationHeader; "Specification Header"."Version Nos.")
            {
            }
            column(Status_SpecificationHeader; "Specification Header".Status)
            {
            }
            column(LastDateModified_SpecificationHeader; "Specification Header"."Last Date Modified")
            {
            }
            column(CreationDate_SpecificationHeader; "Specification Header"."Creation Date")
            {
            }
            column(CreatedBy_SpecificationHeader; "Specification Header"."Created By")
            {
            }
            column(ModifiedBy_SpecificationHeader; "Specification Header"."Modified By")
            {
            }
            column(logo; CompanyInfo.Picture)
            {
            }
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(CompanyInfo_add; CompanyInfo.Address)
            {
            }
            column(CompanyInfo_add2; CompanyInfo."Address 2")
            {
            }
            column(CompanyInfo_city; CompanyInfo.City)
            {
            }
            column(CompanyInfo_PhNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyInfo_Postcode; CompanyInfo."Post Code")
            {
            }
            column(CompanyInfo_HomePage; CompanyInfo."Home Page")
            {
            }
            column(Address; CompanyInfo.Address + ' ' + CompanyInfo."Address 2" + ',' + CompanyInfo.City + '-' + CompanyInfo."Post Code" + ' ,Maharashtra,  ' + 'India.')
            {
            }
            column(Adresss123; 'Tel.:(+91 22)' + CompanyInfo."Phone No." + ' ' + 'Email:' + CompanyInfo."E-Mail" + ' CIN: L24110MH1981PLC025884,' + ' ' + 'Website:' + CompanyInfo."Home Page")
            {
            }
            column(CompanyInfo_mail; CompanyInfo."E-Mail")
            {
            }
            dataitem("Specification Details"; "Specification Details")
            {
                DataItemLink = "Specs ID" = FIELD("Specs ID");
                DataItemTableView = WHERE("Account Type" = FILTER(Posting));
                column(SpecsID_SpecificationDetails; "Specification Details"."Specs ID")
                {
                }
                column(Description_SpecificationDetails; "Specification Details".Description)
                {
                }
                column(SrNo; SrNo)
                {
                }
                column(TextValue_SpecificationDetails; "Specification Details"."Text Value")
                {
                }

                trigger OnAfterGetRecord();
                begin
                    SrNo += 1;
                end;
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

    trigger OnInitReport();
    begin
        CompanyInfo.GET();
    end;

    var
        CompanyInfo: Record "Company Information";
        SrNo: Integer;
}

