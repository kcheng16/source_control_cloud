<App>
  <Include src="./functions.rsx" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    paddingType="normal"
    sticky={null}
    type="main"
  >
    <JSONExplorer id="jsonExplorer1" value="{{query1.data.data}}" />
    <Button id="button1" text="Button" />
  </Frame>
</App>
