<GlobalFunctions>
  <SqlQueryUnified
    id="query1"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    query={include("./lib/query1.sql", "string")}
    queryTimeout="10001"
    resourceDisplayName="retool_db"
    resourceName="1dafb1eb-888d-4223-8616-232d9ae927e3"
    resourceTypeOverride=""
    transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
    warningCodes={[]}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="query2"
    notificationDuration={4.5}
    resourceDisplayName="HTTPBIN_GET"
    resourceName="a68b00e0-1609-4233-93e8-ea7c4c944f2c"
    showSuccessToaster={false}
  />
  <SqlQueryUnified
    id="query3"
    query={include("./lib/query3.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="1dafb1eb-888d-4223-8616-232d9ae927e3"
    warningCodes={[]}
  />
  <JavascriptQuery
    id="query4"
    notificationDuration={4.5}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
</GlobalFunctions>
