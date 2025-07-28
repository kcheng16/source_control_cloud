<ModalFrame
  id="Modal_Claim_Lookup"
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
    <Text id="modalTitle3" value="### Claim Viewer" verticalAlign="center" />
    <Button
      id="modalCloseButton3"
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
        pluginId="Modal_Claim_Lookup"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <TextInput
      id="ClaimViewer_MemberID_input"
      label="Member ID"
      placeholder="Enter value"
      showClear={true}
    />
    <TextInput
      id="ClaimViewer_ClaimNo_input"
      label="Claim Number"
      placeholder="Enter value"
      showClear={true}
    />
    <Button
      id="button3"
      disabled="{{ ClaimViewer_ClaimNo_input.value == '' && ClaimViewer_MemberID_input.value == '' }}"
      text="Search"
    >
      <Event
        event="click"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                ordered: [{ additionalScope: { ordered: [{ LOB: "PHP" }] } }],
              },
            },
          ],
        }}
        pluginId="pull_Claim"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Table
      id="ClaimViewer_table"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ pull_Claim.data }}"
      defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      persistRowSelection={true}
      primaryKeyColumnId="6880c"
      rowHeight="small"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="da561"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="false"
        key="MemberID"
        label="Member ID"
        placeholder="Enter value"
        position="center"
        size={91.3125}
        summaryAggregationMode="none"
      />
      <Column
        id="36043"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        hidden="false"
        key="MemberName"
        label="Member Name"
        placeholder="Enter value"
        position="center"
        size={128.203125}
        summaryAggregationMode="none"
      />
      <Column
        id="6880c"
        alignment="left"
        editable={false}
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="ClaimNumber"
        label="Claim Number"
        placeholder="Enter value"
        position="center"
        size={108.28125}
        summaryAggregationMode="none"
      />
      <Column
        id="e5498"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="ClaimType"
        label="Claim Type"
        placeholder="Select option"
        position="center"
        size={97.875}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="1b72f"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="ClaimStatusDesc"
        label="Claim Status"
        placeholder="Select option"
        position="center"
        size={94.328125}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="5d4a1"
        alignment="left"
        format="date"
        formatOptions={{ dateFormat: "MM/dd/yyyy" }}
        groupAggregationMode="none"
        key="ClaimFromDate"
        label="Claim From Date"
        placeholder="Enter value"
        position="center"
        size={123.8125}
        summaryAggregationMode="none"
      />
      <Column
        id="7401d"
        alignment="left"
        format="date"
        formatOptions={{ dateFormat: "MM/dd/yyyy" }}
        groupAggregationMode="none"
        key="ClaimToDate"
        label="Claim To Date"
        placeholder="Enter value"
        position="center"
        size={110.90625}
        summaryAggregationMode="none"
      />
      <Column
        id="c394a"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="BillingProvID"
        label="Billing Provider ID"
        placeholder="Enter value"
        position="center"
        size={130.234375}
        summaryAggregationMode="none"
      />
      <Column
        id="05495"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="BillingProvName"
        label="Billing Provider Name"
        placeholder="Enter value"
        position="center"
        size={246.859375}
        summaryAggregationMode="none"
      />
      <Column
        id="7ad48"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="fldBillingProvContract"
        label="Billing Provider Contract"
        placeholder="Select option"
        position="center"
        size={159.984375}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="cf4f6"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="RenderingProvID"
        label="Rendering Provider ID"
        placeholder="Enter value"
        position="center"
        size={149.390625}
        summaryAggregationMode="none"
      />
      <Column
        id="570b3"
        alignment="left"
        format="string"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="RenderingProvName"
        label="Rendering Provider Name"
        placeholder="Enter value"
        position="center"
        size={169.796875}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="e7875"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="fldRenderingProvContract"
        label="Rendering Provider Contract"
        placeholder="Select option"
        position="center"
        size={184.140625}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="0a677"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          currency: "USD",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
        }}
        groupAggregationMode="sum"
        key="BillAmount"
        label="Bill Amount"
        placeholder="Enter value"
        position="center"
        size={110}
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
        pluginId="Modal_Claim_Lookup"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
  </Body>
</ModalFrame>
