<Container
  id="CaseViewer_Basic"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle1"
      value="#### Case Basics"
      verticalAlign="center"
    />
  </Header>
  <View id="fcba9" viewKey="View 1">
    <TextInput
      id="CaseViewer_CaseID_input"
      label="Case ID"
      placeholder="Enter value"
      showClear={true}
      value="{{ global_case_id.value }}"
    >
      <Event
        enabled="{{ self.value.length == 7}}"
        event="submit"
        method="setValue"
        params={{ ordered: [{ value: "{{ CaseViewer_CaseID_input.value }}" }] }}
        pluginId="global_case_id"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <Text
      id="CaseViewer_DueDate"
      horizontalAlign="right"
      style={{ ordered: [{ background: "highlight" }] }}
      value="##### <u>{{ DueDateMsg.value }}</u>"
      verticalAlign="center"
    />
    <Text id="text10" value="##### Case Info" verticalAlign="center" />
    <IconText
      id="iconText2"
      hidden="{{ !upload_newattachment.isFetching }}"
      horizontalAlign="right"
      icon="bold/interface-page-controller-loading-1"
      iconPosition="right"
      style={{
        ordered: [
          { fontSize: "labelEmphasizedFont" },
          { fontWeight: "labelEmphasizedFont" },
          { fontFamily: "labelEmphasizedFont" },
          { iconColor: "warning" },
          { color: "warning" },
        ],
      }}
      text="Uploading........"
    />
    <Text id="text11" value="##### Attachments" verticalAlign="center" />
    <KeyValue
      id="CaseViewer_CaseBasic_1"
      data={
        '{\n  "Line of Business": {{ CaseBasicInfo.value?.lob }},\n  "Case Type": {{ CaseBasicInfo.value?.casetype_description }},\n  "Case Priority": {{ CaseBasicInfo.value?.case_priority }},\n  "Case Initiator": {{ CaseBasicInfo.value?.case_initiator }},\n  "Case Received Date": {{ CaseBasicInfo.value?.Case_Received_Date }},\n  "Case Owner": {{ CaseBasicInfo.value?.case_owner }},\n  "Member ID": {{ CaseBasicInfo.value?.case_memberid }},\n  "Member Name": {{ CaseBasicInfo.value?.Reference_Member_Name }},\n  "WOL/AOR Required": {{ CaseBasicInfo.value?.WOLAOR_req }},\n  "ServiceNow Ticket No": {{ CaseBasicInfo.value?.ServiceNow_Ticket_No }},\n  "Case Converted To": {{ CaseBasicInfo.value?.Case_Converted }}\n}'
      }
      editIcon="bold/interface-edit-pencil"
      enableSaveActions={true}
      groupLayout="singleColumn"
      heightType="fixed"
      labelWrap={true}
    >
      <Property
        id="Line of Business"
        editable="false"
        editableOptions={{}}
        format="tag"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="LOB"
      />
      <Property
        id="Case Type"
        editable="false"
        editableOptions={{}}
        format="tag"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Case Type"
      />
      <Property
        id="Case Priority"
        editable="false"
        editableOptions={{}}
        format="tag"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Case Priority"
        optionList={{
          manualData: [
            {
              ordered: [
                { value: "Expedited" },
                { color: "{{ theme.danger }}" },
              ],
            },
            { ordered: [{ value: "Standard" }, { color: "{{ theme.info }}" }] },
            {
              ordered: [
                { value: "Not Applicable" },
                { color: "{{ theme.canvas }}" },
              ],
            },
          ],
        }}
      />
      <Property
        id="Case Initiator"
        editable="false"
        editableOptions={{}}
        format="tag"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Case Initiator"
      />
      <Property
        id="Case Received Date"
        editable="{{ !CaseBasicInfo.value.EndStage_YN }}"
        editableOptions={{}}
        format="datetime"
        formatOptions={{ dateFormat: "MM/dd/yyyy" }}
        hidden="false"
        label="Case Received Date"
      />
      <Property
        id="Case Owner"
        editable="{{ !CaseBasicInfo.value.EndStage_YN }}"
        editableOptions={{ allowCustomValue: true }}
        format="tag"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Case Owner"
        optionList={{
          mode: "mapped",
          mappedData: "{{ category_CaseOwner.value }}",
          valueByIndex: "{{ item }}",
          labelByIndex: "",
        }}
      />
      <Property
        id="Member ID"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Member ID"
      />
      <Property
        id="Member Name"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Member Name"
      />
      <Property
        id="WOL/AOR Required"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="WOL/AOR Required"
      />
      <Property
        id="ServiceNow Ticket No"
        editable="{{ !CaseBasicInfo.value.EndStage_YN }}"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="ServiceNow Ticket No"
      />
      <Property
        id="Case Converted To"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Case Converted To"
      />
      <Event
        event="save"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  {
                    additionalScope: {
                      ordered: [
                        { changeset: "{{ CaseViewer_CaseBasic_1.changeset }}" },
                      ],
                    },
                  },
                ],
              },
            },
          ],
        }}
        pluginId="prep_CaseDetail_Batch"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </KeyValue>
    <IconText
      id="iconText1"
      hidden="{{ !add_CaseDetail_Batch.isFetching }}"
      horizontalAlign="right"
      icon="bold/interface-page-controller-loading-1"
      iconPosition="right"
      maintainSpaceWhenHidden={true}
      style={{
        ordered: [
          { fontSize: "labelEmphasizedFont" },
          { fontWeight: "labelEmphasizedFont" },
          { fontFamily: "labelEmphasizedFont" },
          { color: "warning" },
          { iconColor: "warning" },
        ],
      }}
      text="Info's being updated........"
    />
    <Table
      id="CaseViewer_CaseAttachments"
      actionsOverflowPosition={2}
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ pull_CaseAttachment.data }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No attachments found"
      enableSaveActions={true}
      primaryKeyColumnId="ec663"
      rowHeight="medium"
      showBorder={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="ec663"
        alignment="right"
        editable={false}
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="attachment_id"
        label="Attachment ID"
        placeholder="Enter value"
        position="center"
        size={96.96875}
        summaryAggregationMode="none"
      />
      <Column
        id="a7b33"
        alignment="left"
        editableOptions={{ allowCustomValue: true }}
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="attachment_desc"
        label="Description"
        optionList={{
          mode: "mapped",
          mappedData: "{{ category_Attachment.value }}",
          valueByIndex: "{{ item }}",
          labelByIndex: "{{ item.split('~')[0] }}",
          captionByIndex: "{{ item.split('~')[1] }}",
          colorByIndex: "{{ theme.primary }}",
        }}
        placeholder="Enter value"
        position="center"
        size={118.75}
        summaryAggregationMode="none"
        valueOverride="{{ item.replace('~', ' ') }}"
      />
      <Column
        id="0de03"
        alignment="left"
        format="string"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="none"
        key="attachment_name"
        label="Attachment Name"
        placeholder="Enter value"
        position="center"
        size={143}
        summaryAggregationMode="none"
      />
      <Column
        id="9fe0c"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="attachment_sizeBytes"
        label="File Size"
        placeholder="Enter value"
        position="center"
        size={62.890625}
        summaryAggregationMode="none"
      />
      <Column
        id="ede84"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="none"
        hidden="false"
        key="attachment_upload_by"
        label="Uploaded By"
        placeholder="Enter value"
        position="center"
        size={167.34375}
        summaryAggregationMode="none"
      >
        <Event
          event="clickCell"
          method="openUrl"
          params={{ ordered: [{ url: "mailto:{{ item }}" }] }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="05866"
        alignment="left"
        format="datetime"
        formatOptions={{ dateFormat: "MM/dd/yyyy" }}
        groupAggregationMode="none"
        key="attachment_upload_datetime"
        label="Uploaded At"
        placeholder="Enter value"
        position="center"
        size={146.171875}
        summaryAggregationMode="none"
      />
      <Action
        id="7683e"
        icon="bold/interface-download-button-2"
        label="Download"
      >
        <Event
          event="clickAction"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="download_attachmentContent"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Action>
      <Action
        id="cb3ec"
        disabled="{{ CaseBasicInfo.value.EndStage_YN }}"
        icon="bold/interface-delete-bin-2"
        label="Remove"
      >
        <Event
          event="clickAction"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="remove_attachment"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Action>
    </Table>
    <KeyValue
      id="CaseViewer_CaseBasic_2"
      data={
        '{\n  "Reference Type": {{ CaseBasicInfo.value?.case_ref_type }},\n  "Reference Number": {{ CaseBasicInfo.value?.case_ref }},\n  "Reference StartDate": {{ CaseBasicInfo.value?.Reference_Start_Date }},\n  "Reference EndDate": {{ CaseBasicInfo.value?.Reference_End_Date }},\n  "Reference Bill Amount": {{ CaseBasicInfo.value?.Reference_Bill_Amount }},\n  "Reference Provider": {{ CaseBasicInfo.value?.Reference_Provider_Name == null\n                            ? null\n                            : CaseBasicInfo.value?.Reference_Provider_Name + \' (ProvID: \' + CaseBasicInfo.value?.Reference_Provider_ID  + \')\'}},\n  "Reference Provider Contract": {{ CaseBasicInfo.value?.Reference_Provider_Contract }}\n}'
      }
      editIcon="bold/interface-edit-pencil"
      enableSaveActions={true}
      groupLayout="singleColumn"
      heightType="fixed"
      labelWrap={true}
    >
      <Property
        id="Reference Type"
        editable="false"
        editableOptions={{}}
        format="tag"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Ref Type"
      />
      <Property
        id="Reference Number"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Ref Number"
      />
      <Property
        id="Reference StartDate"
        editable="false"
        editableOptions={{}}
        format="date"
        formatOptions={{ dateFormat: "MM/dd/yyyy" }}
        hidden="false"
        label="Ref Start Date"
      />
      <Property
        id="Reference EndDate"
        editable="false"
        editableOptions={{}}
        format="date"
        formatOptions={{ dateFormat: "MM/dd/yyyy" }}
        hidden="false"
        label="Ref End Date"
      />
      <Property
        id="Reference Bill Amount"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          currency: "USD",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
        }}
        hidden="false"
        label="Ref Bill Amount"
      />
      <Property
        id="Reference Provider"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Ref Provider"
      />
      <Property
        id="Reference Provider Contract"
        editable="{{ !CaseBasicInfo.value.EndStage_YN }}"
        editableOptions={{}}
        format="tag"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Ref Provider Contract"
        optionList={{
          manualData: [
            { ordered: [{ value: "CP" }, { label: "Contracted" }] },
            { ordered: [{ value: "NCP" }, { label: "Non Contracted" }] },
            { ordered: [{ value: "NA" }, { label: "Not Applicable" }] },
          ],
        }}
      />
      <Event
        enabled="{{ CaseViewer_CaseBasic_2.changeset != null }}"
        event="save"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  {
                    additionalScope: {
                      map: {
                        changeset: "{{ CaseViewer_CaseBasic_2.changeset }}",
                      },
                    },
                  },
                ],
              },
            },
          ],
        }}
        pluginId="prep_CaseDetail_Batch"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </KeyValue>
    <Form
      id="CaseViewer_UploadAttachment"
      disabled="{{ CaseBasicInfo.value?.EndStage_YN }}"
      footerPadding="0"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showFooter={true}
    >
      <Header>
        <Text id="formTitle2" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <FileInput
          id="fileInput1"
          _isUpgraded={true}
          hideLabel={true}
          iconBefore="bold/programming-browser-search"
          labelPosition="top"
          maxCount={20}
          maxSize="10mb"
          required={true}
          textBefore="Browse"
        />
        <Select
          id="select1"
          captionByIndex="{{ item.split('~')[1] }}"
          data="{{ [...category_Attachment.value, 'Other'] }}"
          emptyMessage="No options"
          hideLabel={true}
          labelPosition="top"
          labels="{{ item.split('~')[0] }}"
          overlayMaxHeight={375}
          placeholder="Choose File Description"
          required={true}
          showSelectionIndicator={true}
          values="{{ item }}"
        />
        <TextInput
          id="textInput1"
          hidden="{{ select1.value != 'Other' }}"
          hideLabel={true}
          labelPosition="top"
          placeholder="If other, briefly describe"
          required="{{ select1.value == 'Other' }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton2"
          style={{ ordered: [] }}
          styleVariant="outline"
          submit={true}
          submitTargetId="CaseViewer_UploadAttachment"
          text="Upload"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="upload_newattachment"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
    <Divider id="divider3" />
    <Button
      id="button30"
      disabled="{{ CaseBasicInfo.value?.EndStage_YN }}"
      style={{ ordered: [{ background: "rgba(219, 145, 89, 1)" }] }}
      text="Escalation Review"
    >
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="modal_Escalation_Review"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Timeline
      id="CaseAuditTimeline"
      dateFormat="MM/dd/yyyy"
      groupBy="none"
      isGrouped={true}
      items="{{ formatDataAsArray(pull_CaseDetail.data)
   .filter(x => x.casedetailtype_id.startsWith('A'))
   .map(x => x.casedetailtype_description.replaceAll('_', ' '))
}}"
      margin="4px 8px"
      sortedDesc={true}
      timestamps="{{ formatDataAsArray(pull_CaseDetail.data)
   .filter(x => x.casedetailtype_id.startsWith('A'))
   .map(x => moment(x.casedetail_add_datetime).tz('UTC').format('YYYY/MM/DD HH:mm:ss.SSS'))
}}"
    />
    <Text id="text9" value="##### Audit Timeline" verticalAlign="center" />
    <Button
      id="button31"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="View Escalations"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="pull_Escalations"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="modal_View_Escalations"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
