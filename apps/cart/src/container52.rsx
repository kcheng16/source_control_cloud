<Container
  id="container52"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="true"
  marginType="normal"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle52"
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="9f435" viewKey="View 1">
    <Container
      id="container53"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      marginType="normal"
      padding="12px"
      showBody={true}
      showBorder={false}
      style={{
        ordered: [
          { background: "rgb(255, 238, 229)" },
          { borderRadius: "8px" },
        ],
      }}
    >
      <Header>
        <Text
          id="containerTitle51"
          marginType="normal"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="b5c31" viewKey="View 1">
        <Icon
          id="icon7"
          horizontalAlign="center"
          icon="bold/interface-search"
          marginType="normal"
          style={{ ordered: [{ color: "rgb(255, 82, 0)" }] }}
        />
      </View>
    </Container>
    <Spacer id="spacer12" marginType="normal" />
    <Spacer id="spacer13" marginType="normal" />
    <Text
      id="text90"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(13, 13, 13, 0.75)" }] }}
      value={'##### **Show all results for "{{textInput1.value}}"**'}
      verticalAlign="center"
    />
  </View>
  <Event
    event="click"
    method="run"
    params={{
      ordered: [
        {
          src: 'tabbedContainer2.setCurrentViewIndex(1);\nauto_suggestions.setValue(null);\nfetch_search_results.trigger();\n\n// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "show-all-results",\n  object_value: {search_term: textInput1.value}\n});',
        },
      ],
    }}
    pluginId=""
    type="script"
    waitMs="0"
    waitType="debounce"
  />
</Container>
