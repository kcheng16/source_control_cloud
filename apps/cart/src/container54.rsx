<Container
  id="container54"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="{{!auto_suggestions.value?.secondary_suggestions?.length}}"
  margin="0"
  marginType="none"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle55"
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="b5c31" viewKey="View 1">
    <Spacer id="spacer15" marginType="normal" />
    <Text
      id="text92"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(13, 13, 13, 0.45)" }] }}
      value="###### **More Suggestions**"
      verticalAlign="center"
    />
    <Divider id="divider47" marginType="normal" textSize="default" />
    <Spacer id="spacer16" marginType="normal" />
    <Spacer id="spacer17" marginType="normal" />
    <ListViewBeta
      id="listView3"
      data="{{auto_suggestions.value?.secondary_suggestions || []}}"
      enableInstanceValues={true}
      heightType="auto"
      itemWidth="200px"
      margin="0"
      marginType="none"
      numColumns={3}
      padding="0"
    >
      <Container
        id="container55"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        marginType="normal"
        padding="0"
        showBody={true}
        showBorder={false}
      >
        <Header>
          <Text
            id="containerTitle58"
            marginType="normal"
            value="#### Container title"
            verticalAlign="center"
          />
        </Header>
        <View id="9f435" viewKey="View 1">
          <Container
            id="container56"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            marginType="normal"
            padding="0"
            showBody={true}
            showBorder={false}
          >
            <Header>
              <Text
                id="containerTitle57"
                marginType="normal"
                value="#### Container title"
                verticalAlign="center"
              />
            </Header>
            <View id="9f435" viewKey="View 1">
              <Container
                id="container57"
                footerPadding="4px 12px"
                headerPadding="4px 12px"
                marginType="normal"
                padding="0"
                showBody={true}
                showBorder={false}
                style={{
                  ordered: [
                    { background: "rgba(228, 225, 225, 0.2)" },
                    { borderRadius: "8px" },
                  ],
                }}
              >
                <Header>
                  <Text
                    id="containerTitle56"
                    marginType="normal"
                    value="#### Container title"
                    verticalAlign="center"
                  />
                </Header>
                <View id="9f435" viewKey="View 1">
                  <Image
                    id="image25"
                    aspectRatio=""
                    fit="contain"
                    heightType="fixed"
                    horizontalAlign="center"
                    marginType="normal"
                    src="{{image_url_auto_suggestions.value + item.cloudinaryId}}"
                    style={{ ordered: [{ borderRadius: "8px" }] }}
                  >
                    <Event
                      event="click"
                      method="trigger"
                      params={{ ordered: [] }}
                      pluginId="fetch_auto_suggestions"
                      type="datasource"
                      waitMs="0"
                      waitType="debounce"
                    />
                  </Image>
                </View>
              </Container>
              <Text
                id="text91"
                marginType="normal"
                style={{ ordered: [{ color: "rgba(13, 13, 13, 0.75)" }] }}
                value="##### **{{item.text}}**"
                verticalAlign="center"
              />
              <Icon
                id="icon8"
                horizontalAlign="center"
                icon="line/interface-search"
                marginType="normal"
                style={{ ordered: [{ color: "rgba(13, 13, 13, 0.75)" }] }}
              />
            </View>
            <Event
              event="click"
              method="run"
              params={{
                ordered: [
                  {
                    src: "tabbedContainer2.setCurrentViewIndex(1);\ntextInput1.setValue(item.text);\nauto_suggestions.setValue(null);",
                  },
                ],
              }}
              pluginId=""
              type="script"
              waitMs="0"
              waitType="debounce"
            />
          </Container>
        </View>
      </Container>
    </ListViewBeta>
  </View>
</Container>
