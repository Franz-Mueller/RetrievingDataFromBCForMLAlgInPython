page 50100 Pag_Iris_List
{
    ApplicationArea = All;
    Caption = 'Pag_Iris_List';
    PageType = List;
    SourceTable = Tab_Iris;
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                }
                field("Sepal Length"; Rec."Sepal Length")
                {
                }
                field("Sepal Width"; Rec."Sepal Width")
                {
                }
                field("Petal Length"; Rec."Petal Length")
                {
                }
                field("Petal Width"; Rec."Petal Width")
                {
                }
                field(Class; Rec.Class)
                {
                }
            }
        }
    }
}
