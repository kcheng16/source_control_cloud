<GlobalFunctions>
  <Folder id="Queries_Read">
    <SqlQueryUnified
      id="get_soil_round_and_project_data"
      enableTransformer={true}
      isMultiplayerEdited={false}
      offlineQueryType="Read"
      query={include("./lib/get_soil_round_and_project_data.sql", "string")}
      resourceDisplayName="Production GIS1 (read)"
      resourceName="adcb7d1c-1c93-44a2-8ac6-e40770f3d49c"
      runWhenModelUpdates={false}
      transformer="return _tool.formatDataAsArray(data);"
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_soil_sampling_data"
      enableTransformer={true}
      offlineQueryType="Read"
      query={include("./lib/get_soil_sampling_data.sql", "string")}
      resourceDisplayName="Production GIS1 (read)"
      resourceName="adcb7d1c-1c93-44a2-8ac6-e40770f3d49c"
      runWhenModelUpdates={false}
      transformer="return _tool.formatDataAsArray(data);"
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_soil_sampling_yearly_result"
      enableTransformer={true}
      notificationDuration={4.5}
      offlineQueryType="Read"
      query={include("./lib/get_soil_sampling_yearly_result.sql", "string")}
      resourceDisplayName="Production GIS1 (read)"
      resourceName="adcb7d1c-1c93-44a2-8ac6-e40770f3d49c"
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      transformer="return _tool.formatDataAsArray(data);"
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_my_info"
      enableTransformer={true}
      offlineQueryType="Read"
      query={include("./lib/get_my_info.sql", "string")}
      resourceDisplayName="Production GIS1 (read)"
      resourceName="adcb7d1c-1c93-44a2-8ac6-e40770f3d49c"
      runWhenModelUpdates={false}
      transformer="return _tool.formatDataAsArray(data)[0];"
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_staffs"
      enableTransformer={true}
      isMultiplayerEdited={false}
      offlineQueryType="Read"
      query={include("./lib/get_staffs.sql", "string")}
      resourceDisplayName="Production GIS1 (read)"
      resourceName="adcb7d1c-1c93-44a2-8ac6-e40770f3d49c"
      runWhenModelUpdates={false}
      transformer="return _tool.formatDataAsArray(data);"
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="get_list_options"
      enableTransformer={true}
      offlineQueryType="Read"
      query={include("./lib/get_list_options.sql", "string")}
      resourceDisplayName="Production GIS1 (read)"
      resourceName="adcb7d1c-1c93-44a2-8ac6-e40770f3d49c"
      transformer="return _tool.formatDataAsArray(data);"
      warningCodes={[]}
    />
  </Folder>
  <Folder id="Variables_SelectedObject">
    <State id="varSelectedProject" value="" />
    <State id="varSelectedSamplingRound" />
    <State id="varSelectedSamplingSite" />
    <State id="varSelectedSamplingSiteResult" />
  </Folder>
  <Folder id="Classes">
    <JavascriptQuery
      id="ClassTemplate"
      isMultiplayerEdited={false}
      query={include("./lib/ClassTemplate.js", "string")}
      resourceName="JavascriptQuery"
    />
    <SqlQueryUnified
      id="call_process_dynamic_procedure_call"
      _additionalScope={["procedureName", "parameters"]}
      enableTransformer={true}
      query={include("./lib/call_process_dynamic_procedure_call.sql", "string")}
      resourceDisplayName="Production GIS1 (write)"
      resourceName="e8259c5e-8b7a-4dc9-a773-9fba0fd5d873"
      runWhenModelUpdates={false}
      transformer="return _tool.formatDataAsArray(data)[0].p_result;"
      warningCodes={[]}
    />
    <JavascriptQuery
      id="PendingJobClass"
      _additionalScope={["methodToCall", "jsonParameters"]}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/PendingJobClass.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="JobQueueClass"
      _additionalScope={["methodToCall", "jsonParameter"]}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/JobQueueClass.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="Soil_sampling_round_upserts">
    <SqlQueryUnified
      id="upsert_soil_sampling_round"
      query={include("./lib/upsert_soil_sampling_round.sql", "string")}
      resourceDisplayName="Production GIS1 (write)"
      resourceName="e8259c5e-8b7a-4dc9-a773-9fba0fd5d873"
      runWhenModelUpdates={false}
      warningCodes={[]}
    />
    <Function
      id="trnSamplingRoundData"
      funcBody={include("./lib/trnSamplingRoundData.js", "string")}
    />
    <JavascriptQuery
      id="saveSamplingRoundData"
      _additionalScope={["offline_job_id"]}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/saveSamplingRoundData.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <Function
      id="trnIsValid_SamplingRound"
      funcBody={include("./lib/trnIsValid_SamplingRound.js", "string")}
    />
    <SqlQueryUnified
      id="upsert_soil_sampling_round2"
      query={include("./lib/upsert_soil_sampling_round2.sql", "string")}
      resourceDisplayName="Production GIS1 (write)"
      resourceName="e8259c5e-8b7a-4dc9-a773-9fba0fd5d873"
      runWhenModelUpdates={false}
      warningCodes={[]}
    />
  </Folder>
  <Folder id="Soil_sampling_round_get_data">
    <State id="varTempSoilRoundData" />
    <JavascriptQuery
      id="setSelectedSoilSamplingRound"
      query={include("./lib/setSelectedSoilSamplingRound.js", "string")}
      resourceName="JavascriptQuery"
    />
    <SqlTransformQuery
      id="get_selected_soil_round_data"
      enableTransformer={true}
      isMultiplayerEdited={false}
      query={include("./lib/get_selected_soil_round_data.sql", "string")}
      resourceName="SQL Transforms"
      transformer="return data[0];"
    />
    <SqlTransformQuery
      id="get_selected_soil_round_data_backup"
      enableTransformer={true}
      isMultiplayerEdited={false}
      query={include("./lib/get_selected_soil_round_data_backup.sql", "string")}
      resourceName="SQL Transforms"
      transformer="return data[0];"
    />
  </Folder>
  <Folder id="Sampling_site">
    <Function
      id="trnSiteData"
      funcBody={include("./lib/trnSiteData.js", "string")}
    />
    <SqlQueryUnified
      id="upsert_soil_sampling"
      isMultiplayerEdited={false}
      offlineQueryType="Write"
      offlineUserQueryInputs={'[{"key":"Test 1","value":"Testing"}]'}
      query={include("./lib/upsert_soil_sampling.sql", "string")}
      resourceDisplayName="Production GIS1 (write)"
      resourceName="e8259c5e-8b7a-4dc9-a773-9fba0fd5d873"
      runWhenModelUpdates={false}
      transformer=""
      warningCodes={[]}
    />
    <JavascriptQuery
      id="saveSamplingSite"
      _additionalScope={["samplingRoundOfflineJobId"]}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/saveSamplingSite.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <Function
      id="trnIsValid_SamplingSite"
      funcBody={include("./lib/trnIsValid_SamplingSite.js", "string")}
    />
  </Folder>
  <JavascriptQuery
    id="retrieveLatestData"
    notificationDuration={4.5}
    query={include("./lib/retrieveLatestData.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="clearQueue"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/clearQueue.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
</GlobalFunctions>
