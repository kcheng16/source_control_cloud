<ModalFrame
  id="bulkTriageMessageModalFrame"
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
    <Text
      id="modalTitle4"
      value="### Triage {{ Object.keys(untriagedMessageIds.value).length }} message{{ Object.keys(untriagedMessageIds.value).length > 1? 's': ''  }}"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton4"
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
        pluginId="bulkTriageMessageModalFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Link
      id="link7"
      hidden="{{ !bulkTriageMessageRetrieveTask.data?.name }}"
      loading="{{ bulkTriageMessageRetrieveTask.isFetching }}"
      showUnderline="never"
      text="{{ bulkTriageMessageRetrieveTask.data?.name }}"
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
      id="button13"
      style={{ ordered: [{ background: "danger" }] }}
      text="Spam"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "bulkTriageMessages.trigger({\n  additionalScope: {\n    markSpam: true\n  }\n});",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button id="button12" submit={true} submitTargetId="" text="Triage" />
  </Footer>
</ModalFrame>
