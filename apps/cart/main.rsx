<App>
  <Include src="./functions.rsx" />
  <AppStyles id="$appStyles" css={include("./lib/$appStyles.css", "string")} />
  <Include src="./src/addItemModal.rsx" />
  <Include src="./src/modalFrame1.rsx" />
  <Include src="./src/modalFrame2.rsx" />
  <Include src="./src/modalFrame3.rsx" />
  <Include src="./src/modalFrame4.rsx" />
  <Include src="./src/modalFrame5.rsx" />
  <Include src="./src/modalFrame6.rsx" />
  <Include src="./src/modalFrame7.rsx" />
  <Include src="./src/scanItemModal.rsx" />
  <Include src="./sidebar.rsx" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="0"
    sticky={null}
    type="main"
  >
    <Include src="./src/tabbedContainer1.rsx" />
    <Include src="./src/container1.rsx" />
    <Include src="./src/container2.rsx" />
    <Include src="./src/container3.rsx" />
  </Frame>
</App>
