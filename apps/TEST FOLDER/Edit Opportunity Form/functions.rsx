<GlobalFunctions>
  <Function
    id="headlinesTransformer"
    funcBody={include("./lib/headlinesTransformer.js", "string")}
  />
  <Function
    id="descriptionsTransformer"
    funcBody={include("./lib/descriptionsTransformer.js", "string")}
  />
  <Function
    id="forcekeysTransformer"
    funcBody={include("./lib/forcekeysTransformer.js", "string")}
  />
  <Function
    id="updateOpportunityTransformer"
    funcBody={include("./lib/updateOpportunityTransformer.js", "string")}
  />
  <Function
    id="forcekeysTextAreaTransformer"
    funcBody={include("./lib/forcekeysTextAreaTransformer.js", "string")}
  />
  <GlobalWidgetQuery
    id="submitAction"
    defaultValue=""
    resourceName="GlobalWidgetQuery"
    value=""
  />
  <GlobalWidgetQuery
    id="cancelAction"
    defaultValue=""
    resourceName="GlobalWidgetQuery"
    value=""
  />
  <RESTQuery
    id="submitRegenerateLaunchOpportunity"
    body={
      '[{"key":"operationId","value":"{{operationId}}"},{"key":"requester","value":"{{requester}}"},{"key":"operationTrigger","value":"{{operationTrigger}}"},{"key":"parameters","value":"{{parameters}}"}]'
    }
    bodyType="json"
    enableTransformer={true}
    headers={'[{"key":"Content-Type","value":"application/json"}]'}
    importedQueryInputs={{
      ordered: [
        { operationId: "dd2e9335-7d82-4c2e-a233-1b6532a54a84" },
        { requester: "{{ current_user.email }}" },
        {
          operationTrigger:
            '{\n  requestId: {{ opportunityModel.value.operationRequestId}},\n  user: {{ current_user.email}},\n  source: "Retool"\n}',
        },
        { parameters: "{{ updateOpportunityTransformer.value }}" },
      ],
    }}
    isImported={true}
    notificationDuration={4.5}
    playgroundQueryName="v1-operations"
    playgroundQueryUuid="09922158-2bb1-45cf-a629-de1739633723"
    query="v1/operations"
    resourceName="2e5a36c6-2040-4700-bd5d-30e1b9efdfe1"
    retoolVersion="3.41.0"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="POST"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="submitAction"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
</GlobalFunctions>
