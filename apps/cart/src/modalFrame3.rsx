<ModalFrame
  id="modalFrame3"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  padding="8px 12px"
  showOverlay={true}
  size="medium"
>
  <Header>
    <Text id="modalTitle5" value="### Container title" verticalAlign="center" />
    <Button
      id="modalCloseButton4"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ map: { border: "transparent" } }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ map: { hidden: true } }}
        pluginId="modalFrame3"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Text
      id="text116"
      style={{ map: { color: "primary" } }}
      value={
        '<h4 style="color:#3E4152;">{{ cartValidationErrMsg.value.msg }} </h4>\n\n<br/>\nNote: Please verify the items in the cart before proceeding again.'
      }
      verticalAlign="center"
    />
    <Button id="button34" text="Okay">
      <Event
        event="click"
        method="hide"
        params={{}}
        pluginId="modalFrame3"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="run"
        params={{
          map: {
            src: 'cartValidationErrMsg.setValue("");\nresetScanItemFocus.trigger();',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Body>
</ModalFrame>
