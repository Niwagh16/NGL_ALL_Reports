pageextension 50180 Posted_tranfer_shipment_report extends "Posted Transfer Shipment"
{
    // version NAVW19.00.00.45778,NAVIN9.00.00.45778,SUBCON1.0

    layout
    {


    }
    actions
    {



        addafter("&Print")
        {
            action("Delivery Challan ")
            {
                ApplicationArea = all;

                trigger OnAction();
                begin

                    CLEAR(RepDeliveryChallan);
                    TransShipment.RESET;
                    TransShipment.SETRANGE("No.", Rec."No.");
                    IF TransShipment.FINDFIRST THEN BEGIN
                        RepDeliveryChallan.SETTABLEVIEW(TransShipment);
                        RepDeliveryChallan.RUNMODAL;
                    END ELSE
                        ERROR(Text001);

                end;
            }
        }
    }

    var
        RepDeliveryChallan: Report 50091; //NSW07
        TransShipment: Record 5744;
        Text001: Label 'Report not Found';
        TransferShipmentHeader: Record 5744;
        TransferShipmentLine: Record 5745;

    //Unsupported feature: PropertyChange. Please convert manually.

}

