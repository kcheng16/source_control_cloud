<ModalFrame
  id="modal_Withdraw"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showHeader={true}
  showOverlay={true}
  size="medium"
>
  <Header>
    <Text
      id="modalTitle5"
      value="### Withdraw the Case"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton5"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="modal_Withdraw"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Text
      id="text15"
      value="<h4>By proceeding, this case will be closed as <u>Withdrawn</u></h4>
<h6>You must provide the supporting reason in comment<h6>

This action is not reversible. Once the case is closed, you'll no longer be able to modify it."
      verticalAlign="center"
    />
    <Form
      id="Withdraw_form"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showFooter={true}
    >
      <Header>
        <Text id="formTitle7" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <Date
          id="Withdraw_ResolutionDate_input"
          dateFormat="MM/dd/yyyy"
          datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
          iconBefore="bold/interface-calendar"
          label="Resolution Letter Sent Date"
          labelWidth="40"
          labelWrap={true}
          required={true}
          showClear={true}
          value="{{ CaseBasicInfo.value?.Case_Resolution_Date }}"
        />
        <Select
          id="Withdraw_ResolutionDeliveryMethod_input"
          data="{{ [...category_ResolutionDeliveryMethod.value, 'Other'] }}"
          emptyMessage="No options"
          label="Resolution Delivery Method"
          labelWidth="40"
          labelWrap={true}
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
        />
        <TextInput
          id="Withdraw_ResolutionDeliveryMethod_Other_input"
          hidden="{{ Withdraw_ResolutionDeliveryMethod_input.value != 'Other' }}"
          label=""
          labelPosition="top"
          placeholder="If other, please specify"
          required="{{ Withdraw_ResolutionDeliveryMethod_input.value == 'Other' }}"
          showClear={true}
          value="{{ 
  Withdraw_ResolutionDeliveryMethod_input.value == 'Other'
    ? CaseBasicInfo.value?.Case_Resolution_Delivery_Method
    : ''
}}"
        />
        <TextArea
          id="Withdraw_Comment_input"
          autoResize={true}
          label="Case Withdraw Comment"
          labelPosition="top"
          minLines="3"
          placeholder="Enter value"
          required={true}
          value="{{ CaseBasicInfo.value?.Case_Withdraw_Comment }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton7"
          style={{ ordered: [] }}
          styleVariant="outline"
          submit={true}
          submitTargetId="Withdraw_form"
          text="Withdraw"
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
                        { casedetailtype_description: "_WithdrawCase" },
                        {
                          casedetail_info:
                            "{{ moment(Withdraw_ResolutionDate_input.value).format('MM/DD/yyyy') }}",
                        },
                        {
                          addson1:
                            "{{\n  Withdraw_ResolutionDeliveryMethod_input.value == 'Other'\n    ? Withdraw_ResolutionDeliveryMethod_Other_input.value\n    : Withdraw_ResolutionDeliveryMethod_input.value\n}}",
                        },
                        { addson2: "{{ Withdraw_Comment_input.value }}" },
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
    </Form>
  </Body>
  <Footer>
    <Button
      id="button16"
      disabled="{{ Withdraw_Comment_input.invalid }}"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="Confirm Withdraw"
    />
  </Footer>
</ModalFrame>
