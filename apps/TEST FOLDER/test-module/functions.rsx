<GlobalFunctions>
  <JavascriptQuery
    id="search_start"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    playgroundQuerySaveId={0}
    query={include("./lib/search_start.js", "string")}
    queryFailureConditions="[]"
    resourceName="JavascriptQuery"
    showSuccessConfetti={false}
    showSuccessToaster={false}
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    triggersOnFailure={[]}
    triggersOnSuccess={[]}
    workflowBlockPluginId={null}
  />
  <RESTQuery
    id="search_user_email"
    enableTransformer={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    importedQueryInputs={{
      ordered: [{ variable0: "{{ gsearch.value.trim() }}" }],
    }}
    isImported={true}
    playgroundQueryName="search_user_email"
    playgroundQuerySaveId={62}
    playgroundQueryUuid="ca4184f5-e250-4074-894d-cf4bb11777ea"
    query="admin/users?email={{ variable0 }}"
    resourceName="api"
    retoolVersion="2.97.9"
    runWhenModelUpdates={false}
    showSuccessConfetti={false}
    showSuccessToaster={false}
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data.data[0]"
    triggersOnFailure={["search_user_email_error"]}
    triggersOnSuccess={[]}
    version={1}
    workflowBlockPluginId={null}
  >
    <Event
      event="failure"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="search_user_email_error"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <JavascriptQuery
    id="search_user_email_error"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    playgroundQuerySaveId={0}
    query={include("./lib/search_user_email_error.js", "string")}
    queryFailureConditions="[]"
    resourceName="JavascriptQuery"
    showSuccessConfetti={false}
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    triggersOnFailure={[]}
    triggersOnSuccess={[]}
    workflowBlockPluginId={null}
  />
  <RESTQuery
    id="search_org_name"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    importedQueryInputs={{ ordered: [{ variable0: "{{ gsearch.value }}" }] }}
    isImported={true}
    playgroundQueryName="search_org_name"
    playgroundQuerySaveId={45}
    playgroundQueryUuid="62f01547-1821-4f8a-9122-ef8e6adbf2b0"
    query="admin/organizations?name={{ variable0 }}"
    queryFailureConditions={
      '[{"condition":"{{metadata.status >= 400}}","message":"{{data.error.message}}"}]'
    }
    resourceName="api"
    retoolVersion="2.80.18"
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessConfetti={false}
    transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
    triggersOnFailure={[]}
    triggersOnSuccess={[]}
    version={1}
    workflowBlockPluginId={null}
  />
</GlobalFunctions>
