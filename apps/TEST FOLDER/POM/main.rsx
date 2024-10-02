<App>
  <Include src="./functions.rsx" />
  <Include src="./header.rsx" />
  <Include src="./sidebar.rsx" />
  <Include src="./src/splitPaneFrame1.rsx" />
  <Frame
    id="$main"
    enableFullBleed={true}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="0"
    sticky={null}
    type="main"
  >
    <Table
      id="table1"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ getLoanListBlue.data }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      dynamicColumnProperties={{ formatByIndex: "auto" }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      primaryKeyColumnId="fc9c4"
      rowBackgroundColor=""
      rowHeight="medium"
      searchTerm="{{ globalSearch.value || null }}"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      style={{ borderRadius: "10px" }}
      toolbarPosition="bottom"
    >
      <Column
        id="fc9c4"
        alignment="left"
        editable="false"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="ID"
        label="ID"
        placeholder="Enter value"
        position="center"
        size={109}
        summaryAggregationMode="none"
      />
      <Column
        id="fa573"
        alignment="left"
        editable="false"
        format="string"
        groupAggregationMode="none"
        key="ML Loan Number"
        label="ML Number"
        placeholder="Enter value"
        position="center"
        size={107.296875}
        summaryAggregationMode="none"
      />
      <Column
        id="9316e"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        hidden="false"
        key="First Name"
        label="First name"
        placeholder="Enter value"
        position="center"
        size={83.578125}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="79b88"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="Last Name"
        label="Last name"
        placeholder="Enter value"
        position="center"
        size={79.296875}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="71db3"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="Status"
        label="Status"
        optionList={{
          mode: "manual",
          manualData: [
            {
              ordered: [
                { value: "Markiii Approved" },
                { label: "Approved" },
                { color: "rgb(123, 188, 73)" },
                { textColor: "rgb(255, 255, 255)" },
                { icon: "bold/interface-validation-check-alternate" },
              ],
            },
            {
              ordered: [
                { value: "Auto Decline" },
                { label: "Declined" },
                { color: "rgb(177, 70, 56)" },
                { textColor: "rgb(255, 255, 255)" },
                { icon: "bold/interface-user-delete" },
              ],
            },
            {
              ordered: [
                { value: "Pending" },
                { label: "In Progress" },
                { color: "rgb(89, 176, 189)" },
                { textColor: "rgb(255, 255, 255)" },
                { icon: "bold/interface-time-rewind" },
              ],
            },
            { ordered: [{ value: "Bank Approved" }] },
            { ordered: [{ value: "Manual Review" }] },
          ],
        }}
        placeholder="Select option"
        position="center"
        size={127.15625}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="ac766"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        hidden="true"
        key="State"
        label="State"
        placeholder="Enter value"
        position="center"
        size={55.078125}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="e2c47"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="Zip"
        label="Zip"
        placeholder="Enter value"
        position="center"
        size={54.875}
        summaryAggregationMode="none"
      />
      <Column
        id="f3c10"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="Publisher"
        label="Publisher"
        placeholder="Enter value"
        position="center"
        size={87.5625}
        summaryAggregationMode="none"
      />
      <Column
        id="983d4"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="Click ID"
        label="Click id"
        placeholder="Enter value"
        position="center"
        size={57.328125}
        summaryAggregationMode="none"
      />
      <ToolbarButton
        id="1a"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
      <ToolbarButton
        id="b64bf"
        icon="bold/interface-text-formatting-list-bullets"
        label="Group by"
        type="groupBy"
      />
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      />
      <Event
        event="selectRow"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getLoanApplicationFromRow"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
  </Frame>
</App>
