<Screen
  id="page1"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title="Page 1"
  urlSlug=""
>
  <SqlQueryUnified
    id="getApplicationAccessOverview"
    query={include("../lib/getApplicationAccessOverview.sql", "string")}
    resourceDisplayName="ReToolReadOnly"
    resourceName="9066bf81-26a7-448b-ab59-81b05b8861ba"
    resourceTypeOverride=""
    warningCodes={[]}
  />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    type="main"
  >
    <TextInput
      id="emailSearch"
      label="Email"
      labelPosition="top"
      placeholder="Enter value"
    />
    <TextInput
      id="groupSearch"
      label="Group"
      labelPosition="top"
      placeholder="Enter value"
    />
    <TextInput
      id="appSearch"
      label="Application"
      labelPosition="top"
      placeholder="Enter value"
    />
    <TextInput
      id="nameSearch"
      label="Name"
      labelPosition="top"
      placeholder="Enter value"
    />
    <TextInput
      id="folderSearch"
      label="Folder"
      labelPosition="top"
      placeholder="Enter value"
    />
    <Table
      id="table1"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ getApplicationAccessOverview.data }}"
      defaultFilters={{
        0: {
          id: "b1b4b",
          columnId: "43cb5",
          operator: "includes",
          value: "{{ emailSearch.value }}",
          disabled: false,
        },
        1: {
          id: "fcd8f",
          columnId: "e1ed7",
          operator: "includes",
          value: "{{ nameSearch.value }}",
          disabled: false,
        },
        2: {
          id: "9a9a5",
          columnId: "a210a",
          operator: "includes",
          value: "{{ groupSearch.value }}",
          disabled: false,
        },
        3: {
          id: "d3fa9",
          columnId: "36e10",
          operator: "includes",
          value: "{{ folderSearch.value }}",
          disabled: false,
        },
        4: {
          id: "96f72",
          columnId: "33f77",
          operator: "includes",
          value: "{{ appSearch.value }}",
          disabled: false,
        },
      }}
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="43cb5"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover" }}
        groupAggregationMode="none"
        key="Email"
        label="Email"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="e1ed7"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="Name"
        label="Name"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="a210a"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="groupName"
        label="Group name"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="36e10"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="folderName"
        label="Folder name"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="33f77"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="appName"
        label="App name"
        placeholder="Enter value"
        position="center"
        size={427}
        summaryAggregationMode="none"
      />
      <Column
        id="cfaed"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="Access Level"
        label="Access level"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
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
    </Table>
  </Frame>
</Screen>
