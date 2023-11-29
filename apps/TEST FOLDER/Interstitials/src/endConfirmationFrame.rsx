<DrawerFrame
  id="endConfirmationFrame"
  hidden={true}
  isHiddenOnMobile={true}
  showFooter={true}
  showHeader={true}
  showOverlay={true}
  width="medium"
>
  <Header>
    <Text
      id="endConfirmationTitle"
      value="### End Interstitial?"
      verticalAlign="center"
    />
    <Button
      id="button3"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="endConfirmationFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Text
      id="endConfirmationModalText"
      value="Are you sure you want to end interstitial?

This will set the end time to immediately end the interstitial. You can re-run the interstitial by adjusting the end time."
      verticalAlign="center"
    />
    <Button
      id="endConfirmationCancelButton"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="Cancel"
    >
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="endConfirmationFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="endConfirmationModalConfirmButton"
      style={{ ordered: [{ background: "danger" }] }}
      styleVariant="solid"
      text="Yes, End Now"
    >
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="endConfirmationFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="endInterstitial"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Body>
</DrawerFrame>
