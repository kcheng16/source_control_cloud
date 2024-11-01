<GlobalFunctions>
  <SqlQueryUnified
    id="GetCostData"
    notificationDuration={4.5}
    query={include("./lib/GetCostData.sql", "string")}
    resourceDisplayName="analytics_sf_ondeck_prod"
    resourceName="8b1544c4-ed2e-401b-994b-e009c15857a8"
    resourceTypeOverride=""
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="query2"
    actionType="BULK_UPSERT_BY_KEY"
    bulkUpdatePrimaryKey="FILE_DATE"
    editorMode="gui"
    notificationDuration={4.5}
    records="{{ table1.changesetArray }}"
    resourceDisplayName="analytics_sf_ondeck_prod"
    resourceName="8b1544c4-ed2e-401b-994b-e009c15857a8"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    tableName="ODK_DIRECT_MAIL.DM_SCHEDULE_AND_COSTS"
    updateSetValueDynamically={true}
  >
    <Event
      event="success"
      method="trigger"
      params={{
        ordered: [
          {
            options: {
              ordered: [
                { onSuccess: null },
                { onFailure: null },
                { additionalScope: null },
              ],
            },
          },
        ],
      }}
      pluginId="GetCostData"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </SqlQueryUnified>
</GlobalFunctions>
