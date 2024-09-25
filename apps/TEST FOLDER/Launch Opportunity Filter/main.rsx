<App>
  <Include src="./functions.rsx" />
  <GlobalWidgetOutput id="filter" value="{{filterFormOutput.value}}" />
  <GlobalWidgetProp id="submitButtonText" defaultValue="Submit" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <ModuleContainerWidget
      id="moduleContainer"
      backgroundColor="white"
      isGlobalWidgetContainer={true}
      margin="0"
    >
      <Form
        id="opportunityFilterForm"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        margin="0"
        padding="0"
        requireValidation={true}
        showBody={true}
        showFooter={true}
      >
        <Body>
          <Select
            id="providerSelect"
            data="{{ providerTransformer.value }}"
            emptyMessage="No options"
            label="Provider"
            labelPosition="top"
            labels="{{ item.label }}"
            overlayMaxHeight={375}
            placeholder="Select an option"
            showSelectionIndicator={true}
            value={'""'}
            values="{{ item.value }}"
          />
          <Select
            id="opportunityTypeSelect"
            data="{{ opportunityTypesTransformer.value }}"
            emptyMessage="No options"
            label="Opportunity Type"
            labelPosition="top"
            labels={'{{ item ?  _.startCase(item) : "All" }}'}
            overlayMaxHeight={375}
            placeholder="Select an option"
            showSelectionIndicator={true}
            value=""
            values="{{ item }}"
          />
          <TextInput
            id="buyerEmail"
            hidden=""
            iconBefore="bold/mail-send-envelope"
            label="Buyer"
            labelPosition="top"
            patternType="email"
            placeholder="buyer@system1.com"
            value="{{current_user.email}}"
          />
        </Body>
        <Footer>
          <Button
            id="filterButton"
            submit={true}
            submitTargetId="opportunityFilterForm"
            text="{{ submitButtonText.value }}"
          />
        </Footer>
        <Event
          event="submit"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="filterQuery"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Form>
    </ModuleContainerWidget>
  </Frame>
</App>
