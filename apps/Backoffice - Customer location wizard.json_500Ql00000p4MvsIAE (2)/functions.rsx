<GlobalFunctions>
  <Folder id="Permissions">
    <State
      id="servicesPermissions"
      value="{{ getCurrentUserQuery?.data?.permissions?.Services}}"
    />
    <State
      id="configurationsPermissions"
      value="{{ getCurrentUserQuery?.data?.permissions?.Configurations}}"
    />
    <State
      id="customersPermissions"
      value="{{ getCurrentUserQuery?.data?.permissions?.Customers}}"
    />
    <State
      id="partnersPermissions"
      value="{{ getCurrentUserQuery?.data?.permissions?.Partners }}"
    />
    <State
      id="ordersPermissions"
      value="{{ getCurrentUserQuery?.data?.permissions?.Orders }}"
    />
    <State
      id="compliancePermissions"
      value="{{ getCurrentUserQuery?.data?.permissions?.Compliance }}"
    />
    <State
      id="reportingPermissions"
      value="{{ getCurrentUserQuery?.data?.permissions?.Reporting }}"
    />
    <State
      id="usersPermissions"
      value="{{ getCurrentUserQuery?.data?.permissions?.Users }}"
    />
    <State
      id="salePermissions"
      value="{{ getCurrentUserQuery?.data?.permissions?.Sale }}"
    />
    <State
      id="invoicesPermissions"
      value="{{ getCurrentUserQuery?.data?.permissions?.Invoices }}"
    />
  </Folder>
  <SqlQueryUnified
    id="getConfigurationStatusesQuery"
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/getConfigurationStatusesQuery.sql", "string")}
    resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
    showFailureToaster={false}
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    transformer="return formatDataAsArray(data);"
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="getCurrentUserQuery"
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/getCurrentUserQuery.sql", "string")}
    resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    transformer="const [user] = formatDataAsArray(data);
return user;"
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <JavascriptQuery
    id="setLocaleOnLoad"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/setLocaleOnLoad.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <JavascriptQuery
    id="onAppLoad"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/onAppLoad.js", "string")}
    resourceName="JavascriptQuery"
    runWhenPageLoads={true}
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <State id="variable20" />
</GlobalFunctions>
