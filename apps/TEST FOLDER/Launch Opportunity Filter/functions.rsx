<GlobalFunctions>
  <RESTQuery
    id="opportunitiesQuery"
    cacheKeyTtl={300}
    cookies={'[{"key":"","value":""}]'}
    enableCaching={true}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    importedQueryInputs={{
      ordered: [
        { assignee: '""' },
        { status: '""' },
        { includeExpired: '""' },
        { opportunityType: '""' },
        { ids: '""' },
        { includeParams: '""' },
      ],
    }}
    isImported={true}
    notificationDuration={4.5}
    playgroundQueryName="v2-launch-opportunity-search"
    playgroundQueryUuid="a60c16b7-29cf-4440-87d4-b7db6cebf7a7"
    query="v2/launch/opportunity/search?assignee={{assignee}}&status={{status}}&includeExpired={{includeExpired}}&opportunityType={{opportunityType}}&ids={{ids}}&include={{includeParams}}"
    resourceName="da56c1ef-76bf-4d88-a534-cd82291799f1"
    retoolVersion="3.41.0"
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
return data"
  />
  <Function
    id="opportunityTypesTransformer"
    funcBody={include("./lib/opportunityTypesTransformer.js", "string")}
  />
  <GlobalWidgetQuery
    id="filterQuery"
    defaultValue=""
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    resourceName="GlobalWidgetQuery"
    transformer="// Query results are available as the `data` variable
return data"
    value=""
  />
  <Function
    id="filterFormOutput"
    funcBody={include("./lib/filterFormOutput.js", "string")}
  />
  <RESTQuery
    id="providerQuery"
    enableTransformer={true}
    importedQueryInputs={{
      ordered: [
        { filter1: '"PROVIDER"' },
        { filter2: '"E2E_SUPPORTED"' },
        {
          filter3:
            '{{ current_user.groups.some(x => x.name === \'admin\') ? "":"IS_LIVE" }}',
        },
        { filter4: '""' },
        { filter5: '""' },
      ],
    }}
    isImported={true}
    notificationDuration={4.5}
    playgroundQueryName="v1-property-set"
    playgroundQueryUuid="1d8c9879-5489-4f63-ad59-d5c533f90892"
    query="v1/property-set?filter1={{filter1}}&filter2={{filter2}}&filter3={{filter3}}&filter4={{filter4}}&filter5={{filter5}}"
    resourceName="da56c1ef-76bf-4d88-a534-cd82291799f1"
    retoolVersion="3.40.0"
    showSuccessToaster={false}
    transformer="return data.results.map(x => x.label)"
  />
  <Function
    id="providerTransformer"
    funcBody={include("./lib/providerTransformer.js", "string")}
  />
</GlobalFunctions>
