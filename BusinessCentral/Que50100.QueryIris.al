query 50100 Query_Iris
{
    APIGroup = 'apiGroup';
    APIPublisher = 'Franz';
    APIVersion = 'v1.0';
    EntityName = 'Query_Iris';
    EntitySetName = 'entitySetName';
    QueryType = API;
    
    elements
    {
        dataitem(tabIris; Tab_Iris)
        {
            column(sepalLength; "Sepal Length")
            {
            }
            column(sepalWidth; "Sepal Width")
            {
            }
            column(petalLength; "Petal Length")
            {
            }
            column(petalWidth; "Petal Width")
            {
            }
            column(class; Class)
            {
            }
        }
    }
}
