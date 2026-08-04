<Screen
  id="SamplingRoundList"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={1}
  _searchParams={[]}
  browserTitle={null}
  events={[
    {
      method: "trigger",
      params: {
        map: {
          options: {
            object: { onSuccess: null, onFailure: null, additionalScope: null },
          },
        },
      },
      targetId: null,
      pluginId: "onPageLoad_ProjectView",
      waitType: "debounce",
      event: "refresh",
      type: "datasource",
      id: "b433ae44",
      waitMs: "0",
    },
  ]}
  headerRightActions={[
    {
      type: "icon",
      value: "line/interface-arrows-synchronize",
      event: {
        id: "f2603729",
        event: "click",
        method: "trigger",
        pluginId: "onPageLoad_ProjectView",
        type: "datasource",
        waitMs: 0,
        waitType: "debounce",
      },
    },
  ]}
  refreshing="{{ onPageLoad_ProjectView.isFetching }}"
  title="Sampling Round"
  urlSlug={null}
  uuid="d72d7c84-c2b6-426d-a691-96b3dfeb0d9d"
>
  <JavascriptQuery
    id="onPageLoad_ProjectView"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/onPageLoad_ProjectView.js", "string")}
    resourceName="JavascriptQuery"
    runWhenPageLoads={true}
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="rowRound_OnClick"
    _additionalScope={["selectedRound"]}
    isMultiplayerEdited={false}
    query={include("../lib/rowRound_OnClick.js", "string")}
    resourceName="JavascriptQuery"
    transformer=""
  />
  <JavascriptQuery
    id="btnAddYearlySampling_OnClick"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/btnAddYearlySampling_OnClick.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <SqlTransformQuery
    id="sampling_round_display"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/sampling_round_display.sql", "string")}
    resourceName="SQL Transforms"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
  />
  <SqlTransformQuery
    id="sampling_round_display_backup"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/sampling_round_display_backup.sql", "string")}
    resourceName="SQL Transforms"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
  />
  <Heading
    id="lblProjectName"
    size="h1"
    style={{}}
    value="{{ varSelectedProject.value.project_name }}"
  />
  <Divider id="divider1" spacing={4} />
  <KeyValue
    id="kvProjects"
    _rowKeysFormatted={{
      project_state: "State",
      erf_id: "ERF ID",
      project_manager: "Project manager",
      project_status: "Project Status",
    }}
    allowTextWrapping={true}
    data="{{ _.pick(varSelectedProject.value, ['project_state', 'project_status', 'erf_id', 'project_manager']) }}"
    rows={[
      "a",
      "b",
      "c",
      "title",
      "body",
      "project_state",
      "caption",
      "project_id",
      "erf_id",
      "project_manager",
      "project_status",
      "project_name",
    ]}
    rowVisibility={{
      project_id: true,
      a: true,
      erf_id: true,
      b: true,
      body: true,
      c: true,
      caption: true,
      project_manager: true,
      project_state: true,
      project_name: true,
      title: true,
      project_status: true,
    }}
    valueHorizontalAlignment="right"
    valueWidth="50%"
  />
  <Divider id="divider2" spacing={4} />
  <TabbedContainer
    id="tabSamplingRound"
    _hasMigratedNestedItems={true}
    _hiddenByIndex={["", ""]}
    _ids={["00031", "00030"]}
    _labels={["Yearly Sampling", "Official Sampling"]}
    _viewKeys={["YEARLY", "OFFICIAL"]}
    currentViewKey="{{ self.viewKeys[0] }}"
  >
    <CollectionView
      id="listCollection2"
      bodyByIndex="{{ item.caption }}"
      cardStyle="elevated"
      data="{{ sampling_round_display.data }}"
      prefixIconByIndex="bold/interface-user-single"
      prefixIconColorByIndex=""
      prefixImageFitByIndex="cover"
      prefixImageShapeByIndex="square"
      prefixImageSizeByIndex="1 to 1"
      prefixImageSourceByIndex=""
      prefixTypeByIndex="none"
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
        id="e76e796f"
        event="press"
        method="setValue"
        params={{ map: { value: "{{ item }}" } }}
        pluginId="varSelectedSamplingRound"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        id="353b9609"
        event="press"
        method="navigateTo"
        params={{ map: { screenPluginId: "SamplingRoundAddEdit" } }}
        pluginId=""
        type="navigator"
        waitMs="0"
        waitType="debounce"
      />
    </CollectionView>
    <CollectionView
      id="lstOfficialSampling"
      bodyByIndex=""
      cardStyle="elevated"
      data="{{ sampling_round_display.data.filter((x) => x.sampling_type == 'type_official').sort((a, b) => a.reporting_period - b.reporting_period) }}"
      prefixIconByIndex={
        '{{ item.pending_update ? "/icon:bold/interface-time-clock-circle" : null }}'
      }
      prefixIconColorByIndex="grey"
      prefixImageFitByIndex="cover"
      prefixImageShapeByIndex="square"
      prefixImageSizeByIndex="1 to 1"
      prefixImageSourceByIndex=""
      prefixTypeByIndex="icon"
      showSeparator={true}
      subtitleByIndex="{{ item.caption }}"
      subtitleLengthByIndex="2"
      suffixIconByIndex="bold/interface-arrows-button-right"
      suffixTextByIndex="Button"
      suffixTypeByIndex="none"
      suffixValueByIndex="false"
      titleByIndex="{{ item.round_name == 'T0' ? 'Base Round' : `Round ${item.round_name}` }}"
    >
      <Event
        id="410c2db1"
        event="press"
        method="trigger"
        params={{
          map: {
            options: {
              map: { additionalScope: { map: { selectedRound: "{{ item}}" } } },
            },
          },
        }}
        pluginId="rowRound_OnClick"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </CollectionView>
    <CollectionView
      id="lstYearlySampling"
      bodyByIndex=""
      cardStyle="elevated"
      data="{{ sampling_round_display.data.filter((x) => x.sampling_type == 'type_yearly').sort((a, b) => a.year - b.year) }}"
      prefixIconByIndex={
        '{{ item.pending_update ? "/icon:bold/interface-time-clock-circle" : null }}'
      }
      prefixIconColorByIndex="grey"
      prefixImageFitByIndex="cover"
      prefixImageShapeByIndex="square"
      prefixImageSizeByIndex="1 to 1"
      prefixImageSourceByIndex=""
      prefixTypeByIndex="icon"
      showSeparator={true}
      subtitleByIndex="{{ item.caption }}"
      subtitleLengthByIndex="2"
      suffixIconByIndex="bold/interface-arrows-button-right"
      suffixTextByIndex="Button"
      suffixTypeByIndex="none"
      suffixValueByIndex="false"
      titleByIndex="Year {{ item.year }}"
    >
      <Event
        id="73e7647f"
        event="press"
        method="trigger"
        params={{
          map: {
            options: {
              map: {
                additionalScope: { map: { selectedRound: "{{ item }}" } },
              },
            },
          },
        }}
        pluginId="rowRound_OnClick"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </CollectionView>
    <Fab id="btnAdd_YearlySampling" hidden="" icon="bold/interface-add-1">
      <Event
        id="493eefd9"
        event="click"
        method="trigger"
        params={{}}
        pluginId="btnAddYearlySampling_OnClick"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Fab>
  </TabbedContainer>
</Screen>
