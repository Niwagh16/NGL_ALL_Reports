report 50078 "INTER UNIT TRASFER SHIPMENT"
{
    // version RSPL/DEFAULT/NAV2013R2/0015

    // Report Name:Large Label-1
    // Company:Urdhwa
    // Date: 30-01-2013
    // Prepared By: Gunjan Mittal
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\INTER UNIT TRASFER SHIPMENT.rdl';


    dataset
    {
        dataitem(Copyloop; Integer)
        {
            DataItemTableView = SORTING(Number);
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            dataitem("Transfer Shipment Header"; "Transfer Shipment Header")
            {
                DataItemTableView = SORTING("No.")
                                    ORDER(Ascending);
                RequestFilterFields = "No.";
                column(Dylabel; Dylabel)
                {
                }
                column(TSH_toloc; FORMAT(' ') + FORMAT(("Transfer Shipment Header"."Transfer-to Name") + FORMAT(' ') + FORMAT("Transfer Shipment Header"."Transfer-to Name 2")))
                {
                }
                column(TSH_toloc2; ("Transfer Shipment Header"."Transfer-to Address") + FORMAT(' ') + FORMAT("Transfer Shipment Header"."Transfer-to Address 2") + FORMAT(' ') + FORMAT("Transfer Shipment Header"."Transfer-to City"))
                {
                }
                column(TransferShipmentHeader_Sum; FORMAT(' ') + FORMAT(("Transfer Shipment Header"."Transfer-from Name") + FORMAT('  ') + FORMAT("Transfer Shipment Header"."Transfer-from Name 2")))
                {
                }
                column(TransferShipmentHeader_Sum2; ("Transfer Shipment Header"."Transfer-from Address") + FORMAT('  ') + FORMAT("Transfer Shipment Header"."Transfer-from Address 2") + FORMAT(' ') + FORMAT("Transfer Shipment Header"."Transfer-from City"))
                {
                }
                column(locrang; locrang)
                {
                }
                column(locdivision; locdivision)
                {
                }
                column(loccom; loccom)
                {
                }
                column(locecc; locecc)
                {
                }
                column(CompanyInformation_CE_Range; '') //CompanyInformation."C.E. Range") //PCPL-Deepak
                {
                }
                column(Companyinformation_CE_Division; '') //CompanyInformation."C.E. Division") //PCPL-Deepak
                {
                }
                column(CompanyInformation_CE_Commissionerate; '') //CompanyInformation."C.E. Commissionerate") //PCPL-Deepak
                {
                }
                column(TransferShipmentHeader_JW_Delivery_Challan; '') //"Transfer Shipment Header"."JW Delivery Challan") //PCPL-Deepak
                {
                }
                column(TransferShipmentHeader_PostingDate; "Transfer Shipment Header"."Posting Date")
                {
                }
                column(TransferShipment_No; "Transfer Shipment Header"."No.")
                {
                }
                column(Vendor_Name; FORMAT(Vendor.Name) + FORMAT(Vendor."Name 2"))
                {
                }
                column(Vendor_Address; FORMAT(Vendor.Address) + FORMAT(' ') + FORMAT(Vendor."Address 2"))
                {
                }
                column(Manufacturing; FORMAT("Manufacturing of"))
                {
                }
                dataitem("Transfer Shipment Line"; "Transfer Shipment Line")
                {
                    DataItemLink = "Document No." = FIELD("No.");
                    column(TSH_NatueofMov; '')
                    {
                    }
                    column(Double_Quotes; '')
                    {
                    }
                    column(Badlapur_Thane; 'Badlapur (E), Dist.:- Thane')
                    {
                    }
                    column(TransferShipmentHeader_VehicleNo; "Transfer Shipment Header"."Vehicle No.")
                    {
                    }
                    column(TransferShipmentHeader_Insured; '')
                    {
                    }
                    column(Txt1; Txt1)
                    {
                    }
                    column(Txt2; Txt2)
                    {
                    }
                    column(Txt3; Txt3)
                    {
                    }
                    column(Txt4; Txt4)
                    {
                    }
                    column(Txt5; Txt5)
                    {
                    }
                    column(Txt6; Txt6)
                    {
                    }
                    column(Txt7; Txt7)
                    {
                    }
                    column(Txt8; Txt8)
                    {
                    }
                    column(Txt9; Txt9)
                    {
                    }
                    column(Txt10; Txt10)
                    {
                    }
                    column(Txt11; Txt11)
                    {
                    }
                    column(Item_Code; "Transfer Shipment Line"."Item No.")
                    {
                    }
                    column(Description; Description)
                    {
                    }
                    column(Unit_of_Measure; "Unit of Measure")
                    {
                    }
                    column(TransferShipmentLine_Quantity; "Transfer Shipment Line".Quantity)
                    {
                    }
                    column(Tariff_No; "Tariff No")
                    {
                    }
                    column(Unit_Price; "Unit Price")
                    {
                    }
                    column(Amount; Amount)
                    {
                    }
                    column(TransferShipmentLine_No_of_Packing; '')
                    {
                    }
                    column(TSL_EPPG; '') //"Transfer Shipment Line"."Excise Prod. Posting Group") //PCPL-Deepak
                    {
                    }
                    dataitem("Item Ledger Entry"; "Item Ledger Entry")
                    {
                        DataItemLink = "Item No." = FIELD("Item No."),
                                       "Document No." = FIELD("Document No."),
                                       "Location Code" = FIELD("Transfer-from Code");
                        column(Qty; ABS(Qty))
                        {
                        }
                        column(UnitPrice; UnitPrice)
                        {
                        }
                        column(Lot_No; "Lot No.")
                        {
                        }
                        column(vAmount; vAmount)
                        {
                        }
                        column(Srno; Srno)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            Srno += 1;

                            Qty := "Item Ledger Entry".Quantity;
                            //UnitPrice:=
                            vAmount := ABS(Qty) * "Transfer Shipment Line"."Unit Price";
                        end;
                    }

                    trigger OnAfterGetRecord();
                    begin
                        // EPPG.RESET;
                        // EPPG.SETRANGE(Code, "Transfer Shipment Line"."Excise Prod. Posting Group");
                        // IF EPPG.FINDFIRST THEN
                        //     EPPGName := EPPG.Description;
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    Location.RESET;
                    Location.SETRANGE(Location.Code, "Transfer Shipment Header"."Transfer-from Code");
                    IF Location.FINDFIRST THEN BEGIN
                        //locname:=Location.Name;
                        //locadd := Location.Address;
                        //locadd1 := Location."Address 2";
                        //locadd2 := Location.City;
                        //locadd3 := Location."Post Code";
                        //loctel := Location."Phone No.";
                        //locfax := Location."E-Mail";
                        //loctin := Location."T.I.N. No.";
                        //loccst := Location."C.S.T No.";
                        //locecc:=Location."E.C.C. No.";
                        //locser:=Location."Service Tax Registration No.";
                        // locrang := Location."C.E. Range";
                        // locdivision := Location."C.E. Division";
                        // loccom := Location."C.E. Commissionerate";
                        //LocCon:=Location.Contact;
                        //LocMob:=Location."Phone No. 2";
                        //LocMail:=Location."Fax No.";
                        //locecc := Location."E.C.C. No.";
                    END;
                end;
            }

            trigger OnAfterGetRecord();
            begin

                Srno := 0;
                /*IF Number > 1 THEN
                  CopyText := Text000;
                CurrReport.PAGENO := 1;
                */
                IF Number = 1 THEN BEGIN

                    Dylabel := 'Original';


                END;


                IF Number = 2 THEN BEGIN

                    Dylabel := 'Duplicate';

                END;


                IF Number = 3 THEN BEGIN

                    Dylabel := 'Triplicate';

                END;


                IF Number = 4 THEN BEGIN

                    Dylabel := 'Gate Pass';

                END;

            end;

            trigger OnPreDataItem();
            begin

                IF CompanyInfo.GET THEN;



                Number := 0;
                NoOfLoops := ABS(NoOfCopies);
                CopyText := '';
                IF NoOfLoops <= 0 THEN
                    NoOfLoops := 1;

                SETRANGE(Number, 1, NoOfLoops);
                Srno := 0;
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
        Vendor: Record Vendor;
        ItemLedgerEntry: Record "Item Ledger Entry";
        VendAddr: array[8] of Text[50];
        //  FormatAddr: Codeunit 365;
        "Sum": Decimal;
        TotalQuantity: Decimal;
        TotalReworkQty: Decimal;
        TotalExciseAmount: Decimal;
        TotalCost: Decimal;
        CostAmount: Decimal;
        CompanyInformation: Record "Company Information";
        DeliveryChallanFilters: Text[250];
        "Tariff No": Text[30];
        CompanyInfo: Record "Company Information";
        itm: Record Item;
        Dylabel: Text[30];
        NoOfLoops: Integer;
        NoOfCopies: Integer;
        CopyText: Text[30];
        RecILE: Record "Item Ledger Entry";
        Srno: Integer;
        Location: Record Location;
        Txt1: Label '1.Description of the Processed Inputs/Capital Goods Returned Back';
        Txt2: Label '2.Quanitity Returned';
        Txt3: Label '3.Waste and Scrap Returned';
        Txt4: Label '4.Waste and Scrap non-recoverable';
        Txt5: Label '1.Quantity of Inputs/Partially Processed Inputs/Capital Goods Not reveived within 180 days';
        "Manufacturing of": Integer;
        Description: Text;
        "Unit of Measure": Decimal;
        "Unit Price": Decimal;
        Amount: Decimal;
        locrang: Code[50];
        locdivision: Code[50];
        loccom: Code[50];
        // EPPG: Record "Excise Prod. Posting Group";
        EPPGName: Text[30];
        Txt6: Label '2.Value of Such Goods';
        Txt7: Label '3.Amt. To Be debited of above said Value';
        Txt8: Label '4.Debit Entry No. & date';
        Txt9: Label '5.Qty. Reveived subsequently';
        Txt10: Label '6.Amount of Credit restored';
        Txt11: Label '7.Credit Entry No. & Date';
        locecc: Code[20];
        UnitPrice: Decimal;
        Qty: Decimal;
        vAmount: Decimal;
}

