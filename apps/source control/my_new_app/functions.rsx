<GlobalFunctions>
  <SqlQueryUnified
    id="query1"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    queryTimeout="10001"
    resourceName="ae40bfc4-bfe8-4f0d-b0a6-4d63aab73d82"
    transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowRunId={null}
  />
</GlobalFunctions>
