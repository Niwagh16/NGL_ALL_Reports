// report 50081 "Certificate of origin-PCPL"
// {
//     // version PCPL-NS //PCPL/NSW/MIG 09Aug22

//     DefaultLayout = RDLC;
//     RDLCLayout = './Certificate of origin-PCPL.rdlc';

//     dataset
//     {
//         dataitem("Sales Invoice Header"; "Sales Invoice Header")
//         {
//             column(Comment; Comments)
//             {
//             }
//             column(Companyadd; FORMAT(CompanyInfo.Name) + ',' + FORMAT(CompanyInfo.Address) + ', ' + FORMAT(CompanyInfo."Address 2") + ', ' + FORMAT(CompanyInfo.City))
//             {
//             }
//             column(BillToAdd; "Sales Invoice Header"."Ship-to Name")
//             {
//             }
//             column(BilltoAdd2; "Sales Invoice Header"."Ship-to Address" + ',' + "Sales Invoice Header"."Ship-to Address 2" + ',' + "Sales Invoice Header"."Ship-to City" + '-' + "Sales Invoice Header"."Ship-to Post Code")
//             {
//             }
//             column(ModeOftransports; "Sales Invoice Header"."Shipment Method Code")
//             {
//             }
//             column(BilltoAddress2_SalesInvoiceHeader; "Sales Invoice Header"."Bill-to Address 2")
//             {
//             }
//             column(ShiptoCity_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to City")
//             {
//             }
//             column(ICPartnerCode; CompanyInfo."IC Partner Code")
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
//             column(noo; "Sales Invoice Header"."No.")
//             {
//             }
//             column(Postingdateinv; FORMAT("Sales Invoice Header"."No."))
//             {
//             }
//             column(PostingDateS; FORMAT("Sales Invoice Header"."Posting Date"))
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
//             column(Port_SalesInvoiceHeader; "Sales Invoice Header".Port)
//             {
//             }
//             column(BatchNo1; BatchNo1)
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
//             column(batch6; BatchNo[7])
//             {
//             }
//             column(batch7; BatchNo[8])
//             {
//             }
//             column(batch8; BatchNo[9])
//             {
//             }
//             column(batch9; BatchNo[10])
//             {
//             }
//             column(batch10; BatchNo[11])
//             {
//             }
//             column(batch11; BatchNo[12])
//             {
//             }
//             column(batch12; BatchNo[13])
//             {
//             }
//             column(batch13; BatchNo[14])
//             {
//             }
//             column(batch14; BatchNo[15])
//             {
//             }
//             column(batch15; BatchNo[16])
//             {
//             }
//             dataitem("Sales Invoice Line"; "Sales Invoice Line")
//             {
//                 DataItemLink = "Document No." = FIELD("No.");
//                 DataItemTableView = SORTING("Document No.", "Line No.")
//                                     ORDER(Ascending)
//                                     WHERE(Quantity = FILTER(<> 0));
//                 column(ExtenstedText; ExtenstedText)
//                 {
//                 }
//                 column(ItemDescription; "Sales Invoice Line".Description)
//                 {
//                 }
//                 column(Srno; SrNo)
//                 {
//                 }
//                 column(HSCODE; Item."HSN/SAC Code")
//                 {
//                 }

//                 trigger OnAfterGetRecord();
//                 begin
//                     SrNo := SrNo + 1;
//                     UOM := "Sales Invoice Line"."Unit of Measure Code";
//                     IF Item.GET("Sales Invoice Line"."No.") THEN;

//                     //pcpl0024 04 june 2019
//                     IF ExtendedLinePrint = TRUE THEN BEGIN
//                         CLEAR(ExtenstedText);
//                         RecextendedLine.RESET;
//                         RecextendedLine.SETRANGE(RecextendedLine."No.", "Sales Invoice Line"."No.");
//                         IF RecextendedLine.FINDSET THEN BEGIN
//                             REPEAT
//                                 ExtenstedText += RecextendedLine.Text + ' ';
//                             UNTIL RecextendedLine.NEXT = 0;
//                         END;
//                     END;
//                     //pcpl0024 04 june 2019
//                 end;

//                 trigger OnPreDataItem();
//                 begin
//                     SrNo := 0;
//                 end;
//             }
//             dataitem(DataItem1000000013; Table33001046)
//             {
//                 DataItemLink = No.=FIELD(No.),
//                                SO NO.=FIELD(Order No.);
//                 column(TotalNetwt;FORMAT(TotalNetwt)+' '+PackingListPackage."Weight UOM")
//                 {
//                 }
//                 column(PCNo;"No.")
//                 {
//                 }
//                 column(Marks_PackingListHeader;Marktext)
//                 {
//                 }
//                 column(NoOfPack;Drum)
//                 {
//                 }
//                 column(totqty;FORMAT(TotalQty)+' '+PackingListPackage."Weight UOM")
//                 {
//                 }
//                 column(Grosswt;FORMAT(PackageTotal)+' '+PackingListPackage."Weight UOM")
//                 {
//                 }
//                 column(From;FORMAT(1)+'/'+FORMAT(PackingListPackage."To Package No."))
//                 {
//                 }
//                 column(WeightUOM_PackingListPackageDetails;PackingListPackage."Weight UOM")
//                 {
//                 }
//                 dataitem(DataItem1000000014;Table33001048)
//                 {
//                     DataItemLink = Packing List No.=FIELD(No.);
//                 }

//                 trigger OnAfterGetRecord();
//                 begin
//                       PackingListPackage.RESET;
//                       PackingListPackage.SETRANGE(PackingListPackage."Packing List No.","No.");
//                       IF PackingListPackage.FINDSET THEN REPEAT
//                       //  Drum += (FORMAT(PackingListPackage."No. Of Packages")+' '+FORMAT(PackingListPackage."Kind of Packing"));
//                         Nodrum += PackingListPackage."No. Of Packages"; //+' '+PackingListPackage."Kind of Packing";
//                       Marktext := "Packing List Header".Marks;
//                       PackageTotal += (PackingListPackage."No. Of Packages" * PackingListPackage."Gross Wght. per Case");
//                       TotalQty += PackingListPackage."Total Quantity";
//                       TotalNetwt += PackingListPackage."Net Wght. per Case"*PackingListPackage."No. Of Packages";
//                       UNTIL  PackingListPackage.NEXT =0;
//                       Drum  := FORMAT(Nodrum) +' '+FORMAT(PackingListPackage."Kind of Packing");
//                 end;
//             }

//             trigger OnAfterGetRecord();
//             var
//                 SalesInvLine : Record "113";
//             begin
//                 IF PortfROM.GET("Sales Invoice Header".Port) THEN;
//                 IF PortOF.GET("Sales Invoice Header"."Port of Discharge") THEN;
//                 IF (PortfROM."Port Name"<>'') AND (PortOF."Port Name"<>'') THEN
//                   PortCap:=PortfROM."Port Name"+' TO '+PortOF."Port Name";
//                 IF Customer.GET("Sales Invoice Header"."Sell-to Customer No.") THEN;
//                 IF Location.GET("Sales Invoice Header"."Location Code") THEN;

//                 ExportOrder.RESET;
//                 ExportOrder.SETRANGE(ExportOrder."Invoice No.","Sales Invoice Header"."No.");
//                 IF ExportOrder.FINDFIRST THEN
//                 BEGIN
//                   BIllOfLadinno:=ExportOrder."Bill of Lading No.";
//                   Billofladindate:=ExportOrder."Bill of Lading Date";
//                   SHBLno := ExportOrder."Bill of Exchange No.";
//                   SHBLDate :=ExportOrder."Bill of Exchange Date";
//                 END;
//                 //PCPL/BRB
//                 //IF Location."Country/Region Code"
//                 IF Location.GET("Location Code") THEN
//                   IF CountryRegionrec.GET(Location."Country/Region Code") THEN
//                       ShipCountryName := CountryRegionrec.Name;
//                 IF Customer.GET("Bill-to Customer No.") THEN
//                     IF CountryRegionrec.GET(Customer."Country/Region Code") THEN
//                 //
//                 SalesInvLine.RESET;
//                 SalesInvLine.SETRANGE("Document No.","No.");
//                 IF SalesInvLine.FINDSET THEN REPEAT
//                     ItemLedgEntry.RESET;
//                     //ItemLedgEntry.SETRANGE("Document Type",ItemLedgEntry."Document Type"::"Sales Invoice");
//                     ItemLedgEntry.SETRANGE("Entry Type",ItemLedgEntry."Entry Type"::Sale);
//                     ItemLedgEntry.SETRANGE("External Document No.",SalesInvLine."Document No.");
//                     ItemLedgEntry.SETRANGE("Document Line No.",SalesInvLine."Line No.");
//                     IF ItemLedgEntry.FINDSET THEN REPEAT
//                     i+=1;
//                     IF LotNumber <> ItemLedgEntry."Lot No." THEN BEGIN
//                          LotNumber := ItemLedgEntry."Lot No.";
//                          BatchNo[i] := ItemLedgEntry."Lot No.";
//                          //BatchNo1 += ItemLedgEntry."Lot No."; //PCPL 0028/AVINASH
//                         // MESSAGE(FORMAT(BatchNo1));
//                     END;
//                   UNTIL ItemLedgEntry.NEXT = 0;
//                 UNTIL SalesInvLine.NEXT =0;
//                 IF CountryRegion.GET("Sales Invoice Header"."Country of Final Destination") THEN;
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
//                 field(Comments;Comments)
//                 {
//                 }
//                 field(ExtendedLinePrint;ExtendedLinePrint)
//                 {
//                     Caption = 'Extended Line Print';
//                 }
//             }
//         }

//         actions
//         {
//         }

//         trigger OnOpenPage();
//         begin
//             ExtendedLinePrint:=FALSE;//pcpl0024
//         end;
//     }

//     labels
//     {
//     }

//     var
//         CompanyInfo : Record "Company Information";
//         PortfROM : Record "33001050";
//         PortOF : Record "33001050";
//         PortCap : Text;
//         Customer : Record Customer;
//         PackingList : Record "33001046";
//         PackingListLine : Record "33001047";
//         PackingListPackage : Record "33001048";
//         SrNo : Integer;
//         Location : Record Location;
//         OrderNo : Text;
//         Drum : Text;
//         ExportOrderrec : Record "33001040";
//         BIllOfLadinno : Code[20];
//         Billofladindate : Date;
//         Item : Record Item;
//         CountryRegion : Record "Country/Region";
//         UOM : Text;
//         ValueEntry : Record "Value Entry";
//         ItemLedgEntry : Record "Item Ledger Entry";
//         Comments : Text;
//         Marktext : Text;
//         PackageTotal : Decimal;
//         TotalQty : Decimal;
//         BatchNo : array [23] of Text[250];
//         i : Integer;
//         Nodrum : Decimal;
//         TotalNetwt : Decimal;
//         ExportOrder : Record "33001041";
//         SHBLno : Text;
//         SHBLDate : Date;
//         Shiptoadd : Record "Ship-to Address";
//         CountryRegionrec : Record "Country/Region";
//         ShipCountryName : Text;
//         SalesInvLine : Record "Sales Invoice Line";
//         SalesInvHeader : Record "Sales Invoice Header";
//         BatchNo1 : Code[200];
//         shiph : Record "Sales Shipment Header";
//         shipl : Record "Sales Shipment Line";
//         ILE : Record "Item Ledger Entry";
//         LotNo : Code[100];
//         LotNumber : Text;
//         ExtendedLinePrint : Boolean;
//         RecextendedLine : Record "Extended Text Line";
//         ExtenstedText : Text[1024];
// }

