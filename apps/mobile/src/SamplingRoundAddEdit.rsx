<Screen
  id="SamplingRoundAddEdit"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={2}
  _searchParams={[]}
  browserTitle={null}
  events={[
    {
      method: "trigger",
      params: {},
      targetId: null,
      pluginId: "onPageLoad_SamplingRound",
      waitType: "debounce",
      event: "refresh",
      type: "datasource",
      id: "c3f3529c",
      waitMs: "0",
    },
  ]}
  headerRightActions={[
    {
      type: "text",
      value: "{{ trnIsDirty.value ? 'Cancel' : ''}}",
      event: {
        id: "0a32b9e3",
        event: "click",
        method: "trigger",
        pluginId: "btnCancel_OnClick",
        type: "datasource",
        waitMs: 0,
        waitType: "debounce",
      },
    },
    {
      type: "text",
      value: "{{ trnIsDirty.value ? 'Save' : 'Refresh' }}",
      event: {
        id: "2384ece4",
        event: "click",
        method: "run",
        pluginId: "",
        type: "script",
        waitMs: 0,
        waitType: "debounce",
        params: {
          map: {
            src: "if (trnIsDirty.value)\n{\n  if (varSelectedSamplingRound.value.sampling_type == 'type_yearly' && varSelectedSamplingRound.value.year == undefined && (txtYear.value == undefined || txtYear.value == ''))\n    displayErrorMessage.trigger({\n      additionalScope:{\n        alertObject: {\n          title: 'Invalid Year',\n          message: 'Please specify which year this sampling for'\n        }\n      }\n    });\n  else\n    btnSave_OnClick.trigger();\n}  \nelse\n  onPageLoad_SamplingRound.trigger();",
          },
        },
      },
    },
  ]}
  refreshing="{{ onPageLoad_SamplingRound.isFetching }}"
  title="Sampling Round"
  urlSlug={null}
  uuid="8031855a-dbdc-49b7-aa12-51188806fd2a"
>
  <Folder id="On_load_and_displays">
    <SqlTransformQuery
      id="sampling_site_display_backup"
      isMultiplayerEdited={false}
      query={include("../lib/sampling_site_display_backup.sql", "string")}
      resourceName="SQL Transforms"
      runWhenModelUpdates={false}
    />
    <SqlTransformQuery
      id="sampling_site_display_union_tables"
      isMultiplayerEdited={false}
      query={include("../lib/sampling_site_display_union_tables.sql", "string")}
      resourceName="SQL Transforms"
      runWhenModelUpdates={false}
    />
    <SqlTransformQuery
      id="sampling_site_display"
      isMultiplayerEdited={false}
      query={include("../lib/sampling_site_display.sql", "string")}
      resourceName="SQL Transforms"
      runWhenModelUpdates={false}
    />
    <JavascriptQuery
      id="onPageLoad_SamplingRound"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/onPageLoad_SamplingRound.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="Sampling_site_copy">
    <JavascriptQuery
      id="btnAddNewSiteOptions"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/btnAddNewSiteOptions.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    >
      <Event
        id="1c71f791"
        enabled="{{ trnValidToCopySiteFromLastRound.value }}"
        event="success"
        method="open"
        params={{
          title: "Add new site or copy from last year?",
          description:
            "Would you like to add new site or brought over sites from last year sampling round?",
          actionItems: [
            {
              label: "Add new site",
              event: {
                id: "3f019b7d",
                event: "click",
                method: "trigger",
                pluginId: "btnAddEditSite_OnClick",
                type: "datasource",
                waitMs: 0,
                waitType: "debounce",
                params: {
                  map: {
                    options: {
                      map: {
                        additionalScope: {
                          map: { selectedSite: "{{ undefined }}" },
                        },
                      },
                    },
                  },
                },
              },
            },
            {
              label: "Copy from last year round",
              event: {
                id: "0ac17d15",
                event: "click",
                method: "trigger",
                pluginId: "copySamplingSiteFromLastYear",
                type: "datasource",
                waitMs: 0,
                waitType: "debounce",
              },
            },
          ],
        }}
        pluginId=""
        type="actionSheet"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        id="c3f5329d"
        enabled="{{ !trnValidToCopySiteFromLastRound.value }}"
        event="success"
        method="trigger"
        params={{
          map: {
            options: {
              map: {
                additionalScope: { map: { selectedSite: "{{ undefined }}" } },
              },
            },
          },
        }}
        pluginId="btnAddEditSite_OnClick"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </JavascriptQuery>
    <JavascriptQuery
      id="copySamplingSiteFromLastYear"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/copySamplingSiteFromLastYear.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <Function
      id="trnValidToCopySiteFromLastRound"
      funcBody={include("../lib/trnValidToCopySiteFromLastRound.js", "string")}
    />
    <JavascriptQuery
      id="buildUpsertSoilSampling"
      _additionalScope={["obj"]}
      notificationDuration={4.5}
      query={include("../lib/buildUpsertSoilSampling.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="saveSamplingSite_Copy"
      _additionalScope={["obj", "qryStr"]}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/saveSamplingSite_Copy.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="Score_card">
    <JavascriptQuery
      id="btnScorecard_OnClick"
      _additionalScope={["selectedItem"]}
      isMultiplayerEdited={false}
      query={include("../lib/btnScorecard_OnClick.js", "string")}
      resourceName="JavascriptQuery"
    >
      <Event
        id="d8b19753"
        event="failure"
        method="open"
        params={{
          title: "Can't open scorecard",
          description: "{{ btnScorecard_OnClick.error }}",
          actionItems: [
            {
              label: "OK",
              event: {
                id: "7535cc83",
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
    <JavascriptQuery
      id="checkScorecardValid"
      _additionalScope={["data"]}
      notificationDuration={4.5}
      query={include("../lib/checkScorecardValid.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="Site_row_click">
    <JavascriptQuery
      id="btnAddEditSite_OnClick"
      _additionalScope={["selectedSite"]}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/btnAddEditSite_OnClick.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <SqlTransformQuery
      id="get_yearly_sampling_result"
      isMultiplayerEdited={false}
      query={include("../lib/get_yearly_sampling_result.sql", "string")}
      resourceName="SQL Transforms"
      runWhenModelUpdates={false}
    />
  </Folder>
  <Folder id="Sampling_Round_Update">
    <Function
      id="trnIsDirty"
      funcBody={include("../lib/trnIsDirty.js", "string")}
    />
    <Function
      id="trnUpdatedSoilRoundData"
      funcBody={include("../lib/trnUpdatedSoilRoundData.js", "string")}
    />
    <JavascriptQuery
      id="btnCancel_OnClick"
      notificationDuration={4.5}
      query={include("../lib/btnCancel_OnClick.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="btnSave_OnClick"
      confirmationMessage="The sampling round for year {{ txtYear.value }} exists, this will overwrite the existing data. Continue?"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("../lib/btnSave_OnClick.js", "string")}
      requireConfirmation="{{ varSelectedSamplingRound.value.year == undefined && varSelectedSamplingRound.value.sampling_type == 'type_yearly' && get_soil_round_and_project_data.data.findIndex((x) => x.project_id == varSelectedProject.value.project_id && x.sampling_type == 'type_yearly' && x.year == txtYear.value) > -1}}"
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    >
      <Event
        id="35a52279"
        event="failure"
        method="open"
        params={{
          title: "Invalid Input",
          description: "{{ btnSave_OnClick.error }}",
          actionItems: [
            {
              label: "OK",
              event: {
                id: "72c664ed",
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
    <JavascriptQuery
      id="displayErrorMessage"
      _additionalScope={["alertObject"]}
      notificationDuration={4.5}
      query={include("../lib/displayErrorMessage.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    >
      <Event
        id="b264a647"
        event="success"
        method="open"
        params={{
          title: "{{ displayErrorMessage.data?.title }}",
          description: "{{ displayErrorMessage.data?.message }}",
          actionItems: [
            {
              label: "OK",
              event: {
                id: "58880bff",
                event: "click",
                method: "trigger",
                pluginId: "",
                type: "datasource",
                waitMs: 0,
                waitType: "debounce",
              },
            },
            {
              label: "Cancel",
              event: {
                id: "673f730b",
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
  </Folder>
  <TabbedContainer
    id="tabContainer1"
    _hasMigratedNestedItems={true}
    _hiddenByIndex={["", ""]}
    _ids={["00030", "00031"]}
    _labels={["Round", ""]}
    _viewKeys={["View_rund", "Sites"]}
    currentViewKey="{{ self.viewKeys[0] }}"
    hidden=""
  >
    <NumberInput id="numberInput4" placeholder={0} stepSize={1} />
    <Text
      id="text1"
      hidden="{{ sampling_site_display.data.length > 0 }}"
      markdown={true}
      size="medium"
      value="##### No data available"
      weight="normal"
    />
    <KeyValue
      id="keyValue1"
      _rowKeysFormatted={{
        cf_staff_as_samplers_display: "CF Staff as Samplers",
        erf_id: "ERF ID",
        last_possible_sampling_date: "Last Possible Sampling Date",
        num_of_mobs: "Number of Mobs",
        project_manager: "Project manager",
        total_grazing_area: "Total Grazing Area (ha)",
        sampling_median_date: "Sampling Median Date",
        project_name: "Project",
        reporting_period: "Reporting Period",
        forecast_date: "Forecast Date",
        status: "Status",
        sampling_type_display: "Sampling Type",
        num_of_livestocks: "Number of Livestock (head)",
        sampling_scheduled_date: "Sampling Scheduled Date",
        num_of_paddocks: "Number of Paddocks",
        round_name: "Round",
        warning: "Warning Flag",
      }}
      _rowValuesFormatted={{
        cf_staff_as_samplers_display:
          "{{ (varSelectedSamplingRound.value.cf_staff_as_samplers_display || []).length == 0 ? 'No data' : arSelectedSamplingRound.value.cf_staff_as_samplers_display  }}",
        last_possible_sampling_date: '{{ moment(item).format("MMM D, yyyy") }}',
        num_of_mobs: "{{ item == undefined ? 'No data' : item }}",
        total_grazing_area: "{{ item == undefined ? 'No data' : `${item}ha` }}",
        sampling_median_date:
          '{{varSelectedSamplingRound.value.sampling_median_date_calculated != undefined ? `${moment(varSelectedSamplingRound.value.sampling_median_date_calculated).format("MMM D, yyyy")} (calculated)` : varSelectedSamplingRound.value.sampling_median_date_override != undefined ? `${moment(varSelectedSamplingRound.value.sampling_median_date_override).format("MMM D, yyyy")} (override)` : \'No data\'}}',
        forecast_date:
          '{{ varSelectedProject.value.forecast_date_override == undefined ? `${moment(varSelectedProject.value.forecast_date_calculated).format("MMM D, yyyy")} (calculated)` : `${moment(varSelectedProject.value.forecast_date_override).format("MMM D, yyyy")} (override)` }}',
        num_of_livestocks: "{{ item == undefined ? 'No data' : item }}",
        sampling_scheduled_date:
          "{{ item == undefined ? 'No data' :  moment(item).format(\"MMM D, yyyy\") }}",
        num_of_paddocks: "{{ item == undefined ? 'No data' : item }}",
      }}
      allowTextWrapping={true}
      data="{{ varSelectedSamplingRound.value }}"
      direction="vertical"
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_official' }}"
      rows={[
        "a",
        "b",
        "c",
        "cf_staff_as_sampler_ids",
        "project_name",
        "erf_id",
        "project_manager",
        "sampling_type_display",
        "reporting_period",
        "round_name",
        "forecast_date",
        "last_possible_sampling_date",
        "sampling_median_date",
        "sampling_scheduled_date",
        "status",
        "cf_staff_as_samplers_display",
        "num_of_mobs",
        "num_of_livestocks",
        "num_of_paddocks",
        "total_grazing_area",
        "warning",
        "external_sampler_client_id",
        "external_sampler_contact_id",
        "forecast_date_calculated",
        "forecast_date_override",
        "id",
        "livestock_to_total_grazing_area_ratio",
        "paddock_to_mob_ratio",
        "project_id",
        "project_state",
        "project_status",
        "sampling_median_date_calculated",
        "sampling_median_date_override",
        "sampling_type",
        "total_sampling",
        "year",
        "pending_update",
        "offline_job_id",
        "note",
      ]}
      rowVisibility={{
        sampling_median_date_override: false,
        cf_staff_as_samplers_display: true,
        project_id: false,
        a: true,
        erf_id: true,
        last_possible_sampling_date:
          "{{ varSelectedSamplingRound.value.status != 'Complete' }}",
        paddock_to_mob_ratio: false,
        b: true,
        total_sampling: false,
        num_of_mobs: false,
        c: true,
        livestock_to_total_grazing_area_ratio: false,
        external_sampler_client_id: false,
        external_sampler_contact_id: false,
        project_manager: true,
        total_grazing_area: false,
        forecast_date_calculated: false,
        sampling_median_date: true,
        project_state: false,
        cf_staff_as_sampler_ids: false,
        pending_update: false,
        project_name: true,
        sampling_type: false,
        reporting_period: true,
        sampling_median_date_calculated: false,
        forecast_date: true,
        note: true,
        status: true,
        sampling_type_display: true,
        num_of_livestocks: false,
        sampling_scheduled_date:
          "{{ varSelectedSamplingRound.value.status != 'Complete' }}",
        project_status: false,
        forecast_date_override: false,
        offline_job_id: false,
        id: false,
        num_of_paddocks: false,
        round_name: true,
        warning: "{{ item != undefined }}",
        year: false,
      }}
      showSeparator={true}
      valueHorizontalAlignment="right"
      valueWidth="50%"
    />
    <CollectionView
      id="lstSitesYearly"
      bodyByIndex={
        'Taken at {{ moment(item.sample_taken_date).format("MMM D, yyyy") }}'
      }
      cardStyle="elevated"
      data="{{ sampling_site_display.data }}"
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' }}"
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
      subtitleByIndex="{{ `(${item.lat}, ${item.lon})`}}"
      subtitleLengthByIndex="2"
      suffixIconByIndex="bold/interface-arrows-button-right"
      suffixTextByIndex="Scorecard"
      suffixTypeByIndex="button"
      suffixValueByIndex="false"
      titleByIndex="{{ item.site_name }}"
    >
      <Event
        id="2e82b302"
        enabled="{{ trnIsDirty.value }}"
        event="press"
        method="open"
        params={{
          title: "Update sampling round?",
          description:
            "You made changes on sampling round data but haven't saved it yet. Do you want to save the changes?",
          actionItems: [
            {
              label: "Confirm changes",
              event: {
                id: "4e66c6a6",
                event: "click",
                method: "run",
                pluginId: "",
                type: "script",
                waitMs: 0,
                waitType: "debounce",
                params: {
                  map: {
                    src: "await btnSave_OnClick.trigger();\nbtnAddEditSite_OnClick.trigger({\n  additionalScope:{\n    selectedSite: item\n  }\n});",
                  },
                },
              },
            },
            {
              label: "Revert changes",
              event: {
                id: "afb932f0",
                event: "click",
                method: "run",
                pluginId: "",
                type: "script",
                waitMs: 0,
                waitType: "debounce",
                params: {
                  map: {
                    src: "await btnCancel_OnClick.trigger();\nbtnAddEditSite_OnClick.trigger({\n  additionalScope:{\n    selectedSite: item\n  }\n});",
                  },
                },
              },
            },
          ],
        }}
        pluginId=""
        type="actionSheet"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        id="4fc701ee"
        enabled="{{ !trnIsDirty.value }}"
        event="press"
        method="trigger"
        params={{
          map: {
            options: {
              map: { additionalScope: { map: { selectedSite: "{{ item }}" } } },
            },
          },
        }}
        pluginId="btnAddEditSite_OnClick"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        id="e1d9c7fd"
        event="buttonPress"
        method="trigger"
        params={{
          map: {
            options: {
              map: { additionalScope: { map: { selectedItem: "{{ item }}" } } },
            },
          },
        }}
        pluginId="btnScorecard_OnClick"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </CollectionView>
    <Status
      id="status3"
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
      value="{{ varSelectedSamplingRound.value.pending_update ? 'pending' : '' }}"
    />
    <NumberInput
      id="txtYear"
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' || varSelectedSamplingRound.value.year != undefined }}"
      label="Year"
      placeholder={0}
      required="{{ varSelectedSamplingRound.value.sampling_type == 'type_yearly' && varSelectedSamplingRound.value.year == undefined }}"
      showStepper={true}
      stepSize={1}
      value={'{{ moment().format("yyyy") }}'}
    />
    <CollectionView
      id="lstSitesOfficial"
      bodyByIndex={
        'Taken at {{ moment(item.sample_taken_date).format("MMM D, yyyy") }}'
      }
      cardStyle="elevated"
      data="{{ sampling_site_display.data }}"
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_official' }}"
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
      subtitleByIndex="{{ `(${item.lat}, ${item.lon})`}}"
      subtitleLengthByIndex="2"
      suffixIconByIndex="bold/interface-arrows-button-right"
      suffixTextByIndex="Scorecard"
      suffixTypeByIndex="none"
      suffixValueByIndex="false"
      titleByIndex="{{ item.site_name }}"
    >
      <Event
        id="1ef7a2d5"
        enabled="{{ trnIsDirty.value }}"
        event="press"
        method="open"
        params={{
          title: "Update sampling round?",
          description:
            "You made changes on sampling round data but haven't saved it yet. Do you want to save the changes?",
          actionItems: [
            {
              label: "Confirm changes",
              event: {
                id: "51071117",
                event: "click",
                method: "run",
                pluginId: "",
                type: "script",
                waitMs: 0,
                waitType: "debounce",
                params: {
                  map: {
                    src: "await btnSave_OnClick.trigger();\nbtnAddEditSite_OnClick.trigger({\n  additionalScope:{\n    selectedSite: item\n  }\n});",
                  },
                },
              },
            },
            {
              label: "Revert changes",
              event: {
                id: "83c8a02d",
                event: "click",
                method: "run",
                pluginId: "",
                type: "script",
                waitMs: 0,
                waitType: "debounce",
                params: {
                  map: {
                    src: "await btnCancel_OnClick.trigger();\nbtnAddEditSite_OnClick.trigger({\n  additionalScope:{\n    selectedSite: item\n  }\n});",
                  },
                },
              },
            },
          ],
        }}
        pluginId=""
        type="actionSheet"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        id="f3511daa"
        enabled="{{ !trnIsDirty.value }}"
        event="press"
        method="trigger"
        params={{
          map: {
            options: {
              map: { additionalScope: { map: { selectedSite: "{{ item }}" } } },
            },
          },
        }}
        pluginId="btnAddEditSite_OnClick"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </CollectionView>
    <Fab
      id="btnAddSite"
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' }}"
      icon="bold/interface-add-1"
    >
      <Event
        id="f9d97fec"
        enabled="{{ !trnIsDirty.value }}"
        event="click"
        method="trigger"
        params={{ map: { options: { map: { additionalScope: {} } } } }}
        pluginId="btnAddNewSiteOptions"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        id="f2e48799"
        enabled="{{ trnIsDirty.value }}"
        event="click"
        method="open"
        params={{
          description:
            "You made changes on sampling round data but haven't saved it yet. Do you want to save the changes?",
          title: "Update sampling round?",
          actionItems: [
            {
              label: "Confirm changes",
              event: {
                id: "b2e05ad5",
                event: "click",
                method: "run",
                pluginId: "",
                type: "script",
                waitMs: 0,
                waitType: "debounce",
                params: {
                  map: {
                    src: "\n\nif (varSelectedSamplingRound.value.sampling_type == 'type_yearly' && varSelectedSamplingRound.value.year == undefined && (txtYear.value == undefined || txtYear.value == ''))\n    displayErrorMessage.trigger({\n      additionalScope:{\n        alertObject: {\n          title: 'Invalid Year',\n          message: 'Please specify which year this sampling for'\n        }\n      }\n    });\nelse\n{\n  await btnSave_OnClick.trigger();\n  btnAddNewSiteOptions.trigger();\n}",
                  },
                },
              },
            },
            {
              label: "Revert changes",
              event: {
                id: "5bd44538",
                event: "click",
                method: "run",
                pluginId: "",
                type: "script",
                waitMs: 0,
                waitType: "debounce",
                params: {
                  map: {
                    src: "await btnCancel_OnClick.trigger();\nbtnAddEditSite_OnClick.trigger({\n  additionalScope:{\n    selectedSite: undefined\n  }\n});",
                  },
                },
              },
            },
          ],
        }}
        pluginId=""
        type="actionSheet"
        waitMs="0"
        waitType="debounce"
      />
    </Fab>
    <DatePicker
      id="dtForecastDate"
      displayTimeZone="local"
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' }}"
      label="Forecast Date Override"
      labelCaption="Calculated: {{ varSelectedSamplingRound.value?.forecast_date_calculated }}"
      mode="date"
      value="{{ varSelectedSamplingRound.value?.forecast_date_override }}"
      valueTimeZone="local"
    />
    <DatePicker
      id="dtScheduledDate"
      displayTimeZone="local"
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' }}"
      label="Scheduled Date"
      mode="date"
      value="{{ varSelectedSamplingRound.value?.sampling_scheduled_date }}"
      valueTimeZone="local"
    />
    <NumberInput id="numberInput3" placeholder={0} stepSize={1} />
    <Multiselect
      id="selCFAsSamplers"
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' }}"
      label="CF Staffs as Samplers"
      labelPosition="top"
      labels=""
      placeholder="Select staff names"
      value="{{ varSelectedSamplingRound.value?.cf_staff_as_sampler_ids }}"
      values={
        '["test", "10.0.1.9", "Adrian Vandenbergh","Alec Downey","Alec Neville","Alexis Terry"]'
      }
    />
    <NumberInput
      id="txtNumOfMobs"
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' }}"
      label="Number of mobs"
      placeholder={0}
      showStepper={true}
      stepSize={1}
      value="{{ varSelectedSamplingRound.value?.num_of_mobs }}"
    />
    <NumberInput id="numberInput2" placeholder={0} stepSize={1} />
    <NumberInput
      id="txtNumOfLivestock"
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' }}"
      label="Number of livestock (head)"
      placeholder={0}
      showStepper={true}
      stepSize={1}
      value="{{ varSelectedSamplingRound.value?.num_of_livestocks }}"
    />
    <NumberInput
      id="txtNumOfPaddock"
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' }}"
      label="Number of paddocks"
      placeholder={0}
      showStepper={true}
      stepSize={1}
      value="{{ varSelectedSamplingRound.value?.num_of_paddocks }}"
    />
    <NumberInput id="numberInput1" placeholder={0} stepSize={1} />
    <NumberInput
      id="txtTotalGrazingArea"
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' }}"
      label="Total grazing area (ha)"
      placeholder={0}
      showStepper={true}
      stepSize={1}
      value="{{ varSelectedSamplingRound.value?.total_grazing_area }}"
    />
    <Multiselect
      id="multiselect1"
      labelPosition="top"
      labels="['Foo', 'Bar', 'Baz']"
      placeholder="Select options"
      value="[]"
      values="['foo', 'bar', 'baz']"
    />
    <DatePicker
      id="datePicker1"
      displayTimeZone="local"
      label="Date"
      mode="date"
      value="{{ new Date() }}"
      valueTimeZone="local"
    />
    <TextArea
      id="txtNote_SamplingRound"
      autoCorrect={true}
      hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' }}"
      label="Note"
      labelCaption="e.g. reason for scheduled/forecast date change"
      minLines={4}
      placeholder="e.g. reason for scheduled/forecast date change"
      value="{{ varSelectedSamplingRound.value?.note }}"
    />
  </TabbedContainer>
</Screen>
