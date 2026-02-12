<Screen
  id="clientLocationWizard"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={4}
  _searchParams={[]}
  browserTitle={null}
  title={null}
  urlSlug="addClientLocation"
  uuid="f1cf48e5-4e39-4a81-9d58-b06cd9c5b648"
>
  <Folder id="InvoiceAddress">
    <SqlQueryUnified
      id="updateClientLocationInvoiceAddressQuery"
      _additionalScope={["clientLocationId", "invoiceAddressId"]}
      enableTransformer={true}
      notificationDuration={4.5}
      query={include(
        "../lib/updateClientLocationInvoiceAddressQuery.sql",
        "string"
      )}
      resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      transformer="return formatDataAsArray(data)[0];"
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <JavascriptQuery
      id="handleAddInvoiceAddress"
      notificationDuration={4.5}
      query={include("../lib/handleAddInvoiceAddress.js", "string")}
      resourceName="JavascriptQuery"
      showFailureToaster={false}
      showSuccessToaster={false}
    />
    <State
      id="invoiceAddressDraft"
      value="{
  street: {{ loadClientLocationData?.data?.invoiceAddressStreet }},
  zipcode: {{ loadClientLocationData?.data?.invoiceAddressZipCode }},
  city: {{ loadClientLocationData?.data?.invoiceAddressCity }},
  countryId: {{ loadClientLocationData?.data?.invoiceAddressCountryId }},
  number: {{ loadClientLocationData?.data?.invoiceAddressHouseNumber }},
  addition: {{ loadClientLocationData?.data?.invoiceAddressAddition }},
  country: {{ loadClientLocationData?.data?.invoiceAddressCountry }},
}"
    />
  </Folder>
  <Folder id="PickupAddress">
    <SqlQueryUnified
      id="updateClientLocationPickupAddressQuery"
      _additionalScope={["clientLocationId", "pickupAddressId"]}
      enableTransformer={true}
      notificationDuration={4.5}
      query={include(
        "../lib/updateClientLocationPickupAddressQuery.sql",
        "string"
      )}
      resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      transformer="return formatDataAsArray(data)[0];"
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <JavascriptQuery
      id="handleAddPickupAddress"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/handleAddPickupAddress.js", "string")}
      resourceName="JavascriptQuery"
      showFailureToaster={false}
      showSuccessToaster={false}
    />
    <State
      id="pickupAddressDraft"
      value="{
  street: {{ loadClientLocationData?.data?.pickupAddressStreet }},
  zipcode: {{ loadClientLocationData?.data?.pickupAddressZipCode }},
  city: {{ loadClientLocationData?.data?.pickupAddressCity }},
  countryId: {{ loadClientLocationData?.data?.pickupAddressCountryId }},
  number: {{ loadClientLocationData?.data?.pickupAddressHouseNumber }},
  addition: {{ loadClientLocationData?.data?.pickupAddressAddition }},
  country: {{ loadClientLocationData?.data?.pickupAddressCountry }},
}"
    />
  </Folder>
  <Folder id="ContactPerson">
    <JavascriptQuery
      id="handleAddContactPerson2"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/handleAddContactPerson2.js", "string")}
      resourceName="JavascriptQuery"
      showFailureToaster={false}
      showSuccessToaster={false}
    />
    <SqlQueryUnified
      id="getContactPersonFunctionByDepartmentQuery4"
      _additionalScope={["departmentId"]}
      enableTransformer={true}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include(
        "../lib/getContactPersonFunctionByDepartmentQuery4.sql",
        "string"
      )}
      resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      transformer="return formatDataAsArray(data);"
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <State
      id="contactPersonStatuses3"
      value="{{ getConfigurationStatusesQuery.data.filter((item) => ['Active', 'Inactive', 'Concept'].includes(item.configurationStatusName)) }}"
    />
    <SqlQueryUnified
      id="getDepartmentQuery5"
      enableTransformer={true}
      notificationDuration={4.5}
      query={include("../lib/getDepartmentQuery5.sql", "string")}
      resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      transformer="return formatDataAsArray(data);"
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <State id="contactPersonsDraft1" value="[]" />
    <SqlQueryUnified
      id="insertContactPersonQuery4"
      _additionalScope={[
        "statusId",
        "phone",
        "email",
        "name",
        "remark",
        "clientLocationId",
        "functionId",
      ]}
      query={include("../lib/insertContactPersonQuery4.sql", "string")}
      resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="getClientGroupContactPersonsQuery3"
      _additionalScope={["clientGroupId"]}
      enableTransformer={true}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/getClientGroupContactPersonsQuery3.sql", "string")}
      resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      transformer="return formatDataAsArray(data);"
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="getClientLocationContactPersonQuery"
      _additionalScope={["clientLocationId"]}
      enableTransformer={true}
      notificationDuration={4.5}
      query={include(
        "../lib/getClientLocationContactPersonQuery.sql",
        "string"
      )}
      resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      transformer="return formatDataAsArray(data);"
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
  </Folder>
  <Folder id="OpenHours">
    <JavascriptQuery
      id="addOpenHours"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/addOpenHours.js", "string")}
      resourceName="JavascriptQuery"
      showFailureToaster={false}
      showSuccessToaster={false}
    />
    <State
      id="openHours"
      value="{
  0: {
    isOpen: {{ getOpenHoursQuery.data[0]?.isOpen }},
    openTime: {{ getOpenHoursQuery.data[0]?.openTime }},
    closeTime: {{ getOpenHoursQuery.data[0]?.closeTime }},
  },
  1: {
    isOpen: {{ getOpenHoursQuery.data[1]?.isOpen }},
    openTime: {{ getOpenHoursQuery.data[1]?.openTime }},
    closeTime: {{ getOpenHoursQuery.data[1]?.closeTime }},
  },
  2: {
    isOpen: {{ getOpenHoursQuery.data[2]?.isOpen }},
    openTime: {{ getOpenHoursQuery.data[2]?.openTime }},
    closeTime: {{ getOpenHoursQuery.data[2]?.closeTime }},
  },
  3: {
    isOpen: {{ getOpenHoursQuery.data[3]?.isOpen }},
    openTime: {{ getOpenHoursQuery.data[3]?.openTime }},
    closeTime: {{ getOpenHoursQuery.data[3]?.closeTime }},
  },
  4: {
    isOpen: {{ getOpenHoursQuery.data[4]?.isOpen }},
    openTime: {{ getOpenHoursQuery.data[4]?.openTime }},
    closeTime: {{ getOpenHoursQuery.data[4]?.closeTime }},
  },
  5: {
    isOpen: {{ getOpenHoursQuery.data[5]?.isOpen }},
    openTime: {{ getOpenHoursQuery.data[5]?.openTime }},
    closeTime: {{ getOpenHoursQuery.data[5]?.closeTime }},
  },
  6: {
    isOpen: {{ getOpenHoursQuery.data[6]?.isOpen }},
    openTime: {{ getOpenHoursQuery.data[6]?.openTime }},
    closeTime: {{ getOpenHoursQuery.data[6]?.closeTime }},
  },
}"
    />
    <SqlQueryUnified
      id="getOpenHoursQuery"
      _additionalScope={["clientLocationId"]}
      enableTransformer={true}
      notificationDuration={4.5}
      query={include("../lib/getOpenHoursQuery.sql", "string")}
      resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
      showFailureToaster={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      transformer="return formatDataAsArray(data);"
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="deleteOpenHoursQuery"
      _additionalScope={["clientLocationId"]}
      notificationDuration={4.5}
      query={include("../lib/deleteOpenHoursQuery.sql", "string")}
      resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="insertOpeningHoursQuery"
      _additionalScope={[
        "openTime",
        "closeTime",
        "isOpen",
        "clientLocationId",
        "dayOfWeek",
      ]}
      enableTransformer={true}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/insertOpeningHoursQuery.sql", "string")}
      resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      transformer="return formatDataAsArray(data)[0];"
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
    <SqlQueryUnified
      id="updateOpeningHoursQuery"
      _additionalScope={[
        "openTime",
        "closeTime",
        "isOpen",
        "clientLocationId",
        "dayOfWeek",
      ]}
      enableTransformer={true}
      notificationDuration={4.5}
      query={include("../lib/updateOpeningHoursQuery.sql", "string")}
      resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      showUpdateSetValueDynamicallyToggle={false}
      transformer="return formatDataAsArray(data)[0];"
      updateSetValueDynamically={true}
      warningCodes={[]}
    />
  </Folder>
  <SqlQueryUnified
    id="getCustomerProfilesForLocation"
    notificationDuration={4.5}
    query={include("../lib/getCustomerProfilesForLocation.sql", "string")}
    resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <JavascriptQuery
    id="handleClientGroupDataInherit"
    isMultiplayerEdited={false}
    query={include("../lib/handleClientGroupDataInherit.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
  />
  <SqlQueryUnified
    id="getRelationManagersForLocation"
    query={include("../lib/getRelationManagersForLocation.sql", "string")}
    resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
    runWhenModelUpdates={false}
    showFailureToaster={false}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="getSectorsForLocation"
    notificationDuration={4.5}
    query={include("../lib/getSectorsForLocation.sql", "string")}
    resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
    showFailureToaster={false}
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <JavascriptQuery
    id="onWizardLoad"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/onWizardLoad.js", "string")}
    resourceName="JavascriptQuery"
    runWhenPageLoads={true}
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <SqlQueryUnified
    id="loadClientLocationData"
    enableTransformer={true}
    isMultiplayerEdited={false}
    query={include("../lib/loadClientLocationData.sql", "string")}
    resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
    runWhenModelUpdates={false}
    showFailureToaster={false}
    transformer="return formatDataAsArray(data)[0];"
    warningCodes={[]}
  />
  <State id="currentEditLocationId" value="null" />
  <SqlQueryUnified
    id="getClientGroupsForSelection"
    notificationDuration={4.5}
    query={include("../lib/getClientGroupsForSelection.sql", "string")}
    resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <JavascriptQuery
    id="saveClientLocation"
    _additionalScope={["transitToActive"]}
    isMultiplayerEdited={false}
    query={include("../lib/saveClientLocation.js", "string")}
    resourceName="JavascriptQuery"
    transformer=""
  />
  <SqlQueryUnified
    id="loadCountriesQuery"
    notificationDuration={4.5}
    query={include("../lib/loadCountriesQuery.sql", "string")}
    resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
    showFailureToaster={false}
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="getClientGroupDataForInherit"
    _additionalScope={["customerGroupId"]}
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/getClientGroupDataForInherit.sql", "string")}
    resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    transformer="return formatDataAsArray(data)[0];"
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="getSubSectorsForLocation"
    _additionalScope={["parentSectorId"]}
    enableTransformer={true}
    query={include("../lib/getSubSectorsForLocation.sql", "string")}
    resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
    runWhenModelUpdates={false}
    showFailureToaster={false}
    transformer="return formatDataAsArray(data);"
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="updateClientLocationQuery"
    _additionalScope={[
      "clientLocationId",
      "name",
      "groupId",
      "cocNumber",
      "sectorId",
      "profileId",
      "relationManagerId",
      "wastePartnersInfo",
      "invoiceSendingChannel",
      "invoiceFreq",
      "invoiceEmail",
      "paymentTermsDays",
      "debtorNumber",
      "btwNumber",
    ]}
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/updateClientLocationQuery.sql", "string")}
    resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    transformer="return formatDataAsArray(data)[0];"
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="updateAddressQuery"
    _additionalScope={[
      "addressId",
      "street",
      "addition",
      "city",
      "countryId",
      "zipcode",
      "number",
    ]}
    enableTransformer={true}
    notificationDuration={4.5}
    query={include("../lib/updateAddressQuery.sql", "string")}
    resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    transformer="return formatDataAsArray(data)[0];"
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <JavascriptQuery
    id="handleSwitchTabs"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/handleSwitchTabs.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <SqlQueryUnified
    id="deleteAddressQuery"
    _additionalScope={["addressId"]}
    enableTransformer={true}
    notificationDuration={4.5}
    query={include("../lib/deleteAddressQuery.sql", "string")}
    resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    transformer="return formatDataAsArray(data)[0];"
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="insertAddressQuery"
    _additionalScope={[
      "street",
      "houseNumber",
      "addition",
      "city",
      "countryId",
      "zipcode",
    ]}
    enableTransformer={true}
    notificationDuration={4.5}
    query={include("../lib/insertAddressQuery.sql", "string")}
    resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    transformer="return formatDataAsArray(data)[0];"
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="insertClientLocationQuery"
    _additionalScope={[
      "name",
      "groupId",
      "cocNumber",
      "sectorId",
      "profileId",
      "relationManagerId",
      "statusId",
      "wastePartnersInfo",
      "invoiceSendingChannel",
      "invoiceFreq",
      "invoiceEmail",
      "paymentTermsDays",
      "debtorNumber",
      "btwNumber",
    ]}
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/insertClientLocationQuery.sql", "string")}
    resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    transformer="return formatDataAsArray(data)[0];"
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="updateClientLocationAddressQuery"
    _additionalScope={["clientLocationId", "addressId"]}
    enableTransformer={true}
    notificationDuration={4.5}
    query={include("../lib/updateClientLocationAddressQuery.sql", "string")}
    resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
    runWhenModelUpdates={false}
    showFailureToaster={false}
    showSuccessToaster={false}
    showUpdateSetValueDynamicallyToggle={false}
    transformer="return formatDataAsArray(data)[0];"
    updateSetValueDynamically={true}
    warningCodes={[]}
  />
  <State id="statusText" value="Concept" />
  <State id="statusColor" value="#DA7F35" />
  <JavascriptQuery
    id="goBack"
    notificationDuration={4.5}
    query={include("../lib/goBack.js", "string")}
    resourceName="JavascriptQuery"
    showFailureToaster={false}
    showSuccessToaster={false}
  />
  <State id="isFormDirty" value="false" />
  <SqlQueryUnified
    id="updateCustomerLocationStatusQuery"
    _additionalScope={["customerLocationId", "statusId"]}
    isMultiplayerEdited={false}
    query={include("../lib/updateCustomerLocationStatusQuery.sql", "string")}
    queryTimeout=""
    queryTriggerDelay=""
    resourceName="cf8f1891-c134-40b7-8270-f8552914ccd2"
    runWhenModelUpdates={false}
    showFailureToaster={false}
    warningCodes={[]}
  />
  <State id="requiredFieldsMessageText" />
  <Include src="./addClientContactPersonModal.rsx" />
  <Include src="./invoiceAddressModal.rsx" />
  <Include src="./openHoursModal.rsx" />
  <Include src="./pickupAddressModal.rsx" />
  <Include src="./requiredFieldsModal.rsx" />
  <Frame
    id="$main"
    enableFullBleed={true}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  />
  <Frame
    id="$main38"
    enableFullBleed={true}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Container
      id="wizardRootPageContainer"
      _align="center"
      _direction="vertical"
      _gap="0px"
      _type="stack"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showBorder={false}
    >
      <View id="00030" viewKey="View 1">
        <Container
          id="container455"
          _direction="vertical"
          _gap="20px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="12px"
          showBody={true}
          showBorder={false}
        >
          <View id="00030" viewKey="View 1">
            <Container
              id="group615"
              _align="center"
              _gap="0px"
              _type="stack"
              footerPadding="4px 12px"
              headerPadding="4px 12px"
              margin="0"
              padding="0"
              showBody={true}
              showBorder={false}
              style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
            >
              <View id="00030" viewKey="View 1">
                <Text
                  id="companyNameHeader"
                  disableMarkdown={true}
                  style={{
                    fontSize: "h3Font",
                    fontWeight: "h3Font",
                    fontFamily: "h3Font",
                  }}
                  value="{{ companyName9.value }}"
                  verticalAlign="center"
                />
                <Button
                  id="saveAndBack"
                  iconBefore="bold/interface-arrows-left-alternate"
                  style={{ map: { background: "tokens/8ca1af49" } }}
                  text="{{ i18n.t('buttons_save_and_back') }}"
                >
                  <Event
                    id="7fa0b1de"
                    event="click"
                    method="trigger"
                    params={{
                      map: {
                        options: {
                          map: {
                            additionalScope: {
                              map: { transitToActive: "false" },
                            },
                          },
                        },
                      },
                    }}
                    pluginId="saveClientLocation"
                    type="datasource"
                    waitMs="0"
                    waitType="debounce"
                  />
                </Button>
              </View>
            </Container>
            <Container
              id="group616"
              _align="center"
              _gap="0px"
              _justify="space-between"
              _type="stack"
              footerPadding="4px 12px"
              headerPadding="4px 12px"
              margin="0px 8px"
              overflowType="hidden"
              padding="12px"
              showBody={true}
              style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
            >
              <View id="00030" viewKey="View 1">
                <Tabs
                  id="clientGroupAddModalTabs23"
                  itemMode="static"
                  navigateContainer={true}
                  style={{
                    selectedText: "#2b3860",
                    unselectedText: "primary",
                    hoverText: "primary",
                    fontSize: "labelEmphasizedFont",
                    fontWeight: "labelEmphasizedFont",
                    fontFamily: "labelEmphasizedFont",
                    pillBorderRadius: "6px",
                  }}
                  targetContainerId="tabbedContainer14"
                  value="{{ self.values[0] }}"
                >
                  <Option id="00030" value="Tab 1" />
                  <Option id="00031" value="Tab 2" />
                  <Option id="00032" value="Tab 3" />
                </Tabs>
                <Button
                  id="button471"
                  allowWrap={false}
                  disabled="false"
                  heightType="auto"
                  horizontalAlign="left"
                  style={{
                    background: "{{ statusColor.value }}",
                    activeBackground: "{{ statusColor.value }}",
                    hoverBackground: "{{ statusColor.value }}",
                  }}
                  submitTargetId=""
                  text="{{ statusText.value }}"
                />
              </View>
            </Container>
            <Include src="./tabbedContainer14.rsx" />
          </View>
        </Container>
      </View>
    </Container>
  </Frame>
</Screen>
