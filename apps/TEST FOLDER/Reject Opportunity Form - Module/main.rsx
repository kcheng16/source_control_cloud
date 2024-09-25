<App>
  <Include src="./functions.rsx" />
  <GlobalWidgetProp
    id="launchOpportunities"
    defaultValue={
      '[{\n  id:"string",\n  operationRequestId: "string2"\n},{\n  id:"string 1",\n  operationRequestId: "string3"\n}]'
    }
    description=""
  />
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
      launchOpportunityIds=""
      margin="0"
    >
      <Form
        id="rejectOpportunityForm"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        loading="{{rejectLaunchOpportunity.isFetching}}"
        margin="0"
        padding="12px"
        requireValidation={true}
        resetAfterSubmit={true}
        showBody={true}
        showFooter={true}
        showHeader={true}
      >
        <Header>
          <Text
            id="headerText"
            value="## Select a reason for rejecting {{ launchOpportunities.value.length }} {{ launchOpportunities.value.length === 1 ? 'opportunity' : 'opportunities'  }}"
            verticalAlign="center"
          />
        </Header>
        <Body>
          <Select
            id="reasonSelect"
            emptyMessage="No options"
            itemMode="static"
            label="Reason"
            labelPosition="top"
            overlayMaxHeight={375}
            placeholder="Select an option"
            showSelectionIndicator={true}
          >
            <Option
              id="43602"
              disabled={false}
              hidden={false}
              value="Too few keywords"
            />
            <Option id="39c05" value="Irrelevant" />
            <Option id="135eb" value="Too vague" />
            <Option id="db9bb" value="Too aggressive" />
            <Option
              id="1ac8a"
              disabled={false}
              hidden={false}
              value="Non-Compliant"
            />
            <Option
              id="d00a8"
              disabled={false}
              hidden={false}
              value="Low Quality"
            />
            <Option id="e54dd" disabled={false} hidden={false} value="Other" />
          </Select>
          <TextArea
            id="rejectOpportunityReasonInput"
            autoResize={true}
            hidden="{{reasonSelect.value !== 'Other'}}"
            label="Comment"
            labelPosition="top"
            minLines={2}
            placeholder="Please provide some more details"
            required="{{!self.hidden}}"
          />
        </Body>
        <Footer>
          <Button
            id="rejectOpportunityCancelButton"
            style={{ ordered: [{ background: "canvas" }] }}
            text="Cancel"
          >
            <Event
              event="click"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="cancelAction"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </Button>
          <Button
            id="rejectOpportunityButton"
            disabled="{{rejectOpportunityReasonInput.invalid || !reasonSelect.value || (!rejectOpportunityReasonInput.hidden && !rejectOpportunityReasonInput.value)}}"
            style={{ ordered: [{ background: "danger" }] }}
            submitTargetId="rejectOpportunityForm"
            text="Reject"
          >
            <Event
              event="click"
              method="trigger"
              params={{ ordered: [] }}
              pluginId="rejectLaunchOpportunity"
              type="datasource"
              waitMs="0"
              waitType="debounce"
            />
          </Button>
        </Footer>
        <Event
          event="submit"
          method="trigger"
          params={{ ordered: [] }}
          pluginId=""
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Form>
    </ModuleContainerWidget>
  </Frame>
</App>
