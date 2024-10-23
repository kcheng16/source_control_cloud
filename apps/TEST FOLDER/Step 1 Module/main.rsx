<App>
  <Include src="./functions.rsx" />
  <GlobalWidgetOutput
    id="currentRID"
    description="selected rental id"
    value="{{ parseRID.value }}"
  />
  <GlobalWidgetProp
    id="custEmail"
    description="customer email"
    value="el.linzer@spothero.com"
  />
  <GlobalWidgetProp id="initialRID" value="3320218" />
  <GlobalWidgetProp id="interactionId" description="SF case interaction id" />
  <GlobalWidgetOutput
    id="reservationEmail"
    value="{{ parseCustomerContact.value }}"
  />
  <Frame
    id="$main"
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    paddingType="normal"
    sticky={null}
    type="main"
  >
    <ModuleContainerWidget
      id="moduleContainer"
      backgroundColor="white"
      custEmail="el.linzer@spothero.com"
      initialRID="3320218"
      interactionId=""
      isEmailSearch=""
      isGlobalWidgetContainer={true}
      singleRes="3260950"
    >
      <Include src="./src/step1Container.rsx" />
    </ModuleContainerWidget>
  </Frame>
</App>
