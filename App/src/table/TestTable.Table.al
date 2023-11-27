table 84100 "Test Table FLX"
{
    DataClassification = ToBeClassified;
    Caption = 'Test Table';

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';

        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
    }
}