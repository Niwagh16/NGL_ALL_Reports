report 50009 "Auto Maintenance Schedule"
{
    // version PCPL-FA-1.0

    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report Layout\Auto Maintenance Schedule.rdl';

    dataset
    {
        dataitem("Fixed Asset"; "Fixed Asset")
        {
            DataItemTableView = WHERE(Inactive = CONST(false),
                                      Blocked = CONST(false));

            trigger OnAfterGetRecord();
            begin
                JobComponentHeader.RESET;
                JobComponentHeader.SETRANGE("FA No.", "Fixed Asset"."No.");
                JobComponentHeader.SETRANGE(Blocked, FALSE);
                IF JobComponentHeader.FINDFIRST THEN
                    REPEAT
                        IF JobComponentHeader."Daily Job" THEN BEGIN
                            //PCPL-25
                            MaintH.RESET;
                            MaintH.SETCURRENTKEY("FA No.", "Creation Date");
                            MaintH.SETRANGE(MaintH."FA No.", "No.");
                            MaintH.SETRANGE(MaintH."Creation Date", TODAY);
                            IF MaintH.FINDFIRST THEN BEGIN
                            END
                            ELSE BEGIN
                                //PCPL-25
                                MaintenanceHeader.RESET;
                                MaintenanceHeader.SETRANGE("FA No.", JobComponentHeader."FA No.");
                                MaintenanceHeader.SETRANGE("Maintenance Type", JobComponentHeader."Maintenance Type");
                                MaintenanceHeader.SETRANGE(MaintenanceHeader."Creation Date", TODAY);
                                IF NOT MaintenanceHeader.FINDFIRST THEN BEGIN
                                    MaintenanceHeader.INIT;
                                    FASetup.GET;
                                    FASetup.TESTFIELD("Maintenance Nos.");
                                    MaintenanceHeader."No." := NoSeriesMgt.GetNextNo(FASetup."Maintenance Nos.", WORKDATE, TRUE);
                                    MaintenanceHeader."Created By" := USERID;
                                    MaintenanceHeader."FA No." := "Fixed Asset"."No.";
                                    MaintenanceHeader."FA Description" := "Fixed Asset".Description;
                                    MaintenanceHeader."Creation Date" := TODAY;
                                    MaintenanceHeader.Status := MaintenanceHeader.Status::Created;
                                    MaintenanceHeader."Start Date" := TODAY;
                                    MaintenanceHeader."End Date" := TODAY;
                                    MaintenanceHeader."Maintenance Type" := MaintenanceHeader."Maintenance Type"::"Preventive Maintenance";
                                    MaintenanceHeader.Daily := JobComponentHeader."Daily Job";    //PCPL-25
                                    MaintenanceHeader.INSERT;
                                    ComponentList.RESET;
                                    ComponentList.SETRANGE("FA No.", MaintenanceHeader."FA No.");
                                    ComponentList.SETRANGE(Period, JobComponentHeader.Period);
                                    ComponentList.SETRANGE("Maintenance Type", JobComponentHeader."Maintenance Type");
                                    IF ComponentList.FINDFIRST THEN
                                        REPEAT
                                            MaintenanceLine.RESET;
                                            MaintenanceLine.SETRANGE("Document No.", MaintenanceHeader."No.");
                                            IF MaintenanceLine.FINDLAST THEN
                                                vlineno := MaintenanceLine."Line No." + 10000
                                            ELSE
                                                vlineno := 10000;
                                            MaintenanceLine.INIT;
                                            MaintenanceLine."Document No." := MaintenanceHeader."No.";
                                            MaintenanceLine."Line No." := vlineno;
                                            MaintenanceLine."Component Type" := ComponentList."Component Type";
                                            MaintenanceLine.VALIDATE(MaintenanceLine.Component, ComponentList.Component);
                                            MaintenanceLine.Quantity := ComponentList.Quantity;
                                            MaintenanceLine.INSERT;
                                        UNTIL ComponentList.NEXT = 0;
                                END;
                            END;    //PCPL-25
                        END ELSE BEGIN
                            /*MaintenanceHeader.RESET;
                            MaintenanceHeader.SETCURRENTKEY("FA No.","Creation Date");
                            MaintenanceHeader.SETRANGE(MaintenanceHeader."FA No.","No.");
                            MaintenanceHeader.SETRANGE(MaintenanceHeader."Maintenance Type",JobComponentHeader."Maintenance Type");
                            MaintenanceHeader.SETRANGE(MaintenanceHeader."Creation Date",TODAY);
                            IF NOT MaintenanceHeader.FINDFIRST THEN*/    //temp comment
                            BEGIN
                                CLEAR(vJobDate);
                                IF JobComponentHeader."Next Job Date" = 0D THEN
                                    vJobDate := CALCDATE(JobComponentHeader.Period, JobComponentHeader."Start Date")
                                ELSE
                                    vJobDate := JobComponentHeader."Next Job Date";
                                IF vJobDate = TODAY THEN BEGIN
                                    JobComponentHeader."Next Job Date" := CALCDATE(JobComponentHeader.Period, vJobDate);
                                    JobComponentHeader.MODIFY;
                                    MaintenanceHeader.INIT;
                                    FASetup.GET;
                                    FASetup.TESTFIELD("Maintenance Nos.");
                                    MaintenanceHeader."No." := NoSeriesMgt.GetNextNo(FASetup."Maintenance Nos.", WORKDATE, TRUE);
                                    MaintenanceHeader."Created By" := USERID;
                                    MaintenanceHeader."FA No." := "Fixed Asset"."No.";
                                    MaintenanceHeader."FA Description" := "Fixed Asset".Description;
                                    MaintenanceHeader."Creation Date" := TODAY;
                                    MaintenanceHeader.Status := MaintenanceHeader.Status::Created;
                                    MaintenanceHeader."Start Date" := TODAY;
                                    MaintenanceHeader."End Date" := TODAY;
                                    MaintenanceHeader."Maintenance Type" := JobComponentHeader."Maintenance Type"::"Preventive Maintenance";
                                    MaintenanceHeader.Daily := JobComponentHeader."Daily Job";    //PCPL-25
                                    MaintenanceHeader.INSERT;
                                    ComponentList.RESET;
                                    ComponentList.SETRANGE("FA No.", MaintenanceHeader."FA No.");
                                    ComponentList.SETRANGE(Period, JobComponentHeader.Period);
                                    ComponentList.SETRANGE("Maintenance Type", JobComponentHeader."Maintenance Type");
                                    IF ComponentList.FINDFIRST THEN
                                        REPEAT
                                            MaintenanceLine.RESET;
                                            MaintenanceLine.SETRANGE("Document No.", MaintenanceHeader."No.");
                                            IF MaintenanceLine.FINDLAST THEN
                                                vlineno := MaintenanceLine."Line No." + 10000
                                            ELSE
                                                vlineno := 10000;
                                            MaintenanceLine.INIT;
                                            MaintenanceLine."Document No." := MaintenanceHeader."No.";
                                            MaintenanceLine."Line No." := vlineno;
                                            MaintenanceLine."Component Type" := ComponentList."Component Type";
                                            MaintenanceLine.VALIDATE(MaintenanceLine.Component, ComponentList.Component);
                                            MaintenanceLine.Quantity := ComponentList.Quantity;
                                            MaintenanceLine.INSERT;
                                        UNTIL ComponentList.NEXT = 0;
                                END;
                            END;
                        END;
                    UNTIL JobComponentHeader.NEXT = 0;

                CLEAR(vQty);
                CLEAR(vPO);
                CLEAR(vUQty);
                MaintenanceHeader.RESET;
                //MaintenanceHeader.SETRANGE("FA No.",JobComponentHeader."FA No.");
                MaintenanceHeader.SETRANGE(Status, MaintenanceHeader.Status::Created);
                IF MaintenanceHeader.FINDFIRST THEN
                    REPEAT
                        MaintenanceLine.RESET;
                        MaintenanceLine.SETRANGE("Document No.", MaintenanceHeader."No.");
                        IF MaintenanceLine.FINDFIRST THEN
                            REPEAT
                                IF MaintenanceLine."Component Type" = MaintenanceLine."Component Type"::Item THEN BEGIN
                                    MaintenanceLine.CALCFIELDS("Quantity Utilized");
                                    vUQty := MaintenanceLine."Quantity Utilized";
                                    IF MaintenanceLine.Quantity = vUQty THEN BEGIN
                                        vQty := TRUE;
                                        vPO := TRUE;
                                    END;
                                END ELSE
                                    IF MaintenanceLine."Component Type" = MaintenanceLine."Component Type"::"G/L Account" THEN BEGIN
                                        IF MaintenanceHeader."PO Document No." <> '' THEN BEGIN
                                            vPO := TRUE;
                                            IF vQty THEN
                                                vQty := TRUE
                                            ELSE
                                                vQty := FALSE;
                                        END;
                                    END;
                            UNTIL MaintenanceLine.NEXT = 0;
                        IF (vQty) AND (vPO) THEN BEGIN
                            MaintenanceHeader.Status := MaintenanceHeader.Status::"Under Maintenance";
                            MaintenanceHeader.MODIFY;
                        END;
                        CLEAR(vQty);
                        CLEAR(vPO);
                        CLEAR(vUQty);
                    UNTIL MaintenanceHeader.NEXT = 0;

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
        JobComponentHeader: Record 50036;
        MaintenanceHeader: Record 50035;
        MaintenanceLine: Record 50037;
        vJobDate: Date;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FASetup: Record "FA Setup";
        ComponentList: Record 50000;
        vlineno: Integer;
        vSChDate: Date;
        vMainDate: Date;
        vQty: Boolean;
        vPO: Boolean;
        vUQty: Decimal;
        MaintH: Record 50035;
        MaintenanceHeader12: Record 50035;
}

