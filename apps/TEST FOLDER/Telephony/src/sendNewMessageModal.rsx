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
    <Form
      id="form2"
      disableSubmit="{{
  !(
    newConversationPayloadTransformer.value.body
    && newConversationPayloadTransformer.value.phone_numbers.length > 0
    && newConversationPayloadTransformer.value.task
    && newMessageRetrieveTask.data?.id
  )
}}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text id="formTitle1" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <TextArea
          id="textArea1"
          autoResize={true}
          formDataKey="body"
          label=""
          labelPosition="top"
          minLines="5"
          placeholder="Type a message"
        />
        <TextInput
          id="textInput2"
          customValidation="{{ newMessageRetrieveTask.data?.data?.detail }}"
          formDataKey="task"
          label="Task / Ticket ID"
          labelPosition="top"
          required={true}
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "newMessageRetrieveTask.reset();\nnewMessageRetrieveTask.trigger();",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </TextInput>
        <Link
          id="link2"
          hidden="{{ !newMessageRetrieveTask.data?.name }}"
          loading="{{ newMessageRetrieveTask.isFetching }}"
          showUnderline="never"
          text="{{ newMessageRetrieveTask.data?.name }}"
        >
          <Event
            event="click"
            method="openUrl"
            params={{
              ordered: [
                {
                  url: "https://retool.getduckbill.com/app/cockpit?task_id={{ newMessageRetrieveTask.data.id }}&_environment={{retoolContext.environment}}",
                },
              ],
            }}
            pluginId=""
            type="util"
            waitMs="0"
            waitType="debounce"
          />
        </Link>
        <ListViewBeta
          id="phoneNumbersInputlistView"
          _primaryKeys="{{ item }}"
          data="{{ Array.from({ length: phonesCount.value }, (_, i) => i) }}"
          enableInstanceValues={true}
          heightType="auto"
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <PhoneNumberInput
            id="phoneNumber1"
            _lockSelectedCountry="{{ showDefaultUSCountryCode.value }}"
            customValidation="{{ self.value.length > 3 && self.value.length < 12 ? 'Phone number is too short': null }}"
            label=""
            labelPosition="top"
            lockedCountryCode="US"
            showClear={true}
          >
            <Event
              event="focus"
              method="setValue"
              params={{ ordered: [{ value: "{{ false }}" }] }}
              pluginId="showDefaultUSCountryCode"
              type="state"
              waitMs="0"
              waitType="debounce"
            />
          </PhoneNumberInput>
        </ListViewBeta>
      </Body>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="sendNewMessage"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
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
      submitTargetId="form2"
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
