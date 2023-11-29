<DrawerFrame
  id="viewersDrawerFrame"
  hidden={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  showFooter={true}
  showHeader={true}
  showOverlay={true}
  width="medium"
>
  <Header>
    <Text id="viewersTitleText" value="### Viewers" verticalAlign="center" />
    <Button
      id="button4"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="viewersDrawerFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <TextArea
      id="viewersDraftPlayersTextArea"
      autoResize={true}
      label="Draft players"
      labelCaption="A comma-separated list of user IDs that will see the draft interstitial."
      labelPosition="top"
      labelWrap={true}
      minLines={2}
      placeholder="Comma-separated user IDs"
      value="{{selectedInterstitial.value.draftPlayers.join(', ')}}"
    />
    <TextArea
      id="viewersTestPlayersTextArea"
      autoResize={true}
      label="Test players"
      labelCaption="A comma-separated list of user IDs that will see the testing interstitial."
      labelPosition="top"
      labelWrap={true}
      minLines={2}
      placeholder="Comma-separated user IDs"
      value="{{selectedInterstitial.value.testPlayers.join(', ')}}"
    />
    <Button
      id="viewersCancel"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="Cancel"
    >
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="viewersDrawerFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="viewersConfirm"
      style={{ ordered: [{ background: "success" }] }}
      styleVariant="solid"
      text="Confirm"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="updateViewers"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="viewersDrawerFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Body>
</DrawerFrame>
