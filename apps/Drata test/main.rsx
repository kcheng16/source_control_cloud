<App>
  <Include src="./functions.rsx" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Text id="text1" value="Change" verticalAlign="center" />
    <JSONExplorer id="jsonExplorer1" value="{{ query1.data }}" />
  </Frame>
</App>
