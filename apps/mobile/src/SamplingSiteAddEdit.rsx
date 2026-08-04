<Screen
  id="SamplingSiteAddEdit"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={3}
  _searchParams={[]}
  browserTitle={null}
  events={[]}
  headerRightActions={[
    {
      type: "text",
      value: "Done",
      event: {
        method: "trigger",
        enabled: "",
        params: {
          map: {
            options: {
              object: {
                onSuccess: null,
                onFailure: null,
                additionalScope: null,
              },
            },
          },
        },
        pluginId: "btnDone_OnClick",
        waitType: "debounce",
        event: "click",
        type: "datasource",
        id: "a9b3ce45",
        waitMs: 0,
      },
    },
  ]}
  refreshing=""
  title="{{varSelectedSamplingRound.value.sampling_type == 'type_official' ? '' : varSelectedSamplingSite.value?.soil_sampling_id == undefined ? 'Add' : 'Edit' }} Sampling site"
  urlSlug={null}
  uuid="7b2c8d6d-7ee5-4056-aae1-0cdccd0ee1b7"
>
  <Folder id="Location_Fns">
    <JavascriptQuery
      id="setLatitudeFromLocation"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/setLatitudeFromLocation.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <State id="varCurrPosition" />
    <JavascriptQuery
      id="setLongitudeFromLocation"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/setLongitudeFromLocation.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="Yearly_data">
    <SqlTransformQuery
      id="get_humus_smells"
      query={include("../lib/get_humus_smells.sql", "string")}
      resourceName="SQL Transforms"
    />
    <SqlTransformQuery
      id="get_dispersions"
      query={include("../lib/get_dispersions.sql", "string")}
      resourceName="SQL Transforms"
    />
    <SqlQueryUnified
      id="upsert_yearly_result_data"
      isMultiplayerEdited={false}
      offlineQueryType="Write"
      query={include("../lib/upsert_yearly_result_data.sql", "string")}
      queryDisabled="{{ openModal.value != true }}"
      resourceDisplayName="Production GIS1 (write)"
      resourceName="e8259c5e-8b7a-4dc9-a773-9fba0fd5d873"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      transformer=""
      warningCodes={[]}
    />
    <Function
      id="trnYearlyResultData"
      funcBody={include("../lib/trnYearlyResultData.js", "string")}
    />
    <Function
      id="trnNAYearlyResultData"
      funcBody={include("../lib/trnNAYearlyResultData.js", "string")}
    />
    <Function
      id="trnIsValid_YearlyData"
      funcBody={include("../lib/trnIsValid_YearlyData.js", "string")}
    />
    <JavascriptQuery
      id="saveYearlyResultData"
      _additionalScope={["offline_job_id"]}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/saveYearlyResultData.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <Function
      id="trnWarning_GroundCover"
      funcBody={include("../lib/trnWarning_GroundCover.js", "string")}
    />
  </Folder>
  <JavascriptQuery
    id="btnDone_OnClick"
    confirmationMessage="{{ trnWarning_GroundCover.value }}"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/btnDone_OnClick.js", "string")}
    requireConfirmation="{{ trnWarning_GroundCover.value != '' && chkAddResultData.value }}"
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  >
    <Event
      id="2d25e053"
      event="failure"
      method="open"
      params={{
        title: "Invalid Input",
        description: "{{btnDone_OnClick.error}}",
        actionItems: [
          {
            label: "OK",
            event: {
              id: "d856dccb",
              event: "click",
              method: "trigger",
              pluginId: "",
              type: "datasource",
              waitMs: 0,
              waitType: "debounce",
            },
          },
        ],
      }}
      pluginId=""
      type="alert"
      waitMs="0"
      waitType="debounce"
    />
  </JavascriptQuery>
  <Function
    id="trnIsValid"
    funcBody={include("../lib/trnIsValid.js", "string")}
  />
  <TabbedContainer
    id="tabContainer2"
    _hasMigratedNestedItems={true}
    _hiddenByIndex={[
      "",
      "{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' || !chkAddResultData.value }}",
    ]}
    _ids={["00030", "00031"]}
    _labels={["Site", "Result data"]}
    _viewKeys={["SAMPLING_SITE", "YEARLY_RESULT"]}
    currentViewKey="{{ self.viewKeys[0] }}"
  >
    <KeyValue
      id="keyValue2"
      _rowKeysFormatted={{
        site_number: "Site #",
        site_name: "Site Name",
        lat: "Coordinate",
        note: "Note",
        sample_taken_date: "Sample Taken Date",
      }}
      _rowValuesFormatted={{
        lat: "{{ `${varSelectedSamplingSite.value.lat}, ${varSelectedSamplingSite.value.lon}` }}",
        sample_taken_date: '{{ moment(item).format("MMM D, yyyy") }}',
      }}
      allowTextWrapping={true}
      data="{{ varSelectedSamplingSite.value }}"
      direction="vertical"
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_official' }}"
      rows={[
        "a",
        "b",
        "c",
        "id",
        "soil_sampling_round_id",
        "site_number",
        "site_name",
        "sample_taken_date",
        "lat",
        "lon",
        "geom",
        "note",
        "is_deleted",
        "created_on",
        "created_by",
        "modified_on",
        "modified_by",
        "pending_update",
        "offline_job_id",
        "latitude",
        "longitude",
      ]}
      rowVisibility={{
        a: true,
        site_number: true,
        b: true,
        c: true,
        site_name: true,
        is_deleted: false,
        soil_sampling_round_id: false,
        lon: false,
        latitude: true,
        modified_by: false,
        created_by: false,
        longitude: true,
        pending_update: false,
        note: true,
        modified_on: false,
        created_on: false,
        offline_job_id: false,
        id: false,
        sample_taken_date: true,
        geom: false,
        lat: true,
      }}
      showSeparator={true}
      valueHorizontalAlignment="right"
      valueWidth="50%"
    />
    <Status
      id="status1"
      _colorByIndex={["#059669", "#cd6f00", "#dc2626"]}
      _iconByIndex={[
        "bold/interface-validation-check-circle",
        "bold/interface-alert-warning-circle",
        "bold/interface-delete-circle",
      ]}
      _ids={["00030", "00031", "00032"]}
      _labels={["Completed", "Pending data upload", "Canceled"]}
      _values={["completed", "pending", "canceled"]}
      itemMode="static"
      value="{{ varSelectedSamplingSite.value.pending_update ? 'pending' : undefined }}"
    />
    <Status
      id="status2"
      _colorByIndex={["#059669", "#cd6f00", "#dc2626"]}
      _iconByIndex={[
        "bold/interface-validation-check-circle",
        "bold/interface-alert-warning-circle",
        "bold/interface-delete-circle",
      ]}
      _ids={["00030", "00031", "00032"]}
      _labels={["Completed", "Pending data upload", "Canceled"]}
      _values={["completed", "pending", "canceled"]}
      itemMode="static"
      value="{{ varSelectedSamplingSiteResult.value.pending_update ? 'pending' : undefined }}"
    />
    <Switch
      id="swcDraft"
      caption="Bypass validations, saved locally only"
      label={'Save as "Draft"'}
      value="{{ varSelectedSamplingSiteResult.value.ready_to_upload == undefined ? false : !varSelectedSamplingSiteResult.value.ready_to_upload }}"
      width="full"
    />
    <TextArea
      id="txtSiteName"
      autoCorrect={true}
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' }}"
      label="Site name"
      minLines={1}
      placeholder="e.g. Paddock #1"
      required={true}
      value="{{ varSelectedSamplingSite.value?.site_name }}"
    />
    <Divider id="divider3" spacing={4} />
    <Select
      id="selPaddockUseAs"
      label="Paddock use as"
      labelPosition="top"
      labels="{{ get_list_options.data.filter((x) => x.list_key == 'soil_paddock_use_as').map((x) => x.option_name) }}"
      placeholder="Select an option"
      required={true}
      value="{{ varSelectedSamplingSite.value.paddock_use_as }}"
      values="{{ get_list_options.data.filter((x) => x.list_key == 'soil_paddock_use_as').map((x) => x.option_key) }}"
    />
    <TextArea
      id="txtPaddockAsOther"
      autoCorrect={true}
      hidden="{{ (selPaddockUseAs.value ?? '') != 'use_as_other' }}"
      label={'Paddock use as "other"'}
      minLines={1}
      placeholder="Type in what the paddock use as"
      required={true}
      value="{{ varSelectedSamplingSite.value.paddock_use_as_other }}"
    />
    <DatePicker
      id="dtSampleTakenDate"
      displayTimeZone="local"
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' }}"
      label="Sample taken date"
      mode="date"
      required={true}
      value="{{ varSelectedSamplingSite.value?.sample_taken_date  || new Date() }}"
      valueTimeZone="local"
    />
    <Include src="./cntGroundCover.rsx" />
    <NumberInput
      id="txtlatitude"
      allowNegativeNumbers={true}
      customValidation="{{ (/^-(10\.6\d{3,}|1[1-9]\.\d{3,}|[2-3]\d\.\d{3,}|4[0-2]\.\d{3,}|43\.[0-5]\d{3,}|43\.6\d{3,})$/).test(txtlatitude.value) ? '' : 'Input valid coordinate' }}"
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' }}"
      iconAfter="bold/travel-map-location-pin-alternate"
      label="Latitude"
      placeholder={0}
      required={true}
      stepSize={1}
      value="{{ varSelectedSamplingSite.value?.lat }}"
    >
      <Event
        id="4aa9aa45"
        event="suffixIconPress"
        method="trigger"
        params={{}}
        pluginId="setLatitudeFromLocation"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </NumberInput>
    <Include src="./cntPlantDiversity.rsx" />
    <NumberInput
      id="txtLongitude"
      customValidation="{{ (/^(113\.2\d{3,}|113\.[3-9]\d{3,}|11[4-9]\.\d{3,}|12\d\.\d{3,}|13\d\.\d{3,}|14\d\.\d{3,}|15[0-2]\.\d{3,}|153\.[0-5]\d{3,}|153\.6\d{3,})$/).test(txtLongitude.value) ? '' : 'Input valid coordinate' }}"
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' }}"
      iconAfter="bold/travel-map-location-pin-alternate"
      label="Longitude"
      placeholder={0}
      required={true}
      stepSize={1}
      value="{{ varSelectedSamplingSite.value?.lon }}"
    >
      <Event
        id="60d50753"
        event="suffixIconPress"
        method="trigger"
        params={{}}
        pluginId="setLongitudeFromLocation"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </NumberInput>
    <NumberInput
      id="txtCEA"
      label="CEA"
      placeholder={0}
      showStepper={true}
      stepSize={1}
      value="{{ varSelectedSamplingSite.value?.cea }}"
    />
    <Include src="./cntWaterInfiltration.rsx" />
    <NumberInput
      id="txtStrata"
      label="Strata"
      placeholder={0}
      showStepper={true}
      stepSize={1}
      value="{{ varSelectedSamplingSite.value?.strata }}"
    />
    <TextArea
      id="txtProperty"
      autoCorrect={true}
      label="Property"
      minLines={1}
      placeholder="Enter value"
      value="{{ varSelectedSamplingSite.value?.property }}"
    />
    <Include src="./cntAggregateStability.rsx" />
    <TextArea
      id="txtNote"
      autoCorrect={true}
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' }}"
      label="Note"
      minLines={4}
      placeholder="Enter value"
      value="{{ varSelectedSamplingSite.value?.note }}"
    />
    <Switch
      id="chkAddResultData"
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' }}"
      label="Add result data?"
      type="checkbox"
      value="{{ varSelectedSamplingSiteResult.value != undefined }}"
      width="full"
    />
    <Include src="./cntOtherData.rsx" />
    <TextArea
      id="txtNote_YearlyResult"
      autoCorrect={true}
      label="Note"
      labelCaption="e.g. why data is not available?"
      minLines={4}
      placeholder="Enter value"
      required="{{ Object.values(trnNAYearlyResultData.value).includes(true) }}"
      value="{{ varSelectedSamplingSiteResult.value?.note }}"
    />
  </TabbedContainer>
</Screen>
