<GlobalFunctions>
  <Folder id="admin_queries">
    <RESTQuery
      id="getSingleReservation"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      importedQueryInputs={{
        ordered: [{ reservationID: "{{reservationForCase.value}}" }],
      }}
      isImported={true}
      playgroundQueryName="getSingleReservation"
      playgroundQueryUuid="1aeac9cc-bf44-4cfe-aa00-2c8c4c98871b"
      query="reservations/{{reservationID}}"
      queryDisabled={'{{reservationForCase.value === ""}}'}
      resourceName="4cdfe8db-32d5-456f-a3ca-63458464c0f8"
      retoolVersion="3.10.0"
      runWhenPageLoads={true}
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      watchedParams={["reservationID"]}
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getSingleFacility"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getSingleRentalTransaction"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="getSingleRentalTransaction"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      playgroundQueryId={0}
      playgroundQueryName="getSingleRentalTransaction"
      playgroundQuerySaveId={0}
      query="reservation-transactions/?search_field=rental_identifier&search_param={{reservationForCase.value}}"
      queryDisabled={'{{reservationForCase.value == ""}}'}
      resourceName="4cdfe8db-32d5-456f-a3ca-63458464c0f8"
      resourceTypeOverride=""
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <RESTQuery
      id="getSingleFacility"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      importedQueryInputs={{
        ordered: [
          { facilityID: "{{getSingleReservation.data.data.facility_id}}" },
        ],
      }}
      isImported={true}
      playgroundQueryName="getSingleFacility"
      playgroundQueryUuid="a010b28e-ef99-4041-9adb-dd1f53fac7bd"
      query="facilities/{{facilityID}}"
      queryDisabled="{{getSingleReservation.data === null}}"
      queryDisabledMessage="Please Select a Reservation"
      resourceName="4cdfe8db-32d5-456f-a3ca-63458464c0f8"
      retoolVersion="3.10.0"
      runWhenModelUpdates={false}
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="timeBasedMessages"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="priceBreakdown"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query="pricebreakdown?rental-id={{reservationForCase.value}}"
      queryDisabled={'{{reservationForCase.value === ""}}'}
      queryDisabledMessage="Make sure there is a reservation selected"
      resourceName="4cdfe8db-32d5-456f-a3ca-63458464c0f8"
      resourceTypeOverride=""
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <RESTQuery
      id="cancelReservationAsCredit"
      body={
        '[{"key":"refund_as_credit","value":"true"},{"key":"reason","value":"{{refundReason}}"}]'
      }
      bodyType="json"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      importedQueryInputs={{
        ordered: [
          { refundReason: "{{refundReason.value}}" },
          { reservationForCase: "{{reservationForCase.value}}" },
        ],
      }}
      isImported={true}
      playgroundQueryName="cancelReservationAsCredit"
      playgroundQueryUuid="b38d4efa-6956-4789-bc28-ddbd90091aba"
      query="reservations/{{reservationForCase}}/refund/?"
      resourceName="4cdfe8db-32d5-456f-a3ca-63458464c0f8"
      runWhenModelUpdates={false}
      showLatestVersionUpdatedWarning={true}
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      type="POST"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="close"
        params={{ ordered: [] }}
        pluginId="modal1"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="close"
        params={{ ordered: [] }}
        pluginId="cancelResModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="open"
        params={{ ordered: [] }}
        pluginId="cancelErrorModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="cancelReservationOriginalSource"
      body={
        '[{"key":"refund_as_credit","value":"false"},{"key":"reason","value":"{{refundReason}}"}]'
      }
      bodyType="json"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      importedQueryInputs={{
        ordered: [
          { refundReason: "{{refundReason.value}}" },
          { reservationForCase: "{{reservationForCase.value}}" },
        ],
      }}
      isImported={true}
      playgroundQueryName="cancelReservationOriginalPayment"
      playgroundQueryUuid="b0735437-1a37-47e9-b462-e62a6e8d62ba"
      query="reservations/{{reservationForCase}}/refund/?"
      resourceName="4cdfe8db-32d5-456f-a3ca-63458464c0f8"
      retoolVersion="3.10.0"
      runWhenModelUpdates={false}
      showLatestVersionUpdatedWarning={true}
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      type="POST"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="close"
        params={{ ordered: [] }}
        pluginId="modal1"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="close"
        params={{ ordered: [] }}
        pluginId="cancelResModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="open"
        params={{ ordered: [] }}
        pluginId="cancelErrorModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="addCreditToUser"
      body={
        '[{"key":"notify_user","value":"true"},{"key":"credit_delta","value":"{{creditAmount}}"},{"key":"currency_type","value":"{{currencyType}}"},{"key":"reason","value":"{{creditReason}}"},{"key":"referenced_rental_id","value":"{{rentalID}}"}]'
      }
      bodyType="json"
      confirmationMessage="## Are you sure you want to assign ${{textInput90.value}} credit to user?"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      importedQueryInputs={{
        ordered: [
          { creditAmount: "{{textInput90.value}}" },
          {
            currencyType:
              "{{getSingleRentalTransaction.data.data.results['0'].currency_type}}",
          },
          { creditReason: "{{select4.value}}" },
          { rentalID: "{{reservationForCase.value}}" },
          {
            renterPK:
              "{{getSingleRentalTransaction.data.data.results['0'].renter_pk}}",
          },
        ],
      }}
      isImported={true}
      playgroundQueryName="addCreditToUser"
      playgroundQueryUuid="b5f7e7c5-8fae-48e1-815e-20d11c4b6b6e"
      query="users/{{renterPK}}/credit/"
      requireConfirmation={true}
      resourceName="4cdfe8db-32d5-456f-a3ca-63458464c0f8"
      retoolVersion="3.10.0"
      runWhenModelUpdates={false}
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      type="PATCH"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="close"
        params={{ ordered: [] }}
        pluginId="creditModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="open"
        params={{ ordered: [] }}
        pluginId="creditErrorModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="timeBasedMessages"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query="facilities/{{getSingleReservation.data.data.facility_id}}/time-based-getting-here/"
      resourceName="4cdfe8db-32d5-456f-a3ca-63458464c0f8"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <Function
      id="timeBasedActiveBoolean"
      funcBody={include("./lib/timeBasedActiveBoolean.js", "string")}
    />
  </Folder>
  <Folder id="SFDC_queries">
    <SalesforceQuery
      id="findReservationObj"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      importedQueryInputs={{
        ordered: [{ reservationForCase: "{{reservationForCase.value}}" }],
      }}
      isImported={true}
      playgroundQueryName="findReservationObj"
      playgroundQueryUuid="6bf6eec4-2787-4a3f-bf4a-c3a496135048"
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      resourceTypeOverride=""
      retoolVersion="3.35.0"
      SOQLQuery={include("./lib/findReservationObj.soql", "string")}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="ifTicketmaster"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </SalesforceQuery>
    <SalesforceQuery
      id="create_reservation_record"
      crudAction="create"
      crudResouceID=""
      crudResourceBody={
        '{"Name":"{{reservationForCase.value}}", "Unique_User_Id__c": "{{getUniqueUserId.data[0].Unique_User_ID__c}}"}'
      }
      crudResourceType="Reservation__c"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      queryType="crud"
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="findReservationObj"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </SalesforceQuery>
    <SalesforceQuery
      id="getUniqueUserId"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      importedQueryInputs={{ ordered: [{ email: "{{customerEmail.value}}" }] }}
      isImported={true}
      playgroundQueryName="getUniqueUserId"
      playgroundQueryUuid="a9b865a3-6fe4-4f3a-9c3b-b3d521844540"
      queryDisabled={'{{customerEmail.value == ""}}'}
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      resourceTypeOverride=""
      SOQLQuery={include("./lib/getUniqueUserId.soql", "string")}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <SalesforceQuery
      id="assign_RID_and_user_to_case__c"
      crudAction="update"
      crudResouceID=""
      crudResourceBody={
        '{\n  "Id":{{getCaseNumber.data[\'0\'].Id}} , \n  "Reservation__c":"{{findReservationObj.data[\'0\'].Id}}",\n  "Supplied_User_ID__c": "{{getUniqueUserId.data[\'0\'].Id}}"\n}'
      }
      crudResourceType="Case"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      queryType="crud"
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="open"
        params={{ ordered: [] }}
        pluginId="OCRMacroModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="open"
        params={{ ordered: [] }}
        pluginId="assign_rid_to_case_error_modal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </SalesforceQuery>
    <SalesforceQuery
      id="Set_Status_pending_automation"
      crudAction="update"
      crudResouceID=""
      crudResourceBody={
        '{\n"Id":{{getCaseNumber.data[\'0\'].Id}} ,\n"Status":"Pending - Automation",\n"Hero_Tag__c": "a3M0H0000019UvAUAU" , \n"Automation_Identifier__c" : "OCR Receipt Processing"\n}'
      }
      crudResourceType="Case"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      queryType="crud"
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="open"
        params={{ ordered: [] }}
        pluginId="emailSentSuccessModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="open"
        params={{ ordered: [] }}
        pluginId="sendEmailErrorModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </SalesforceQuery>
    <SalesforceQuery
      id="getCaseNumber"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      runWhenPageLoads={true}
      SOQLQuery={include("./lib/getCaseNumber.soql", "string")}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <Function
      id="case_status_determinator"
      funcBody={include("./lib/case_status_determinator.js", "string")}
    />
    <Function
      id="convert_time_input_to_UTC"
      funcBody={include("./lib/convert_time_input_to_UTC.js", "string")}
    />
    <SalesforceQuery
      id="set_need_receipt_status"
      crudAction="update"
      crudResouceID=""
      crudResourceBody={
        '{\n  "Id" : {{getCaseNumber.data[\'0\'].Id}},\n  "Status" : "Pending - Customer",\n  "Hero_Tag__c" : {{select5.value}} ,\n  "Automation_Identifier__c" : "receipt-same-facility"\n}'
      }
      crudResourceType="Case"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      queryType="crud"
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      runWhenModelUpdates={false}
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <SalesforceQuery
      id="HeroTags"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      importedQueryInputs={{
        ordered: [{ retoolUUID: "{{retoolContext.appUuid}}" }],
      }}
      isImported={true}
      playgroundQueryName="interfaceSpecificHeroTags"
      playgroundQueryUuid="b432f3c7-d19f-46a5-b1d3-ba7bd392b95c"
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      SOQLQuery={include("./lib/HeroTags.soql", "string")}
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="handleTransferDetailsForSupply"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </SalesforceQuery>
    <SalesforceQuery
      id="creditReasons"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      importedQueryInputs={{
        ordered: [{ retoolUUID: "{{retoolContext.appUuid}}" }],
      }}
      isImported={true}
      playgroundQueryName="interfaceSpecificCreditReasons"
      playgroundQueryUuid="53ad535b-f9c6-494c-bd73-482ebebcb708"
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      retoolVersion="3.7.0"
      SOQLQuery={include("./lib/creditReasons.soql", "string")}
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <SalesforceQuery
      id="refundReasons"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      importedQueryInputs={{
        ordered: [{ retoolUUID: "{{retoolContext.appUuid}}" }],
      }}
      isImported={true}
      playgroundQueryName="interfaceSpecificRefundReasons"
      playgroundQueryUuid="69b24e12-2ca9-462d-af86-4efe0c5457fc"
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      retoolVersion="3.7.0"
      SOQLQuery={include("./lib/refundReasons.soql", "string")}
      transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
  </Folder>
  <Folder id="closeCaseFlow">
    <SalesforceQuery
      id="addLicensePlateForClose"
      crudAction="update"
      crudResouceID=""
      crudResourceBody={
        '{\n  "Id" : {{getCaseNumber.data[\'0\'].Id}},\n  "Single_Space_Offending_License_Plate__c" : {{ closeCaseFormDataCache.value.required_license_plate_input }}\n}'
      }
      crudResourceType="Case"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      queryType="crud"
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="assignRIDForClose"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="setValue"
        params={{
          ordered: [{ value: "{{ addLicensePlateForClose.data.message}}" }],
        }}
        pluginId="closeCaseErrorMessage"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="open"
        params={{ ordered: [] }}
        pluginId="CloseCaseErrorModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </SalesforceQuery>
    <SalesforceQuery
      id="assignRIDForClose"
      crudAction="update"
      crudResouceID=""
      crudResourceBody={
        '{\n"Id":{{getCaseNumber.data[\'0\'].Id}} ,\n"Reservation__c":"{{findReservationObj.data[\'0\'].Id}}"\n}'
      }
      crudResourceType="Case"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      notificationDuration={null}
      queryType="crud"
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      runWhenModelUpdates={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="assignHeroTagForClose"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="setValue"
        params={{
          ordered: [{ value: "{{ assignRIDForClose.data.message }}" }],
        }}
        pluginId="closeCaseErrorMessage"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="open"
        params={{ ordered: [] }}
        pluginId="CloseCaseErrorModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </SalesforceQuery>
    <SalesforceQuery
      id="assignHeroTagForClose"
      crudAction="update"
      crudResouceID=""
      crudResourceBody={
        '{\n"Id":{{getCaseNumber.data[\'0\'].Id}} ,\n"Hero_Tag__c": {{ closeCaseFormDataCache.value.select3 }} \n}'
      }
      crudResourceType="Case"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration={null}
      queryType="crud"
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      runWhenModelUpdates={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="assignNotesToCase"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="setValue"
        params={{
          ordered: [{ value: "{{ assignHeroTagForClose.data.message }}" }],
        }}
        pluginId="closeCaseErrorMessage"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="open"
        params={{ ordered: [] }}
        pluginId="CloseCaseErrorModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </SalesforceQuery>
    <SalesforceQuery
      id="assignNotesToCase"
      crudAction="update"
      crudResouceID=""
      crudResourceBody={
        '{\n"Id":{{getCaseNumber.data[\'0\'].Id}} ,\n"Details__c":"{{ closeCaseFormDataCache.value.details }} : : details posted by {{current_user.email}}`",\n"Internal_Note__c":"{{ closeCaseFormDataCache.value.internalNotes }} : comment made by {{current_user.fullName}}",\n"Date_Time__c" : {{facilityUTCOffset.value}}\n}'
      }
      crudResourceType="Case"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration={null}
      queryType="crud"
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      runWhenModelUpdates={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="solveCaseQuery"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="setValue"
        params={{
          ordered: [{ value: "{{ assignNotesToCase.data.message }}" }],
        }}
        pluginId="closeCaseErrorMessage"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="open"
        params={{ ordered: [] }}
        pluginId="CloseCaseErrorModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </SalesforceQuery>
    <SalesforceQuery
      id="solveCaseQuery"
      crudAction="update"
      crudResouceID=""
      crudResourceBody={
        '{\n"Id":{{getCaseNumber.data[\'0\'].Id}} ,\n"Status": {{case_status_determinator.value.status}}\n}\n'
      }
      crudResourceType="Case"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      queryType="crud"
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer=""
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="open"
        params={{ ordered: [] }}
        pluginId="blackoutModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="open"
        params={{ ordered: [] }}
        pluginId="CloseCaseErrorModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="setValue"
        params={{ ordered: [{ value: "{{ solveCaseQuery.data.message }}" }] }}
        pluginId="closeCaseErrorMessage"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </SalesforceQuery>
    <RESTQuery
      id="createBlackout"
      body={'[{"key":"blackout","value":"{{blackoutBoolean.value}}"}]'}
      bodyType="json"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query="admin/facilities/{{getSingleRentalTransaction.data.data.results['0'].parking_spot_id}}/blackouts/"
      resourceName="4cdfe8db-32d5-456f-a3ca-63458464c0f8"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      type="POST"
      version={1}
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="blackout_log"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="open"
        params={{ ordered: [] }}
        pluginId="closeOutCase"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="close"
        params={{ ordered: [] }}
        pluginId="blackoutErrorModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="open"
        params={{ ordered: [] }}
        pluginId="blackoutErrorModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="blackout_log"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <State
      id="closeCaseErrorMessage"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <State
      id="closeCaseFormDataCache"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
    <Function
      id="facilityUTCOffset"
      funcBody={include("./lib/facilityUTCOffset.js", "string")}
    />
  </Folder>
  <Folder id="post_patch_log_folder">
    <Function
      id="logging_formatter"
      funcBody={include("./lib/logging_formatter.js", "string")}
    />
    <SalesforceQuery
      id="cancel_as_credit_log"
      crudAction="create"
      crudResouceID=""
      crudResourceBody="{
Current_User_Email__c: {{logging_formatter.value.cancelAsCreditRequestObj.heroUser}},
Endpoint__c : {{logging_formatter.value.cancelAsCreditRequestObj.endpoint}},
Retool_Global_User__c : {{logging_formatter.value.cancelAsCreditRequestObj.retoolUser}},
Timestamp__c : {{logging_formatter.value.cancelAsCreditRequestObj.timeOfCall}},
Response_Message__c : {{logging_formatter.value.cancelAsCreditRequestObj.responseMessage}},
Status_Code__c : {{logging_formatter.value.cancelAsCreditRequestObj.statusCode}}
}"
      crudResourceType="Retool_log__c"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      queryType="crud"
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <SalesforceQuery
      id="credit_log"
      crudAction="create"
      crudResouceID=""
      crudResourceBody="{
Current_User_Email__c: {{logging_formatter.value.creditRequestObj.heroUser}},
Endpoint__c : {{logging_formatter.value.creditRequestObj.endpoint}},
Retool_Global_User__c : {{logging_formatter.value.creditRequestObj.retoolUser}},
Timestamp__c : {{logging_formatter.value.creditRequestObj.timeOfCall}},
Response_Message__c : {{logging_formatter.value.creditRequestObj.responseMessage}},
Status_Code__c : {{logging_formatter.value.creditRequestObj.statusCode}}
}"
      crudResourceType="Retool_log__c"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      queryType="crud"
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <SalesforceQuery
      id="blackout_log"
      crudAction="create"
      crudResouceID=""
      crudResourceBody="{
Current_User_Email__c: {{logging_formatter.value.blackoutRequestObj.heroUser}},
Endpoint__c : {{logging_formatter.value.blackoutRequestObj.endpoint}},
Retool_Global_User__c : {{logging_formatter.value.blackoutRequestObj.retoolUser}},
Timestamp__c : {{logging_formatter.value.blackoutRequestObj.timeOfCall}},
Response_Message__c : {{logging_formatter.value.blackoutRequestObj.responseMessage}},
Status_Code__c : {{logging_formatter.value.blackoutRequestObj.statusCode}}
}"
      crudResourceType="Retool_log__c"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      queryType="crud"
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <SalesforceQuery
      id="cancel_to_origin_log"
      crudAction="create"
      crudResouceID=""
      crudResourceBody="{
Current_User_Email__c: {{logging_formatter.value.cancelAsOriginRequestObj.heroUser}},
Endpoint__c : {{logging_formatter.value.cancelAsOriginRequestObj.endpoint}},
Retool_Global_User__c : {{logging_formatter.value.cancelAsOriginRequestObj.retoolUser}},
Timestamp__c : {{logging_formatter.value.cancelAsOriginRequestObj.timeOfCall}},
Response_Message__c : {{logging_formatter.value.cancelAsOriginRequestObj.responseMessage}},
Status_Code__c : {{logging_formatter.value.cancelAsOriginRequestObj.statusCode}}
}"
      crudResourceType="Retool_Log__c"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      queryType="crud"
      resourceName="1aed54ea-d147-47fd-b5cd-f8263adc80db"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      transformer="// type your code here
// example: return formatDataAsArray(data).filter(row => row.quantity > 20)
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
  </Folder>
  <Folder id="URL_parse_state">
    <State
      id="parseCustomerContact"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value="{{urlparams.hash.searchTerm}}"
    />
    <State
      id="parseCallTime"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value="{{currentTime_temp_state.value}}"
    />
    <State
      id="interactionID"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value="{{urlparams.hash.interactionId}}"
    />
    <State
      id="ParseRID"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value="{{urlparams.hash.RID}}"
    />
    <Function
      id="currentTime_temp_state"
      funcBody={include("./lib/currentTime_temp_state.js", "string")}
    />
    <Function
      id="interface_switch_inputs"
      funcBody={include("./lib/interface_switch_inputs.js", "string")}
    />
    <State
      id="transferDetailsForSupply"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
      value={'""'}
    />
    <JavascriptQuery
      id="handleTransferDetailsForSupply"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      query={include("./lib/handleTransferDetailsForSupply.js", "string")}
      resourceName="JavascriptQuery"
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockPluginId={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
  </Folder>
  <Folder id="Business_logic_folder">
    <Function
      id="UTCtoTimezoneForDefaultDateTimeSelect"
      funcBody={include(
        "./lib/UTCtoTimezoneForDefaultDateTimeSelect.js",
        "string"
      )}
    />
    <Function
      id="rebookBoolean"
      funcBody={include("./lib/rebookBoolean.js", "string")}
    />
    <Function
      id="licensePlate_boolean"
      funcBody={include("./lib/licensePlate_boolean.js", "string")}
    />
    <Function
      id="blackoutBoolean"
      funcBody={include("./lib/blackoutBoolean.js", "string")}
    />
    <Function
      id="cancelBoolean"
      funcBody={include("./lib/cancelBoolean.js", "string")}
    />
    <Function
      id="rebookUrlFormattedTimes"
      funcBody={include("./lib/rebookUrlFormattedTimes.js", "string")}
    />
    <Function
      id="step3ScriptWriter"
      funcBody={include("./lib/step3ScriptWriter.js", "string")}
    />
    <Function
      id="reservationIsPreTaxOrSH4B"
      funcBody={include("./lib/reservationIsPreTaxOrSH4B.js", "string")}
    />
    <Function
      id="displayErrorMessageCancelRes"
      funcBody={include("./lib/displayErrorMessageCancelRes.js", "string")}
    />
    <Function
      id="noOffendingPlateDefaultValue"
      funcBody={include("./lib/noOffendingPlateDefaultValue.js", "string")}
    />
    <Function id="forceOpenTransfer" />
    <JavascriptQuery
      id="ifTicketmaster"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      notificationDuration={4.5}
      query={include("./lib/ifTicketmaster.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <State
      id="isTicketmaster"
      _persistedValueGetter={null}
      _persistedValueSetter={null}
      persistedValueKey=""
      persistValue={false}
    />
  </Folder>
</GlobalFunctions>
