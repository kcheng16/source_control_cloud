<ModalFrame
  id="Modal_PA_Lookup"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showHeader={true}
  showOverlay={true}
  size="large"
>
  <Header>
    <Text
      id="modalTitle2"
      value="### Prior Authorization Viewer"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton2"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="Modal_PA_Lookup"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <TextInput
      id="PAViewer_MemberID_input"
      label="Member ID"
      placeholder="Enter value"
      showClear={true}
    />
    <TextInput
      id="PAViewer_HSAuthID_input"
      label="HS Auth ID"
      placeholder="Enter value"
      showClear={true}
    />
    <Button
      id="button2"
      disabled="{{ PAViewer_MemberID_input.value == '' && PAViewer_HSAuthID_input.value == '' }}"
      text="Search"
    >
      <Event
        event="click"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { onSuccess: null },
                  { onFailure: null },
                  { additionalScope: { ordered: [{ LOB: "PHP" }] } },
                ],
              },
            },
          ],
        }}
        pluginId="pull_PA"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Table
      id="PAViewer_table"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ pull_PA.data }}"
      defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      persistRowSelection={true}
      primaryKeyColumnId="42591"
      rowHeight="small"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="23840"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="false"
        key="fldMemberID"
        label="Member ID"
        placeholder="Enter value"
        position="center"
        size={82.9375}
        summaryAggregationMode="none"
      />
      <Column
        id="96393"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        hidden="false"
        key="MemberName"
        label="Member Name"
        placeholder="Enter value"
        position="center"
        size={137}
        summaryAggregationMode="none"
      />
      <Column
        id="42591"
        alignment="left"
        editable={false}
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="fldHSAuthID"
        label="HS Auth ID"
        placeholder="Enter value"
        position="center"
        size={83.84375}
        summaryAggregationMode="none"
      />
      <Column
        id="6ef38"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="fldEQLink"
        label="EQ Link"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="49a1d"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="fldRequestStatus"
        label="Auth Status"
        placeholder="Select option"
        position="center"
        size={152.171875}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="5fae7"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="fldAuthTypeDesc"
        label="Type"
        placeholder="Select option"
        position="center"
        size={131.296875}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="2df11"
        alignment="left"
        format="date"
        formatOptions={{ dateFormat: "MM/dd/yyyy" }}
        groupAggregationMode="none"
        key="fldBeginDate"
        label="Start Date"
        placeholder="Enter value"
        position="center"
        size={83.75}
        summaryAggregationMode="none"
      />
      <Column
        id="a301e"
        alignment="left"
        format="date"
        formatOptions={{ dateFormat: "MM/dd/yyyy" }}
        groupAggregationMode="none"
        key="fldEndDate"
        label="End Date"
        placeholder="Enter value"
        position="center"
        size={84.0625}
        summaryAggregationMode="none"
      />
      <Column
        id="f3d0a"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="RefProvID"
        label="Referring Provider ID"
        placeholder="Enter value"
        position="center"
        size={133.453125}
        summaryAggregationMode="none"
      />
      <Column
        id="35815"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="RefProvName"
        label="Referring Provider Name"
        placeholder="Enter value"
        position="center"
        size={226.828125}
        summaryAggregationMode="none"
      />
      <Column
        id="d051f"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="ServProvID"
        label="Servicing Provider ID"
        placeholder="Enter value"
        position="center"
        size={134.421875}
        summaryAggregationMode="none"
      />
      <Column
        id="47a1a"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="ServProvName"
        label="Servicing Provider Name"
        placeholder="Enter value"
        position="center"
        size={215.828125}
        summaryAggregationMode="none"
      />
      <ToolbarButton
        id="1a"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
      <Event
        event="clickRow"
        method="hide"
        params={{ ordered: [] }}
        pluginId="Modal_PA_Lookup"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
  </Body>
</ModalFrame>
