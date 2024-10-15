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
    <Form
      id="form4"
      disabled=""
      disableSubmit="{{ !(callTriageTaskInput.value && triageCallRetrieveTask.data?.id && !triageCallRetrieveTask.isFetching) }}"
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
      <Select
        id="callTriageTaskInput"
        allowCustomValue={true}
        customValidation="{{ triageCallRetrieveTask.data?.data?.detail }}"
        data="{{ Array.isArray(listCalls.data) && listCalls.data.filter(call => !!call.task_id).map(call => [call.task_id, call.task])}}"
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
                src: "triageCallRetrieveTask.reset();\ntriageCallRetrieveTask.trigger();",
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </Select>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="triageCall"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
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
    <Button id="button2" submit={true} submitTargetId="form4" text="Submit" />
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
