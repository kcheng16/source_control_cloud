<Container
  id="tabbedContainer2"
  currentViewKey="{{ self.viewKeys[0] }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden=""
  margin="0"
  marginType="none"
  padding="0"
  showBody={true}
  showBorder={false}
  showHeader="{{tabbedContainer2.currentViewIndex === 1}}"
  showHeaderBorder={false}
>
  <Header>
    <Tabs
      id="tabs2"
      hidden="true"
      itemMode="static"
      marginType="normal"
      navigateContainer={true}
      targetContainerId="tabbedContainer2"
      value="{{ self.values[0] }}"
    >
      <Option id="a6335" value="Tab 1" />
      <Option id="08195" value="Tab 2" />
      <Option id="76b39" value="Tab 3" />
    </Tabs>
    <Button
      id="button26"
      marginType="normal"
      style={{
        ordered: [{ background: "rgb(27, 166, 114)" }, { borderRadius: "8px" }],
      }}
      text="Go to cart"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: 'tabbedContainer1.setCurrentViewIndex(0);\n\ntabbedContainer2.setCurrentViewIndex(0);\n\nreset_search_data.trigger();\ntextInput1.resetValue();\n\nGetCart.trigger();\n\n// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "go-to-cart",\n  object_value: {search_term: textInput1.value}\n});',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="text95"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(13, 13, 13, 0.75)" }] }}
      value={'##### **Showing results for "{{textInput1.value}}"**'}
      verticalAlign="center"
    />
    <Divider id="divider50" marginType="normal" textSize="default" />
  </Header>
  <View id="35764" viewKey="View 1">
    <Container
      id="container49"
      disabled="{{fetch_auto_suggestions.isFetching}}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      hidden="{{textInput1.value.trim().length < 2}}"
      loading="{{fetch_auto_suggestions.isFetching}}"
      marginType="normal"
      padding="0"
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text
          id="containerTitle59"
          marginType="normal"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="b5c31" viewKey="View 1">
        <ListViewBeta
          id="listView4"
          _primaryKeys=""
          data="{{ auto_suggestions.value?.suggestions }}"
          enableInstanceValues={true}
          heightType="auto"
          hidden="{{!auto_suggestions.value?.suggestions?.length}}"
          itemWidth="200px"
          margin="0"
          marginType="none"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container58"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            margin="0"
            marginType="none"
            padding="0"
            showBody={true}
            showBorder={false}
          >
            <Header>
              <Text
                id="containerTitle65"
                marginType="normal"
                value="#### Container title"
                verticalAlign="center"
              />
            </Header>
            <View id="b5c31" viewKey="View 1">
              <Container
                id="container59"
                footerPadding="4px 12px"
                headerPadding="4px 12px"
                marginType="normal"
                padding="0"
                showBody={true}
                showBorder={false}
              >
                <Header>
                  <Text
                    id="containerTitle62"
                    marginType="normal"
                    value="#### Container title"
                    verticalAlign="center"
                  />
                </Header>
                <View id="b5c31" viewKey="View 1">
                  <Container
                    id="container60"
                    footerPadding="4px 12px"
                    headerPadding="4px 12px"
                    marginType="normal"
                    padding="0"
                    showBody={true}
                    showBorder={false}
                  >
                    <Header>
                      <Text
                        id="containerTitle61"
                        marginType="normal"
                        value="#### Container title"
                        verticalAlign="center"
                      />
                    </Header>
                    <View id="ec523" viewKey="View 1">
                      <Container
                        id="container61"
                        footerPadding="4px 12px"
                        headerPadding="4px 12px"
                        heightType="fixed"
                        marginType="normal"
                        overflowType="hidden"
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
                            id="containerTitle60"
                            marginType="normal"
                            value="#### Container title"
                            verticalAlign="center"
                          />
                        </Header>
                        <View id="b5c31" viewKey="View 1">
                          <Image
                            id="image26"
                            aspectRatio=""
                            heightType="fixed"
                            horizontalAlign="center"
                            marginType="normal"
                            src="{{image_url_auto_suggestions.value + item?.card?.card?.cloudinaryId}}"
                            style={{ ordered: [{ borderRadius: "8px" }] }}
                          />
                        </View>
                      </Container>
                      <Text
                        id="text93"
                        marginType="normal"
                        style={{
                          ordered: [{ color: "rgba(13, 13, 13, 0.75)" }],
                        }}
                        value={
                          "##### **{{item?.card?.card?.text.includes(\"Show all results\") ? `Show all results for '${textInput1.value}'` : item?.card?.card?.text}}**"
                        }
                        verticalAlign="center"
                      />
                      <Icon
                        id="icon9"
                        hidden={
                          '{{ item.card.card.text.includes("Show all results") }}'
                        }
                        horizontalAlign="center"
                        icon="line/interface-search"
                        marginType="normal"
                      />
                    </View>
                    <Event
                      event="click"
                      method="run"
                      params={{
                        ordered: [
                          {
                            src: 'tabbedContainer2.setCurrentViewIndex(1);\nauto_suggestions.setValue(null);\nfetch_search_results.trigger();\n\nif (item.card.card.text.includes("Show all results")) {\n  // DP event\n  window.send_dp_event({\n    event: "click",\n    object_name: "show-all-results",\n    object_value: {search_term: textInput1.value}\n  });\n} else {\n  textInput1.setValue(item.card.card.text);\n  \n  // DP event\n  window.send_dp_event({\n    event: "click",\n    object_name: "searched-item",\n    object_value: {search_term: textInput1.value, item}\n  });\n}',
                          },
                        ],
                      }}
                      pluginId=""
                      type="script"
                      waitMs="0"
                      waitType="debounce"
                    />
                  </Container>
                  <ListViewBeta
                    id="listView5"
                    data="{{ item?.card?.card?.nestedSuggestions }}"
                    enableInstanceValues={true}
                    heightType="auto"
                    hidden="{{!item?.nestedSuggestions?.length}}"
                    itemWidth="200px"
                    margin="0"
                    marginType="none"
                    numColumns={3}
                    padding="12px"
                  >
                    <Container
                      id="container62"
                      footerPadding="4px 12px"
                      headerPadding="4px 12px"
                      marginType="normal"
                      padding="0"
                      showBody={true}
                      showBorder={false}
                    >
                      <Header>
                        <Text
                          id="containerTitle64"
                          marginType="normal"
                          value="#### Container title"
                          verticalAlign="center"
                        />
                      </Header>
                      <View id="b5c31" viewKey="View 1">
                        <Container
                          id="container63"
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
                              id="containerTitle63"
                              marginType="normal"
                              value="#### Container title"
                              verticalAlign="center"
                            />
                          </Header>
                          <View id="9f435" viewKey="View 1">
                            <Image
                              id="image27"
                              fit="contain"
                              heightType="fixed"
                              horizontalAlign="center"
                              marginType="normal"
                              src="{{image_url_auto_suggestions.value + item.cloudinaryId}}"
                              style={{ ordered: [{ borderRadius: "8px" }] }}
                            />
                          </View>
                        </Container>
                        <Text
                          id="text94"
                          marginType="normal"
                          style={{
                            ordered: [{ color: "rgba(13, 13, 13, 0.75)" }],
                          }}
                          value="##### **{{item.text}}**"
                          verticalAlign="center"
                        />
                        <Icon
                          id="icon10"
                          horizontalAlign="center"
                          icon="line/interface-search"
                          marginType="normal"
                          style={{
                            ordered: [{ color: "rgba(13, 13, 13, 0.75)" }],
                          }}
                        />
                      </View>
                      <Event
                        event="click"
                        method="run"
                        params={{
                          ordered: [
                            {
                              src: "tabbedContainer2.setCurrentViewIndex(1);\ntextInput1.setValue(item.card.card.text);\nauto_suggestions.setValue(null);\nfetch_search_results.trigger();",
                            },
                          ],
                        }}
                        pluginId=""
                        type="script"
                        waitMs="0"
                        waitType="debounce"
                      />
                    </Container>
                    <Divider
                      id="divider49"
                      hidden="{{ auto_suggestions.value?.suggestions?.[ri[0]]?.nestedSuggestions?.length - 1 === i}}"
                      marginType="normal"
                      textSize="default"
                    />
                  </ListViewBeta>
                  <Divider
                    id="divider48"
                    hidden="{{ auto_suggestions.value.suggestions.length - 1 === i}}"
                    marginType="normal"
                    textSize="default"
                  />
                </View>
              </Container>
            </View>
          </Container>
        </ListViewBeta>
        <Include src="./container54.rsx" />
        <Container
          id="container50"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          hidden="true"
          margin="0"
          marginType="none"
          padding="0"
          showBody={true}
          showBorder={false}
        >
          <Header>
            <Text
              id="containerTitle54"
              marginType="normal"
              value="#### Container title"
              verticalAlign="center"
            />
          </Header>
          <View id="b5c31" viewKey="View 1">
            <Container
              id="container51"
              footerPadding="4px 12px"
              headerPadding="4px 12px"
              marginType="normal"
              padding="0"
              showBody={true}
              showBorder={false}
            >
              <Header>
                <Text
                  id="containerTitle53"
                  marginType="normal"
                  value="#### Container title"
                  verticalAlign="center"
                />
              </Header>
              <View id="b5c31" viewKey="View 1">
                <Spacer id="spacer14" marginType="normal" />
                <Include src="./container52.rsx" />
              </View>
            </Container>
          </View>
          <Event
            event="click"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="fetch_auto_suggestions"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Container>
      </View>
    </Container>
    <Include src="./container48.rsx" />
  </View>
  <View id="862b5" viewKey="View 2">
    <Container
      id="container46"
      disabled="{{fetch_search_results.isFetching || ((get_cart_search.isFetching || add_to_cart_search.isFetching) && modalFrame2.hidden)}}"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      loading="{{fetch_search_results.isFetching || ((get_cart_search.isFetching || add_to_cart_search.isFetching) && modalFrame2.hidden)}}"
      marginType="normal"
      padding="0"
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text
          id="containerTitle48"
          marginType="normal"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="b5c31" viewKey="View 1">
        <Text
          id="text88"
          hidden="{{ search_results.value.length !== 0 || fetch_search_results.isFetching }}"
          style={{ fontSize: "14px", fontWeight: "400", fontFamily: "Gilroy" }}
          value="Sorry, we couldn't find any results for {{ textInput1.value }} !"
          verticalAlign="center"
        />
        <ListViewBeta
          id="gridView1"
          data="{{ search_results.value }}"
          enableInstanceValues={true}
          heightType="auto"
          itemWidth="200px"
          layoutType="grid"
          margin="0"
          marginType="none"
          numColumns="5"
          padding="0"
        >
          <Include src="./container47.rsx" />
        </ListViewBeta>
      </View>
    </Container>
    <Button
      id="button25"
      disabled="{{fetch_search_results.isFetching}}"
      hidden="{{!fetch_search_results.data?.success?.pageOffset}}"
      iconAfter={'{{  "/icon:line/interface-arrows-down-circle-2"  }}'}
      loading=""
      marginType="normal"
      style={{
        ordered: [
          { border: "rgba(255, 255, 255, 0)" },
          { hoverBackground: "rgba(13, 13, 13, 0)" },
          { label: "rgb(254, 80, 5)" },
          { activeBackground: "rgba(255, 219, 204, 0)" },
        ],
      }}
      styleVariant="outline"
      text="Show More"
    >
      <Event
        event="click"
        method="setValue"
        params={{
          ordered: [
            {
              value:
                "{{ fetch_search_results.data?.success?.pageOffset?.nextOffset }}",
            },
          ],
        }}
        pluginId="search_result_current_offset_number"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{
          map: {
            value:
              '{{ fetch_search_results.data?.success?.searchResultsOffset || "0"}}',
          },
        }}
        pluginId="search_results_offset"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{}}
        pluginId="fetch_search_results"
        type="datasource"
        waitMs="300"
        waitType="debounce"
      />
      <Event
        event="click"
        method="run"
        params={{
          map: {
            src: '// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "show-more-results",\n  object_value: {search_term: textInput1.value}\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
