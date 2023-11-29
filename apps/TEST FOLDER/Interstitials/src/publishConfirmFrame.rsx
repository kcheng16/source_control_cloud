<DrawerFrame
  id="publishConfirmFrame"
  hidden={true}
  isHiddenOnMobile={true}
  showHeader={true}
  showOverlay={true}
  width="medium"
>
  <Header>
    <Text id="text1" value="### Publish Interstitial?" verticalAlign="center" />
    <Button
      id="button2"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="publishConfirmFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Text
      id="publishConfirmationModalText2"
      value="Publishing this interstitial will make it available to live players for your game.

Once published, you will only be able to modify the scheduling.

You will not be able to modify the ID, Targeting, or Content. To do that you’ll need to duplicate it back to Drafts."
      verticalAlign="center"
    />
    <Button
      id="publishConfirmationModalCancelButton2"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="Cancel"
    >
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="publishConfirmFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="publishConfirmationModalConfirmButton2"
      style={{ ordered: [{ background: "success" }] }}
      styleVariant="solid"
      text="Yes, Publish"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "updateInterstitialState.trigger({\n  additionalScope: {\n    newState: 'active'\n  }\n})",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="publishConfirmFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Body>
</DrawerFrame>
