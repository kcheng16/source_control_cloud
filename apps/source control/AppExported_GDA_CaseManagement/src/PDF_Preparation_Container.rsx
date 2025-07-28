<Container
  id="PDF_Preparation_Container"
  currentViewKey="{{ self.viewKeys[0] }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showFooter={true}
  showHeader={true}
>
  <Header>
    <Steps
      id="steps4"
      horizontalAlign="center"
      indicateCompletedSteps={true}
      itemMode="static"
      navigateContainer={true}
      showStepNumbers={true}
      targetContainerId="PDF_Preparation_Container"
      value="{{ self.values[0] }}"
    >
      <Option id="37bb2" value="Step 1" />
      <Option id="3bbb6" value="Step 2" />
      <Option id="0bff0" value="Step 3" />
    </Steps>
  </Header>
  <View id="53bd1" viewKey="Selete Template">
    <Cascader2
      id="PDF_Template_input"
      _hasMigratedNestedItems={true}
      data="{{ prep_template_list.value }}"
      emptyMessage="No options"
      label="Select Template From Below"
      labelPosition="top"
      labels="{{ item.label }}"
      labelWrap={true}
      overlayMaxHeight={375}
      parentKeyByIndex="{{ item.parent }}"
      placeholder="Select an option"
      required={true}
      values="{{ item.value }}"
    />
  </View>
  <View id="66d0a" viewKey="Confirm Info">
    <JSONSchemaForm
      id="PDF_input_form"
      data="{{ prep_PDF_input.data?.Default_Form_Data }}"
      events={[
        {
          ordered: [
            { method: "trigger" },
            {
              enabled:
                "{{ prep_PDF_input.data?.PDF_Template == 'PHP_Appeal_AKL' }}",
            },
            {
              params: {
                ordered: [{ options: { ordered: [{ additionalScope: {} }] } }],
              },
            },
            { targetId: null },
            { pluginId: "generate_PDF_PHP_Appeal_AKL" },
            { waitType: "debounce" },
            { event: "submit" },
            { type: "datasource" },
            { waitMs: "0" },
          ],
        },
        {
          ordered: [
            { method: "trigger" },
            {
              enabled:
                "{{ prep_PDF_input.data?.PDF_Template == 'PHP_Appeal_WOL_Request' }}",
            },
            {
              params: {
                ordered: [{ options: { ordered: [{ additionalScope: {} }] } }],
              },
            },
            { targetId: null },
            { pluginId: "generate_PDF_PHP_Appeal_WOL_Request" },
            { waitType: "debounce" },
            { event: "submit" },
            { type: "datasource" },
            { waitMs: "0" },
          ],
        },
        {
          ordered: [
            { method: "trigger" },
            {
              enabled:
                "{{ prep_PDF_input.data?.PDF_Template == 'PHP_Appeal_Dismiss' }}",
            },
            { params: { ordered: [] } },
            { targetId: null },
            { pluginId: "generate_PDF_PHP_Appeal_Dismiss" },
            { waitType: "debounce" },
            { event: "submit" },
            { type: "datasource" },
            { waitMs: "0" },
          ],
        },
      ]}
      hidden="false"
      jsonSchema="{{ prep_PDF_input.data?.JSON_Schema }}"
      margin="0"
      submitButtonFullWidth={true}
      submitButtonText="Generate PDF"
      uiSchema="{{ prep_PDF_input.data?.UI_Schema }}"
    />
  </View>
  <Footer>
    <Button
      id="prevButton4"
      disabled="{{ PDF_Preparation_Container.currentViewIndex === 0 }}"
      iconBefore="bold/interface-arrows-left-alternate"
      styleVariant="outline"
      text="Previous"
    >
      <Event
        event="click"
        method="showPreviousVisibleView"
        params={{ ordered: [{ wrap: false }] }}
        pluginId="PDF_Preparation_Container"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="nextButton4"
      disabled="{{ PDF_Preparation_Container.currentViewIndex + 1 === PDF_Preparation_Container.viewKeys.length }}"
      iconAfter="bold/interface-arrows-right-alternate"
      text="Next"
    >
      <Event
        event="click"
        method="showNextVisibleView"
        params={{ ordered: [{ wrap: false }] }}
        pluginId="PDF_Preparation_Container"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
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
                      PDF_Template: "{{ PDF_Template_input.valuePath[0] }}",
                      PDF_Hint: "{{ PDF_Template_input.valuePath?.[1] }}",
                    },
                  },
                ],
              },
            },
          ],
        }}
        pluginId="prep_PDF_input"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</Container>
