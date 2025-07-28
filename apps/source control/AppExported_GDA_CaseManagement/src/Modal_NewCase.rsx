<ModalFrame
  id="Modal_NewCase"
  footerPadding="0"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="0"
  showHeader={true}
  showOverlay={true}
  size="fullScreen"
  style={{ ordered: [{ background: "canvas" }] }}
  styleContext={{ ordered: [] }}
>
  <Header>
    <Text id="modalTitle1" value="### New Case Wizard" verticalAlign="center" />
    <Button
      id="modalCloseButton1"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="hide"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="Modal_NewCase"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "Math.random()" }] }}
        pluginId="global_trigger_bit"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Text
      id="text3"
      heightType="fixed"
      value="##### Current Case Input Recorded:
"
    />
    <KeyValue
      id="keyValue1"
      data="{{ CurrentCaseInput.value }}"
      editIcon="bold/interface-edit-pencil"
      enableSaveActions={true}
      groupLayout="singleColumn"
      heightType="fixed"
      labelWrap={true}
      style={{}}
    >
      <Property
        id="LOB"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="LOB"
      />
      <Property
        id="Case Type"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Case Type"
      />
      <Property
        id="Case Priority"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Priority"
      />
      <Property
        id="Case Received Date"
        editable="false"
        editableOptions={{}}
        format="datetime"
        formatOptions={{ timeFormat: "hh:mm a", dateFormat: "MM/dd/yyyy" }}
        hidden="false"
        label="Received On"
      />
      <Property
        id="Case Initiator"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Initiator"
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
        id="Case Reference"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Case Reference"
      />
      <Property
        id="Case Reference Type"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Reference Type"
      />
      <Property
        id="Reference Start Date"
        editable="false"
        editableOptions={{}}
        format="date"
        formatOptions={{ dateFormat: "MM/dd/yyyy" }}
        hidden="false"
        label="Reference Start Date"
      />
      <Property
        id="Reference End Date"
        editable="false"
        editableOptions={{}}
        format="date"
        formatOptions={{ dateFormat: "MM/dd/yyyy" }}
        hidden="false"
        label="Reference End Date"
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
        label="Reference Bill Amount"
      />
      <Property
        id="Reference Provider ID"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Reference Provider ID"
      />
      <Property
        id="Reference Provider Name"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Reference Provider Name"
      />
      <Property
        id="Reference Provider Contract"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Reference Provider Contract"
      />
      <Property
        id="Case Open Comment"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Case Open Comment"
      />
      <Property
        id="ServiceNow Ticket No"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="ServiceNow Ticket No"
      />
    </KeyValue>
    <Wizard
      id="wizard1"
      currentStep="7CBgbA7Dv"
      initialStep="7CBgbA7Dv"
      margin="4px 8px"
      onReset="onReset"
      steps={{
        ordered: [
          {
            "7CBgbA7Dv": {
              ordered: [
                { name: "Line of Business" },
                {
                  navButtons: [
                    {
                      ordered: [
                        { buttonText: "AHF" },
                        { buttonType: "goToStep" },
                        { buttonGoToStep: "ygycZA21G" },
                        { buttonEnabled: "{{true}}" },
                        { triggerButtonIf: "{{false}}" },
                      ],
                    },
                    {
                      ordered: [
                        { buttonText: "PHC" },
                        { buttonType: "goToStep" },
                        { buttonGoToStep: "881mCp-s1" },
                        { buttonEnabled: "{{true}}" },
                        { triggerButtonIf: "{{false}}" },
                      ],
                    },
                    {
                      ordered: [
                        { buttonText: "PHP" },
                        { buttonType: "goToStep" },
                        { buttonGoToStep: "YabKpLbB_" },
                        { buttonEnabled: "{{true}}" },
                        { triggerButtonIf: "{{false}}" },
                      ],
                    },
                  ],
                },
                { visualizationXCoordinate: 600 },
                { visualizationYCoordinate: 600 },
                { hideTitle: true },
              ],
            },
          },
          {
            ygycZA21G: {
              ordered: [
                { name: "AHF" },
                {
                  navButtons: [
                    {
                      ordered: [
                        { buttonText: "Next" },
                        { buttonType: "goToStep" },
                        { buttonGoToStep: "pAT7SSiAu" },
                        { buttonEnabled: "{{true}}" },
                        { triggerButtonIf: "{{true}}" },
                      ],
                    },
                  ],
                },
                { visualizationXCoordinate: 136 },
                { visualizationYCoordinate: 728 },
                { isVirtual: true },
                { onEnterQuery: "add_LOB_AHF" },
                { hideTitle: false },
              ],
            },
          },
          {
            "881mCp-s1": {
              ordered: [
                { name: "PHC" },
                {
                  navButtons: [
                    {
                      ordered: [
                        { buttonText: "Next" },
                        { buttonType: "goToStep" },
                        { buttonGoToStep: "fHCqfDPUy" },
                        { buttonEnabled: "{{true}}" },
                        { triggerButtonIf: "{{true}}" },
                      ],
                    },
                  ],
                },
                { visualizationXCoordinate: 440 },
                { visualizationYCoordinate: 728 },
                { isVirtual: true },
                { onEnterQuery: "add_LOB_PHC" },
                { hideTitle: false },
              ],
            },
          },
          {
            YabKpLbB_: {
              ordered: [
                { name: "PHP" },
                {
                  navButtons: [
                    {
                      ordered: [
                        { buttonText: "Next" },
                        { buttonType: "goToStep" },
                        { buttonGoToStep: "I9uz58Qqb" },
                        { buttonEnabled: "{{true}}" },
                        { triggerButtonIf: "{{true}}" },
                      ],
                    },
                  ],
                },
                { visualizationXCoordinate: 776 },
                { visualizationYCoordinate: 728 },
                { isVirtual: true },
                { onEnterQuery: "add_LOB_PHP" },
                { hideTitle: false },
              ],
            },
          },
          {
            I9uz58Qqb: {
              ordered: [
                { name: "PHP Case Info" },
                {
                  navButtons: [
                    {
                      ordered: [
                        { buttonText: "Add Case Attachment" },
                        { buttonType: "goToStep" },
                        { buttonGoToStep: "6JYUDtVfp" },
                        {
                          buttonEnabled:
                            "{{!PHP_CaseInfo_form.invalid && (PHP_CaseRef_Container.currentViewKey == 'Manual Input' ? !PHP_CaseInfo_ManualRef_form.invalid : true)}}",
                        },
                        { triggerButtonIf: "{{false}}" },
                      ],
                    },
                  ],
                },
                { visualizationXCoordinate: 776 },
                { visualizationYCoordinate: 920 },
                { isVirtual: false },
                { onEnterQuery: "" },
                { hideTitle: false },
              ],
            },
          },
          {
            fHCqfDPUy: {
              ordered: [
                { name: "PHC Case Info" },
                { navButtons: [] },
                { visualizationXCoordinate: 440 },
                { visualizationYCoordinate: 920 },
                { isVirtual: false },
                { onEnterQuery: "" },
                { hideTitle: false },
              ],
            },
          },
          {
            pAT7SSiAu: {
              ordered: [
                { name: "AHF Case Info" },
                { navButtons: [] },
                { visualizationXCoordinate: 136 },
                { visualizationYCoordinate: 920 },
                { isVirtual: false },
                { onEnterQuery: "" },
                { hideTitle: false },
              ],
            },
          },
          {
            "6JYUDtVfp": {
              ordered: [
                { name: "PHP Stage Info" },
                {
                  navButtons: [
                    {
                      ordered: [
                        { buttonText: "Next" },
                        { buttonType: "goToStep" },
                        { buttonGoToStep: "RbD1lGTdr" },
                        { buttonEnabled: "{{true}}" },
                        { triggerButtonIf: "{{true}}" },
                      ],
                    },
                  ],
                },
                { visualizationXCoordinate: 776 },
                { visualizationYCoordinate: 1096 },
                { isVirtual: true },
                { onEnterQuery: "add_CaseInfo_PHP" },
                { hideTitle: false },
              ],
            },
          },
          {
            RbD1lGTdr: {
              ordered: [
                { name: "Attachment" },
                {
                  navButtons: [
                    {
                      ordered: [
                        { buttonText: "Submit" },
                        { buttonType: "goToStep" },
                        { buttonGoToStep: "gmFYZx7Ao" },
                        {
                          buttonEnabled:
                            "{{attachment_w_desc.value.length == 0 \n  || attachment_w_desc.value.reduce((count, obj) => count + (obj.desc == null), 0) == 0}}",
                        },
                        { triggerButtonIf: "{{false}}" },
                      ],
                    },
                  ],
                },
                { visualizationXCoordinate: 456 },
                { visualizationYCoordinate: 1240 },
                { isVirtual: false },
                { onEnterQuery: "" },
                { hideTitle: false },
              ],
            },
          },
          {
            gmFYZx7Ao: {
              ordered: [
                { name: "Case Creation" },
                {
                  navButtons: [
                    {
                      ordered: [
                        { buttonText: "Next" },
                        { buttonType: "goToStep" },
                        { buttonGoToStep: "4V2a-ebrw" },
                        { buttonEnabled: "{{true}}" },
                        { triggerButtonIf: "{{true}}" },
                      ],
                    },
                  ],
                },
                { visualizationXCoordinate: 456 },
                { visualizationYCoordinate: 1416 },
                { isVirtual: true },
                { onEnterQuery: "send_CaseInfo" },
                { hideTitle: false },
              ],
            },
          },
          {
            "4V2a-ebrw": {
              ordered: [
                { name: "Final" },
                { navButtons: [] },
                { visualizationXCoordinate: 456 },
                { visualizationYCoordinate: 1592 },
                { isVirtual: false },
                { onEnterQuery: "" },
                { hideTitle: false },
              ],
            },
          },
        ],
      }}
    >
      <FileDropzone
        id="FileDropZone"
        _isUpgraded={true}
        appendNewSelection={true}
        iconBefore="bold/programming-browser-search"
        label=""
        labelPosition="top"
        maxCount={20}
        maxSize="10mb"
        placeholder="Select or Drag & Drop"
        selectionType="multiple"
      />
      <Form
        id="PHP_CaseInfo_form"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        heightType="fixed"
        margin="0"
        overflowType="hidden"
        padding="0"
        requireValidation={true}
        resetAfterSubmit={true}
        showBody={true}
        showBorder={false}
      >
        <Header>
          <Text
            id="formTitle1"
            value="#### Form title"
            verticalAlign="center"
          />
        </Header>
        <Body>
          <Select
            id="PHP_CaseType_input"
            emptyMessage="No options"
            itemMode="static"
            label="Case Type"
            labelPosition="top"
            overlayMaxHeight={375}
            placeholder="Select an option"
            required={true}
            showSelectionIndicator={true}
            value="Post-Service Appeal"
          >
            <Option
              id="f4837"
              disabled="true"
              hidden="true"
              value="Grievance"
            />
            <Option id="9eb20" disabled="true" value="Dispute" />
            <Option id="e6ac3" value="Pre-Service Appeal" />
            <Option
              id="72ed9"
              disabled={false}
              hidden={false}
              value="Post-Service Appeal"
            />
            <Option id="97e39" value="Reopen" />
            <Option id="86427" value="Inquiry" />
            <Option id="22bff" disabled="true" hidden="true" value="Other" />
          </Select>
          <SegmentedControl
            id="PHP_Priority_input"
            disabled="{{ !['Pre-Service Appeal'].includes(PHP_CaseType_input.value) }}"
            hideLabel={true}
            itemMode="static"
            label="Priority"
            labelPosition="top"
            paddingType="spacious"
            value="{{ self.values[0] }}"
          >
            <Option id="f6f51" value="Standard" />
            <Option id="16f2d" value="Expedited" />
          </SegmentedControl>
          <Divider id="divider2" hidden="true" margin="0" />
          <Select
            id="PHP_CaseInitiator_input"
            emptyMessage="No options"
            itemMode="static"
            label="Case Initiator"
            labelPosition="top"
            overlayMaxHeight={375}
            placeholder="Select an option"
            required={true}
            showSelectionIndicator={true}
            value="{{ PHP_CaseType_input.value == 'Dispute' ? 'Provider' : '' }}"
          >
            <Option id="3595e" value="Member" />
            <Option
              id="6f313"
              disabled={false}
              hidden={false}
              value="Member Representative"
            />
            <Option id="41c83" value="Provider" />
            <Option id="68f2f" value="Plan" />
            <Option
              id="2cbba"
              disabled={false}
              hidden={false}
              value="Compliance"
            />
            <Option
              id="791e2"
              disabled={false}
              hidden={false}
              value="Auditor/Agency"
            />
          </Select>
          <Date
            id="PHP_CaseReceivedDate_input"
            dateFormat="MM/dd/yyyy"
            datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
            iconBefore="bold/interface-calendar"
            label="Case Received Date"
            labelPosition="top"
            maxDate="{{ new Date() }}"
            required={true}
            showClear={true}
            value="{{ new Date() }}"
          />
          <Time
            id="PHP_CaseReceivedTime_input"
            displayTimeZone="local"
            hidden="{{ !(PHP_CaseType_input.value == 'Pre-Service Appeal' && PHP_Priority_input.value == 'Expedited') }}"
            iconBefore="bold/interface-time-clock-circle-alternate"
            label=""
            labelPosition="top"
            minuteStep="60"
            required="{{ PHP_CaseType_input.value == 'Pre-Service Appeal' && PHP_Priority_input.value == 'Expedited' }}"
            showClear={true}
            textAfter="In PST"
            value={
              "{{ moment().tz(\"America/Los_Angeles\").format('HH:mm:ss.SSS') }}"
            }
            valueTimeZone="00:00"
          />
          <Container
            id="PHP_CaseRef_Container"
            currentViewKey="{{ self.viewKeys[0] }}"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            padding="12px"
            showBody={true}
            showHeader={true}
            style={{ ordered: [] }}
          >
            <Header>
              <Tabs
                id="tabs1"
                alignment="justify"
                itemMode="static"
                margin="0"
                navigateContainer={true}
                targetContainerId="PHP_CaseRef_Container"
                value="{{ self.values[0] }}"
              >
                <Option id="4c7f9" value="Tab 1" />
                <Option id="71af2" value="Tab 2" />
                <Option id="28374" value="Tab 3" />
              </Tabs>
            </Header>
            <View id="8c3ab" viewKey="Automatic Fill">
              <Button
                id="button20"
                style={{
                  ordered: [{ background: "rgba(222, 152, 10, 0.36)" }],
                }}
                text="Click to Pick Claim / Prior Authorization Reference"
              >
                <Event
                  enabled="{{ PHP_CaseType_input.value == 'Pre-Service Appeal' }}"
                  event="click"
                  method="show"
                  params={{ ordered: [] }}
                  pluginId="Modal_PA_Lookup"
                  type="widget"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  enabled="{{ PHP_CaseType_input.value != 'Pre-Service Appeal' }}"
                  event="click"
                  method="show"
                  params={{ ordered: [] }}
                  pluginId="Modal_Claim_Lookup"
                  type="widget"
                  waitMs="0"
                  waitType="debounce"
                />
              </Button>
            </View>
            <View id="dac96" viewKey="Manual Input">
              <Form
                id="PHP_CaseInfo_ManualRef_form"
                disabled=""
                footerPadding="4px 12px"
                headerPadding="4px 12px"
                margin="0"
                padding="0"
                requireValidation={true}
                resetAfterSubmit={true}
                showBody={true}
                showBorder={false}
              >
                <Header>
                  <Text
                    id="formTitle3"
                    value="#### Form title"
                    verticalAlign="center"
                  />
                </Header>
                <Body>
                  <TextInput
                    id="PHP_MemberID_input"
                    disabled=""
                    label="Member ID"
                    labelWidth="40"
                    placeholder="Click and Choose"
                    readOnly="true"
                    required="{{ PHP_CaseRef_Container.currentViewKey == 'Manual Input' }}"
                    showClear={true}
                  >
                    <Event
                      event="focus"
                      method="show"
                      params={{ ordered: [] }}
                      pluginId="Modal_Member_Lookup"
                      type="widget"
                      waitMs="0"
                      waitType="debounce"
                    />
                  </TextInput>
                  <NumberInput
                    id="PHP_BillAmount_input"
                    allowNull={true}
                    currency="USD"
                    format="currency"
                    hidden="{{ PHP_CaseType_input.value == 'Pre-Service Appeal' }}"
                    inputValue={0}
                    label="Bill Amount"
                    labelWidth="40"
                    placeholder="Enter value"
                    required="{{ PHP_CaseType_input.value == 'Post-Service Appeal' }}"
                    showClear={true}
                    showSeparators={true}
                    showStepper={true}
                    value=""
                  />
                  <Divider id="divider6" hidden="true" />
                  <Select
                    id="PHP_CaseRefType_input"
                    emptyMessage="No options"
                    itemMode="static"
                    label="Ref Type"
                    labelWidth="40"
                    overlayMaxHeight={375}
                    placeholder="Select an option"
                    required="{{ PHP_CaseRef_Container.currentViewKey == 'Manual Input' }}"
                    showClear={true}
                    showSelectionIndicator={true}
                    value="''"
                  >
                    <Option id="261b2" label="Prior Authorization" value="PA" />
                    <Option id="48f1a" value="Claim" />
                  </Select>
                  <TextInput
                    id="PHP_CaseRef_input"
                    label="Ref #"
                    labelWidth="40"
                    placeholder="Enter value"
                    required="{{ PHP_CaseRef_Container.currentViewKey == 'Manual Input' }}"
                    showClear={true}
                  />
                  <Divider id="divider7" hidden="true" />
                  <Date
                    id="PHP_CaseRefStartDate_input"
                    dateFormat="MM/dd/yyyy"
                    datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
                    iconBefore="bold/interface-calendar"
                    label="Ref Start Date"
                    labelWidth="40"
                    required="{{ PHP_CaseRef_Container.currentViewKey == 'Manual Input' }}"
                    showClear={true}
                  />
                  <Date
                    id="PHP_CaseRefEndDate_input"
                    dateFormat="MM/dd/yyyy"
                    datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
                    iconBefore="bold/interface-calendar"
                    label="Ref End Date"
                    labelWidth="40"
                    required="{{ PHP_CaseRef_Container.currentViewKey == 'Manual Input' }}"
                    showClear={true}
                  />
                  <Divider id="divider8" hidden="true" />
                  <Select
                    id="PHP_CaseRefProviderID_input"
                    allowCustomValue={true}
                    emptyMessage="No options"
                    itemMode="static"
                    label="Provider ID"
                    labelWidth="40"
                    labelWrap={true}
                    overlayMaxHeight={375}
                    placeholder="Input or choose"
                    required="{{ PHP_CaseRef_Container.currentViewKey == 'Manual Input' }}"
                    showClear={true}
                    showSelectionIndicator={true}
                  >
                    <Option id="261b2" value="Not in HS" />
                  </Select>
                  <Select
                    id="PHP_CaseRefProviderContract_input"
                    emptyMessage="No options"
                    itemMode="static"
                    label="Provider Contract"
                    labelWidth="40"
                    overlayMaxHeight={375}
                    placeholder="Choose"
                    required="{{ PHP_CaseRef_Container.currentViewKey == 'Manual Input' }}"
                    showSelectionIndicator={true}
                  >
                    <Option id="0dbbf" label="Contracted" value="CP" />
                    <Option id="46acf" label="Non Contracted" value="NCP" />
                  </Select>
                  <TextInput
                    id="PHP_CaseRefProviderName_input"
                    label="Provider Name"
                    labelWidth="20"
                    placeholder="Enter value"
                    required="{{ PHP_CaseRef_Container.currentViewKey == 'Manual Input' }}"
                    showClear={true}
                  />
                </Body>
                <Footer>
                  <Button
                    id="formButton3"
                    submit={true}
                    submitTargetId="PHP_CaseInfo_ManualRef_form"
                    text="Submit"
                  />
                </Footer>
              </Form>
            </View>
          </Container>
          <TextInput
            id="PHP_SNTicketNo_input"
            label="ServiceNow Ticket No"
            labelPosition="top"
            placeholder="Enter value"
          />
          <TextArea
            id="PHP_OpenComment_input"
            label="Case Open Comment"
            labelPosition="top"
            minLines="4"
            placeholder="Please document the full request from the case initiator.

* This section cannot be modified after case creation."
            required={true}
          />
        </Body>
        <Footer>
          <Button
            id="formButton1"
            submit={true}
            submitTargetId=""
            text="Submit"
          />
        </Footer>
      </Form>
      <Status
        id="status1"
        horizontalAlign="center"
        itemMode="static"
        style={{
          ordered: [
            { fontSize: "h4Font" },
            { fontWeight: "h4Font" },
            { fontFamily: "h4Font" },
          ],
        }}
        value="{{ send_CaseInfo.isFetching ? 'inprogress' : (send_CaseInfo.error == null ? 'success' : 'failed') }}"
      >
        <Option
          id="634d6"
          color="{{ theme.warning }}"
          icon="bold/interface-page-controller-loading-1"
          label="Case is being created.............."
          value="inprogress"
        />
        <Option
          id="d7a99"
          color="{{ theme.success }}"
          icon="bold/interface-validation-check-circle"
          label="Case has been created. Case Number: {{ send_CaseInfo.data.case_id[0] }}"
          value="success"
        />
        <Option
          id="d33c5"
          color="{{ theme.danger }}"
          icon="bold/interface-alert-warning-circle"
          label="Case creation failed. Please try again later."
          value="failed"
        />
      </Status>
      <Image
        id="image1"
        heightType="fixed"
        horizontalAlign="center"
        src="https://thepublichealthinsight.com/wp-content/uploads/2023/10/9.png"
      />
      <Status
        id="status2"
        horizontalAlign="center"
        itemMode="static"
        value="{{ FileDropZone.value.length > 0
   ? ( upload_attachment.data == null ? 'uploading' : 'finished')
   : 'no_attachment' }}"
      >
        <Option
          id="1488a"
          color="{{ theme.success }}"
          icon="bold/interface-validation-check-circle"
          label="Attachments have been uploaded. Confirm status below."
          value="finished"
        />
        <Option
          id="5d03b"
          color="{{ theme.warning }}"
          icon="bold/interface-alert-warning-circle"
          label="Attachments are being uploading....."
          value="uploading"
        />
        <Option
          id="d4d63"
          color="{{ theme.danger }}"
          icon="bold/interface-delete-circle"
          label="No attachment in the previous step."
          value="no_attachment"
        />
      </Status>
      <Table
        id="table1"
        cellSelection="none"
        clearChangesetOnSave={true}
        data="{{ upload_attachment.data }}"
        defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
        emptyMessage="No Attachment"
        enableSaveActions={true}
        margin="0"
        primaryKeyColumnId="fff58"
        rowHeight="xsmall"
        rowSelection="none"
        showBorder={true}
        showHeader={true}
        toolbarPosition="bottom"
      >
        <Column
          id="fff58"
          alignment="left"
          editable="false"
          format="link"
          formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
          groupAggregationMode="none"
          key="file_name"
          label="File Name"
          position="center"
          size={621}
          summaryAggregationMode="none"
        >
          <Event
            event="clickCell"
            method="openUrl"
            params={{ ordered: [{ url: "{{ item }}" }] }}
            pluginId=""
            type="util"
            waitMs="0"
            waitType="debounce"
          />
        </Column>
        <Column
          id="07023"
          alignment="left"
          format="tag"
          formatOptions={{ automaticColors: true }}
          groupAggregationMode="none"
          key="status"
          label="Status"
          placeholder="Select option"
          position="center"
          size={100}
          summaryAggregationMode="none"
          valueOverride="{{ _.startCase(item) }}"
        />
      </Table>
      <Divider id="divider1" />
      <Table
        id="FileUploaded_table"
        cellSelection="none"
        clearChangesetOnSave={true}
        data="{{ list_FileUploaded.data }}"
        defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
        emptyMessage="No File Uploaded"
        primaryKeyColumnId="7c208"
        rowHeight="small"
        showBorder={true}
        showHeader={true}
        toolbarPosition="bottom"
      >
        <Column
          id="7c208"
          alignment="left"
          editable={false}
          format="link"
          formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
          groupAggregationMode="none"
          key="FileName"
          label="File Name"
          position="center"
          size={659}
          summaryAggregationMode="none"
        >
          <Event
            event="clickCell"
            method="openUrl"
            params={{ ordered: [{ url: "{{ item }}" }] }}
            pluginId=""
            type="util"
            waitMs="0"
            waitType="debounce"
          />
        </Column>
        <Column
          id="41132"
          alignment="right"
          editableOptions={{ showStepper: true }}
          format="string"
          formatOptions={{ showSeparators: true, notation: "standard" }}
          groupAggregationMode="sum"
          key="SizeInBytes"
          label="Size (KB)"
          placeholder="Enter value"
          position="center"
          size={76.515625}
          summaryAggregationMode="none"
          valueOverride="{{ (item/1024).toFixed(1) }}"
        />
        <Column
          id="9ed44"
          alignment="right"
          cellTooltip="{{ item }}"
          editable="true"
          editableOptions={{ allowCustomValue: true }}
          format="tag"
          formatOptions={{ automaticColors: true }}
          groupAggregationMode="none"
          label="Description"
          optionList={{
            manualData: [
              { ordered: [{ value: "WOL" }] },
              { ordered: [{ value: "AOR" }] },
            ],
            mode: "mapped",
            mappedData: "{{ category_Attachment.value }}",
            valueByIndex: "{{ item }}",
            labelByIndex: "{{ item.split('~')[0] }}",
            captionByIndex: "{{ item.split('~')[1] }}",
          }}
          placeholder="Select or Type"
          position="center"
          referenceId="desc"
          size={100}
          summaryAggregationMode="none"
        />
      </Table>
      <Text
        id="text7"
        value="🐑 **Under Development..........**"
        verticalAlign="center"
      />
      <Text
        id="text8"
        value="🐑 **Under Development..........**"
        verticalAlign="center"
      />
      <Text
        id="text4"
        horizontalAlign="center"
        style={{ ordered: [{ background: "canvas" }] }}
        value="##### Choose proper Line of Business from below"
        verticalAlign="center"
      />
      <ButtonGroup2
        id="buttonGroup1"
        hidden="{{ !(status1.value == 'success' && ['no_attachment', 'finished'].includes(status2.value))  }}"
        overflowPosition={2}
      >
        <ButtonGroup2-Button
          id="e273d"
          styleVariant="outline"
          text="Back To Case List"
        >
          <Event
            event="click"
            method="run"
            params={{
              ordered: [
                {
                  src: "Modal_NewCase.hide();\nonReset.trigger();\nglobal_trigger_bit.setValue(Math.random());",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </ButtonGroup2-Button>
        <ButtonGroup2-Button
          id="3ba1b"
          styleVariant="solid"
          text="View Case {{ send_CaseInfo.data.case_id[0] }}"
        >
          <Event
            event="click"
            method="openPage"
            params={{
              ordered: [
                { pageName: "CaseViewer" },
                {
                  options: {
                    ordered: [
                      { queryParams: [] },
                      { passDataWith: "globalVariable" },
                    ],
                  },
                },
              ],
            }}
            pluginId=""
            type="util"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="click"
            method="run"
            params={{
              ordered: [{ src: "Modal_NewCase.hide();\nonReset.trigger();\n" }],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </ButtonGroup2-Button>
      </ButtonGroup2>
    </Wizard>
  </Body>
</ModalFrame>
