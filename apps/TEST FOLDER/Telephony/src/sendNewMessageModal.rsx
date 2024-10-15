<ModalFrame
  id="sendNewMessageModal"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
  showOverlay={true}
>
  <Header>
    <Text id="modalTitle2" value="### Send message" verticalAlign="center" />
    <Button
      id="modalCloseButton2"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="sendNewMessageModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Button id="button6" iconBefore="bold/interface-add-1" text="Add">
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "{{ phonesCount.value + 1 }}" }] }}
        pluginId="phonesCount"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Body>
  <Footer>
    <Button
      id="formButton2"
      iconAfter="bold/mail-send-email"
      submit={true}
      submitTargetId=""
      text="Send"
    />
  </Footer>
  <Event
    event="hide"
    method="reset"
    params={{ ordered: [] }}
    pluginId="retrieveTask"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
</ModalFrame>
