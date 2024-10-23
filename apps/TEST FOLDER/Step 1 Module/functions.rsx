<GlobalFunctions>
  <Folder id="adminQueries">
    <RESTQuery
      id="getReservationTransactions"
      query="reservation-transactions/?search_field=email&search_param={{parseCustomerContact.value}}&from={{ymdToMdy.value.start}}&to={{ymdToMdy.value.end}}"
      resourceName="4cdfe8db-32d5-456f-a3ca-63458464c0f8"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      runWhenPageLoads={true}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      version={1}
      workflowBlockPluginId={null}
    />
    <RESTQuery
      id="getSingleReservationByID"
      playgroundQueryId={0}
      playgroundQueryName="getSingleRentalTransaction"
      playgroundQuerySaveId={0}
      query="reservation-transactions/?search_field=rental_identifier&search_param={{initialRID.value}}"
      queryDisabled={'{{initialRID.value == ""}}'}
      queryTimeout="120000"
      resourceName="4cdfe8db-32d5-456f-a3ca-63458464c0f8"
      streamResponse={true}
    />
  </Folder>
  <Folder id="jsTransformers">
    <Function id="ymdToMdy" funcBody={include("./lib/ymdToMdy.js", "string")} />
  </Folder>
  <Folder id="parseState">
    <State id="parseCustomerContact" value="{{custEmail.value}}" />
    <State id="parseRID" value="{{initialRID.value}}" />
  </Folder>
</GlobalFunctions>
