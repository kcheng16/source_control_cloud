<Screen
  id="CaseList"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title="CaseList"
  urlSlug=""
>
  <Function
    id="calc_DueInDays"
    funcBody={include("../lib/calc_DueInDays.js", "string")}
  />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Multiselect
      id="CaseList_DueInDays_filter"
      captionByIndex=""
      colorByIndex=""
      data="{{ [...new Set(Object.values(calc_DueInDays.value.categorized))] }}"
      disabledByIndex=""
      emptyMessage="No options"
      fallbackTextByIndex=""
      hiddenByIndex=""
      iconByIndex=""
      imageByIndex=""
      label="Due In Days"
      labelPosition="top"
      labels=""
      labelWidth="20"
      labelWrap={true}
      maxLines="3"
      minLines="3"
      overlayMaxHeight={375}
      overlayMinWidth=""
      placeholder="Select options"
      showClear={true}
      showSelectionIndicator={true}
      tooltipByIndex=""
      value="{{ self.values }}"
      values="{{ item }}"
      wrapTags={true}
    />
    <Multiselect
      id="CaseList_CurrentStage_filter"
      captionByIndex=""
      colorByIndex=""
      data="{{ [...new Set(pull_CaseList.data.latest_audit_event
               .map(x => ['Case_Open', 'Case_Converted', 'Case_Withdrawn',
                          'Case_Dismissed', 'Case_Closed'].includes(x) ? x : 'In Progress'))] }}"
      disabledByIndex=""
      emptyMessage="No options"
      fallbackTextByIndex=""
      hiddenByIndex=""
      iconByIndex=""
      imageByIndex=""
      label="Current Stage"
      labelPosition="top"
      labels="{{ ['Case_Open', 'Case_Converted', 'Case_Withdrawn', 'Case_Dismissed', 'Case_Closed'].includes(item) ? item.replace('_', ' ') : 'In Progress' }}"
      labelWidth="20"
      labelWrap={true}
      maxLines="3"
      minLines="3"
      overlayMaxHeight={375}
      placeholder="Select options"
      showClear={true}
      showSelectionIndicator={true}
      tooltipByIndex=""
      value="['Case_Open', 'In Progress']"
      values="{{ item }}"
      wrapTags={true}
    />
    <Multiselect
      id="CaseList_CaseType_filter"
      data="{{ [...new Set(pull_CaseList.data.casetype_description)] }}"
      emptyMessage="No options"
      label="Case Type"
      labelPosition="top"
      labelWidth="20"
      labelWrap={true}
      maxLines="3"
      minLines="3"
      overlayMaxHeight={375}
      placeholder="Select options"
      showClear={true}
      showSelectionIndicator={true}
      value="{{ self.values }}"
      wrapTags={true}
    />
    <Multiselect
      id="CaseList_CaseOwner_filter"
      data="{{ [...new Set(pull_CaseList.data.Case_Owner)] }}"
      emptyMessage="No options"
      label="Case Owner"
      labelPosition="top"
      labelWidth="20"
      labelWrap={true}
      maxLines="3"
      minLines="3"
      overlayMaxHeight={375}
      overlayMinWidth=""
      placeholder="Select options"
      showClear={true}
      showSelectionIndicator={true}
      value="{{ self.values }}"
      wrapTags={true}
    />
    <Divider id="divider5" />
    <Table
      id="CaseList_table"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{
  formatDataAsArray(pull_CaseList.data)
  .filter(x =>
    (CaseList_CurrentStage_filter.value.includes(x.latest_audit_event)
    || (CaseList_CurrentStage_filter.value.includes('In Progress') 
        && !['Case_Open', 'Case_Converted', 'Case_Withdrawn', 'Case_Dismissed', 'Case_Closed'].includes(x.latest_audit_event)))
    && CaseList_CaseType_filter.value.includes(x.casetype_description)
    && CaseList_CaseOwner_filter.value.includes(x.Case_Owner)
    )
}}"
      defaultFilters={{
        0: {
          ordered: [
            { id: "963fd" },
            { columnId: "d1a84" },
            { operator: "isOneOf" },
            { value: "{{ CaseList_DueInDays_filter.value }}" },
            { disabled: false },
          ],
        },
      }}
      defaultSelectedRow={{
        mode: "none",
        indexType: "display",
        index: 0,
        key: "{{ global_case_id.value }}",
      }}
      defaultSort={[{ object: { columnId: "7604e", direction: "desc" } }]}
      emptyMessage="No rows found"
      enableSaveActions={true}
      persistRowSelection={true}
      primaryKeyColumnId="7604e"
      rowHeight="xsmall"
      showBorder={true}
      showColumnBorders={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="ec83a"
        alignment="left"
        format="button"
        formatOptions={{ automaticColors: true, variant: "outline" }}
        groupAggregationMode="none"
        key="Button"
        placeholder="Select option"
        position="center"
        size={92.140625}
        summaryAggregationMode="none"
      >
        <Event
          event="clickCell"
          method="openPage"
          params={{
            ordered: [
              { pageName: "CaseViewer" },
              {
                options: {
                  ordered: [
                    { queryParams: [] },
                    { passDataWith: "urlParams" },
                    { hashParams: [] },
                  ],
                },
              },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickCell"
          method="setValue"
          params={{ map: { value: "{{ currentRow?.case_id }}" } }}
          pluginId="global_case_id"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickCell"
          method="setValue"
          params={{ map: { value: "{{ CaseList_table?.selectedRow }}" } }}
          pluginId="global_case_header"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="7604e"
        alignment="left"
        editable={false}
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="case_id"
        label="Case ID"
        placeholder="Enter value"
        position="center"
        size={82.21875}
        summaryAggregationMode="none"
      />
      <Column
        id="ed4c0"
        alignment="left"
        cellTooltip="{{ item.replaceAll('_', ' ') }}"
        cellTooltipMode="custom"
        editableOptions={{ allowCustomValue: false }}
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="latest_audit_event"
        label="Current Stage"
        optionList={{
          mode: "mapped",
          mappedData:
            "{{ [...new Set(pull_CaseList.data.latest_audit_event)] }}",
          valueByIndex: "{{ item }}",
          labelByIndex:
            "{{ ['Case_Open', 'Case_Converted', 'Case_Withdrawn', 'Case_Dismissed', 'Case_Closed'].includes(item) ? item.replace('_', ' ') : 'In Progress' }}",
          captionByIndex: "",
          colorByIndex: "",
        }}
        placeholder="Select option"
        position="center"
        referenceId="Current_Stage_Simplified"
        size={131}
        summaryAggregationMode="none"
      />
      <Column
        id="d8aa0"
        alignment="left"
        editableOptions={{ allowCustomValue: true }}
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        hidden="true"
        key="latest_audit_event"
        label="Current Stage Raw"
        optionList={{
          manualData: [
            { ordered: [{ value: "Case Open" }] },
            { ordered: [{ value: "Health Plan Reconsideration" }] },
            { ordered: [{ value: "IRE Reconsideration" }] },
            {
              ordered: [
                { value: "Case Converted" },
                { color: "{{ theme.canvas }}" },
              ],
            },
            {
              ordered: [
                { value: "Case Withdrawn" },
                { color: "{{ theme.canvas }}" },
              ],
            },
            {
              ordered: [
                { value: "Case Dismissed" },
                { color: "{{ theme.canvas }}" },
              ],
            },
            {
              ordered: [
                { value: "Case Closed" },
                { color: "{{ theme.canvas }}" },
              ],
            },
          ],
        }}
        placeholder="Select option"
        position="center"
        size={264.625}
        summaryAggregationMode="none"
        valueOverride="{{  item.replaceAll('_', ' ') }}"
      />
      <Column
        id="215d9"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        label="Due In Days"
        placeholder="Enter value"
        position="center"
        referenceId="due_in_days_raw"
        size={128.390625}
        summaryAggregationMode="none"
        valueOverride="{{ 
  calc_DueInDays.value.raw[currentSourceRow.case_id] == null || calc_DueInDays.value.raw[currentSourceRow.case_id] == 'ASAP'
    ? calc_DueInDays.value.raw[currentSourceRow.case_id]
    : (calc_DueInDays.value.raw[currentSourceRow.case_id]?.hours < 0
       ? 'Overdue ' + (-calc_DueInDays.value.raw[currentSourceRow.case_id]?.days) + 'd ' + (-calc_DueInDays.value.raw[currentSourceRow.case_id]?.hours) + 'h'
       : calc_DueInDays.value.raw[currentSourceRow.case_id]?.days + 'd ' + calc_DueInDays.value.raw[currentSourceRow.case_id]?.hours + 'h')
}}"
      />
      <Column
        id="d1a84"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="average"
        hidden="true"
        label="Due In Days Category"
        optionList={{
          manualData: [
            {
              ordered: [
                { value: "Not Applicable" },
                { color: "{{ theme.canvas }}" },
              ],
            },
            {
              ordered: [{ value: "Overdue" }, { color: "{{ theme.danger }}" }],
            },
            {
              ordered: [
                { value: "Less than 3 days" },
                { color: "rgba(242, 248, 46, 1)" },
              ],
            },
            {
              ordered: [
                { value: "3-10 days" },
                { color: "rgba(197, 238, 141, 1)" },
              ],
            },
            {
              ordered: [
                { value: "Greater than 10 days" },
                { color: "rgba(119, 246, 123, 1)" },
              ],
            },
            { ordered: [{ value: "ASAP" }] },
          ],
        }}
        placeholder="Select option"
        position="center"
        referenceId="due_in_days_categorized"
        size={150.109375}
        summaryAggregationMode="none"
        valueOverride="{{ calc_DueInDays.value.categorized[currentSourceRow.case_id] }}"
      />
      <Column
        id="6435b"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="latest_milestone_event"
        label="Latest Milestone Event"
        placeholder="Enter value"
        position="center"
        size={175.203125}
        summaryAggregationMode="none"
      />
      <Column
        id="2bcf0"
        alignment="left"
        format="datetime"
        formatOptions={{ dateFormat: "MM/dd/yyyy" }}
        groupAggregationMode="none"
        hidden="true"
        key="latest_milestone_datetime"
        label="Latest Milestone Datetime"
        placeholder="Enter value"
        position="center"
        size={164.484375}
        summaryAggregationMode="none"
      />
      <Column
        id="33f8c"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="lob"
        label="LOB"
        placeholder="Select option"
        position="center"
        size={75.09375}
        summaryAggregationMode="none"
      />
      <Column
        id="618e1"
        alignment="left"
        cellTooltip="{{ item }}"
        cellTooltipMode="custom"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="casetype_description"
        label="Case Type"
        optionList={{
          manualData: [
            {
              ordered: [
                { value: "Dispute" },
                { color: "rgba(255, 224, 102, 0.5)" },
              ],
            },
            {
              ordered: [
                { value: "Pre-Service Appeal" },
                { color: "rgba(36, 123, 160, 0.5)" },
                { label: "Appeal" },
                { caption: "" },
                { fallbackText: "" },
              ],
            },
            {
              ordered: [
                { value: "Post-Service Appeal" },
                { color: "rgba(112, 193, 179, 0.5)" },
                { label: "Appeal" },
                { caption: "" },
              ],
            },
            { ordered: [{ value: "Reopen" }] },
            { ordered: [{ value: "Inquiry" }] },
          ],
        }}
        placeholder="Select option"
        position="center"
        size={93.015625}
        summaryAggregationMode="none"
      />
      <Column
        id="6d04e"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="case_priority"
        label="Priority"
        optionList={{
          manualData: [
            {
              ordered: [
                { value: "Expedited" },
                { color: "{{ theme.danger }}" },
              ],
            },
            { ordered: [{ value: "Standard" }, { color: "{{ theme.info }}" }] },
            {
              ordered: [
                { value: "NA" },
                { label: "N/A" },
                { color: "{{ theme.canvas }}" },
              ],
            },
          ],
        }}
        placeholder="Select option"
        position="center"
        size={99.9375}
        summaryAggregationMode="none"
      />
      <Column
        id="b2f0d"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="case_initiator"
        label="Case Initiator"
        placeholder="Select option"
        position="center"
        size={177.484375}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="0311f"
        alignment="left"
        format="date"
        formatOptions={{ dateFormat: "MM/dd/yyyy" }}
        groupAggregationMode="none"
        key="Case_Received_Date"
        label="Case Received Date"
        placeholder="Enter value"
        position="center"
        size={140.109375}
        summaryAggregationMode="none"
      />
      <Column
        id="335a2"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="case_memberid"
        label="Member ID"
        placeholder="Enter value"
        position="center"
        size={98.171875}
        summaryAggregationMode="none"
      />
      <Column
        id="6e993"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="case_ref_type"
        label="Case Ref Type"
        optionList={{
          manualData: [
            { ordered: [{ value: "Claim" }] },
            { ordered: [{ value: "PA" }, { label: "Auth" }] },
          ],
        }}
        placeholder="Select option"
        position="center"
        size={102.296875}
        summaryAggregationMode="none"
      />
      <Column
        id="6b1cb"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="case_ref"
        label="Case Reference"
        placeholder="Enter value"
        position="center"
        size={112.65625}
        summaryAggregationMode="none"
      />
      <Column
        id="1fa46"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="Reference_Provider_Name"
        label="Provider Name"
        placeholder="Enter value"
        position="center"
        size={274}
        summaryAggregationMode="none"
      />
      <Column
        id="bb63c"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="Reference_Provider_Contract"
        label="Provider Contract"
        optionList={{
          manualData: [
            { ordered: [{ value: "NCP" }] },
            { ordered: [{ value: "NA" }, { label: "Unknown" }] },
            { ordered: [{ value: "CP" }] },
          ],
        }}
        placeholder="Select option"
        position="center"
        size={122}
        summaryAggregationMode="none"
      />
      <Column
        id="33f43"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="ServiceNow_Ticket_No"
        label="ServiceNow Ticket No"
        placeholder="Enter value"
        position="center"
        size={153}
        summaryAggregationMode="none"
      />
      <Column
        id="b8139"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="latest_audit_event_id"
        label="Latest Audit Event ID"
        placeholder="Enter value"
        position="center"
        size={135.015625}
        summaryAggregationMode="none"
      />
      <Column
        id="844c2"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        hidden="true"
        key="latest_audit_datetime"
        label="Latest Audit Datetime"
        placeholder="Enter value"
        position="center"
        size={148.390625}
        summaryAggregationMode="none"
      />
      <Column
        id="0e8b9"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="none"
        key="Case_Owner"
        label="Case Owner"
        position="center"
        size={180.90625}
        summaryAggregationMode="none"
      >
        <Event
          event="clickCell"
          method="openUrl"
          params={{ ordered: [{ url: "mailto:{{ item }}" }] }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="1ba15"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="sum"
        hidden="true"
        key="WOLAOR_req"
        label="WOLAOR Required"
        optionList={{
          manualData: [
            { ordered: [{ value: "Not Required" }, { label: "" }] },
            { ordered: [{ value: "Require WOL" }] },
            { ordered: [{ value: "Require AOR" }] },
          ],
        }}
        placeholder="Select option"
        position="center"
        size={121.640625}
        summaryAggregationMode="none"
      />
      <ToolbarButton
        id="1a"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
      <ToolbarButton
        id="3c"
        icon="bold/interface-download-button-2"
        label="Download"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="exportData"
          params={{
            ordered: [
              {
                options: {
                  ordered: [{ fileType: "csv" }, { fileName: "GDA" }],
                },
              },
            ],
          }}
          pluginId="CaseList_table"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="trigger"
          params={{
            ordered: [
              {
                options: {
                  object: {
                    onSuccess: null,
                    onFailure: null,
                    additionalScope: null,
                  },
                },
              },
            ],
          }}
          pluginId="pull_CaseList"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
    <Text
      id="Footer"
      value={
        '<hr style="margin-bottom: 0.5em;">\n<p style="text-align: left; margin-top: 0em;">\n    &nbsp;&nbsp;&nbsp;&nbsp;This app <strong>{{ retoolContext.appName }}</strong> is maintained by: <a href="mailto:jason.zhao@ahf.org">Jason Zhao</a>\n    <span style="float: right;">Last modified on: {{ moment(FooterInfo.data.last_modified_date[0]).format(\'YYYY/MM/DD HH:mm:ss\') }} &nbsp;&nbsp;&nbsp;&nbsp;</span>\n</p>'
      }
      verticalAlign="center"
    />
  </Frame>
</Screen>
