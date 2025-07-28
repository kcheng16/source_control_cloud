<Screen
  id="CaseViewer"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title="CaseViewer"
  urlSlug=""
>
  <Folder id="EscalationReview">
    <WorkflowRun
      id="initiate_Escalation"
      isHidden={false}
      isMultiplayerEdited={false}
      resourceName="WorkflowRun"
      resourceTypeOverride=""
      workflowId="d760411a-6d4e-41ed-b7c4-27f98ade5e71"
      workflowParams={include("../lib/initiate_Escalation.json", "string")}
      workflowRunExecutionType="async"
    >
      <Event
        event="success"
        method="run"
        params={{
          ordered: [
            {
              src: "escalation_assignee_input.resetValue();\nescalation_task_input.resetValue();\nescalation_requiredecision_input.resetValue();",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="pull_CaseDetail"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </WorkflowRun>
    <SqlQueryUnified
      id="pull_Escalations"
      isHidden={false}
      notificationDuration={4.5}
      query={include("../lib/pull_Escalations.sql", "string")}
      resourceDisplayName="AHFRAMDW"
      resourceName="6edc6777-ecc7-4d6e-bab7-2067156b4aa7"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
  </Folder>
  <Folder id="UpdateCaseDetail">
    <SqlQueryUnified
      id="add_CaseDetail_General"
      _additionalScope={[
        "casedetailtype_description",
        "casedetail_info",
        "addson1",
        "addson2",
        "addson3",
      ]}
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/add_CaseDetail_General.sql", "string")}
      resourceDisplayName="AHFRAMDW"
      resourceName="6edc6777-ecc7-4d6e-bab7-2067156b4aa7"
      runWhenModelUpdates={false}
      showUpdateSetValueDynamicallyToggle={false}
      successMessage="Info Updated"
      updateSetValueDynamically={true}
      warningCodes={[]}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="pull_CaseDetail"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </SqlQueryUnified>
    <JavascriptQuery
      id="prep_CaseDetail_Batch"
      _additionalScope={["changeset"]}
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/prep_CaseDetail_Batch.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="add_CaseDetail_Batch"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </JavascriptQuery>
    <WorkflowRun
      id="add_CaseDetail_Batch"
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      resourceName="WorkflowRun"
      showSuccessToaster={false}
      workflowId="d760411a-6d4e-41ed-b7c4-27f98ade5e71"
      workflowParams={include("../lib/add_CaseDetail_Batch.json", "string")}
    >
      <Event
        event="success"
        method="run"
        params={{
          ordered: [
            {
              src: "CaseViewer_CaseBasic_1.clearChangeset();\nCaseViewer_CaseBasic_2.clearChangeset();\n",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="pull_CaseDetail"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </WorkflowRun>
  </Folder>
  <Folder id="ConvertCloseCase">
    <SqlQueryUnified
      id="step1_dup_case"
      _additionalScope={["casetype_description"]}
      isHidden={false}
      isMultiplayerEdited={false}
      query={include("../lib/step1_dup_case.sql", "string")}
      resourceDisplayName="AHFRAMDW"
      resourceName="6edc6777-ecc7-4d6e-bab7-2067156b4aa7"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      warningCodes={[]}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="step2_dup_attachment"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </SqlQueryUnified>
    <SqlQueryUnified
      id="step2_dup_attachment"
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/step2_dup_attachment.sql", "string")}
      queryDisabled="{{  step1_dup_case.data == null }}"
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
        params={{}}
        pluginId="step3_adddetail_newcase"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </SqlQueryUnified>
    <SqlQueryUnified
      id="step3_adddetail_newcase"
      isHidden={false}
      isMultiplayerEdited={false}
      query={include("../lib/step3_adddetail_newcase.sql", "string")}
      resourceDisplayName="AHFRAMDW"
      resourceName="6edc6777-ecc7-4d6e-bab7-2067156b4aa7"
      runWhenModelUpdates={false}
      warningCodes={[]}
    >
      <Event
        event="success"
        method="trigger"
        params={{}}
        pluginId="step4_close_case"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </SqlQueryUnified>
    <JavascriptQuery
      id="step4_close_case"
      isHidden={false}
      isMultiplayerEdited={false}
      query={include("../lib/step4_close_case.js", "string")}
      queryDisabled="{{ step1_dup_case.data == null }}"
      resourceName="JavascriptQuery"
      resourceTypeOverride=""
      showSuccessToaster={false}
    >
      <Event
        event="success"
        method="trigger"
        params={{}}
        pluginId="step5_cleanup"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </JavascriptQuery>
    <JavascriptQuery
      id="step5_cleanup"
      isHidden={false}
      notificationDuration={4.5}
      query={include("../lib/step5_cleanup.js", "string")}
      queryDisabled="{{ step1_dup_case.data == null }}"
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="GeneratePDF">
    <State
      id="logo_PHP_CA"
      value="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"
    />
    <Function
      id="prep_template_list"
      funcBody={include("../lib/prep_template_list.js", "string")}
    />
    <SqlQueryUnified
      id="pull_provider_address"
      isHidden={false}
      notificationDuration={4.5}
      query={include("../lib/pull_provider_address.sql", "string")}
      resourceDisplayName="AHFRAMDW"
      resourceName="6edc6777-ecc7-4d6e-bab7-2067156b4aa7"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <JavascriptQuery
      id="prep_PDF_input"
      _additionalScope={["PDF_Template", "PDF_Hint"]}
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/prep_PDF_input.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="generate_PDF_PHP_Appeal_AKL"
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/generate_PDF_PHP_Appeal_AKL.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    >
      <Event
        event="success"
        method="hide"
        params={{ ordered: [] }}
        pluginId="modal_PDF_Generator"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </JavascriptQuery>
    <JavascriptQuery
      id="generate_PDF_PHP_Appeal_WOL_Request"
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/generate_PDF_PHP_Appeal_WOL_Request.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="generate_PDF_PHP_Appeal_Dismiss"
      isHidden={false}
      notificationDuration={4.5}
      query={include("../lib/generate_PDF_PHP_Appeal_Dismiss.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="CaseAttachment">
    <SqlQueryUnified
      id="pull_CaseAttachment"
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/pull_CaseAttachment.sql", "string")}
      resourceDisplayName="AHFRAMDW"
      resourceName="6edc6777-ecc7-4d6e-bab7-2067156b4aa7"
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <WorkflowRun
      id="upload_newattachment"
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      resourceName="WorkflowRun"
      showSuccessToaster={false}
      workflowId="d760411a-6d4e-41ed-b7c4-27f98ade5e71"
      workflowParams={include("../lib/upload_newattachment.json", "string")}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="pull_CaseAttachment"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="clear"
        params={{ ordered: [] }}
        pluginId="CaseViewer_UploadAttachment"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </WorkflowRun>
    <SqlQueryUnified
      id="remove_attachment"
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/remove_attachment.sql", "string")}
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
        pluginId="pull_CaseAttachment"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </SqlQueryUnified>
    <SqlQueryUnified
      id="download_attachmentContent"
      enableTransformer={true}
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/download_attachmentContent.sql", "string")}
      resourceDisplayName="AHFRAMDW"
      resourceName="6edc6777-ecc7-4d6e-bab7-2067156b4aa7"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      transformer="let data_array = formatDataAsArray(data)[0];
return data_array;
"
      updateSetValueDynamically={true}
      warningCodes={[]}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="download_attachmentAsFile"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </SqlQueryUnified>
    <JavascriptQuery
      id="download_attachmentAsFile"
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/download_attachmentAsFile.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <SqlTransformQuery
      id="trigger_check_RequiredDocuments"
      isHidden={false}
      isMultiplayerEdited={false}
      query={include("../lib/trigger_check_RequiredDocuments.sql", "string")}
      queryThrottleTime=""
      queryTriggerDelay="200"
      resourceName="SQL Transforms"
      resourceTypeOverride=""
      showSuccessToaster={false}
    >
      <Event
        event="success"
        method="trigger"
        params={{}}
        pluginId="check_RequiredDocuments"
        type="datasource"
        waitMs="1000"
        waitType="throttle"
      />
    </SqlTransformQuery>
    <JavascriptQuery
      id="check_RequiredDocuments"
      isHidden={false}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/check_RequiredDocuments.js", "string")}
      resourceName="JavascriptQuery"
      showFailureToaster={false}
      showSuccessToaster={false}
    />
  </Folder>
  <Function
    id="CaseBasicInfo"
    funcBody={include("../lib/CaseBasicInfo.js", "string")}
  />
  <Function
    id="DueDateMsg"
    funcBody={include("../lib/DueDateMsg.js", "string")}
  />
  <SqlQueryUnified
    id="pull_CaseHeader"
    isHidden={false}
    isMultiplayerEdited={false}
    query={include("../lib/pull_CaseHeader.sql", "string")}
    queryDisabled="{{ global_case_id?.value == global_case_header?.value?.case_id }}"
    resourceDisplayName="AHFRAMDW"
    resourceName="6edc6777-ecc7-4d6e-bab7-2067156b4aa7"
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="pull_CaseDetail"
    isHidden={false}
    isMultiplayerEdited={false}
    query={include("../lib/pull_CaseDetail.sql", "string")}
    resourceDisplayName="AHFRAMDW"
    resourceName="6edc6777-ecc7-4d6e-bab7-2067156b4aa7"
    warningCodes={[]}
  />
  <SqlTransformQuery
    id="trigger_input_validations"
    isHidden={false}
    isMultiplayerEdited={false}
    query={include("../lib/trigger_input_validations.sql", "string")}
    queryThrottleTime=""
    resourceName="SQL Transforms"
    resourceTypeOverride=""
  >
    <Event
      enabled="{{ Container_CMSAppeal.currentViewKey == 'Health Plan Reconsideration' }}"
      event="success"
      method="run"
      params={{
        map: {
          src: "CMSAppeal_WOLReceivedDate_input.validate();\nCMSAppeal_AORReceivedDate_input.validate();",
        },
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      enabled="{{ Container_CMSAppeal.currentViewKey == 'IRE Reconsideration' }}"
      event="success"
      method="run"
      params={{
        map: {
          src: "CMSAppeal_IREDecisionReceivedDate_input.validate();\nCMSAppeal_IREDecisionEffectiveDate_input.validate();",
        },
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      enabled="{{ CaseBasicInfo.value?.casetype_description == 'Inquiry' }}"
      event="success"
      method="run"
      params={{
        map: {
          src: "Inquiry_ResolutionDate_input.validate();\nInquiry_ResolutionDeliveryMethod_input.validate();",
        },
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </SqlTransformQuery>
  <Include src="./modal_Case_Selector.rsx" />
  <Include src="./modal_Dismiss.rsx" />
  <Include src="./modal_Escalation_Review.rsx" />
  <Include src="./modal_Establish_Case.rsx" />
  <Include src="./modal_PDF_Generator.rsx" />
  <Include src="./modal_Resolve_in_FF.rsx" />
  <Include src="./modal_View_Escalations.rsx" />
  <Include src="./modal_Withdraw.rsx" />
  <Frame
    id="$main2"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Include src="./CaseViewer_Basic.rsx" />
    <Divider id="divider4" />
    <Table
      id="CaseViewer_DocumentStatus"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ check_RequiredDocuments.data }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      primaryKeyColumnId="b3bcc"
      rowHeight="xsmall"
      showBorder={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="b3bcc"
        alignment="left"
        editable="false"
        editableOptions={{ allowCustomValue: true }}
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="Required Doc"
        label="Required Document"
        optionList={{
          mode: "mapped",
          mappedData: "{{ category_Attachment.value }}",
          valueByIndex: "{{ item }}",
          labelByIndex: "{{ item.split('~')[0] }}",
          captionByIndex: "{{ item.split('~')[1] }}",
          colorByIndex: "",
        }}
        placeholder="Enter value"
        position="center"
        size={160}
        summaryAggregationMode="none"
      />
      <Column
        id="c34cc"
        alignment="right"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="Status"
        label="Status"
        optionList={{
          manualData: [
            {
              ordered: [
                { value: "Optional" },
                { color: "{{ theme.highlight }}" },
              ],
            },
            {
              ordered: [
                { value: "Found" },
                { color: "rgba(5, 150, 105, 0.5)" },
              ],
            },
            {
              ordered: [
                { value: "Not Found" },
                { color: "rgba(248, 106, 106, 0.8)" },
              ],
            },
          ],
        }}
        placeholder="Select option"
        position="center"
        size={112.515625}
        summaryAggregationMode="none"
      />
      <ToolbarButton
        id="1a"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
      <ToolbarButton
        id="3c"
        icon="bold/interface-download-button-2"
        label="Download"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="exportData"
          pluginId="CaseViewer_DocumentStatus"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="refresh"
          pluginId="CaseViewer_DocumentStatus"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
    <Button
      id="button29"
      disabled="{{ CaseBasicInfo.value?.EndStage_YN }}"
      style={{
        ordered: [
          { fontSize: "11px" },
          { fontWeight: "700" },
          { fontFamily: "Inter" },
          { background: "rgba(251, 249, 159, 0.73)" },
        ],
      }}
      text="Generate
Letter"
    >
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="modal_PDF_Generator"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Include src="./Container_CMSAppeal.rsx" />
    <TextArea
      id="CMSAppeal_CaseGeneralComment_input"
      autoResize={true}
      disabled="{{ CaseBasicInfo.value?.EndStage_YN }}"
      label="Case General Comment"
      labelPosition="top"
      minLines="9"
      placeholder="This is to record general comment throughout the full case processing lifecycle.

Recommend to input comment in:
<DateTime> - <Comment>"
      value="{{
  formatDataAsArray(pull_CaseDetail.data)
    .filter(x => x.casedetailtype_description == 'Case_General_Comment' && x.rn_type == 1)
    .map(x => x.casedetail_info)[0]
}}"
    />
    <Spacer id="spacer1" hidden="" />
    <Button
      id="button22"
      disabled="{{
  (formatDataAsArray(pull_CaseDetail.data)
    .filter(x => x.casedetailtype_description == 'Case_General_Comment' && x.rn_type == 1)
    .map(x => x.casedetail_info)[0] == CMSAppeal_CaseGeneralComment_input.value)
    || CaseBasicInfo.value?.EndStage_YN
}}"
      style={{
        ordered: [
          { fontSize: "labelEmphasizedFont" },
          { fontWeight: "labelEmphasizedFont" },
          { fontFamily: "labelEmphasizedFont" },
        ],
      }}
      styleVariant="outline"
      text="Update"
    >
      <Event
        event="click"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  {
                    additionalScope: {
                      ordered: [
                        { casedetailtype_description: "Case_General_Comment" },
                        {
                          casedetail_info:
                            "{{ CMSAppeal_CaseGeneralComment_input.value }}",
                        },
                        { addson1: "" },
                        { addson2: "" },
                        { addson3: "" },
                      ],
                    },
                  },
                ],
              },
            },
          ],
        }}
        pluginId="add_CaseDetail_General"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Include src="./Container_Inquiry.rsx" />
    <Include src="./Container_Reopen.rsx" />
    <Text
      id="Footer2"
      value={
        '<hr style="margin-bottom: 0.5em;">\n<p style="text-align: left; margin-top: 0em;">\n    &nbsp;&nbsp;&nbsp;&nbsp;This app <strong>{{ retoolContext.appName }}</strong> is maintained by: <a href="mailto:jason.zhao@ahf.org">Jason Zhao</a>\n    <span style="float: right;">Last modified on: {{ moment(FooterInfo.data.last_modified_date[0]).format(\'YYYY/MM/DD HH:mm:ss\') }} &nbsp;&nbsp;&nbsp;&nbsp;</span>\n</p>'
      }
      verticalAlign="center"
    />
  </Frame>
</Screen>
