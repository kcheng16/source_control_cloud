<GlobalFunctions>
  <GlobalWidgetQuery
    id="cancelAction"
    defaultValue=""
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    resourceName="GlobalWidgetQuery"
    transformer="// Query results are available as the `data` variable
return data"
    value=""
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <GlobalWidgetQuery
    id="rejectAction"
    defaultValue=""
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    resourceName="GlobalWidgetQuery"
    transformer="// Query results are available as the `data` variable
return data"
    value=""
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RESTQuery
    id="rejectLaunchOpportunity"
    body="{{ operations }}"
    bodyType="raw"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    headers={'[{"key":"Content-Type","value":"application/json"}]'}
    importedQueryInputs={{
      ordered: [{ operations: "{{ rejectOperationTransformer.value }}" }],
    }}
    isImported={true}
    notificationDuration={4.5}
    playgroundQueryName="v1-operations-bulk"
    playgroundQueryUuid="49dd7d8d-e436-426a-b111-73894e15e42b"
    query="v1/operations/bulk"
    resourceName="2e5a36c6-2040-4700-bd5d-30e1b9efdfe1"
    retoolVersion="3.95.0"
    runWhenModelUpdates={false}
    showLatestVersionUpdatedWarning={true}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    type="POST"
  >
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="rejectAction"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <Function
    id="rejectOperationTransformer"
    funcBody={include("./lib/rejectOperationTransformer.js", "string")}
  />
  <Function
    id="rejectReasonTransformer"
    funcBody={include("./lib/rejectReasonTransformer.js", "string")}
  />
</GlobalFunctions>
