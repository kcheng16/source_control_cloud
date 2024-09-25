<GlobalFunctions>
  <GlobalWidgetQuery
    id="closeAction"
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
  <Function
    id="opportunityIds"
    funcBody={include("./lib/opportunityIds.js", "string")}
  />
  <Function
    id="opportunityResourceTypes"
    funcBody={include("./lib/opportunityResourceTypes.js", "string")}
  />
  <RESTQuery
    id="approveOpportunities"
    body={
      '[{"key":"launchOpportunityIds","value":"{{launchOpportunityIds}}"},{"key":"userEmail","value":"{{email}}"}]'
    }
    bodyType="json"
    cookies={'[{"key":"","value":""}]'}
    headers="[]"
    importedQueryInputs={{
      ordered: [
        { launchOpportunityIds: "{{ opportunityIds.value }}" },
        { email: "{{ current_user.email }}" },
      ],
    }}
    isImported={true}
    playgroundQueryName="v2-launch-opportunity-approve"
    playgroundQueryUuid="adb7fdce-bf3d-4dea-9d88-0e32a8aee2c8"
    query="v2/launch/opportunity/approve"
    resourceName="4f54bd89-671e-4975-b330-9f72a56c8082"
    retoolVersion="3.41.0"
    runWhenModelUpdates={false}
    type="POST"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="closeAction"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
</GlobalFunctions>
