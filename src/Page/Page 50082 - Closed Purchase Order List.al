page 50082 "Closed Purchase Order List"
{
    // version NAVW19.00.00.46621,NAVIN9.00.00.46621,GITLEXIM

    // GITLExim   001   Changes done in SourceTableView property.
    Extensible = true;

    CaptionML = ENU = 'Purchase Orders',
                ENN = 'Purchase Orders';
    CardPageID = "Purchase Order";
    Editable = false;
    PageType = List;
    SourceTable = 38;
    SourceTableView = WHERE("Closed PO" = CONST(True),
                            "Document Type" = CONST(Order));

    layout
    {
        area(content)
        {
            repeater(Control001)
            {
                field("No."; rec."No.")
                {
                }
                field("Vendor Shipment No."; rec."Vendor Shipment No.")
                {
                }
                field("Buy-from Vendor No."; rec."Buy-from Vendor No.")
                {
                }
                field("Order Address Code"; rec."Order Address Code")
                {
                    Visible = false;
                }
                field("Buy-from Vendor Name"; rec."Buy-from Vendor Name")
                {
                }
                field("Vendor Authorization No."; rec."Vendor Authorization No.")
                {
                }
                field("Buy-from Post Code"; rec."Buy-from Post Code")
                {
                    Visible = false;
                }
                field("Buy-from Country/Region Code"; rec."Buy-from Country/Region Code")
                {
                    Visible = false;
                }
                field("Buy-from Contact"; rec."Buy-from Contact")
                {
                    Visible = false;
                }
                field("Pay-to Vendor No."; rec."Pay-to Vendor No.")
                {
                    Visible = false;
                }
                field("Pay-to Name"; rec."Pay-to Name")
                {
                    Visible = false;
                }
                field("Pay-to Post Code"; rec."Pay-to Post Code")
                {
                    Visible = false;
                }
                field("Pay-to Country/Region Code"; rec."Pay-to Country/Region Code")
                {
                    Visible = false;
                }
                field("Pay-to Contact"; rec."Pay-to Contact")
                {
                    Visible = false;
                }
                field("Ship-to Code"; rec."Ship-to Code")
                {
                    Visible = false;
                }
                field("Ship-to Name"; rec."Ship-to Name")
                {
                    Visible = false;
                }
                field("Ship-to Post Code"; rec."Ship-to Post Code")
                {
                    Visible = false;
                }
                field("Ship-to Country/Region Code"; rec."Ship-to Country/Region Code")
                {
                    Visible = false;
                }
                field("Ship-to Contact"; rec."Ship-to Contact")
                {
                    Visible = false;
                }
                field("Order Date"; rec."Order Date")
                {
                }
                field("Posting Date"; rec."Posting Date")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; rec."Shortcut Dimension 1 Code")
                {
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        DimMgt.LookupDimValueCodeNoUpdate(1);
                    end;
                }
                field("Shortcut Dimension 2 Code"; rec."Shortcut Dimension 2 Code")
                {
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        DimMgt.LookupDimValueCodeNoUpdate(2);
                    end;
                }
                field("Location Code"; rec."Location Code")
                {
                    Visible = true;
                }
                field("Purchaser Code"; rec."Purchaser Code")
                {
                    Visible = false;
                }
                field("Assigned User ID"; rec."Assigned User ID")
                {
                }
                field("Currency Code"; rec."Currency Code")
                {
                    Visible = false;
                }
                field("Document Date"; rec."Document Date")
                {
                    Visible = false;
                }
                field(PackingDetails; rec.PackingDetails)
                {
                }
                field(Status; rec.Status)
                {
                    Visible = false;
                }
                field("Payment Terms Code"; rec."Payment Terms Code")
                {
                    Visible = false;
                }
                field("Due Date"; rec."Due Date")
                {
                    Visible = false;
                }
                field("Payment Discount %"; rec."Payment Discount %")
                {
                    Visible = false;
                }
                field("Payment Method Code"; rec."Payment Method Code")
                {
                    Visible = false;
                }
                field("Shipment Method Code"; rec."Shipment Method Code")
                {
                    Visible = false;
                }
                field("Requested Receipt Date"; rec."Requested Receipt Date")
                {
                    Visible = false;
                }
                field("Job Queue Status"; rec."Job Queue Status")
                {
                    Visible = JobQueueActive;
                }
                field("Item Description"; rec."Item Description")
                {
                }
                field("Item Code"; rec."Item Code")
                {
                }
            }
        }
        area(factboxes)
        {
            part(IncomingDocAttachFactBox; 193)
            {
                ShowFilter = false;
                Visible = false;
            }
            part(Newpage; 9093)
            {
                SubPageLink = "No." = FIELD("Buy-from Vendor No."),
                              "Date Filter" = FIELD("Date Filter");
                Visible = true;
            }
            systempart(NewLinlks; Links)
            {
                Visible = false;
            }
            systempart(NewLinlks1; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                CaptionML = ENU = 'O&rder',
                            ENN = 'O&rder';
                Image = "Order";
                action(Dimensions)
                {
                    AccessByPermission = TableData 348 = R;
                    CaptionML = ENU = 'Dimensions',
                                ENN = 'Dimensions';
                    Image = Dimensions;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        rec.ShowDocDim;
                    end;
                }
                action(Statistics)
                {
                    CaptionML = ENU = 'Statistics',
                                ENN = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F7';

                    trigger OnAction();
                    begin
                        rec.CalcInvDiscForHeader;
                        COMMIT;
                        PAGE.RUNMODAL(PAGE::"Purchase Order Statistics", Rec);
                    end;
                }
                action(Approvals)
                {
                    CaptionML = ENU = 'Approvals',
                                ENN = 'Approvals';
                    Image = Approvals;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;

                    trigger OnAction();
                    var
                        ApprovalEntries: Page 658;
                    begin
                        ApprovalEntries.Setfilters(DATABASE::"Purchase Header", rec."Document Type", rec."No.");
                        ApprovalEntries.RUN;
                    end;
                }
                action("Co&mments")
                {
                    CaptionML = ENU = 'Co&mments',
                                ENN = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page 66;
                    RunPageLink = "Document Type" = FIELD("Document Type"),
                                  "No." = FIELD("No."),
                                  "Document Line No." = CONST(0);
                }
            }
            group(Documents)
            {
                CaptionML = ENU = 'Documents',
                            ENN = 'Documents';
                Image = Documents;
                action(Receipts)
                {
                    CaptionML = ENU = 'Receipts',
                                ENN = 'Receipts';
                    Image = PostedReceipts;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Page 145;
                    RunPageLink = "Order No." = FIELD("No.");
                    RunPageView = SORTING("Order No.");
                }
                action(Invoices)
                {
                    CaptionML = ENU = 'Invoices',
                                ENN = 'Invoices';
                    Image = Invoice;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Page 146;
                    RunPageLink = "Order No." = FIELD("No.");
                    RunPageView = SORTING("Order No.");
                }
                action("Prepa&yment Invoices")
                {
                    CaptionML = ENU = 'Prepa&yment Invoices',
                                ENN = 'Prepa&yment Invoices';
                    Image = PrepaymentInvoice;
                    RunObject = Page 146;
                    RunPageLink = "Prepayment Order No." = FIELD("No.");
                    RunPageView = SORTING("Prepayment Order No.");
                }
                action("Prepayment Credi&t Memos")
                {
                    CaptionML = ENU = 'Prepayment Credi&t Memos',
                                ENN = 'Prepayment Credi&t Memos';
                    Image = PrepaymentCreditMemo;
                    RunObject = Page 147;
                    RunPageLink = "Prepayment Order No." = FIELD("No.");
                    RunPageView = SORTING("Prepayment Order No.");
                }
                separator(Contro001)
                {
                }
            }
            group(Warehouse1)
            {
                CaptionML = ENU = 'Warehouse',
                            ENN = 'Warehouse';
                Image = Warehouse;
                action("In&vt. Put-away/Pick Lines")
                {
                    CaptionML = ENU = 'In&vt. Put-away/Pick Lines',
                                ENN = 'In&vt. Put-away/Pick Lines';
                    Image = PickLines;
                    RunObject = Page 5774;
                    RunPageLink = "Source Document" = CONST("Purchase Order"),
                                  "Source No." = FIELD("No.");
                    RunPageView = SORTING("Source Document", "Source No.", "Location Code");
                }
                action("Whse. Receipt Lines")
                {
                    CaptionML = ENU = 'Whse. Receipt Lines',
                                ENN = 'Whse. Receipt Lines';
                    Image = ReceiptLines;
                    RunObject = Page 7342;
                    RunPageLink = "Source Type" = CONST(39),
                                  "Source Subtype" = FIELD("Document Type"),
                                  "Source No." = FIELD("No.");
                    RunPageView = SORTING("Source Type", "Source Subtype", "Source No.", "Source Line No.");
                }
                separator(Control002)
                {
                }
            }
        }
        area(processing)
        {
            group(General)
            {
                CaptionML = ENU = 'General',
                            ENN = 'General';
                Image = Print;
                action("&Print")
                {
                    CaptionML = ENU = '&Print',
                                ENN = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    //RunObject = Report 50040; //NSW07

                    trigger OnAction();
                    begin
                        DocPrint.PrintPurchHeader(Rec);
                    end;
                }
            }
            group(Release1)
            {
                CaptionML = ENU = 'Release',
                            ENN = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    CaptionML = ENU = 'Re&lease',
                                ENN = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    var
                        ReleasePurchDoc: Codeunit 415;
                    begin
                        ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action(Reopen)
                {
                    CaptionML = ENU = 'Re&open',
                                ENN = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction();
                    var
                        ReleasePurchDoc: Codeunit 415;
                    begin
                        ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                separator(Control003)
                {
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU = 'F&unctions',
                            ENN = 'F&unctions';
                Image = "Action";
                action("Send IC Purchase Order1")
                {
                    AccessByPermission = TableData 410 = R;
                    CaptionML = ENU = 'Send IC Purchase Order',
                                ENN = 'Send IC Purchase Order';
                    Image = IntercompanyOrder;

                    trigger OnAction();
                    var
                        ICInOutboxMgt: Codeunit 427;
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        IF ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) THEN
                            ICInOutboxMgt.SendPurchDoc(Rec, FALSE);
                    end;
                }
            }
            group("Request Approval")
            {
                CaptionML = ENU = 'Request Approval',
                            ENN = 'Request Approval';
                action("Send A&pproval Request")
                {
                    CaptionML = ENU = 'Send A&pproval Request',
                                ENN = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        //IF ApprovalsMgmt.CheckPurchaseApprovalsWorkflowEnabled(Rec) THEN
                        ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    CaptionML = ENU = 'Cancel Approval Re&quest',
                                ENN = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                    end;
                }
                separator(Control0456)
                {
                }
                action("Send IC Purchase Order")
                {
                    CaptionML = ENU = 'Send IC Purchase Order',
                                ENN = 'Send IC Purchase Order';
                    Image = IntercompanyOrder;

                    trigger OnAction();
                    var
                        ICInOutboxMgt: Codeunit 427;
                        SalesHeader: Record 36;
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        IF ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) THEN
                            ICInOutboxMgt.SendPurchDoc(Rec, FALSE);
                    end;
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU = 'Warehouse',
                            ENN = 'Warehouse';
                Image = Warehouse;
                action("Create &Whse. Receipt")
                {
                    AccessByPermission = TableData 7316 = R;
                    CaptionML = ENU = 'Create &Whse. Receipt',
                                ENN = 'Create &Whse. Receipt';
                    Image = NewReceipt;

                    trigger OnAction();
                    var
                        GetSourceDocInbound: Codeunit 5751;
                    begin
                        GetSourceDocInbound.CreateFromPurchOrder(Rec);

                        IF NOT rec.FIND('=><') THEN
                            rec.INIT;
                    end;
                }
                action("Create Inventor&y Put-away/Pick")
                {
                    CaptionML = ENU = 'Create Inventor&y Put-away/Pick',
                                ENN = 'Create Inventor&y Put-away/Pick';
                    Ellipsis = true;
                    Image = CreatePutawayPick;

                    trigger OnAction();
                    begin
                        rec.CreateInvtPutAwayPick;

                        IF NOT rec.FIND('=><') THEN
                            rec.INIT;
                    end;
                }
                separator(Contro0125)
                {
                }
            }
            group("P&osting")
            {
                CaptionML = ENU = 'P&osting',
                            ENN = 'P&osting';
                Image = Post;
                action("Test Report")
                {
                    CaptionML = ENU = 'Test Report',
                                ENN = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;

                    trigger OnAction();
                    begin
                        ReportPrint.PrintPurchHeader(Rec);
                    end;
                }
                action("P&ost")
                {
                    CaptionML = ENU = 'P&ost',
                                ENN = 'P&ost';
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin
                        rec.SendToPosting(CODEUNIT::"Purch.-Post (Yes/No)");
                    end;
                }
                action(Preview)
                {
                    CaptionML = ENU = 'Preview Posting',
                                ENN = 'Preview Posting';
                    Image = ViewPostedOrder;

                    trigger OnAction();
                    var
                        PurchPostYesNo: Codeunit 91;
                    begin
                        PurchPostYesNo.Preview(Rec);
                    end;
                }
                action("Post and &Print")
                {
                    CaptionML = ENU = 'Post and &Print',
                                ENN = 'Post and &Print';
                    Ellipsis = true;
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction();
                    begin
                        rec.SendToPosting(CODEUNIT::"Purch.-Post + Print");
                    end;
                }
                action(PostBatch)
                {
                    CaptionML = ENU = 'Post &Batch',
                                ENN = 'Post &Batch';
                    Ellipsis = true;
                    Image = PostBatch;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        REPORT.RUNMODAL(REPORT::"Batch Post Purchase Orders", TRUE, TRUE, Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action(RemoveFromJobQueue)
                {
                    CaptionML = ENU = 'Remove From Job Queue',
                                ENN = 'Remove From Job Queue';
                    Image = RemoveLine;
                    Visible = JobQueueActive;

                    trigger OnAction();
                    begin
                        rec.CancelBackgroundPosting;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        SetControlAppearance;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    end;

    trigger OnOpenPage();
    var
        PurchasesPayablesSetup: Record 312;
        RecUser: Record 91;
        TmpLocCode: Code[100];
    begin
        rec.SetSecurityFilterOnRespCenter;

        JobQueueActive := PurchasesPayablesSetup.JobQueueActive;

        RecUser.RESET;
        RecUser.SETRANGE(RecUser."User ID", USERID);
        IF RecUser.FINDFIRST THEN BEGIN
            TmpLocCode := RecUser."Location Code";
        END;

        IF TmpLocCode <> '' THEN BEGIN
            rec.FILTERGROUP(2);
            rec.SETFILTER("Location Code", TmpLocCode);
            rec.FILTERGROUP(0);
        END;
    end;

    var
        DimMgt: Codeunit 408;
        ReportPrint: Codeunit 228;
        DocPrint: Codeunit 229;
        [InDataSet]
        JobQueueActive: Boolean;
        OpenApprovalEntriesExist: Boolean;

    local procedure SetControlAppearance();
    var
        ApprovalsMgmt: Codeunit 1535;
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(rec.RECORDID);
    end;
}

