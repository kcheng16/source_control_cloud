<ModalFrame
  id="callTriageModelFrame"
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
    <Text id="modalTitle3" value="### Triage" verticalAlign="center" />
    <Button
      id="modalCloseButton3"
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
        pluginId="callTriageModelFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Link
      id="link3"
      hidden="{{ !triageCallRetrieveTask.data?.name }}"
      loading="{{ triageCallRetrieveTask.isFetching }}"
      showUnderline="never"
      text="{{ triageCallRetrieveTask.data?.name }}"
    >
      <Event
        event="click"
        method="openUrl"
        params={{
          ordered: [
            {
              url: "https://retool.getduckbill.com/app/cockpit?task_id={{ triageCallRetrieveTask.data.id }}&_environment={{retoolContext.environment}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Link>
  </Body>
  <Footer>
    <Button
      id="button9"
      disabled="{{ markCallAsSpam.isFetching || triageCall.isFetching }}"
      loading="{{ markCallAsSpam.isFetching }}"
      style={{ ordered: [{ background: "danger" }] }}
      text="Spam"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="markCallAsSpam"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button id="button2" submit={true} submitTargetId="" text="Submit" />
  </Footer>
  <Event
    event="show"
    method="trigger"
    params={{ ordered: [] }}
    pluginId="triageCallRetrieveTask"
    type="datasource"
    waitMs="20"
    waitType="debounce"
  />
  <Event
    event="hide"
    method="setValue"
    params={{ ordered: [{ value: "null" }] }}
    pluginId="activeCall"
    type="state"
    waitMs="0"
    waitType="debounce"
  />
</ModalFrame>
