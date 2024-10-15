<ModalFrame
  id="messageTriageModalFrame"
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
    <Text id="modalTitle1" value="### Triage" verticalAlign="center" />
    <Button
      id="modalCloseButton1"
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
        pluginId="messageTriageModalFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Select
      id="messageTriageTaskInput"
      allowCustomValue={true}
      customValidation="{{ triageMessageRetrieveTask.data?.data?.detail }}"
      data="{{ Object.entries(retrieveConversation.data?.tasks || {}) }}"
      emptyMessage="No options"
      formDataKey="task"
      label="Task / Ticket ID"
      labelPosition="top"
      labels="{{ item[1].client }}: {{ item[1].name }}"
      overlayMaxHeight={375}
      placeholder="Select a task or enter task id"
      showSelectionIndicator={true}
      value=""
      values="{{ item[0] }}"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "triageMessageRetrieveTask.reset();\ntriageMessageRetrieveTask.trigger();",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Form
      id="form1"
      disableSubmit="{{ !(messageTriageTaskInput.value && triageMessageRetrieveTask.data?.id) }}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hoistFetching={true}
      margin="0"
      padding="0"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showBorder={false}
    >
      <Link
        id="link4"
        hidden="{{ !triageMessageRetrieveTask.data?.name }}"
        loading="{{ triageMessageRetrieveTask.isFetching }}"
        showUnderline="never"
        text="{{ triageMessageRetrieveTask.data?.name  }}"
      >
        <Event
          event="click"
          method="openUrl"
          params={{
            ordered: [
              {
                url: "https://retool.getduckbill.com/app/cockpit?task_id={{ triageMessageRetrieveTask.data?.id }}&_environment={{retoolContext.environment}}",
              },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Link>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="triageMessage"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </Body>
  <Footer>
    <Button
      id="button8"
      style={{ ordered: [{ background: "danger" }] }}
      text="Spam"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="markMessageAsSpam"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="formButton1"
      submit={true}
      submitTargetId="form1"
      text="Submit"
    />
  </Footer>
  <Event
    event="hide"
    method="reset"
    params={{ ordered: [] }}
    pluginId="triageMessageRetrieveTask"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="show"
    method="trigger"
    params={{ ordered: [] }}
    pluginId="triageMessageRetrieveTask"
    type="datasource"
    waitMs="20"
    waitType="debounce"
  />
  <Event
    event="hide"
    method="setValue"
    params={{ ordered: [{ value: "null" }] }}
    pluginId="activeMessage"
    type="state"
    waitMs="0"
    waitType="debounce"
  />
</ModalFrame>
