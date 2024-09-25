<ModalFrame
  id="approveModal"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden="{{ true }}"
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="0"
  showOverlay={true}
  size="medium"
>
  <Header>
    <Text id="modalTitle1" value="### Container title" verticalAlign="center" />
    <Button
      id="modalCloseButton1"
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
        pluginId="approveModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Module
      id="approveOpportunitiesForm"
      closeAction="closeApproveModal"
      launchOpportunities="{{opportunitiesForApprovalTransformer.value}}"
      margin="0"
      name="Approve Opportunities Form"
      pageUuid="920481a7-7308-4999-b4aa-b99125a4b1a0"
    />
  </Body>
</ModalFrame>
