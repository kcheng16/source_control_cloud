<Container
  id="container4"
  _gap={0}
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  margin="0"
  padding="6px 0px"
  showBody={true}
  showBorder={false}
  style={{
    ordered: [
      {
        background:
          '{{ listConversations.data[i].id === activeConversation.value.id ? "#EBEAE3": "#FFF" }}',
      },
    ],
  }}
>
  <Header>
    <Text
      id="containerTitle2"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="c6ef1" viewKey="View 1">
    <Avatar
      id="avatar1"
      fallback="{{ current_user.fullName }}"
      hidden="true"
      imageSize={32}
      label="{{ current_user.fullName }}"
      labelCaption="{{ current_user.email }}"
      src="{{ current_user.profilePhotoUrl }}"
      style={{ ordered: [{ background: "automatic" }] }}
    />
    <Text
      id="text1"
      value={
        '**{{ listConversations.data[i].participants.map(e => formatPhoneNumber({number: e.phone_number})).join(", ") }}**\n{{ window.truncateString(listConversations.data[i].last_message.body || "") }}'
      }
      verticalAlign="center"
    />
    <Avatar
      id="avatar2"
      icon={
        '{{ listConversations.data[i].participants.length == 1?  "/icon:bold/interface-user-single" : "/icon:bold/interface-user-multiple" }}'
      }
      imageSize={32}
      label=""
      style={{
        ordered: [
          { borderRadius: "4px" },
          {
            background:
              '{{ window.stringToColor(listConversations.data[i].participants.map(e => e.phone_number).join(", ")) }}',
          },
        ],
      }}
    />
    <TagsWidget2
      id="tags1"
      _colorByIndex={["red"]}
      _hiddenByIndex={[false]}
      _iconByIndex={[""]}
      _ids={["020ed"]}
      _imageByIndex={[""]}
      _labels={[""]}
      _textColorByIndex={[""]}
      _tooltipByIndex={[""]}
      _values={["{{ item.untriaged_msgs_count }}"]}
      allowWrap={true}
      colorByIndex=""
      data=""
      hidden="{{ !item.untriaged_msgs_count }}"
      hiddenByIndex=""
      horizontalAlign="center"
      iconByIndex=""
      imageByIndex=""
      itemMode="static"
      labels=""
      style={{ ordered: [{ borderRadius: "4px" }] }}
      textColorByIndex=""
      tooltipByIndex=""
      value="{{ [item.untriaged_msgs_count] }}"
      values=""
    />
  </View>
  <Event
    event="click"
    method="setValue"
    params={{ ordered: [{ value: "{{ listConversations.data[i] }}" }] }}
    pluginId="activeConversation"
    type="state"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="click"
    method="trigger"
    params={{ ordered: [] }}
    pluginId="retrieveConversation"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="click"
    method="setValue"
    params={{ ordered: [{ value: "true" }] }}
    pluginId="scrollDownMessageList"
    type="state"
    waitMs="0"
    waitType="debounce"
  />
</Container>
