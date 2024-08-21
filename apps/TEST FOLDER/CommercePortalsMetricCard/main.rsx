<App>
  <GlobalWidgetProp
    id="label"
    defaultValue="New students"
    value="New students"
  />
  <GlobalWidgetProp id="metric" defaultValue="213" value="23" />
  <GlobalWidgetProp
    id="isTrendNegative"
    allowedGroupIds={[]}
    allowedGroups={[]}
    cacheKeyTtl=""
    changeset=""
    changesetIsObject={false}
    changesetObject=""
    confirmationMessage={null}
    data={null}
    defaultValue="{{false}}"
    description="true || false"
    enableCaching={false}
    enableErrorTransformer={false}
    enableTransformer={false}
    error={null}
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    events={[]}
    finished={null}
    importedQueryDefaults={{ ordered: [] }}
    importedQueryInputs={{ ordered: [] }}
    isFetching={false}
    isImported={false}
    lastReceivedFromResourceAt={null}
    metadata={null}
    notificationDuration=""
    offlineQueryType="None"
    offlineUserQueryInputs=""
    overrideOrgCacheForUserCache={false}
    playgroundQueryId={null}
    playgroundQuerySaveId="latest"
    playgroundQueryUuid=""
    privateParams={[]}
    query=""
    queryDisabled=""
    queryDisabledMessage=""
    queryFailureConditions=""
    queryRefreshTime=""
    queryRunTime={null}
    queryThrottleTime="750"
    queryTimeout="10000"
    queryTriggerDelay="0"
    rawData={null}
    requestSentTimestamp={null}
    requireConfirmation={false}
    resourceNameOverride=""
    resourceTypeOverride={null}
    runWhenModelUpdates={false}
    runWhenPageLoads={false}
    runWhenPageLoadsDelay=""
    servedFromCache={false}
    showFailureToaster={true}
    showLatestVersionUpdatedWarning={false}
    showSuccessToaster={true}
    showUpdateSetValueDynamicallyToggle={true}
    streamResponse={false}
    successMessage=""
    timestamp={0}
    transformer="// Query results are available as the `data` variable
return data"
    updateSetValueDynamically={false}
    watchedParams={[]}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowId={null}
    workflowParams={null}
    workflowRunBodyType="raw"
    workflowRunId={null}
  />
  <GlobalWidgetProp
    id="trendValue"
    defaultValue="110"
    description="string"
    value="$9.99"
  />
  <GlobalWidgetProp
    id="trendVariant"
    defaultValue="'neutral'"
    description="'positive' | 'negative' | 'neutral'"
    value="positive"
  />
  <GlobalWidgetProp id="tooltip" value="Test" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <ModuleContainerWidget
      id="moduleContainer"
      alteration="$9.99"
      backgroundColor="white"
      isGlobalWidgetContainer={true}
      isNegative="false"
      label="New students"
      metric="23"
      tooltip="Test"
      trendVariant="positive"
    >
      <Include src="./src/container1.rsx" />
    </ModuleContainerWidget>
  </Frame>
</App>
