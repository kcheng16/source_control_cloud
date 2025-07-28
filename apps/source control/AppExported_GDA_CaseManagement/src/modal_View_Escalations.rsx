<ModalFrame
  id="modal_View_Escalations"
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
      id="modalTitle11"
      value="### Escalations on Current Case"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton11"
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
        pluginId="modal_View_Escalations"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Table
      id="Escalations_table"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ pull_Escalations.data }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      primaryKeyColumnId="bec6e"
      rowHeight="medium"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="bec6e"
        alignment="left"
        editable="false"
        format="string"
        groupAggregationMode="none"
        key="caseescalation_id"
        label="Escalation ID"
        placeholder="Enter value"
        position="center"
        size={160}
        summaryAggregationMode="none"
      />
      <Column
        id="6a429"
        alignment="right"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="case_id"
        label="Case ID"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="7b3dd"
        alignment="left"
        format="tags"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="caseescalation_assignee"
        label="Assignee"
        optionList={{ mode: "manual", mappedData: "" }}
        placeholder="Select options"
        position="center"
        size={238}
        summaryAggregationMode="none"
        valueOverride="{{ item.split('; ') }}"
      />
      <Column
        id="18ec5"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="caseescalation_task"
        label="Task"
        placeholder="Enter value"
        position="center"
        size={222}
        summaryAggregationMode="none"
      />
      <Column
        id="7756e"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="caseescalation_decision"
        label="Escalation Decision"
        placeholder="Select option"
        position="center"
        size={135}
        summaryAggregationMode="none"
      />
      <Column
        id="e4320"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="caseescalation_comment"
        label="Escalation Comment"
        placeholder="Enter value"
        position="center"
        size={213}
        summaryAggregationMode="none"
      />
      <Column
        id="e83ca"
        alignment="left"
        format="datetime"
        formatOptions={{ dateFormat: "MM/dd/yyyy" }}
        groupAggregationMode="none"
        key="caseescalation_initiateddate"
        label="Initiated Date"
        placeholder="Enter value"
        position="center"
        size={195}
        summaryAggregationMode="none"
      />
      <Column
        id="d40cc"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="none"
        key="caseescalation_initiatedby"
        label="Initiated By"
        position="center"
        size={179}
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
        id="7bdbf"
        alignment="left"
        format="datetime"
        formatOptions={{ dateFormat: "MM/dd/yyyy" }}
        groupAggregationMode="none"
        key="caseescalation_revieweddate"
        label="Reviewed Date"
        placeholder="Enter value"
        position="center"
        size={193}
        summaryAggregationMode="none"
      />
      <Column
        id="2b395"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="none"
        key="caseescalation_reviewedby"
        label="Reviewed By"
        position="center"
        size={154}
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
          pluginId="Escalations_table"
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
          pluginId="Escalations_table"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
  </Body>
</ModalFrame>
