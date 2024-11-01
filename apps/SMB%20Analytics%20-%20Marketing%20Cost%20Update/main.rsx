<App>
  <Include src="./functions.rsx" />
  <Include src="./header.rsx" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <TextInput
      id="textInput1"
      label="Global Search
"
      labelPosition="top"
      placeholder="Enter value"
    />
    <Table
      id="table1"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ GetCostData.data }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      defaultSort={[{ object: { columnId: "b3d61", direction: "desc" } }]}
      emptyMessage="No rows found"
      enableSaveActions={true}
      primaryKeyColumnId="b3d61"
      searchTerm="{{ textInput1.value }}"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="b3d61"
        alignment="left"
        editable={false}
        editableOptions={{ object: {} }}
        format="date"
        formatOptions={{ dateFormat: "yyyy-MM-dd" }}
        groupAggregationMode="none"
        key="FILE_DATE"
        label="File date"
        placeholder="Enter value"
        position="center"
        size={89.234375}
        summaryAggregationMode="none"
      />
      <Column
        id="14103"
        alignment="left"
        editable="true"
        editableOptions={{ object: {} }}
        format="date"
        formatOptions={{ dateFormat: "yyyy-MM-dd" }}
        groupAggregationMode="none"
        key="DROP_DATE"
        label="Drop date"
        placeholder="Enter value"
        position="center"
        size={89.234375}
        summaryAggregationMode="none"
      />
      <Column
        id="347d1"
        alignment="left"
        editable="true"
        editableOptions={{ object: {} }}
        format="date"
        formatOptions={{ dateFormat: "yyyy-MM-dd" }}
        groupAggregationMode="none"
        key="DATE_IN_BUSINESS"
        label="Date in business"
        placeholder="Enter value"
        position="center"
        size={109.390625}
        summaryAggregationMode="none"
      />
      <Column
        id="c9370"
        alignment="right"
        editable="true"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="DROP_COST"
        label="Drop cost"
        placeholder="Enter value"
        position="center"
        size={71.234375}
        summaryAggregationMode="none"
      />
      <Column
        id="89594"
        alignment="left"
        editable="true"
        editableOptions={{ object: {} }}
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="TRIGGER_OR_MONTHLY"
        label="Trigger or monthly"
        placeholder="Select option"
        position="center"
        size={120.515625}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="9cb98"
        alignment="left"
        editable="true"
        editableOptions={{ object: {} }}
        format="string"
        groupAggregationMode="none"
        key="MONTH_ATTRIBUTED"
        label="Month attributed"
        placeholder="Enter value"
        position="center"
        size={111.78125}
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
          pluginId="table1"
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
          method="refresh"
          pluginId="table1"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <Event
        event="save"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="query2"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
  </Frame>
</App>
