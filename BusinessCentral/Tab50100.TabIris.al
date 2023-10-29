table 50100 Tab_Iris
{
    Caption = 'Tab_Iris';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; Code; Integer)
        {
            Caption = 'Code';
            AutoIncrement = true;
            Editable = false;
        }
        field(2; "Sepal Length"; Decimal)
        {
            Caption = 'Sepal Length';
        }
        field(3; "Sepal Width"; Decimal)
        {
            Caption = 'Sepal Width';
        }
        field(4; "Petal Length"; Decimal)
        {
            Caption = 'Petal Length';
        }
        field(5; "Petal Width"; Decimal)
        {
            Caption = 'Petal Width';
        }
        field(6; Class; Integer)
        {
            Caption = 'Class';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
