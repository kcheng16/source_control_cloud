<GlobalFunctions>
  <RESTQuery
    id="getInterstitialsPage"
    isMultiplayerEdited={false}
    query="/games/{{Common.CurrentSpace.game_id}}/kinds/interstitial/content?count={{interstitialPageCount.value}}&{{interstitialsTable.pagination.afterCursor ? 'cursor' : null}}={{interstitialsTable.pagination.afterCursor}}&{{interstitialsStateTabs.value ? 'state' : null}}={{interstitialsStateTabs.value}}&{{searchInput.value ? 'search' : null}}={{searchInput.value}}"
    resourceName="0f64fc88-3a95-4f46-9551-1730f4795eb4"
    resourceTypeOverride=""
    transformer="// Query results are available as the `data` variable
const newData = {
  ...data  
}

newData.content = newData.content.map(item => ({
  ...item,
  config: {
    schemaName: 'interstitial-test-schema',
    schemaVersion: 1,
    key: 'interstitial-test-config',
    hash: '1de6f7ff60bb47dc13bdda232b9ddfeea915c0f8'
  }
}))

return newData"
    version={1}
    workflowBlockPluginId={null}
  >
    <Event
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getConfigs"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <State id="interstitialPageCount" value="15" />
  <Function
    id="nextCursor"
    funcBody={include("./lib/nextCursor.js", "string")}
  />
  <RESTQuery
    id="postConfig"
    body={
      '[{"key":"key","value":"{{configKey}}"},{"key":"data","value":"{{configData}}"},{"key":"tags","value":"[\'cen-assets\', \'cen-interstitial\']"}]'
    }
    bodyType="json"
    isMultiplayerEdited={false}
    query="games/{{Common.CurrentSpace.game_id}}/schemas/cen-interstitial/versions/1/keys"
    resourceName="89a5cb74-5cda-4453-bee3-1ad554d9fa0b"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="POST"
    version={1}
    workflowBlockPluginId={null}
  />
  <RESTQuery
    id="getConfigHash"
    query="games/{{Common.CurrentSpace.game_id}}/schemas/cen-interstitial/versions/1/keys/{{configKey}}/hashes/{{configHash}}"
    resourceName="89a5cb74-5cda-4453-bee3-1ad554d9fa0b"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    version={1}
    workflowBlockPluginId={null}
  />
  <JavascriptQuery
    id="getConfigs"
    isMultiplayerEdited={false}
    query={include("./lib/getConfigs.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowBlockPluginId={null}
  />
  <Function
    id="renderedInterstitials"
    funcBody={include("./lib/renderedInterstitials.js", "string")}
  />
  <RESTQuery
    id="putInterstitial"
    body={
      '[{"key":"editorId","value":"{{current_user.fullName}}"},{"key":"content","value":"{{interstitialContent}}"}]'
    }
    bodyType="json"
    isMultiplayerEdited={false}
    query="games/{{Common.CurrentSpace.game_id}}/kinds/interstitial/content/{{interstitialName}}"
    resourceName="0f64fc88-3a95-4f46-9551-1730f4795eb4"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="PUT"
    version={1}
    workflowBlockPluginId={null}
  />
  <State id="errorMessage" />
  <RESTQuery
    id="patchInterstitial"
    body={
      '[{"key":"editorId","value":"{{current_user.fullName}}"},{"key":"content","value":"{{interstitialContent}}"}]'
    }
    bodyType="json"
    isMultiplayerEdited={false}
    query="games/{{Common.CurrentSpace.game_id}}/kinds/interstitial/content/{{interstitialName}}"
    resourceName="0f64fc88-3a95-4f46-9551-1730f4795eb4"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="PATCH"
    version={1}
    workflowBlockPluginId={null}
  />
  <JavascriptQuery
    id="updateInterstitialState"
    _additionalScope={["newState"]}
    isMultiplayerEdited={false}
    query={include("./lib/updateInterstitialState.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowBlockPluginId={null}
  />
  <State id="selectedInterstitialName" />
  <Function
    id="selectedInterstitial"
    funcBody={include("./lib/selectedInterstitial.js", "string")}
  />
  <JavascriptQuery
    id="toggleInterstitialPause"
    isMultiplayerEdited={false}
    query={include("./lib/toggleInterstitialPause.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowBlockPluginId={null}
  />
  <State
    id="statusMap"
    value="{
  draft: {
    label: 'Draft',
    color: '#DBDBDB'
  },
  test: {
    label: 'Testing',
    color: '#F6EED2'
  },
  scheduled: {
    label: 'Scheduled',
    color: '#D2EAF6'
  },
  live: {
    label: 'Live',
    color: '#D7EAE0'
  },
  paused: {
    label: 'Paused',
    color: '#F8DBD8'
  },
  ended: {
    label: 'Ended',
    color: '#E4DCF5'
  },
  archive: {
    label: 'Archived',
    color: '#838383'
  }
}"
  />
  <JavascriptQuery
    id="endInterstitial"
    isMultiplayerEdited={false}
    query={include("./lib/endInterstitial.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowBlockPluginId={null}
  />
  <RESTQuery
    id="postImage"
    body={'[{"key":"file","value":"{{ imageData }}","operation":"binary"}]'}
    bodyType="form-data"
    isMultiplayerEdited={false}
    query="images"
    resourceName="93d3d58b-916f-44ef-99a0-0eb25f606008"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    type="POST"
    version={1}
    workflowBlockPluginId={null}
  />
  <JavascriptQuery
    id="uploadImages"
    _additionalScope={["imageFileMap"]}
    query={include("./lib/uploadImages.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowBlockPluginId={null}
  />
  <RESTQuery
    id="getInterstitial"
    isMultiplayerEdited={false}
    query="/games/{{Common.CurrentSpace.game_id}}/kinds/interstitial/content/{{interstitialName}}"
    resourceName="0f64fc88-3a95-4f46-9551-1730f4795eb4"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="// Query results are available as the `data` variable
const newData = {
  ...data  
}

newData.content = newData.content.map(item => ({
  ...item,
  config: {
    schemaName: 'interstitial-test-schema',
    schemaVersion: 1,
    key: 'interstitial-test-config',
    hash: '1de6f7ff60bb47dc13bdda232b9ddfeea915c0f8'
  }
}))

return newData"
    version={1}
    workflowBlockPluginId={null}
  />
  <JavascriptQuery
    id="getSelectedInterstitial"
    isMultiplayerEdited={false}
    query={include("./lib/getSelectedInterstitial.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowBlockPluginId={null}
  />
  <JavascriptQuery
    id="updateViewers"
    isMultiplayerEdited={false}
    query={include("./lib/updateViewers.js", "string")}
    resourceName="JavascriptQuery"
    workflowBlockPluginId={null}
  />
  <JavascriptQuery
    id="hideCreateDrawerFrame"
    query={include("./lib/hideCreateDrawerFrame.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowBlockPluginId={null}
  />
  <JavascriptQuery
    id="setSelectedInterstitialName"
    _additionalScope={["interstitialName"]}
    query={include("./lib/setSelectedInterstitialName.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowBlockPluginId={null}
  />
  <JavascriptQuery
    id="showViewDrawerFrame"
    query={include("./lib/showViewDrawerFrame.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowBlockPluginId={null}
  />
  <JavascriptQuery
    id="submitCreateForm"
    query={include("./lib/submitCreateForm.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowBlockPluginId={null}
  />
  <JavascriptQuery
    id="setErrorMessage"
    query={include("./lib/setErrorMessage.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowBlockPluginId={null}
  />
  <JavascriptQuery
    id="submitUpdateForm"
    query={include("./lib/submitUpdateForm.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
    workflowBlockPluginId={null}
  />
</GlobalFunctions>
