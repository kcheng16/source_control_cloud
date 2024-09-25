<ModalFrame
  id="rejectModal"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden="true"
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="0"
  showOverlay={true}
  size="medium"
>
  <Header>
    <Text
      id="rejectOpportunityModalTitle"
      value="### Enter a reason for rejecting this opportunity"
      verticalAlign="center"
    />
    <Button
      id="rejectOpportunityModalCloseButton"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    />
  </Header>
  <Body>
    <Module
      id="rejectOpportunityFormModule"
      cancelAction="closeRejectModal"
      launchOpportunities="{{ opportunitiesToReject.value }}"
      launchOpportunityId="{{opportunityTableModule.selectedOpportunity?.id}}"
      launchOpportunityIds="{{ opportunitiesToReject.value }}"
      margin="0"
      name="Reject Opportunity Form - Module"
      operationRequestId=""
      pageUuid="65820ddb-ad23-427d-a0f4-6782fdd3c61b"
      rejectAction="refreshAndCloseModals"
    />
  </Body>
</ModalFrame>
