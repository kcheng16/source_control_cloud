<Screen
  id="SoilProjectList"
  _order={1}
  events={[
    {
      method: "trigger",
      params: { map: { options: { map: { additionalScope: {} } } } },
      targetId: null,
      pluginId: "onPageLoad_SoilProjects",
      waitType: "debounce",
      event: "refresh",
      type: "datasource",
      id: "7ac4de39",
      waitMs: "0",
    },
  ]}
  headerRightActions={[
    {
      type: "icon",
      value: "line/interface-arrows-synchronize",
      event: {
        id: "b4e15cf4",
        event: "click",
        method: "trigger",
        pluginId: "onPageLoad_SoilProjects",
        type: "datasource",
        waitMs: 0,
        waitType: "debounce",
      },
    },
  ]}
  refreshing="{{ onPageLoad_SoilProjects.isFetching }}"
  title="Soil Projects"
  uuid="b2e475ab-5642-4016-a3e8-14cf2d349792"
>
  <JavascriptQuery
    id="onPageLoad_SoilProjects"
    notificationDuration={4.5}
    query={include("../lib/onPageLoad_SoilProjects.js", "string")}
    resourceName="JavascriptQuery"
    runWhenPageLoads={true}
    showSuccessToaster={false}
  />
  <SqlTransformQuery
    id="get_display_data"
    isMultiplayerEdited={false}
    query={include("../lib/get_display_data.sql", "string")}
    resourceName="SQL Transforms"
    runWhenModelUpdates={false}
  />
  <JavascriptQuery
    id="rowProject_OnClick"
    _additionalScope={["selectedRow"]}
    query={include("../lib/rowProject_OnClick.js", "string")}
    resourceName="JavascriptQuery"
    transformer=""
  />
  <TextArea
    id="txtSearchProjects"
    autoCorrect={true}
    iconBefore="bold/interface-search"
    label={null}
    minLines={1}
    placeholder="Search..."
  >
    <Event
      id="3dcb5ee4"
      event="change"
      method="trigger"
      params={{}}
      pluginId="get_display_data"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </TextArea>
  <CollectionView
    id="listProjects"
    bodyByIndex="{{ item.caption }}"
    cardStyle="elevated"
    data="{{ get_display_data.data }}"
    prefixIconByIndex="bold/interface-user-single"
    prefixIconColorByIndex=""
    prefixImageFitByIndex="cover"
    prefixImageShapeByIndex="square"
    prefixImageSizeByIndex="1 to 1"
    prefixImageSourceByIndex=""
    prefixTypeByIndex="icon"
    showSeparator={true}
    subtitleByIndex="{{ item.body }}"
    subtitleLengthByIndex="2"
    suffixIconByIndex="bold/interface-arrows-button-right"
    suffixTextByIndex="Button"
    suffixTypeByIndex="none"
    suffixValueByIndex="false"
    titleByIndex="{{ item.title }}"
  >
    <Event
      id="6cb9a637"
      event="press"
      method="trigger"
      params={{
        map: {
          options: {
            map: { additionalScope: { map: { selectedRow: "{{ item }}" } } },
          },
        },
      }}
      pluginId="rowProject_OnClick"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </CollectionView>
  <Text
    id="text3"
    markdown={true}
    size="medium"
    value="👋 Hello {{ current_user.firstName || 'friend' }}!"
    weight="normal"
  />
  <Button id="button2" size="large" text="Button" />
</Screen>
