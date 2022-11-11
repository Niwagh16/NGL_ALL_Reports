// report 50010 "Pre Generalized Of Preferences"
// {
//     // version PCPL-NS //PCPL/NSW/MIG 09Aug22

//     DefaultLayout = RDLC;
//     RDLCLayout = 'src/Pre Generalized Of Preferences.rdl';

//     dataset
//     {
//         dataitem("Sales Header"; "Sales Header")
//         {
//             column(Comment1; Comments[1])
//             {
//             }
//             column(Comment2; Comments[2])
//             {
//             }
//             column(Comment3; Comments[3])
//             {
//             }
//             column(Comment4; Comments[4])
//             {
//             }
//             column(Companyadd; FORMAT(CompanyInfo.Name) + ',' + FORMAT(CompanyInfo.Address) + ', ' + FORMAT(CompanyInfo."Address 2") + ', ' + FORMAT(CompanyInfo.City))
//             {
//             }
//             column(BillToAdd; "Ship-to Name")
//             {
//             }
//             column(BilltoAdd2; "Ship-to Address" + ',' + "Ship-to Address 2" + ',' + "Ship-to City")
//             {
//             }
//             column(ModeOftransports; "Shipment Method Code")
//             {
//             }
//             column(BilltoAddress2_SalesInvoiceHeader; "Bill-to Address 2")
//             {
//             }
//             column(ShiptoCity_SalesInvoiceHeader; "Ship-to City")
//             {
//             }
//             column(ShipCountryName; ShipCountryName)
//             {
//             }
//             column(CountryRegion_Name; CountryRegion.Name)
//             {
//             }
//             column(Port; PortCap)
//             {
//             }
//             column(LocCountry; Location."Country/Region Code")
//             {
//             }
//             column(LocationAdd; Location.Name)
//             {
//             }
//             column(LocationAdd2; Location.Address + '' + Location."Address 2" + ',' + Location.City)
//             {
//             }
//             column(CustName; Customer.Name)
//             {
//             }
//             column(TransactionType_SalesHeader; "Sales Header"."Transaction Type")
//             {
//             }
//             column(SalesPerson_Name; SalespersonCode.Name)
//             {
//             }
//             column(DocumentDate_SalesHeader; "Sales Header"."Document Date")
//             {
//             }
//             column(noo; "No.")
//             {
//             }
//             column(Postingdateinv; FORMAT("No."))
//             {
//             }
//             column(PostingDateS; FORMAT("Posting Date"))
//             {
//             }
//             column(BILLOFLADINGNO; BIllOfLadinno)
//             {
//             }
//             column(bILLOFLANDINGDATE; Billofladindate)
//             {
//             }
//             column(SHBLno; SHBLno)
//             {
//             }
//             column(SHBLDate; SHBLDate)
//             {
//             }
//             column(CompanyName; CompanyInfo.Name)
//             {
//             }
//             column(Countryoffinal; CountryRegion.Name)
//             {
//             }
//             column(Port_SalesInvoiceHeader; '')// Port) //PCPL/NSW/MIG  03Aug22
//             {
//             }
//             column(bATCH; BatchNo[1])
//             {
//             }
//             column(batch1; BatchNo[2])
//             {
//             }
//             column(batch2; BatchNo[3])
//             {
//             }
//             column(batch3; BatchNo[4])
//             {
//             }
//             column(batch4; BatchNo[5])
//             {
//             }
//             column(batch5; BatchNo[6])
//             {
//             }
//             column(doubleco; doubleco)
//             {
//             }
//             column(batch6; BatchNo[7])
//             {
//             }
//             dataitem("Sales Line"; "Sales Line")
//             {
//                 DataItemLink = "Document No." = FIELD("No.");
//                 column(ItemDescription; Description)
//                 {
//                 }
//                 column(Srno; SrNo)
//                 {
//                 }
//                 column(HSCODE; Item."HSN/SAC Code")
//                 {
//                 }
//                 column(GrossWeight_SalesLine; "Sales Line"."Gross Weight")
//                 {
//                 }
//                 column(codInvNo__; "codInvNo.")
//                 {
//                 }
//                 column(intPackingListNo__; "intPackingListNo.")
//                 {
//                 }
//                 column(datPostingDate; datPostingDate)
//                 {
//                 }
//                 dataitem(DataItem1000000013; Table33001046)
//                 {
//                     DataItemLink = "No." = FIELD("Document No.");
//                     column(PackageTotal; TotalNetwt)
//                     {
//                     }
//                     column(TotalNetwt; FORMAT(TotalNetwt) + ' ' + PackingListPackage."Weight UOM")
//                     {
//                     }
//                     column(PCNo; "No.")
//                     {
//                     }
//                     column(Marks_PackingListHeader; Marktext)
//                     {
//                     }
//                     column(NoOfPack; Drum)
//                     {
//                     }
//                     column(totqty; FORMAT(TotalQty) + ' ' + PackingListPackage."Weight UOM")
//                     {
//                     }
//                     column(Grosswt; FORMAT(PackageTotal) + ' ' + PackingListPackage."Weight UOM")
//                     {
//                     }
//                     column(WeightUom; PackingListPackage."Weight UOM")
//                     {
//                     }
//                     column(From; FORMAT(1) + '/' + FORMAT(PackingListPackage."To Package No."))
//                     {
//                     }
//                     column(WeightUOM_PackingListPackageDetails; PackingListPackage."Weight UOM")
//                     {
//                     }
//                     dataitem(DataItem1000000014; Table33001048)
//                     {
//                         DataItemLink = Packing List No.=FIELD(No.);
//                         column(decGrossWeight; "Packing List Package Details"."Gross Wght. per Case" * "Packing List Package Details"."No. Of Packages")
//                         {
//                             DecimalPlaces = 2 : 5;
//                         }
//                     }

//                     trigger OnAfterGetRecord();
//                     begin
//                         CLEAR(PackageTotal);
//                         /*PackingListPackage.RESET;
//                         PackingListPackage.SETRANGE(PackingListPackage."Packing List No.","No.");
//                         IF PackingListPackage.FINDSET THEN REPEAT
//                           Nodrum += PackingListPackage."No. Of Packages";
//                         Marktext := "Packing List Header".Marks;
//                         PackageTotal += (PackingListPackage."No. Of Packages" * PackingListPackage."Gross Wght. per Case");
//                         TotalQty += PackingListPackage."Total Quantity";
//                         TotalNetwt += PackingListPackage."Net Wght. per Case"*PackingListPackage."No. Of Packages";
//                         UNTIL  PackingListPackage.NEXT =0;
//                         Drum  := FORMAT(Nodrum) +' '+FORMAT(PackingListPackage."Kind of Packing"); */ //PCPL-Deepak
//                     end;
//                 }

//                 trigger OnAfterGetRecord();
//                 begin
//                     SrNo := SrNo + 1;
//                     UOM := "Sales Line"."Unit of Measure Code";
//                     IF Item.GET("Sales Line"."No.") THEN;
//                 end;

//                 trigger OnPreDataItem();
//                 begin
//                     SrNo := 0;
//                 end;
//             }

//             trigger OnAfterGetRecord();
//             begin
//                 /* IF PortfROM.GET("Sales Header".Port) THEN;
//                  IF PortOF.GET("Sales Header"."Port of Discharge") THEN;
//                  IF (PortfROM."Port Name"<>'') AND (PortOF."Port Name"<>'') THEN
//                    PortCap:=PortfROM."Port Name"+' TO '+PortOF."Port Name";
//                  IF Customer.GET("Sales Header"."Sell-to Customer No.") THEN;
//                  IF Location.GET("Sales Header"."Location Code") THEN;

//                  cduExim.fctTotalPkgs("Packing List No.","intPackingListNo.");

//                  ExportOrder.RESET;
//                  ExportOrder.SETRANGE(ExportOrder."Invoice No.","Sales Header"."No.");
//                  IF ExportOrder.FINDFIRST THEN
//                  BEGIN
//                    BIllOfLadinno:=ExportOrder."Bill of Lading No.";
//                    Billofladindate:=ExportOrder."Bill of Lading Date";
//                    SHBLno := ExportOrder."Bill of Exchange No.";
//                    SHBLDate :=ExportOrder."Bill of Exchange Date";
//                  END;*/
//                 //PCPL-Deepak

//                 //PCPL/BRB
//                 IF SalespersonCode.GET("Salesperson Code") THEN;
//                 i := 0;
//                 SalesCommment.RESET;
//                 SalesCommment.SETRANGE("Document Type", SalesCommment."Document Type"::Invoice);
//                 SalesCommment.SETRANGE("No.", "No.");
//                 IF SalesCommment.FINDSET THEN
//                     REPEAT
//                         i += 1;
//                         Comments[i] := SalesCommment.Comment;
//                     UNTIL SalesCommment.NEXT = 0;
//                 //IF Location."Country/Region Code"
//                 IF Location.GET("Location Code") THEN
//                     IF CountryRegionrec.GET(Location."Country/Region Code") THEN
//                         ShipCountryName := CountryRegionrec.Name;
//                 IF Customer.GET("Bill-to Customer No.") THEN
//                     IF CountryRegionrec.GET(Customer."Country/Region Code") THEN
//                         //

//                         //IF CountryRegion.GET("Sales Header"."Country of Final Destination") THEN; //PCPL-Deepak
//                 i := 0;
//                 ValueEntry.RESET;
//                 ValueEntry.SETRANGE("Document No.", "No.");
//                 ValueEntry.SETRANGE("Document Type", ValueEntry."Document Type"::"Sales Invoice");
//                 IF ValueEntry.FINDSET THEN
//                     REPEAT
//                         ItemLedgEntry.GET(ValueEntry."Item Ledger Entry No.");
//                         IF ItemLedgEntry."Document Type" = ItemLedgEntry."Document Type"::"Sales Shipment" THEN
//                             i += 1;
//                         BatchNo[i] := ItemLedgEntry."Lot No.";

//                     UNTIL ValueEntry.NEXT = 0;
//                 "codInvNo." := "Sales Header"."No.";
//                 datPostingDate := "Posting Date";
//                 doubleco := '"';
//             end;

//             trigger OnPreDataItem();
//             begin

//                 CompanyInfo.GET;
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 field(Comments1; Comments[1])
//                 {
//                 }
//             }
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     var
//         CompanyInfo: Record "Company Information";
//         //PortfROM : Record "33001050";
//         //PortOF : Record "33001050"; //PCPL-Deepak
//         PortCap: Text;
//         Customer: Record Customer;
//         // PackingList : Record "33001046";
//         // PackingListLine : Record "33001047";
//         // PackingListPackage : Record "33001048"; //PCPL-Deepak
//         SrNo: Integer;
//         Location: Record Location;
//         OrderNo: Text;
//         Drum: Text;
//         //ExportOrderrec : Record "33001040"; //PCPL-Deepak
//         BIllOfLadinno: Code[20];
//         Billofladindate: Date;
//         Item: Record Item;
//         CountryRegion: Record "Country/Region";
//         UOM: Text;
//         ValueEntry: Record "Value Entry";
//         ItemLedgEntry: Record "Item Ledger Entry";
//         Comments: array[8] of Text;
//         Marktext: Text;
//         PackageTotal: Decimal;
//         TotalQty: Decimal;
//         BatchNo: array[10] of Text;
//         i: Integer;
//         Nodrum: Decimal;
//         TotalNetwt: Decimal;
//         //ExportOrder : Record "33001041"; //PCPL-Deepak
//         SHBLno: Text;
//         SHBLDate: Date;
//         Shiptoadd: Record "Ship-to Address";
//         CountryRegionrec: Record "Country/Region";
//         ShipCountryName: Text;
//         "codInvNo.": Code[20];
//         datPostingDate: Date;
//         //cduExim : Codeunit "33001004"; //PCPL-Deepak
//         "intPackingListNo.": Integer;
//         SalesCommment: Record "Sales Comment Line";
//         doubleco: Text[30];
//         SalespersonCode: Record "Salesperson/Purchaser";
//         TransctionCode: Record "Transaction Type";
// }

