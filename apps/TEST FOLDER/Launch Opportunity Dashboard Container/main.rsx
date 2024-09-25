<App>
  <Include src="./functions.rsx" />
  <Include src="./src/approveModal.rsx" />
  <Include src="./src/editOpportunityFrame.rsx" />
  <Include src="./src/rejectModal.rsx" />
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
    >
      <Module
        id="opportunityTableModule6"
        name="Opportunity Table - Module"
        pageUuid="12025a0e-8867-4d92-918a-bf912877aa31"
      />
      <Module
        id="opportunityTableModule5"
        filteredOpportunities=""
        name="Opportunity Table - Module"
        pageUuid="12025a0e-8867-4d92-918a-bf912877aa31"
      />
      <Module
        id="opportunityTableModule4"
        filteredOpportunities=""
        name="Opportunity Table - Module"
        pageUuid="12025a0e-8867-4d92-918a-bf912877aa31"
      />
      <Module
        id="opportunityTableModule3"
        filteredOpportunities=""
        name="Opportunity Table - Module"
        pageUuid="12025a0e-8867-4d92-918a-bf912877aa31"
      />
      <Module
        id="opportunityTableModule2"
        filteredOpportunities=""
        name="Opportunity Table - Module"
        pageUuid="12025a0e-8867-4d92-918a-bf912877aa31"
      />
      <Module
        id="launchOpportunityFilter"
        filterQuery="getOpportunities"
        margin="0"
        name="Launch Opportunity Filter"
        onSubmit=""
        pageUuid="6d4cb183-4d03-40e4-8766-9843bde04e70"
        submitButtonText="{{ submitButtonText.value }}"
      />
      <Module
        id="opportunityTableModule"
        editOpportunity="editOpportunity"
        filteredOpportunities="{{opportunitiesTransformer.value}}"
        hidden="false"
        margin="0"
        name="Opportunity Table - Module"
        pageUuid="12025a0e-8867-4d92-918a-bf912877aa31"
        provider=""
        rejectOpportunity="rejectOpportunity"
      />
      <Button
        id="approveAndLaunchButton"
        hidden="{{ opportunityTableModule.selectedOpportunities.length > 0 }}"
        margin="0"
        style={{ ordered: [] }}
        text="Approve and Launch All"
      >
        <Event
          event="click"
          method="show"
          params={{ ordered: [] }}
          pluginId="approveModal"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
      <Button
        id="rejectSelectedButton"
        hidden="{{ opportunityTableModule.selectedOpportunities.length < 1 }}"
        margin="0"
        style={{ ordered: [{ background: "danger" }] }}
        text="Reject All Selected"
      >
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="rejectOpportunities"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
    </ModuleContainerWidget>
  </Frame>
</App>
