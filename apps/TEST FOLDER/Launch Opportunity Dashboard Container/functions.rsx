<GlobalFunctions>
  <Folder id="variables">
    <State id="opportunities" value="" />
    <State id="submitButtonText" value="Submit" />
    <State
      id="isPowerUser"
      value="{{current_user.groups.some(x => ['ag-retool-advertising editors', 'ag-retool-advertising business managers', 'Managers'].includes(x.name))}}"
    />
    <State id="opportunitiesToReject" value="[]" />
  </Folder>
  <Folder id="containers">
    <JavascriptQuery
      id="rejectOpportunity"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/rejectOpportunity.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <JavascriptQuery
      id="rejectOpportunities"
      notificationDuration={4.5}
      query={include("./lib/rejectOpportunities.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="refreshAndCloseModals"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/refreshAndCloseModals.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <JavascriptQuery
      id="closeRejectModal"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      notificationDuration={4.5}
      query={include("./lib/closeRejectModal.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <JavascriptQuery
      id="closeApproveModal"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      notificationDuration={4.5}
      query={include("./lib/closeApproveModal.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { onSuccess: null },
                  { onFailure: null },
                  { additionalScope: null },
                ],
              },
            },
          ],
        }}
        pluginId="getOpportunities"
        type="datasource"
        waitMs=""
        waitType="debounce"
      />
    </JavascriptQuery>
    <JavascriptQuery
      id="hideEditFrame"
      notificationDuration={4.5}
      query={include("./lib/hideEditFrame.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="editOpportunity"
      notificationDuration={4.5}
      query={include("./lib/editOpportunity.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
  </Folder>
  <RESTQuery
    id="getOpportunities"
    body={
      '[{"key":"provider","value":"{{ provider }}"},{"key":"assignee","value":"{{ assignee }}"},{"key":"opportunityType","value":"{{ opportunityType }}"}]'
    }
    bodyType="json"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    importedQueryInputs={{
      ordered: [
        {
          provider:
            "{{ launchOpportunityFilter.filter.provider?.toUpperCase() }}",
        },
        { assignee: "{{ launchOpportunityFilter.filter.buyer }}" },
        {
          opportunityType:
            "{{ launchOpportunityFilter.filter.opportunityType }}",
        },
      ],
    }}
    isImported={true}
    notificationDuration={4.5}
    playgroundQueryName="v2-opportunity-review-search"
    playgroundQueryUuid="55a7ef39-9f77-45f4-9d60-59623a079fe3"
    query="v2/launch/opportunity/review-search"
    queryTimeout=""
    resourceName="da56c1ef-76bf-4d88-a534-cd82291799f1"
    retoolVersion="3.82.0"
    runWhenModelUpdates={false}
    runWhenPageLoads={true}
    runWhenPageLoadsDelay="1000"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
    type="POST"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="setOpportunitiesVariable"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <Function
    id="opportunitiesTransformer"
    funcBody={include("./lib/opportunitiesTransformer.js", "string")}
  />
  <Function
    id="opportunitiesForApprovalTransformer"
    funcBody={include("./lib/opportunitiesForApprovalTransformer.js", "string")}
  />
  <JavascriptQuery
    id="saveOpportunity"
    notificationDuration={4.5}
    query={include("./lib/saveOpportunity.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="setOpportunitiesVariable"
    notificationDuration={4.5}
    query={include("./lib/setOpportunitiesVariable.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
</GlobalFunctions>
