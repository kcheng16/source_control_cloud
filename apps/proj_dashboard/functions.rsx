<GlobalFunctions>
  <SqlQueryUnified
    id="query1"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query={include("./lib/query1.sql", "string")}
    queryTimeout="10001"
    resourceDisplayName="onboarding_db"
    resourceName="onboarding_db"
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
  />
</GlobalFunctions>
