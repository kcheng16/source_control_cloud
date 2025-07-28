<ModalFrame
  id="Modal_Member_Lookup"
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
    <Text id="modalTitle7" value="### Member Viewer" verticalAlign="center" />
    <Button
      id="modalCloseButton7"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [] }}
        pluginId="Modal_Member_Lookup"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <TextInput
      id="MemberViewer_MemberID_input"
      label="Member ID"
      placeholder="Enter value"
      showClear={true}
    />
    <TextInput
      id="MemberViewer_FirstName_input"
      label="First Name"
      labelWrap={true}
      placeholder="Enter value"
      showClear={true}
    />
    <TextInput
      id="MemberViewer_LastName_input"
      label="Last Name"
      labelWrap={true}
      placeholder="Enter value"
      showClear={true}
    />
    <Button
      id="button21"
      disabled="{{ MemberViewer_MemberID_input.value == '' && MemberViewer_FirstName_input.value == '' && MemberViewer_LastName_input.value == ''}}"
      text="Search"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="pull_Member"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Table
      id="MemberViewer_table"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ pull_Member.data }}"
      defaultSelectedRow={{ mode: "none", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      groupedColumnConfig={{ expandByDefault: true }}
      margin="0"
      rowHeight="small"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="37f84"
        alignment="left"
        editable={false}
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="MembID"
        label="Member ID"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="d9438"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="FirstNM"
        label="First Name"
        placeholder="Enter value"
        position="center"
        size={136}
        summaryAggregationMode="none"
      />
      <Column
        id="928ad"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="LastNM"
        label="Last Name"
        placeholder="Enter value"
        position="center"
        size={151}
        summaryAggregationMode="none"
      />
      <Column
        id="0e207"
        alignment="left"
        format="date"
        formatOptions={{ dateFormat: "MM/dd/yyyy" }}
        groupAggregationMode="none"
        key="DOB"
        label="DOB"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="98f59"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="OPT"
        label="Plan Comp"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="a132f"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        hidden="true"
        key="HPlan"
        label="HPlan"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="30210"
        alignment="left"
        format="date"
        formatOptions={{ dateFormat: "MM/dd/yyyy" }}
        groupAggregationMode="none"
        key="EligDateStart"
        label="Eligibility From"
        placeholder="Enter value"
        position="center"
        size={117}
        summaryAggregationMode="none"
      />
      <Column
        id="04362"
        alignment="left"
        format="date"
        formatOptions={{ dateFormat: "MM/dd/yyyy" }}
        groupAggregationMode="none"
        key="EligDateEnd"
        label="Eligibility To"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <ToolbarButton
        id="1a"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
      <ToolbarButton
        id="36e40"
        icon="bold/shopping-gift"
        label="Custom"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="run"
          params={{
            ordered: [{ src: "MemberViewer_table.expandRows({mode: 'all'})" }],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <Event
        event="clickRow"
        method="hide"
        params={{ ordered: [] }}
        pluginId="Modal_Member_Lookup"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="clickRow"
        method="setValue"
        params={{
          ordered: [{ value: "{{ MemberViewer_table.selectedRow?.MembID }}" }],
        }}
        pluginId="PHP_MemberID_input"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
  </Body>
</ModalFrame>
