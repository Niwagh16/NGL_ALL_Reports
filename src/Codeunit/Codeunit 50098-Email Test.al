codeunit 50098 "Email Test"
{
    trigger OnRun()
    begin
        VarRec.Add('nirmal.wagh@pacificconsulting.in');
        BodyText.AddText('Dear Sir/Madam');
        BodyText.AddText('<br><Br>');
        Emailmessage.Create(VarRec, 'Purchase Approval Process', Format(BodyText), true);
        Email.Send(Emailmessage, Enum::"Email Scenario"::Default);
    end;

    var
        myInt: Integer;
        VarRec: List of [text];
        BodyText: BigText;
        Emailmessage: Codeunit "Email Message";
        Email: Codeunit Email;

}