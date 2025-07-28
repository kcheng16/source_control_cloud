<Container
  id="Container_Inquiry"
  disabled="{{ CaseBasicInfo.value?.EndStage_YN }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  heightType="fixed"
  hidden="{{ CaseBasicInfo.value?.casetype_description != 'Inquiry' ?? true }}"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle5"
      value="##### Inquiry Case Workspace"
      verticalAlign="center"
    />
  </Header>
  <View id="b7bee" viewKey="View 1">
    <Select
      id="Inquiry_ResolutionDeliveryMethod_input"
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
    <Date
      id="Inquiry_ResolutionDate_input"
      dateFormat="MM/dd/yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      iconBefore="bold/interface-calendar"
      label="Inquiry Resolution Date"
      labelPosition="top"
      required={true}
      showClear={true}
      value="{{ CaseBasicInfo.value?.Case_Resolution_Date }}"
    />
    <TextInput
      id="Inquiry_ResolutionDeliveryMethod_Other_input"
      hidden="{{ Inquiry_ResolutionDeliveryMethod_input.value != 'Other' }}"
      label=""
      labelPosition="top"
      placeholder="If other, please specify"
      required="{{ Inquiry_ResolutionDeliveryMethod_input.value == 'Other' }}"
      showClear={true}
      value="{{ 
  Inquiry_ResolutionDeliveryMethod_input.value == 'Other'
    ? CaseBasicInfo.value?.Case_Resolution_Delivery_Method
    : ''
}}"
    />
    <Spacer id="spacer2" />
    <Text
      id="text18"
      horizontalAlign="right"
      style={{
        ordered: [
          { fontSize: "labelEmphasizedFont" },
          { fontWeight: "labelEmphasizedFont" },
          { fontFamily: "labelEmphasizedFont" },
        ],
      }}
      value="> Upload *Resolution Letter* in the attachment if there's any"
      verticalAlign="center"
    />
    <Button
      id="button26"
      disabled="{{ 
  Inquiry_ResolutionDate_input.invalid ||
  Inquiry_ResolutionDeliveryMethod_input.invalid ||
  Inquiry_ResolutionDeliveryMethod_Other_input.invalid
}}"
      style={{ ordered: [{ background: "success" }] }}
      text="Resolve Inquiry Case"
    >
      <Event
        enabled="{{ CaseBasicInfo.value?.RequiredDoc_All }}"
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
                        { casedetailtype_description: "_ResolveInquiry" },
                        {
                          casedetail_info:
                            "{{ moment(Inquiry_ResolutionDate_input.value).format('MM/DD/yyyy') }}",
                        },
                        {
                          addson1:
                            "{{\n  Inquiry_ResolutionDeliveryMethod_input.value == 'Other'\n    ? Inquiry_ResolutionDeliveryMethod_Other_input.value\n    : Inquiry_ResolutionDeliveryMethod_input.value\n}}",
                        },
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
      <Event
        enabled="{{ !CaseBasicInfo.value?.RequiredDoc_All }}"
        event="click"
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
    </Button>
  </View>
</Container>
