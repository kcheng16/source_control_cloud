<GlobalFunctions>
  <Folder id="NewCaseWizard">
    <State id="CurrentCaseInput" value="{}" />
    <JavascriptQuery
      id="onReset"
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/onReset.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="add_LOB_PHP"
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/add_LOB_PHP.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="add_LOB_PHC"
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/add_LOB_PHC.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="add_LOB_AHF"
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/add_LOB_AHF.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <SqlQueryUnified
      id="pull_PA"
      _additionalScope={["LOB"]}
      isHidden={false}
      isMultiplayerEdited={false}
      query={include("./lib/pull_PA.sql", "string")}
      resourceDisplayName="AHFRAMDW"
      resourceName="6edc6777-ecc7-4d6e-bab7-2067156b4aa7"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="pull_Claim"
      _additionalScope={["LOB"]}
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/pull_Claim.sql", "string")}
      resourceDisplayName="AHFRAMDW"
      resourceName="6edc6777-ecc7-4d6e-bab7-2067156b4aa7"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="pull_Member"
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/pull_Member.sql", "string")}
      resourceDisplayName="AHFRAMDW"
      resourceName="6edc6777-ecc7-4d6e-bab7-2067156b4aa7"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <JavascriptQuery
      id="add_CaseInfo_PHP"
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/add_CaseInfo_PHP.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <SqlTransformQuery
      id="list_FileUploaded"
      isHidden={false}
      query={include("./lib/list_FileUploaded.sql", "string")}
      resourceName="SQL Transforms"
      resourceTypeOverride=""
      showSuccessToaster={false}
    />
    <SqlQueryUnified
      id="send_CaseInfo"
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/send_CaseInfo.sql", "string")}
      queryDisabled="{{ send_CaseInfo.data != null }}"
      resourceDisplayName="AHFRAMDW"
      resourceName="6edc6777-ecc7-4d6e-bab7-2067156b4aa7"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="upload_attachment"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="setValue"
        params={{
          ordered: [{ value: "{{ send_CaseInfo.data?.case_id[0] }}" }],
        }}
        pluginId="global_case_id"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </SqlQueryUnified>
    <Function
      id="attachment_w_desc"
      funcBody={include("./lib/attachment_w_desc.js", "string")}
    />
    <WorkflowRun
      id="upload_attachment"
      isHidden={false}
      isMultiplayerEdited={false}
      queryDisabled="{{  send_CaseInfo.data == null || FileDropZone.value.length == 0 }}"
      resourceName="WorkflowRun"
      resourceTypeOverride=""
      showSuccessToaster={false}
      workflowId="d760411a-6d4e-41ed-b7c4-27f98ade5e71"
      workflowParams={include("./lib/upload_attachment.json", "string")}
    />
  </Folder>
  <Folder id="global_DataTransfer">
    <State id="global_case_id" />
    <State id="global_case_header" />
    <State id="global_trigger_bit" value="1" />
  </Folder>
  <Folder id="global_Config">
    <State
      id="category_Attachment"
      value="['Initial Request~without WOL/AOR',
 'Initial Request~with WOL/AOR',
 'Waiver of Liability',
 'Appointment of Representative',
 'Acknowledge Letter',
 'Resolution Letter',
 'Corrected Claim']"
    />
    <State
      id="category_CaseOwner"
      value="{{ users_in_group.data.user_email }}"
    />
    <State
      id="category_ResolutionDeliveryMethod"
      value="['Mail', 'E-Mail', 'Fax']"
    />
    <State
      id="duedate_TimeFrame"
      value="{
'CMS_AllAppeal_PlanRecon_Expedited': 72,
'CMS_PreServiceAppeal_PlanRecon_Standard': {{ 30*24 }},
'CMS_PostServiceAppeal_PlanRecon_Standard': {{ 60*24 }},
'WOLAOR_Followup': {{ 60*24 }}
}"
    />
  </Folder>
  <SqlQueryUnified
    id="FooterInfo"
    importedQueryInputs={{
      ordered: [{ AppUUID: "{{ retoolContext.appUuid }}" }],
    }}
    isHidden={false}
    isImported={true}
    notificationDuration={4.5}
    playgroundQueryName="CurrentAppInfo"
    playgroundQueryUuid="d40f6f96-5ae3-4481-8a52-8d7f1a7a2600"
    query={include("./lib/FooterInfo.sql", "string")}
    resourceDisplayName="Retool_Internal"
    resourceName="e12a3653-ebd8-4553-a590-bbff3f04892e"
    runWhenModelUpdates={false}
    runWhenPageLoads={true}
    showSuccessToaster={false}
    warningCodes={[]}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <JavascriptQuery
    id="DueDateCalculation"
    functionParameters={{
      ordered: [
        { LOB: { ordered: [{ name: "LOB" }, { sampleValue: "PHP" }] } },
        {
          CaseType: {
            ordered: [
              { name: "CaseType" },
              { sampleValue: "Pre-Service Appeal" },
            ],
          },
        },
        {
          CasePriority: {
            ordered: [{ name: "CasePriority" }, { sampleValue: "Expedited" }],
          },
        },
        {
          MilestoneEvent: {
            ordered: [
              { name: "MilestoneEvent" },
              { sampleValue: "Case_Received_Date" },
            ],
          },
        },
        {
          MilestoneDate: {
            ordered: [
              { name: "MilestoneDate" },
              { sampleValue: "03/24/2025 15:00:00.000" },
            ],
          },
        },
        {
          TimeFrame: {
            ordered: [
              { name: "TimeFrame" },
              { sampleValue: "{{ duedate_TimeFrame.value }}" },
            ],
          },
        },
        {
          WOLAOR_req: {
            ordered: [{ name: "WOLAOR_req" }, { sampleValue: "false" }],
          },
        },
      ],
    }}
    isFunction={true}
    query={include("./lib/DueDateCalculation.js", "string")}
    resourceName="JavascriptQuery"
  />
  <SqlQueryUnified
    id="users_in_group"
    isHidden={false}
    isMultiplayerEdited={false}
    query={include("./lib/users_in_group.sql", "string")}
    resourceDisplayName="Retool_Internal"
    resourceName="e12a3653-ebd8-4553-a590-bbff3f04892e"
    runWhenModelUpdates={false}
    runWhenPageLoads={true}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="pull_CaseList"
    isHidden={false}
    isMultiplayerEdited={false}
    query={include("./lib/pull_CaseList.sql", "string")}
    resourceDisplayName="AHFRAMDW"
    resourceName="6edc6777-ecc7-4d6e-bab7-2067156b4aa7"
    showSuccessToaster={false}
    warningCodes={[]}
  />
</GlobalFunctions>
