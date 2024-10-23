<App>
  <Include src="./functions.rsx" />
  <AppStyles id="$appStyles" css="" />
  <UrlFragments
    id="$urlFragments"
    value={{
      ordered: [
        { searchTerm: "{{parseCustomerContact.value}}" },
        { interactionId: "{{interactionID.value}}" },
        { RID: "{{ParseRID.value}}" },
        { callTime: "{{parseCallTime.value}}" },
      ],
    }}
  />
  <Include src="./header.rsx" />
  <Frame
    id="$main"
    _disclosedFields={{ array: ["canvas"] }}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    paddingType="normal"
    sticky={false}
    style={{ ordered: [{ canvas: "rgb(246, 247, 249)" }] }}
    type="main"
  >
    <Text
      id="heroGreeting"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="👋 **Hello {{ current_user.firstName || 'friend' }}!** Let's confirm why this customer was turned away on site and get them on their way!
"
      verticalAlign="center"
    />
    <Include src="./src/salesforceInfoContainer.rsx" />
    <Include src="./src/quickLinksContainer.rsx" />
    <Module
      id="step1Module1"
      currentRID="{{currentRID.value}}"
      custEmail="{{parseCustomerContact.value}}"
      initialRID="{{urlparams.hash.RID}}"
      interactionId="{{urlparams.hash.interactionId}}"
      isEmailSearch=""
      margin="0"
      name="Step 1 Module"
      pageUuid="edd0425a-e7b2-4c7d-9186-7afa256d1c2e"
      reservationEmail="{{reservationEmail.value}}"
    />
    <Include src="./src/confirmationContainer.rsx" />
    <Include src="./src/actionLinksContainer.rsx" />
    <Include src="./src/solvingContainer.rsx" />
    <Modal
      id="continueToSolveCaseModal"
      _disclosedFields={{ array: [] }}
      buttonText="Open Modal"
      closeOnOutsideClick={true}
      hidden="{{!continueToSolveCaseModal.opened}}"
      modalHeightType="auto"
      style={{
        ordered: [
          { "accent-background": "" },
          { "border-radius": "" },
          { "primary-surface": "" },
        ],
      }}
    >
      <Text
        id="text73"
        _disclosedFields={{ array: [] }}
        horizontalAlign="center"
        marginType="normal"
        value="##### You can now continue to step 4!"
        verticalAlign="center"
      />
      <Button
        id="button24"
        _disclosedFields={{ array: ["background", "borderRadius"] }}
        marginType="normal"
        style={{
          ordered: [
            { background: "rgb(18, 113, 235)" },
            { borderRadius: "40" },
          ],
        }}
        text="Close"
      >
        <Event
          event="click"
          method="close"
          params={{ ordered: [] }}
          pluginId="continueToSolveCaseModal"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
    </Modal>
    <Include src="./src/cancelErrorModal.rsx" />
    <Include src="./src/creditErrorModal.rsx" />
    <Include src="./src/modal1.rsx" />
    <Include src="./src/OCRMacroModal.rsx" />
    <Include src="./src/assign_rid_to_case_error_modal.rsx" />
    <Include src="./src/blackoutErrorModal.rsx" />
    <Modal
      id="closeOutCase"
      _disclosedFields={{ array: [] }}
      buttonText="submit"
      disabled="{{findReservationObj.data[0] === undefined}}"
      events={[]}
      hidden="{{!closeOutCase.opened}}"
      maintainSpaceWhenHidden={false}
      modalHeight="200px"
      modalHeightType="auto"
      style={{ ordered: [{ "accent-background": "#ffffff" }] }}
    >
      <Container
        id="container5"
        _gap={0}
        footerPadding="4px 12px"
        footerPaddingType="normal"
        headerPadding="4px 12px"
        headerPaddingType="normal"
        marginType="normal"
        padding="12px"
        paddingType="normal"
        showBody={true}
        showHeader={true}
      >
        <Header>
          <Text
            id="containerTitle14"
            marginType="normal"
            value="#### Case Complete!"
            verticalAlign="center"
          />
        </Header>
        <View id="d8c35" viewKey="View 1">
          <Text
            id="text123"
            heightType="fixed"
            marginType="normal"
            value="You can now close out of this case. The information has been sent to Salesforce and it is safe to close the window."
            verticalAlign="center"
          />
        </View>
      </Container>
    </Modal>
    <Include src="./src/cancelResModal.rsx" />
  </Frame>
</App>
