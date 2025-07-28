<ModalFrame
  id="modal_Resolve_in_FF"
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
      id="modalTitle4"
      value="### Resolve Case in Fully Favorable"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton4"
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
        pluginId="modal_Resolve_in_FF"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Text
      id="text13"
      value={
        '<h4>By proceeding, this case will be closed & resolved in <span style="background-color:#aed581;">Fully Favorable</span> state</h4>\n\nThis action is not reversible. Once the case is closed, you\'ll no longer be able to modify it.'
      }
      verticalAlign="center"
    />
    <Form
      id="ResolveInFF_form"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showFooter={true}
    >
      <Header>
        <Text id="formTitle6" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <Date
          id="ResolveInFF_ResolutionDate_input"
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
          id="ResolveInFF_ResolutionDeliveryMethod_input"
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
          id="ResolveInFF_ResolutionDeliveryMethod_Other_input"
          hidden="{{ ResolveInFF_ResolutionDeliveryMethod_input.value != 'Other' }}"
          label=""
          labelPosition="top"
          placeholder="If other, please specify"
          required="{{ ResolveInFF_ResolutionDeliveryMethod_input.value == 'Other' }}"
          showClear={true}
          value="{{ 
  ResolveInFF_ResolutionDeliveryMethod_input.value == 'Other'
    ? CaseBasicInfo.value?.Case_Resolution_Delivery_Method
    : ''
}}"
        />
        <TextArea
          id="ResolveInFF_Comment_input"
          autoResize={true}
          label="Case Resolution Comment"
          labelPosition="top"
          minLines="3"
          placeholder="Enter value"
          required={true}
          value="{{ CaseBasicInfo.value?.Case_Resolution_Comment }}"
        />
      </Body>
      <Footer>
        <Button
          id="formButton6"
          style={{ ordered: [{ background: "success" }] }}
          submit={true}
          submitTargetId="ResolveInFF_form"
          text="Resolve"
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
                        {
                          casedetailtype_description:
                            "_ResolveInFullyFavorable",
                        },
                        {
                          casedetail_info:
                            "{{ moment(ResolveInFF_ResolutionDate_input.value).format('MM/DD/yyyy') }}",
                        },
                        {
                          addson1:
                            "{{\n  ResolveInFF_ResolutionDeliveryMethod_input.value == 'Other'\n    ? ResolveInFF_ResolutionDeliveryMethod_Other_input.value\n    : ResolveInFF_ResolutionDeliveryMethod_input.value\n}}",
                        },
                        { addson2: "{{ ResolveInFF_Comment_input.value }}" },
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
      id="button7"
      disabled="{{ ResolveInFF_Comment_input.invalid }}"
      style={{ ordered: [{ background: "success" }] }}
      text="Resolve"
    />
  </Footer>
</ModalFrame>
