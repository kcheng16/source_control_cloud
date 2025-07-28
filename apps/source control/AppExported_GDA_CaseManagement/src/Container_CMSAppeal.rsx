<Container
  id="Container_CMSAppeal"
  currentViewKey="{{ formatDataAsArray(pull_CaseDetail.data)
    .filter(x => x.casedetailtype_id.startsWith('AS') && x.rn_subclass_general == 1)
    .map(x => x.casedetailtype_description.replaceAll('_', ' '))[0]
}}"
  disabled="{{ CaseBasicInfo.value?.EndStage_YN }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  heightType="fixed"
  hidden="{{ !CaseBasicInfo.value?.casetype_description.endsWith('Appeal') ?? true }}"
  padding="12px"
  showBody={true}
  showFooter={true}
  showHeader={true}
  transition="slide"
>
  <Header>
    <Steps
      id="steps2"
      heightType="fixed"
      horizontalAlign="center"
      itemMode="static"
      navigateContainer={true}
      orientation="vertical"
      showStepNumbers={true}
      targetContainerId="Container_CMSAppeal"
      value="{{ self.values[0] }}"
    >
      <Option id="a772c" value="Step 1" />
      <Option id="fed2f" value="Step 2" />
      <Option id="f244a" value="Step 3" />
    </Steps>
  </Header>
  <View id="56f31" viewKey="Prerequisite Check">
    <TextArea
      id="CMSAppeal_CaseOpeningComment_input"
      autoResize={true}
      disabled="{{pull_CaseDetail.data.casedetailtype_id.filter(x => (x == 'A3')).length > 0}}"
      label="Case Opening Comment"
      labelPosition="top"
      minLines="3"
      placeholder="Enter value"
      readOnly="true"
      value="{{
  formatDataAsArray(pull_CaseDetail.data)
    .filter(x => x.casedetailtype_description == 'Case_Open_Comment' && x.rn_type == 1)
    .map(x => x.casedetail_info)[0]
}}"
    />
    <Text
      id="text14"
      style={{
        ordered: [
          { fontSize: "10px" },
          { fontWeight: "500" },
          { fontFamily: "Jetbrains Mono NL" },
        ],
      }}
      value="Please Note:
Once you decide to officially establish the case, you MUST follow CMS guildline on subsequent processes. 


Or else, please close / convert the case on this stage."
      verticalAlign="center"
    />
    <SplitButton
      id="splitButton1"
      _colorByIndex={["", "", "", ""]}
      _fallbackTextByIndex={["", "", "", ""]}
      _imageByIndex={["", "", "", ""]}
      _values={["Action 4", "Action 3", "", ""]}
      disabled="{{ CaseBasicInfo.value?.latest_audit_event != 'Case_Open' }}"
      hidden=""
      itemMode="static"
      overlayMaxHeight={375}
      showSelectionIndicator={true}
      style={{ ordered: [] }}
      styleVariant="outline"
    >
      <Option
        id="ac91b"
        disabled={false}
        hidden={false}
        label="Officially Proceed as Appeal"
      >
        <Event
          event="click"
          method="show"
          params={{ ordered: [] }}
          pluginId="modal_Establish_Case"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
      <Option
        id="d4fb6"
        disabled="true"
        hidden={false}
        label="Convert to Dispute"
      />
      <Option id="c217e" label="Convert to Reopening">
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
                        ordered: [{ casetype_description: "Reopen" }],
                      },
                    },
                  ],
                },
              },
            ],
          }}
          pluginId="step1_dup_case"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
      <Option id="25c57" label="Convert to Inquiry">
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
                        ordered: [{ casetype_description: "Inquiry" }],
                      },
                    },
                  ],
                },
              },
            ],
          }}
          pluginId="step1_dup_case"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
    </SplitButton>
  </View>
  <View id="2b9fe" viewKey="Health Plan Reconsideration">
    <Button
      id="button4"
      disabled="{{ CaseBasicInfo.value.latest_audit_event != 'Health_Plan_Reconsideration' }}"
      style={{ ordered: [{ background: "success" }] }}
      text="Resolve in Fully Favorable"
    >
      <Event
        enabled="{{ CaseBasicInfo.value.RequiredDoc_All }}"
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="modal_Resolve_in_FF"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ CaseBasicInfo.value.RequiredDoc_All }}"
        event="click"
        method="validate"
        params={{ ordered: [] }}
        pluginId="ResolveInFF_form"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ !CaseBasicInfo.value.RequiredDoc_All }}"
        event="click"
        method="showNotification"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { notificationType: "warning" },
                  { title: "Missing Required Doc" },
                  {
                    description:
                      "Please upload all required doc and try again ",
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
    </Button>
    <Include src="./CMSAppeal_WOL.rsx" />
    <Button
      id="button25"
      disabled="{{ CaseBasicInfo.value.latest_audit_event != 'Health_Plan_Reconsideration' }}"
      style={{ ordered: [{ background: "rgba(253, 157, 62, 0.7)" }] }}
      text="Upheld - Escalate to IRE"
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
                        { casedetailtype_description: "IRE_Reconsideration" },
                        { casedetail_info: "" },
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
    <Button
      id="button12"
      disabled="{{ CaseBasicInfo.value.latest_audit_event != 'Health_Plan_Reconsideration' }}"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="Withdraw"
    >
      <Event
        enabled="{{ CaseBasicInfo.value.RequiredDoc_RL }}"
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="modal_Withdraw"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ CaseBasicInfo.value.RequiredDoc_RL }}"
        event="click"
        method="validate"
        params={{ ordered: [] }}
        pluginId="Withdraw_form"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ !CaseBasicInfo.value.RequiredDoc_RL }}"
        event="click"
        method="showNotification"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { notificationType: "warning" },
                  { title: "Missing Resolution Letter" },
                  {
                    description:
                      "Please upload Resolution Letter and try again",
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
    </Button>
    <Button
      id="button13"
      disabled="{{ CaseBasicInfo.value.latest_audit_event != 'Health_Plan_Reconsideration' }}"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="Dismiss"
    >
      <Event
        enabled="{{ CaseBasicInfo.value.RequiredDoc_RL }}"
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="modal_Dismiss"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ CaseBasicInfo.value.RequiredDoc_RL }}"
        event="click"
        method="validate"
        params={{ ordered: [] }}
        pluginId="Dismiss_form"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ !CaseBasicInfo.value.RequiredDoc_RL }}"
        event="click"
        method="showNotification"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { notificationType: "warning" },
                  { title: "Missing Resolution Letter" },
                  {
                    description:
                      "Please upload Resolution Letter and try again",
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
    </Button>
    <Include src="./CMSAppeal_AOR.rsx" />
    <Text
      id="text20"
      heightType="fixed"
      hidden="{{ CaseBasicInfo.value?.WOLAOR_req != 'Not Required' }}"
      horizontalAlign="center"
      style={{ ordered: [{ background: "canvas" }] }}
      value="###### Great! WOL / AOR is not required :)


Proceed with one of the options ->"
      verticalAlign="center"
    />
  </View>
  <View id="1cbf3" viewKey="IRE Reconsideration">
    <Date
      id="CMSAppeal_IREDecisionEffectiveDate_input"
      dateFormat="MM/dd/yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      disabled="{{ CaseBasicInfo.value.latest_audit_event != 'IRE_Reconsideration' }}"
      iconBefore="bold/interface-calendar"
      label="IRE Decision Effectuated in System Date"
      labelPosition="top"
      required={true}
      showClear={true}
    />
    <Date
      id="CMSAppeal_IREDecisionReceivedDate_input"
      dateFormat="MM/dd/yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      disabled="{{ CaseBasicInfo.value.latest_audit_event != 'IRE_Reconsideration' }}"
      iconBefore="bold/interface-calendar"
      label="IRE Decision Received Date"
      labelPosition="top"
      required={true}
      showClear={true}
    />
    <ButtonGroup2 id="buttonGroup2" overflowPosition={2}>
      <ButtonGroup2-Button
        id="13378"
        backgroundColor="{{ theme.success }}"
        disabled="{{ CMSAppeal_IREDecisionReceivedDate_input.invalid || CMSAppeal_IREDecisionEffectiveDate_input.invalid || CaseBasicInfo.value.latest_audit_event != 'IRE_Reconsideration' }}"
        styleVariant="custom"
        text="IRE - Approved in Fully Favorable"
      >
        <Event
          enabled="{{ CaseBasicInfo.value.RequiredDoc_All }}"
          event="click"
          method="show"
          params={{ ordered: [] }}
          pluginId="modal_Resolve_in_FF"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          enabled="{{ CaseBasicInfo.value.RequiredDoc_All }}"
          event="click"
          method="validate"
          params={{ ordered: [] }}
          pluginId="ResolveInFF_form"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          enabled="{{ !CaseBasicInfo.value.RequiredDoc_All }}"
          event="click"
          method="showNotification"
          params={{
            ordered: [
              {
                options: {
                  ordered: [
                    { notificationType: "warning" },
                    { title: "Missing Required Doc" },
                    {
                      description:
                        "Please upload all required doc and try again",
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
        <Event
          enabled="{{ CaseBasicInfo.value.RequiredDoc_All }}"
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
                          {
                            casedetailtype_description:
                              "_IREDecisionAndEffectuateDate",
                          },
                          { casedetail_info: "" },
                          {
                            addson1:
                              "{{ moment(CMSAppeal_IREDecisionReceivedDate_input.value).format('MM/DD/yyyy') }}",
                          },
                          {
                            addson2:
                              "{{ moment(CMSAppeal_IREDecisionEffectiveDate_input.value).format('MM/DD/yyyy') }}",
                          },
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
      </ButtonGroup2-Button>
      <ButtonGroup2-Button
        id="11c9f"
        backgroundColor="rgba(253, 157, 62, 0.7)"
        disabled="{{ CMSAppeal_IREDecisionReceivedDate_input.invalid || CMSAppeal_IREDecisionEffectiveDate_input.invalid || CaseBasicInfo.value.latest_audit_event != 'IRE_Reconsideration' }}"
        styleVariant="custom"
        text="IRE - Upheld"
      >
        <Event
          event="click"
          method="trigger"
          params={{
            ordered: [
              {
                options: {
                  ordered: [
                    { onSuccess: null },
                    { onFailure: null },
                    {
                      additionalScope: {
                        ordered: [
                          {
                            casedetailtype_description:
                              "_EscalateToOfficeOfMedicalHearingAndAppeals",
                          },
                          { casedetail_info: "" },
                          {
                            addson1:
                              "{{ moment(CMSAppeal_IREDecisionReceivedDate_input.value).format('MM/DD/yyyy') }}",
                          },
                          {
                            addson2:
                              "{{ moment(CMSAppeal_IREDecisionEffectiveDate_input.value).format('MM/DD/yyyy') }}",
                          },
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
      </ButtonGroup2-Button>
    </ButtonGroup2>
  </View>
  <View
    id="ce34a"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="Office of Medicare Hearings and Appeals"
  />
  <View
    id="3d349"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="Medicare Appeals Council 
"
  />
  <View
    id="02456"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="Federal District Court"
  />
  <Footer>
    <Button
      id="prevButton2"
      disabled="{{ Container_CMSAppeal.currentViewIndex === 0 }}"
      iconBefore="bold/interface-arrows-left-alternate"
      styleVariant="outline"
      text="Review Previous Stage"
    >
      <Event
        event="click"
        method="showPreviousVisibleView"
        params={{ ordered: [{ wrap: false }] }}
        pluginId="Container_CMSAppeal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="nextButton2"
      disabled="{{ 
  (Container_CMSAppeal.currentViewIndex + 1 === Container_CMSAppeal.viewKeys.length)
}}"
      iconAfter="bold/interface-arrows-right-alternate"
      text="Review Next Stage"
    >
      <Event
        enabled=""
        event="click"
        method="showNextVisibleView"
        params={{ ordered: [{ wrap: false }] }}
        pluginId="Container_CMSAppeal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</Container>
