<GlobalFunctions>
  <Folder id="transformers">
    <Function
      id="launchOpportunityIds"
      funcBody={include("./lib/launchOpportunityIds.js", "string")}
    />
    <Function
      id="opportunities"
      funcBody={include("./lib/opportunities.js", "string")}
    />
    <Function
      id="selectedOpportunitiesTransformer"
      funcBody={include("./lib/selectedOpportunitiesTransformer.js", "string")}
    />
  </Folder>
  <GlobalWidgetQuery
    id="rejectOpportunity"
    defaultValue=""
    enableTransformer={true}
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
    id="editOpportunity"
    defaultValue=""
    resourceName="GlobalWidgetQuery"
    value=""
  />
  <State id="selectedRow" />
</GlobalFunctions>
