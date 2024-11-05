<GlobalFunctions>
  <RESTQuery
    id="query1"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isImported={true}
    playgroundQueryName="get_new_gif"
    playgroundQueryUuid="219c20b2-959e-4cfc-be47-4045fac120ac"
    query="https://api.giphy.com/v1/gifs/random?api_key=Pt8BQn7MMyuUDlQW5xvuF2vDU5q8WFJa&tag=&rating=g"
    queryTimeout="10001"
    resourceName="REST-WithoutResource"
    retoolVersion="2.116.1"
    transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
    version={1}
    workflowActionType={null}
    workflowBlockPluginId={null}
    workflowRunId={null}
  />
  <Function
    id="transformer1"
    funcBody={include("./lib/transformer1.js", "string")}
  />
</GlobalFunctions>
