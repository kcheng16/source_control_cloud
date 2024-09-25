<DrawerFrame
  id="editOpportunityFrame"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="0"
  showOverlay={true}
  width="medium"
>
  <Header>
    <Text
      id="drawerTitle1"
      value="### Container title"
      verticalAlign="center"
    />
    <Button
      id="drawerCloseButton1"
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
        pluginId="editOpportunityFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Module
      id="editOpportunityForm"
      cancelAction="hideEditFrame"
      launchId="{{opportunityTableModule.selectedOpportunity?.launchSubmissionId}}"
      margin="0"
      name="Edit Opportunity Form"
      opportunityModel="{{ opportunityTableModule.selectedOpportunity }}"
      pageUuid="318539c6-9f7c-4952-b7a1-c4c1c38d1c5c"
      submitAction="saveOpportunity"
    />
  </Body>
</DrawerFrame>
