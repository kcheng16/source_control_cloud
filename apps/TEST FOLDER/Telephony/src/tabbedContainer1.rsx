<Container
  id="tabbedContainer1"
  _gap={0}
  currentViewKey="{{ self.viewKeys[0] }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Select
      id="selectedPhoneNumber"
      captionByIndex=""
      colorByIndex=""
      data="{{ listPhoneNumbers.data }}"
      disabledByIndex=""
      emptyMessage="No options"
      fallbackTextByIndex=""
      hiddenByIndex=""
      iconBefore="bold/phone-telephone-circle-alternate"
      iconByIndex=""
      imageByIndex=""
      label=""
      labelPosition="top"
      labels="{{ `${formatPhoneNumber({number: item.number})} (${item.agent?.name? item.agent?.name: 'Unassigned'})` }}"
      overlayMaxHeight={375}
      placeholder="Select a phone..."
      showSelectionIndicator={true}
      style={{
        ordered: [
          { background: "rgb(236, 245, 253)" },
          { border: "rgb(103, 170, 228)" },
        ],
      }}
      textBefore="Select Phone"
      tooltipByIndex=""
      value="{{ authTokenQuery.data.user.phone_number_id }}"
      values="{{ item.id }}"
    >
      <Option id="11a91" value="Option 1" />
      <Option id="b6b8c" value="Option 2" />
      <Option id="0e8bb" value="Option 3" />
      <Event
        event="change"
        method="reset"
        params={{ ordered: [] }}
        pluginId="retrieveConversation"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="change"
        method="setValue"
        params={{ ordered: [{ value: "{{ null }}" }] }}
        pluginId="activeConversation"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <Divider id="divider2" />
    <Button
      id="button11"
      disabled="{{ untriagedMessageIds.value.length == 0 }}"
      hidden="{{ tabs1.value !== 'Messages' || !activeConversation.value }}"
      style={{ ordered: [] }}
      text="Triage All"
    >
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="bulkTriageMessageModalFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Tabs
      id="tabs1"
      itemMode="static"
      margin="4px 10px"
      navigateContainer={true}
      targetContainerId="tabbedContainer1"
      value="{{ self.values[0] }}"
    >
      <Option id="38e45" value="Tab 1" />
      <Option id="c137d" value="Tab 2" />
      <Option id="9ab8c" value="Tab 3" />
    </Tabs>
  </Header>
  <View id="a3300" viewKey="Messages">
    <Button id="button1" iconAfter="bold/interface-add-1" text="Send message">
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="sendNewMessageModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <EditableTextArea
      id="notesEditableTextArea"
      editIcon="bold/interface-edit-write-1"
      hidden="{{ !activeConversation.value }}"
      inputTooltip="`Shift+Enter` to save, `Esc` to cancel"
      label="Notes"
      labelPosition="top"
      loading="{{ retrieveNotes.isFetching || updateNotes.isFetching }}"
      maxLength="100"
      placeholder="Enter notes..."
      showCharacterCount={true}
      value="{{ retrieveNotes.data?.notes }}"
    >
      <Event
        event="blur"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="updateNotes"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </EditableTextArea>
    <Divider id="divider1" />
    <ListViewBeta
      id="messagesListView"
      data="{{ retrieveConversation.data?.messages }}"
      itemWidth="200px"
      margin="0"
      numColumns={3}
      padding="0"
    >
      <Container
        id="container3"
        _flexWrap={true}
        _gap={0}
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        padding="0"
        showBody={true}
        showBorder={false}
        style={{ ordered: [] }}
      >
        <Header>
          <Text
            id="containerTitle1"
            value="#### Container title"
            verticalAlign="center"
          />
        </Header>
        <View id="e2ea2" viewKey="View 1">
          <Avatar
            id="avatar3"
            horizontalAlign="right"
            icon="bold/interface-user-single"
            imageSize={32}
            label=""
            style={{
              ordered: [
                { borderRadius: "4px" },
                {
                  background:
                    "{{ window.stringToColor(retrieveConversation.data.messages[i].sender) }}",
                },
              ],
            }}
          />
          <Container
            id="container7"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            padding="12px"
            showBody={true}
            showBorder={false}
            style={{ ordered: [{ background: "rgb(241, 243, 244)" }] }}
          >
            <Header>
              <Text
                id="containerTitle5"
                value="#### Container title"
                verticalAlign="center"
              />
            </Header>
            <View id="20794" viewKey="View 1">
              <Text
                id="text8"
                hidden="{{ !retrieveConversation.data.messages[i].body }}"
                value="{{ retrieveConversation.data.messages[i].body }}"
                verticalAlign="center"
              />
              <Button
                id="button4"
                heightType="auto"
                hidden="{{ !!retrieveConversation.data.messages[i].triaged_at }}"
                iconAfter="bold/mail-chat-bubble-square-check"
                margin="0"
                style={{ ordered: [] }}
                text="Triage"
              >
                <Event
                  event="click"
                  method="show"
                  params={{ ordered: [] }}
                  pluginId="messageTriageModalFrame"
                  type="widget"
                  waitMs="0"
                  waitType="debounce"
                />
                <Event
                  event="click"
                  method="setValue"
                  params={{
                    ordered: [
                      { value: "{{ retrieveConversation.data.messages[i] }}" },
                    ],
                  }}
                  pluginId="activeMessage"
                  type="state"
                  waitMs="0"
                  waitType="debounce"
                />
              </Button>
              <ImageGrid
                id="imageGrid1"
                aspectRatio=""
                columnCount={3}
                columnMinWidth={100}
                columnType="responsive"
                data="{{ retrieveConversation.data.messages[i].media_urls }}"
                hidden="{{ retrieveConversation.data.messages[i].media_urls.length == 0 }}"
                srcByIndex="{{ item }}"
                style={{ ordered: [{ borderColor: "rgba(0, 0, 0, 0.4)" }] }}
              >
                <Event
                  event="click"
                  method="openUrl"
                  params={{ ordered: [{ url: "{{ item }}" }] }}
                  pluginId=""
                  type="util"
                  waitMs="0"
                  waitType="debounce"
                />
              </ImageGrid>
            </View>
          </Container>
          <Container
            id="stack1"
            _gap="0px"
            _type="stack"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            margin="0"
            padding="0"
            showBody={true}
            showBorder={false}
          >
            <View id="22e60" viewKey="View 1">
              <Link
                id="link5"
                hidden="{{ !retrieveConversation.data.messages[i].triaged_at}}"
                showUnderline="never"
                style={{
                  ordered: [
                    {
                      text: "{{ !!retrieveConversation.data.messages[i].task_id ? '#3170F9' : '#5F6368' }}",
                    },
                  ],
                }}
                text="{{ retrieveConversation.data.messages[i].triaged_at ? (retrieveConversation.data.tasks[retrieveConversation.data.messages[i].task_id] ? (`${retrieveConversation.data.tasks[retrieveConversation.data.messages[i].task_id].client}: ${retrieveConversation.data.tasks[retrieveConversation.data.messages[i].task_id].name}`) : 'Spam') : '' }}"
              >
                <Event
                  enabled="{{ !!retrieveConversation.data.messages[i].task_id  }}"
                  event="click"
                  method="openUrl"
                  params={{
                    ordered: [
                      {
                        url: "https://retool.getduckbill.com/app/cockpit?task_id={{ retrieveConversation.data.messages[i].task_id }}&_environment={{ retoolContext.environment }}",
                      },
                    ],
                  }}
                  pluginId=""
                  type="util"
                  waitMs="0"
                  waitType="debounce"
                />
              </Link>
              <Text
                id="text7"
                margin="4px 25px"
                style={{ ordered: [{ color: "rgb(95, 99, 104)" }] }}
                value="{{ `${formatPhoneNumber({number: retrieveConversation.data.messages[i].sender})} • ${moment(retrieveConversation.data.messages[i].sent_at).local().format('MMM D,  h:mm A')}` }}"
                verticalAlign="center"
              />
            </View>
          </Container>
        </View>
      </Container>
    </ListViewBeta>
    <Container
      id="container2"
      _gap={0}
      enableFullBleed={true}
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      overflowType="hidden"
      padding="12px"
      showBody={true}
    >
      <Header>
        <Text
          id="listViewTitle1"
          value="#### List View title"
          verticalAlign="center"
        />
      </Header>
      <View id="0c842" viewKey="View 1">
        <ListViewBeta
          id="listView2"
          data="{{ listConversations.data }}"
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="12px"
        >
          <Include src="./container4.rsx" />
        </ListViewBeta>
      </View>
    </Container>
    <Form
      id="form3"
      disableSubmit="{{ 
  !(
    (form3.data.body || form3.data.media.length > 0)
    && form3.data.task
    && conversationFormRetrieveTask.data?.id
  )
}}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="{{ !activeConversation.value }}"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showFooter={true}
    >
      <Header>
        <Text id="formTitle2" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <TextArea
          id="textArea2"
          autoResize={true}
          disabled=""
          formDataKey="body"
          label=""
          labelPosition="top"
          minLines="3"
          placeholder="Type a message"
        />
        <FileInput
          id="fileInput1"
          _isUpgraded={true}
          accept={'["image/jpeg", "image/jpg", "image/png", "application/pdf"]'}
          disabled=""
          formDataKey="media"
          iconBefore="bold/programming-browser-search"
          label=""
          labelPosition="top"
          maxSize="5 MB"
          selectionType="multiple"
          showClear={true}
          textBefore="Browse"
        />
        <Select
          id="select1"
          allowCustomValue={true}
          customValidation="{{ conversationFormRetrieveTask.data?.data?.detail }}"
          data="{{ Object.entries(retrieveConversation.data?.tasks || {}) }}"
          emptyMessage="No options"
          formDataKey="task"
          label="Task / Ticket ID"
          labelPosition="top"
          labels="{{ item[1].client }}: {{ item[1].name }}"
          overlayMaxHeight={375}
          placeholder="Select a task or enter task id"
          required={true}
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
                  src: "conversationFormRetrieveTask.reset()\nconversationFormRetrieveTask.trigger();",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Select>
        <Link
          id="link1"
          hidden="{{ !conversationFormRetrieveTask.data?.name }}"
          loading="{{ conversationFormRetrieveTask.isFetching }}"
          showUnderline="never"
          text="{{ conversationFormRetrieveTask.data?.name }}"
        >
          <Event
            event="click"
            method="openUrl"
            params={{
              ordered: [
                {
                  url: "https://retool.getduckbill.com/app/cockpit?task_id={{conversationFormRetrieveTask.data.id}}&_environment={{retoolContext.environment}}",
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
          id="formButton3"
          iconAfter="bold/mail-send-email"
          submit={true}
          submitTargetId="form3"
          text="Send"
        />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="sendMessageToConversation"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Form>
  </View>
  <View id="05b0a" viewKey="Calls">
    <TextInput
      id="searchInput"
      iconBefore="bold/interface-search"
      label=""
      labelPosition="top"
      placeholder="Search"
      showClear={true}
      style={{ ordered: [] }}
    />
    <Table
      id="table1"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ listCalls.data.filter(elem => elem.is_inbound ? elem.caller.includes(searchInput.value): elem.recipient.includes(searchInput.value)) }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      heightType="auto"
      primaryKeyColumnId="ce051"
      rowHeight="medium"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="ce051"
        alignment="left"
        editable={false}
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="id"
        label="ID"
        placeholder="Enter value"
        position="center"
        size={196.59375}
        summaryAggregationMode="none"
      />
      <Column
        id="a1308"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="ext_id"
        label="Ext ID"
        placeholder="Enter value"
        position="center"
        size={272.4375}
        summaryAggregationMode="none"
      />
      <Column
        id="23ccd"
        alignment="left"
        format="icon"
        formatOptions={{
          icon: '{{ currentSourceRow.is_answered? (currentSourceRow.is_inbound? "/icon:bold/interface-arrows-corner-down-left": "/icon:bold/interface-arrows-corner-up-right"):"/icon:bold/computer-desktop-block-alternate" }}',
          color:
            "{{ currentSourceRow.is_answered? (currentSourceRow.is_inbound? theme.success: theme.primary): theme.danger }}",
        }}
        groupAggregationMode="none"
        key="is_inbound"
        placeholder="Enter value"
        position="center"
        referenceId="direction"
        size={49}
        summaryAggregationMode="none"
        valueOverride="1"
      />
      <Column
        id="db17b"
        alignment="left"
        format="html"
        formatOptions={{
          showFormatting: true,
          showCountryCallingCode: true,
          restrictToCountry: false,
        }}
        groupAggregationMode="none"
        key="caller"
        label="Phone Number"
        placeholder="Enter value"
        position="center"
        referenceId="phoneNumber"
        size={176}
        summaryAggregationMode="none"
        valueOverride="{{ formatPhoneNumber({number: currentSourceRow.is_inbound ? currentSourceRow.caller: currentSourceRow.recipient}) }}"
      />
      <Column
        id="07c40"
        alignment="left"
        format="datetime"
        formatOptions={{
          manageTimeZone: true,
          valueTimeZone: "00:00",
          displayTimeZone: "local",
        }}
        groupAggregationMode="none"
        key="started_at"
        label="Started at"
        placeholder="Enter value"
        position="center"
        size={147.25}
        summaryAggregationMode="none"
      />
      <Column
        id="3bf78"
        alignment="center"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="duration_sec"
        label="Duration"
        placeholder="Enter value"
        position="center"
        size={105.5625}
        summaryAggregationMode="none"
        valueOverride="{{ `${Math.floor(item / 3600) ? Math.floor(item / 3600) + 'hr' : ''}${Math.floor(item % 3600 / 60) ? Math.floor(item % 3600 / 60) + 'm' : ''}${item % 60 ? item % 60 + 's' : ''}`}}"
      />
      <Column
        id="40b9b"
        alignment="left"
        cellTooltipMode="overflow"
        format="icon"
        formatOptions={{
          icon: '{{ item ? "/icon:bold/entertainment-control-button-play-circle": "/icon:bold/interface-alert-warning-circle" }}',
        }}
        groupAggregationMode="none"
        key="recordings"
        label="Recordings"
        placeholder="Select options"
        position="center"
        size={120.40625}
        summaryAggregationMode="none"
        valueOverride="{{ item.length > 0 ? item[0]: null }}"
      >
        <Event
          event="clickCell"
          method="show"
          params={{ ordered: [] }}
          pluginId="drawerFrame1"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickCell"
          method="setValue"
          params={{ ordered: [{ value: "{{ currentSourceRow }}" }] }}
          pluginId="activeCall"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="30d6d"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="none"
        key="task_id"
        label="Task"
        placeholder="Enter value"
        position="center"
        size={637.40625}
        summaryAggregationMode="none"
        valueOverride="{{ `${currentSourceRow.task.client}: ${currentSourceRow.task.name}` }}"
      >
        <Event
          event="clickCell"
          method="openUrl"
          params={{
            ordered: [
              {
                url: "https://retool.getduckbill.com/app/cockpit?task_id={{ currentSourceRow.task_id }}&_environment={{ retoolContext.environment }}",
              },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="d70f5"
        alignment="left"
        editable="true"
        format="button"
        formatOptions={{
          showUnderline: "hover",
          underlineStyle: "solid",
          variant: "solid",
          iconAfter: "bold/interface-alert-alarm-bell-check",
          iconBefore: "",
        }}
        groupAggregationMode="none"
        key="triaged_at"
        placeholder="Enter value"
        position="right"
        referenceId="triage"
        size={186.171875}
        summaryAggregationMode="none"
        valueOverride={'{{ !item? "Triage": ""}}'}
      >
        <Event
          event="clickCell"
          method="setValue"
          params={{ ordered: [{ value: "{{ currentSourceRow }}" }] }}
          pluginId="activeCall"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickCell"
          method="show"
          params={{ ordered: [] }}
          pluginId="callTriageModelFrame"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <ToolbarButton
        id="3c"
        icon="bold/interface-download-button-2"
        label="Download"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="exportData"
          pluginId="table1"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="refresh"
          pluginId="table1"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="02ac1"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
    </Table>
  </View>
</Container>
