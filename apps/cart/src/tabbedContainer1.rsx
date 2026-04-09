<Container
  id="tabbedContainer1"
  currentViewKey="{{ self.viewKeys[0] }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  heightType="fixed"
  margin="0"
  padding="0"
  showBody={true}
  showBorder={false}
  style={{ map: { background: "canvas" } }}
>
  <Header>
    <Tabs
      id="tabs1"
      hidden="true"
      itemMode="static"
      navigateContainer={true}
      targetContainerId="tabbedContainer1"
      value="{{ self.values[0] }}"
    >
      <Option id="00030" value="Tab 1" />
      <Option id="00031" value="Tab 2" />
      <Option id="00032" value="Tab 3" />
    </Tabs>
  </Header>
  <View id="00032" viewKey="Cart">
    <Include src="./container11.rsx" />
    <Include src="./container16.rsx" />
  </View>
  <View
    id="349e9"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="Payment"
  >
    <Include src="./mainContainer.rsx" />
  </View>
  <View
    id="f23b3"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="Search"
  >
    <Container
      id="container43"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      marginType="normal"
      padding="12px"
      showBody={true}
      style={{
        ordered: [{ borderRadius: "8px" }, { border: "rgba(2, 6, 12, 0.15)" }],
      }}
    >
      <Header>
        <Text
          id="containerTitle46"
          marginType="normal"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="b5c31" viewKey="View 1">
        <Container
          id="container44"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          marginType="none"
          padding="0"
          showBody={true}
          showBorder={false}
          style={{ ordered: [] }}
        >
          <Header>
            <Text
              id="containerTitle45"
              marginType="normal"
              value="#### Container title"
              verticalAlign="center"
            />
          </Header>
          <View id="b5c31" viewKey="View 1">
            <TextInput
              id="textInput1"
              label=""
              labelPosition="top"
              marginType="normal"
              placeholder={'Search for "items"'}
              style={{
                ordered: [
                  { background: "rgb(240, 240, 245)" },
                  { borderRadius: "8px" },
                  { border: "rgb(240, 240, 245)" },
                  { accent: "rgb(240, 240, 245)" },
                ],
              }}
            >
              <Event
                enabled=""
                event="change"
                method="run"
                params={{
                  ordered: [
                    {
                      src: 'tabbedContainer2.setCurrentViewIndex(0);\n\nif (textInput1.value.trim().length > 1) {\n  fetch_auto_suggestions.trigger();\n  \n  // DP event\n  window.send_dp_event({\n    event: "click",\n    object_name: "search-bar",\n    object_value: {text: textInput1.value}\n  });\n\n} else if (textInput1.value.trim().length === 0) {\n  auto_suggestions.setValue(null);\n  container50.setHidden(true);\n}\n\nreset_search_data.trigger();\n',
                    },
                  ],
                }}
                pluginId=""
                type="script"
                waitMs="300"
                waitType="debounce"
              />
            </TextInput>
            <Icon
              id="icon5"
              hidden=""
              horizontalAlign="center"
              icon="bold/interface-arrows-button-left"
              marginType="normal"
            >
              <Event
                event="click"
                method="run"
                params={{
                  ordered: [
                    {
                      src: 'if (textInput1.value?.trim()?.length === 0) {\n  tabbedContainer1.setCurrentViewIndex(0);\n  GetCart.trigger();\n}\n\ntabbedContainer2.setCurrentViewIndex(0);\nauto_suggestions.setValue(null);\ntextInput1.resetValue();\n\nreset_search_data.trigger();\n\n// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "clear-search",\n  object_value: {}\n});',
                    },
                  ],
                }}
                pluginId=""
                type="script"
                waitMs="0"
                waitType="debounce"
              />
            </Icon>
          </View>
        </Container>
      </View>
    </Container>
    <Container
      id="container45"
      disabled=""
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      loading=""
      marginType="normal"
      padding="12px"
      showBody={true}
      style={{
        ordered: [{ borderRadius: "8px" }, { border: "rgba(2, 6, 12, 0.15)" }],
      }}
    >
      <Header>
        <Text
          id="containerTitle47"
          marginType="normal"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="4c266" viewKey="View 1">
        <Include src="./tabbedContainer2.rsx" />
      </View>
    </Container>
  </View>
  <View
    id="d701e"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="Past Orders"
  >
    <Include src="./container70.rsx" />
  </View>
</Container>
