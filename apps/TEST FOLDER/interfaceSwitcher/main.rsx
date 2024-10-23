<App>
  <Include src="./functions.rsx" />
  <UrlFragments id="$urlFragments" value={{ ordered: [] }} />
  <GlobalWidgetProp id="callTime" />
  <GlobalWidgetProp id="customerEmail" />
  <GlobalWidgetProp id="interactionId" />
  <GlobalWidgetProp id="notesForSupply" />
  <GlobalWidgetOutput id="output1" value="{{callTime.value}}" />
  <GlobalWidgetOutput id="output2" />
  <GlobalWidgetProp id="reservationForCase" />
  <GlobalWidgetProp id="workaroundQuery" defaultValue="false" />
  <Frame
    id="$main"
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={false}
    type="main"
  >
    <ModuleContainerWidget
      id="moduleContainer"
      backgroundColor="white"
      input1=""
      input2=""
      isGlobalWidgetContainer={true}
    >
      <Include src="./src/modal1.rsx" />
    </ModuleContainerWidget>
  </Frame>
</App>
