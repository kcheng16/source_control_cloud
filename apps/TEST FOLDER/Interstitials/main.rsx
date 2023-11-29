<App>
  <Include src="./functions.rsx" />
  <Include src="./src/createDrawerFrame.rsx" />
  <Include src="./src/endConfirmationFrame.rsx" />
  <Include src="./src/publishConfirmFrame.rsx" />
  <Include src="./sidebar.rsx" />
  <Include src="./src/viewDrawerFrame.rsx" />
  <Include src="./src/viewersDrawerFrame.rsx" />
  <Frame
    id="$main"
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    paddingType="normal"
    sticky={null}
    type="main"
  >
    <Text
      id="interstitialsHeader"
      value="## Interstitials"
      verticalAlign="center"
    />
    <Button
      id="createInterstitialButton"
      disabled=""
      iconBefore="bold/interface-add-1"
      styleVariant="solid"
      text="Create Interstitial"
    >
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="createDrawerFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Tabs
      id="interstitialsStateTabs"
      itemMode="static"
      style={{
        ordered: [
          { selectedText: "rgb(103, 99, 126)" },
          { selectedBackground: "rgba(239, 184, 135, 0.2)" },
          { hoverText: "" },
          { unselectedText: "" },
        ],
      }}
      value="{{ self.values[0] }}"
    >
      <Option id="3e0c5" label="All" value="''" />
      <Option id="834b3" label="Drafts" value="draft" />
      <Option id="c5e2b" label="Testing" value="test" />
      <Option
        id="3a72b"
        disabled={false}
        hidden={false}
        iconPosition="left"
        label="Published"
        value="active"
      />
      <Option
        id="a80cd"
        disabled={false}
        hidden={false}
        iconPosition="left"
        label="Archived"
        value="archive"
      />
      <Event
        event="change"
        method="resetFilterStack"
        params={{ ordered: [] }}
        pluginId="interstitialsTable"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="searchInput"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Tabs>
    <Divider id="divider1" />
    <Multiselect
      id="statusMultiselect"
      data=""
      emptyMessage="No options"
      hidden="true"
      hiddenByIndex=""
      label=""
      labels="{{ _.startCase(item) }}"
      overlayMaxHeight={375}
      placeholder="Filter by status"
      showSelectionIndicator={true}
      values="{{ item }}"
      wrapTags={true}
    />
    <TextInput
      id="searchInput"
      hidden="false"
      label=""
      placeholder="Search {{interstitialsStateTabs.selectedLabel}}"
    >
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getInterstitialsPage"
        type="datasource"
        waitMs=""
        waitType="debounce"
      />
    </TextInput>
    <Table
      id="interstitialsTable"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{renderedInterstitials.value}}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      defaultSort={[{ object: { columnId: "d0599", direction: "asc" } }]}
      enableSaveActions={true}
      groupByColumns={{}}
      hasNextPage="{{nextCursor.value !== null}}"
      nextAfterCursor="{{nextCursor.value}}"
      overflowType="pagination"
      persistRowSelection={true}
      rowHeight="medium"
      serverPaginated={true}
      serverPaginationType="forwardCursorBased"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      style={{ background: "" }}
      templatePageSize="{{interstitialPageCount.value}}"
      toolbarPosition="bottom"
    >
      <Column
        id="9fb4a"
        alignment="left"
        format="image"
        formatOptions={{
          icon: '{{ { success:  "/icon:bold/interface-validation-check-circle"  }[item] }}',
          widthType: "fit",
        }}
        groupAggregationMode="none"
        key="data"
        label="Icon"
        placeholder="Enter value"
        position="center"
        referenceId="icon"
        size={73.71875}
        summaryAggregationMode="none"
        valueOverride="{{item.menuIcon.imageUrl}}"
      >
        <Event
          event="clickCell"
          method="openUrl"
          params={{ ordered: [{ url: "{{ item }}" }] }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="d0599"
        alignment="left"
        editable={false}
        format="string"
        formatOptions={{ notation: "standard" }}
        groupAggregationMode="none"
        key="name"
        label="Name"
        placeholder="Enter value"
        position="center"
        size={147}
        summaryAggregationMode="none"
      />
      <Column
        id="200b4"
        alignment="left"
        editableOptions={{ allowCustomValue: true }}
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="status"
        label="Status"
        optionList={{
          manualData: [],
          mode: "mapped",
          mappedData: "{{ Object.keys(statusMap.value) }}",
          valueByIndex: "{{ item }}",
          labelByIndex: "{{ statusMap.value[item].label }}",
          colorByIndex: "{{ statusMap.value[item].color }}",
        }}
        placeholder="Select option"
        position="center"
        size={96.46875}
        summaryAggregationMode="none"
      />
      <Column
        id="a6244"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        key="priority"
        label="Priority"
        placeholder="Enter value"
        position="center"
        size={67}
      />
      <Column
        id="8d5b7"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="datetime"
        formatOptions={{
          showSeparators: true,
          notation: "standard",
          dateFormat: "yyyy-MM-dd",
          timeFormat: "hh:mm",
          manageTimeZone: true,
          valueTimeZone: "00:00",
          displayTimeZone: "00:00",
        }}
        key="startTime"
        label="Start time"
        placeholder="Enter value"
        position="center"
        size={149.28125}
      >
        <Event
          event="clickCell"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="getInterstitialsPage"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="cbf23"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="datetime"
        formatOptions={{
          showSeparators: true,
          notation: "standard",
          dateFormat: "yyyy-MM-dd",
          timeFormat: "hh:mm",
          manageTimeZone: true,
          valueTimeZone: "00:00",
          displayTimeZone: "00:00",
        }}
        key="endTime"
        label="End time"
        placeholder="Enter value"
        position="center"
        size={159.28125}
      />
      <Column
        id="4f2ee"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        key="audience"
        label="Audience"
        placeholder="Enter value"
        position="center"
        referenceId="audience"
        size={100}
      />
      <Column
        id="b08f8"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="datetime"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="updatedAt"
        label="Updated at"
        placeholder="Enter value"
        position="center"
        size={157}
        summaryAggregationMode="none"
      >
        <Event
          event="clickCell"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="getInterstitialsPage"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="f4eab"
        alignment="left"
        format="html"
        placeholder="Enter value"
        position="center"
        size={100}
        valueOverride={
          '<div class="tablebutton"><div classname="prefixicon-view"><p>View</p></div></div>'
        }
      >
        <Event
          event="clickCell"
          method="setValue"
          params={{ ordered: [{ value: "{{currentSourceRow.name}}" }] }}
          pluginId="selectedInterstitialName"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickCell"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="getSelectedInterstitial"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickCell"
          method="show"
          params={{ ordered: [] }}
          pluginId="viewDrawerFrame"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
    </Table>
  </Frame>
</App>
