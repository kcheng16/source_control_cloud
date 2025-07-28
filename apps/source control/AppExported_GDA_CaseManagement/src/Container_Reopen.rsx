<Container
  id="Container_Reopen"
  currentViewKey="{{ formatDataAsArray(pull_CaseDetail.data)
    .filter(x => x.casedetailtype_id.startsWith('AS') && x.rn_subclass_general == 1)
    .map(x => x.casedetailtype_description.replaceAll('_', ' '))[0]
}}"
  disabled="{{ CaseBasicInfo.value?.EndStage_YN }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  heightType="fixed"
  hidden="{{ CaseBasicInfo.value?.casetype_description != 'Reopen' ?? true }}"
  padding="12px"
  showBody={true}
  showFooter={true}
  showHeader={true}
  transition="slide"
>
  <Header>
    <Steps
      id="steps3"
      heightType="fixed"
      horizontalAlign="center"
      itemMode="static"
      navigateContainer={true}
      orientation="vertical"
      showStepNumbers={true}
      targetContainerId="Container_Reopen"
      value="{{ self.values[0] }}"
    >
      <Option id="16a14" value="Step 1" />
      <Option id="2d093" value="Step 2" />
      <Option id="c6890" value="Step 3" />
    </Steps>
  </Header>
  <View id="bfead" viewKey="Reopening Info">
    <Form
      id="Reopen_Info_form"
      disabled="{{ formatDataAsArray(pull_CaseDetail.data).filter(x => x.casedetailtype_description == 'Reopening_Resolution').length > 0 }}"
      disableSubmit=""
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      margin="0"
      padding="0"
      requireValidation={true}
      showBody={true}
      style={{ ordered: [] }}
    >
      <Header>
        <Text id="formTitle4" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <TextInput
          id="Reopen_PreviousCaseIDHook_input"
          disabled=""
          label="Previous Case ID Hook"
          labelPosition="top"
          loading=""
          placeholder="Click to select case"
          readOnly="true"
          value="{{ CaseBasicInfo.value?.Previous_Case_ID_Hook }}"
        >
          <Event
            event="focus"
            method="show"
            params={{ ordered: [] }}
            pluginId="modal_Case_Selector"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </TextInput>
        <Divider id="divider11" hidden="true" />
        <Select
          id="Reopen_ReopeningReason_input"
          emptyMessage="No options"
          itemMode="static"
          label="Reopening Reason"
          labelPosition="top"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showClear={true}
          showSelectionIndicator={true}
          value="{{ 
  self.values.includes(CaseBasicInfo.value?.Reopening_Reason ?? 'Other')
    ? CaseBasicInfo.value?.Reopening_Reason
    : 'Other'
}}"
        >
          <Option id="17703" value="Clerical Error" />
          <Option id="7fbeb" value="Other Error" />
          <Option id="d1a74" value="New and Material Evidence" />
          <Option
            id="5904f"
            disabled={false}
            hidden={false}
            value="Fraud or Similar Fault"
          />
          <Option
            id="b3b23"
            caption="Please specify"
            disabled={false}
            hidden={false}
            value="Other"
          />
        </Select>
        <Spacer id="spacer3" />
        <TextInput
          id="Reopen_ReopeningReason_Other_input"
          hidden="{{ Reopen_ReopeningReason_input.value != 'Other' }}"
          label=""
          labelPosition="top"
          placeholder="Enter value"
          required="{{ Reopen_ReopeningReason_input.value == 'Other' }}"
          showClear={true}
          value="{{ 
  Reopen_ReopeningReason_input.value == 'Other'
    ? CaseBasicInfo.value?.Reopening_Reason
    : ''
}}"
        />
        <Divider id="divider9" hidden="true" />
        <Date
          id="Reopen_PreviousDecisionDate_input"
          dateFormat="MM/dd/yyyy"
          datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
          iconBefore="bold/interface-calendar"
          label="Previous Decision Date"
          labelPosition="top"
          required={true}
          showClear={true}
          value="{{ CaseBasicInfo.value?.Previous_Decision_Date }}"
        />
        <Select
          id="Reopen_PreviousDecision_input"
          emptyMessage="No options"
          itemMode="static"
          label="Previous Decision"
          labelPosition="top"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showClear={true}
          showSelectionIndicator={true}
          value="{{ CaseBasicInfo.value?.Previous_Decision }}"
        >
          <Option id="1edf3" value="Approved" />
          <Option id="806f9" value="Denied" />
          <Option id="faf1b" value="Pending" />
        </Select>
      </Body>
      <Footer>
        <Button
          id="formButton4"
          submit={true}
          submitTargetId="Reopen_Info_form"
          text="Submit"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  {
                    additionalScope: {
                      ordered: [
                        { casedetailtype_description: "_AddReopenInfo" },
                        {
                          casedetail_info:
                            "{{ Reopen_PreviousCaseIDHook_input.value }}",
                        },
                        {
                          addson1:
                            "{{ \n  Reopen_ReopeningReason_input.value == 'Other'\n    ? Reopen_ReopeningReason_Other_input.value\n    : Reopen_ReopeningReason_input.value\n}}",
                        },
                        {
                          addson2:
                            "{{ moment(Reopen_PreviousDecisionDate_input.value).format('MM/DD/yyyy') }}",
                        },
                        {
                          addson3: "{{ Reopen_PreviousDecision_input.value }}",
                        },
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
    </Form>
    <Button
      id="button27"
      style={{ ordered: [{ background: "success" }] }}
      submit={true}
      submitTargetId="Reopen_Info_form"
      text="Submit Info"
    />
  </View>
  <View id="7b243" viewKey="Reopening Resolution">
    <Form
      id="Reopen_Resolution_form"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="12px"
      requireValidation={true}
      showBody={true}
    >
      <Header>
        <Text id="formTitle5" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <Date
          id="Reopen_ResolutionDate_input"
          dateFormat="MM/dd/yyyy"
          datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
          iconBefore="bold/interface-calendar"
          label="Reopen Resolution Date"
          labelPosition="top"
          required={true}
          showClear={true}
          value="{{ CaseBasicInfo.value?.Case_Resolution_Date }}"
        />
        <Select
          id="Reopen_ResolutionDeliveryMethod_input"
          data="{{ [...category_ResolutionDeliveryMethod.value, 'Other'] }}"
          emptyMessage="No options"
          label="Resolution Delivery Method"
          labelPosition="top"
          labels=""
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showClear={true}
          showSelectionIndicator={true}
          value="{{ 
  self.values.includes(CaseBasicInfo.value?.Case_Resolution_Delivery_Method ?? 'Other')
    ? CaseBasicInfo.value?.Case_Resolution_Delivery_Method
    : 'Other'
}}"
          values="{{ item }}"
        />
        <TextInput
          id="Reopen_ResolutionDeliveryMethod_Other_input"
          hidden="{{ Reopen_ResolutionDeliveryMethod_input.value != 'Other' }}"
          label=""
          labelPosition="top"
          placeholder="If other, please specify"
          value="{{ 
  Inquiry_ResolutionDeliveryMethod_input.value == 'Other'
    ? CaseBasicInfo.value?.Case_Resolution_Delivery_Method
    : ''
}}"
        />
        <Divider id="divider10" hidden="true" />
        <Select
          id="Reopen_Resolution_input"
          emptyMessage="No options"
          itemMode="static"
          label="Reopen Resolution"
          labelPosition="top"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showClear={true}
          showSelectionIndicator={true}
          value="{{ formatDataAsArray(pull_CaseDetail.data)
  .filter(x => x.casedetailtype_description.startsWith('D'))
  .casedetailtype_description?.[0] }}"
        >
          <Option id="f96a0" label="Fully Favorable" value="Fully_Favorable" />
          <Option
            id="53a42"
            label="Partially Favorable"
            value="Partially_Favorable"
          />
          <Option id="2539a" value="Denied" />
        </Select>
        <TextInput
          id="Reopen_NewClaimNo_input"
          label="New Claim Number"
          labelPosition="top"
          placeholder="Enter value"
          showClear={true}
          value="{{ CaseBasicInfo.value?.New_Claim_No }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton5"
          submit={true}
          submitTargetId="Reopen_Resolution_form"
          text="Submit"
        />
      </Footer>
      <Event
        enabled="{{ CaseBasicInfo.value?.RequiredDoc_All }}"
        event="submit"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  {
                    additionalScope: {
                      ordered: [
                        { casedetailtype_description: "_ResolveReopen" },
                        {
                          casedetail_info:
                            "{{ moment(Reopen_ResolutionDate_input.value).format('MM/DD/yyyy') }}",
                        },
                        {
                          addson1:
                            "{{\n  Reopen_ResolutionDeliveryMethod_input.value == 'Other'\n    ? Reopen_ResolutionDeliveryMethod_Other_input.value\n    : Reopen_ResolutionDeliveryMethod_input.value\n}}",
                        },
                        { addson2: "{{ Reopen_Resolution_input.value }}" },
                        { addson3: "{{ Reopen_NewClaimNo_input.value }}" },
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
      <Event
        enabled="{{ !CaseBasicInfo.value?.RequiredDoc_All }}"
        event="submit"
        method="showNotification"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { notificationType: "error" },
                  { title: "Encounter Issue" },
                  {
                    description:
                      "Upload all required attachments then try again!",
                  },
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
    </Form>
    <Button
      id="button28"
      style={{ ordered: [{ background: "success" }] }}
      submit={true}
      submitTargetId="Reopen_Resolution_form"
      text="Resolve Reopening Case"
    />
    <Text
      id="text19"
      horizontalAlign="right"
      style={{
        ordered: [
          { fontSize: "labelEmphasizedFont" },
          { fontWeight: "labelEmphasizedFont" },
          { fontFamily: "labelEmphasizedFont" },
        ],
      }}
      value="> Upload *Resolution Letter* & *Corrected Claim* in the attachment if there's any"
      verticalAlign="center"
    />
  </View>
  <Footer>
    <Button
      id="prevButton3"
      disabled="{{ Container_Reopen.currentViewIndex === 0 }}"
      iconBefore="bold/interface-arrows-left-alternate"
      styleVariant="outline"
      text="Previous"
    >
      <Event
        event="click"
        method="showPreviousVisibleView"
        params={{ ordered: [{ wrap: false }] }}
        pluginId="Container_Reopen"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="nextButton3"
      disabled="{{ 
  Container_Reopen.currentViewIndex + 1 == Container_Reopen.viewKeys.length
}}"
      iconAfter="bold/interface-arrows-right-alternate"
      style={{ ordered: [] }}
      text="Next"
    >
      <Event
        event="click"
        method="showNextVisibleView"
        params={{ ordered: [{ wrap: false }] }}
        pluginId="Container_Reopen"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</Container>
