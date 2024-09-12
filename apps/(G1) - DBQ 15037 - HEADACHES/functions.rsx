<GlobalFunctions>
  <Folder id="general">
    <SqlQueryUnified
      id="saveForm"
      actionType="UPDATE_OR_INSERT_BY"
      changeset={
        '[{"key":"created_by","value":"{{getForm.data.row_id.length > 0 ? getForm.data?.created_by?.[0] : current_user.lastName }}"},{"key":"modified_by","value":"{{current_user.lastName}}"},{"key":"form_answers","value":"{{parseForm.data}}"},{"key":"dbq_form_id","value":"{{urlparams.dbqFormId}}"},{"key":"raw_form_answers","value":"{{ form1.data }}"},{"key":"modified_date","value":"{{ moment() }}"},{"key":"user_role","value":"{{ getDBQPermission.data?.UserPermission}}"},{"key":"version","value":"10"},{"key":"additional_questions","value":"{{ parseAdditionalQuestions.data?.parseInterface}}"},{"key":"modified_by_email","value":"{{ current_user.email }}"}]'
      }
      doNotThrowOnNoOp={true}
      editorMode="gui"
      filterBy={
        '[{"key":"dbq_form_id","value":"{{ urlparams.dbqFormId }}","operation":"="}]'
      }
      notificationDuration={4.5}
      queryDisabled="{{ !urlparams.dbqFormId || _.isEqual(getForm.data.form_answers[0],JSON.parse(parseForm.data)) }}"
      resourceDisplayName="Retool DBQ Database"
      resourceName="3749fd67-b058-491d-9a8a-68500096e491"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      tableName="dbq_forms"
      updateSetValueDynamically={true}
    />
    <SalesforceQuery
      id="getDBQForm"
      queryDisabled="{{ !urlparams.dbqFormId }}"
      resourceDisplayName="A&M POC Salesforce"
      resourceName="4791f7a6-5783-4eb3-94d3-b37cb4d135c2"
      resourceTypeOverride=""
      SOQLQuery={include("./lib/getDBQForm.soql", "string")}
      SOQLQueryAutoFlatten={true}
    />
    <SalesforceQuery
      id="getDBQFormQuestion"
      enableTransformer={true}
      queryDisabled="{{ !urlparams.dbqFormId }}"
      resourceDisplayName="A&M POC Salesforce"
      resourceName="4791f7a6-5783-4eb3-94d3-b37cb4d135c2"
      resourceTypeOverride=""
      SOQLQuery={include("./lib/getDBQFormQuestion.soql", "string")}
      SOQLQueryAutoFlatten={true}
      transformer="// Query results are available as the `data` variable
return data.map(x => {let div = document.createElement('div'); div.innerHTML = x.Ques__c; let formattedQuestion = div.textContent; return{'Ques__c': formattedQuestion,'Id':x.Id, createdDate: x.CreatedDate, 'Name': x.Name} })"
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="parseAdditionalQuestions"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </SalesforceQuery>
    <SalesforceQuery
      id="getDBQPermission"
      apexPath="/services/apexrest/userpermissions?userId={{current_user.lastName}}&dbqId={{urlparams.dbqFormId}}"
      enableTransformer={true}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      queryDisabled="{{ !urlparams.dbqFormId }}"
      queryType="apex"
      resourceDisplayName="A&M POC Salesforce"
      resourceName="4791f7a6-5783-4eb3-94d3-b37cb4d135c2"
      showSuccessToaster={false}
      transformer="return JSON.parse(data.result)"
    />
    <SqlQueryUnified
      id="saveAuditForm"
      actionType="INSERT"
      changeset={
        '[{"key":"created_by","value":"{{getForm.data.row_id.length > 0 ? getForm.data?.created_by?.[0] : current_user.lastName }}"},{"key":"modified_by","value":"{{current_user.lastName}}"},{"key":"form_answers","value":"{{actionType == \'submit\' ? JSON.parse(parseForm.data) : _.pickBy(JSON.parse(parseForm.data), (v, k) => !_.isEqual(varParseFormData.value?.[k], v))}}"},{"key":"dbq_form_id","value":"{{urlparams.dbqFormId}}"},{"key":"raw_form_answers","value":"{{_.pickBy(form1.data, (v, k) => !_.isEqual(getForm.data.raw_form_answers[0]?.[k], v))}}"},{"key":"modified_date","value":"{{ moment() }}"},{"key":"action","value":"{{actionType}}"},{"key":"version","value":"10"},{"key":"user_role","value":"{{ getDBQPermission.data?.UserPermission}}"},{"key":"modified_by_email","value":"{{ current_user.email }}"}]'
      }
      doNotThrowOnNoOp={true}
      editorMode="gui"
      filterBy={
        '[{"key":"dbq_form_id","value":"{{ urlparams.dbqFormId }}","operation":"="}]'
      }
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      queryDisabled="{{ !urlparams.dbqFormId }}"
      resourceDisplayName="Retool DBQ Database"
      resourceName="3749fd67-b058-491d-9a8a-68500096e491"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      tableName="audit_dbq_forms"
      updateSetValueDynamically={true}
    >
      <Event
        event="success"
        method="setValue"
        params={{ ordered: [{ value: "{{ JSON.parse(parseForm.data) }}" }] }}
        pluginId="varParseFormData"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </SqlQueryUnified>
    <JavascriptQuery
      id="triggerSaveAuditForm"
      _additionalScope={["actionType"]}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/triggerSaveAuditForm.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <State id="varParseFormData" value="" />
    <State id="varFormData" value="{{ form1.initialData}}" />
  </Folder>
  <Folder id="specific">
    <JavascriptQuery
      id="getFieldMap"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/getFieldMap.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      showSuccessToaster={false}
    />
    <SqlQueryUnified
      id="getForm"
      notificationDuration={4.5}
      query={include("./lib/getForm.sql", "string")}
      resourceDisplayName="Retool DBQ Database"
      resourceName="3749fd67-b058-491d-9a8a-68500096e491"
      resourceTypeOverride=""
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <JavascriptQuery
      id="parseForm"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/parseForm.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      runWhenPageLoadsDelay="2000"
      showSuccessToaster={false}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="saveForm"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ !varParseFormData.value }}"
        event="success"
        method="setValue"
        params={{ ordered: [{ value: "{{ JSON.parse(parseForm.data) }}" }] }}
        pluginId="varParseFormData"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </JavascriptQuery>
    <JavascriptQuery
      id="conditoinalClear_1b"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/conditoinalClear_1b.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="triggerEvidenceReviewACE"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/triggerEvidenceReviewACE.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      runWhenPageLoadsDelay="1000"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="triggerMedicalHistoryConcat"
      notificationDuration={4.5}
      query={include("./lib/triggerMedicalHistoryConcat.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="triggerDiagnosticTestingConcat"
      notificationDuration={4.5}
      query={include("./lib/triggerDiagnosticTestingConcat.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <State
      id="customRemarks"
      value="{{parseAdditionalQuestions.data?.formattedRemarks}}"
    />
    <JavascriptQuery
      id="parseAdditionalQuestions"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/parseAdditionalQuestions.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="triggerRemarkConcat"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="validate"
        params={{ ordered: [] }}
        pluginId="form1"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </JavascriptQuery>
    <JavascriptQuery
      id="errorValidation"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/errorValidation.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <State id="validationMessages" value="{}" />
    <JavascriptQuery
      id="triggerRemarkConcat"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/triggerRemarkConcat.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="triggerClaimedConditionConcat"
      notificationDuration={4.5}
      query={include("./lib/triggerClaimedConditionConcat.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <State id="isSubmitAttempt" value="false" />
    <State
      id="additionalQuestions"
      value="{{ parseAdditionalQuestions.data?.parseInterface}}"
    />
  </Folder>
  <Folder id="checkboxgrouplogic">
    <JavascriptQuery
      id="validatecb_43"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/validatecb_43.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
  </Folder>
</GlobalFunctions>
