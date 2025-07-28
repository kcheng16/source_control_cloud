<ModalFrame
  id="modal_Dismiss"
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
      id="modalTitle6"
      value="### Dismiss the Case"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton6"
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
        pluginId="modal_Dismiss"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Text
      id="text16"
      value="<h4>By proceeding, this case will be closed as <u>Dismiss</u></h4>
<h6>You must provide the supporting reason in comment<h6>

This action is not reversible. Once the case is closed, you'll no longer be able to modify it."
      verticalAlign="center"
    />
    <Form
      id="Dismiss_form"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showFooter={true}
    >
      <Header>
        <Text id="formTitle8" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <Date
          id="Dismiss_ResolutionDate_input"
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
          id="Dismiss_ResolutionDeliveryMethod_input"
          data="{{ [...category_ResolutionDeliveryMethod.value, 'Other'] }}"
          emptyMessage="No options"
          label="Resolution Letter Delivery Method"
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
          id="Dismiss_ResolutionDeliveryMethod_Other_input"
          hidden="{{ Dismiss_ResolutionDeliveryMethod_input.value != 'Other' }}"
          label=""
          labelPosition="top"
          placeholder="If other, please specify"
          required="{{ Dismiss_ResolutionDeliveryMethod_input.value == 'Other' }}"
          showClear={true}
          value="{{ 
  Dismiss_ResolutionDeliveryMethod_input.value == 'Other'
    ? CaseBasicInfo.value?.Case_Resolution_Delivery_Method
    : ''
}}"
        />
        <TextArea
          id="Dismiss_Comment_input"
          autoResize={true}
          label="Case Dismiss Comment"
          labelPosition="top"
          minLines="3"
          placeholder="Enter value"
          required={true}
          value="{{ CaseBasicInfo.value?.Case_Dismiss_Comment }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton8"
          style={{ ordered: [] }}
          styleVariant="outline"
          submit={true}
          submitTargetId="Dismiss_form"
          text="Dismiss"
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
                        { casedetailtype_description: "_DismissCase" },
                        {
                          casedetail_info:
                            "{{ moment(Dismiss_ResolutionDate_input.value).format('MM/DD/yyyy') }}",
                        },
                        {
                          addson1:
                            "{{\n  Dismiss_ResolutionDeliveryMethod_input.value == 'Other'\n    ? Dismiss_ResolutionDeliveryMethod_Other_input.value\n    : Dismiss_ResolutionDeliveryMethod_input.value\n}}",
                        },
                        { addson2: "{{ Dismiss_Comment_input.value }}" },
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
      id="button17"
      disabled="{{ Dismiss_Comment_input.invalid }}"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="Confirm Dismiss"
    />
  </Footer>
</ModalFrame>
