<Container
  id="container70"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  heightType="fixed"
  loading="{{ downloadOrderSummary.isFetching || downloadInvoice.isFetching || GetOrderHistory.isFetching }}"
  marginType="normal"
  padding="12px"
  showBody={true}
  style={{ ordered: [{ borderRadius: "12px" }] }}
>
  <Header>
    <Text
      id="containerTitle72"
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="8eb5f" viewKey="View 1">
    <Text
      id="text112"
      marginType="normal"
      value="### Past Orders"
      verticalAlign="center"
    />
    <Image
      id="image33"
      dbBlobId="3dac1618-39e1-4772-8cc0-b0ee6c02169a"
      fit="contain"
      heightType="fixed"
      horizontalAlign="center"
      marginType="normal"
      src="https://ik.imagekit.io/xp8c4ep1p/Society%20Store/scan%20to%20add%20items.png?updatedAt=1743569222878"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "orderIdInput.clearValidation();\norderIdInput.clearValue();\norderIdInput.focus();",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Image>
    <Text
      id="text113"
      heightType="fixed"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.45)" }] }}
      value="#### Scan to directly enter the Order ID"
      verticalAlign="center"
    />
    <Text
      id="text114"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.45)" }] }}
      value="Click the scan icon above if you are unable to scan"
      verticalAlign="center"
    />
    <Divider id="divider61" marginType="normal" textSize="default" />
    <Text
      id="text115"
      heightType="fixed"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.45)" }] }}
      value="OR Enter it manually"
      verticalAlign="center"
    />
    <TextInput
      id="orderIdInput"
      label=""
      labelPosition="top"
      marginType="normal"
      placeholder="Enter Order ID"
      style={{ ordered: [{ borderRadius: "6px" }] }}
    />
    <Button
      id="button32"
      disabled="{{ orderIdInput.value.length <= 10 || downloadOrderSummary.isFetching }}"
      loading=""
      marginType="normal"
      style={{
        ordered: [{ borderRadius: "6px" }, { background: "rgb(255, 82, 0)" }],
      }}
      text="Download Order Summary"
    >
      <Event
        event="click"
        method="run"
        params={{
          map: {
            src: "downloadOrderSummary.trigger({\n  additionalScope: {\n    data: {\n      orderId: orderIdInput.value\n    }\n  }\n})",
          },
        }}
        pluginId=""
        type="script"
        waitMs="300"
        waitType="debounce"
      />
      <Event
        event="click"
        method="run"
        params={{
          map: {
            src: '// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "download-order-summary",\n  object_value: orderIdInput.value\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button33"
      disabled="{{ orderIdInput.value.length <= 10 || downloadInvoice.isFetching }}"
      loading=""
      marginType="normal"
      style={{
        ordered: [{ borderRadius: "6px" }, { background: "rgb(255, 82, 0)" }],
      }}
      text="Download Invoice"
    >
      <Event
        event="click"
        method="run"
        params={{
          map: {
            src: "downloadInvoice.trigger({\n  additionalScope: {\n    data: {\n      orderId: orderIdInput.value\n    }\n  }\n})",
          },
        }}
        pluginId=""
        type="script"
        waitMs="300"
        waitType="debounce"
      />
      <Event
        event="click"
        method="run"
        params={{
          map: {
            src: '// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "download-invoice",\n  object_value: orderIdInput.value\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="text119"
      value="##### Last 20 orders till"
      verticalAlign="center"
    />
    <Date
      id="date1"
      dateFormat="MMM d, yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      iconBefore="bold/interface-calendar"
      label=""
      labelPosition="top"
      maxDate="{{ new Date() }}"
      value="{{ new Date() }}"
    >
      <Event
        event="change"
        method="trigger"
        params={{}}
        pluginId="GetOrderHistory"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Date>
    <Table
      id="table1"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ GetOrderHistory.data?.data?.orders || [] }}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No rows found"
      enableSaveActions={true}
      groupByColumns={{}}
      overflowType="pagination"
      primaryKeyColumnId="dbfc3"
      rowHeight="medium"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      templatePageSize="10"
      toolbarPosition="bottom"
    >
      <Column
        id="dbfc3"
        alignment="left"
        editable={false}
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="order_group_id"
        label="Order ID"
        placeholder="Enter value"
        position="center"
        size={198}
      />
      <Column
        id="cb71a"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="history_status"
        label="Order Status"
        placeholder="Select option"
        position="center"
        size={172}
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="897a8"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="link"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="sum"
        key="customer_id"
        label="Order Summary"
        placeholder="Enter value"
        position="center"
        referenceId="order_summary"
        size={178}
        valueOverride="Download"
      >
        <Event
          event="clickCell"
          method="run"
          params={{
            map: {
              src: "downloadOrderSummary.trigger({\n  additionalScope: {\n    data: {\n      orderId: currentRow.order_group_id\n    }\n  }\n})",
            },
          }}
          pluginId=""
          type="script"
          waitMs={0}
          waitType="debounce"
        />
      </Column>
      <Column
        id="20639"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="link"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="sum"
        key="order_id"
        label="Order Invoice"
        placeholder="Enter value"
        position="center"
        size={167}
        valueOverride="Download"
      >
        <Event
          event="clickCell"
          method="run"
          params={{
            map: {
              src: "downloadInvoice.trigger({\n  additionalScope: {\n    data: {\n      orderId: currentRow.order_group_id\n    }\n  }\n})",
            },
          }}
          pluginId=""
          type="script"
          waitMs={0}
          waitType="debounce"
        />
      </Column>
      <Column
        id="4a721"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="datetime"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="created_at"
        label="Created at"
        placeholder="Enter value"
        position="center"
        size={227}
      />
      <Column
        id="7a02b"
        alignment="left"
        format="link"
        formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
        groupAggregationMode="none"
        key="order_data_v2"
        label="Shipment"
        placeholder="Enter value"
        position="center"
        size={140}
        valueOverride="View Items"
      >
        <Event
          event="clickCell"
          method="setValue"
          params={{
            map: { value: "{{ currentSourceRow?.order_data_v2?.shipments }}" },
          }}
          pluginId="shipmentItems"
          type="state"
          waitMs={0}
          waitType="debounce"
        />
        <Event
          event="clickCell"
          method="show"
          pluginId="modalFrame4"
          type="widget"
          waitMs={0}
          waitType="debounce"
        />
      </Column>
      <Column
        id="fe2ba"
        alignment="left"
        format="button"
        formatOptions={{
          variant: "solid",
          disabled:
            '{{ table1.data[i].history_status === "DELIVERED" || table1.data[i].history_status === "CANCELLED" }}',
          buttonColor: "rgba(236, 63, 63, 1)",
        }}
        groupAggregationMode="none"
        key="refund_details"
        label="Action"
        placeholder="Enter value"
        position="center"
        referenceId="aciton"
        size={100}
        summaryAggregationMode="none"
        valueOverride={'{{ "Cancel Order" }}'}
      >
        <Event
          event="clickCell"
          method="trigger"
          params={{
            map: {
              options: {
                object: {
                  onSuccess: null,
                  onFailure: null,
                  additionalScope: null,
                },
              },
            },
          }}
          pluginId="CancelOrder"
          type="datasource"
          waitMs={0}
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
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="trigger"
          params={{
            map: {
              options: {
                object: {
                  onSuccess: null,
                  onFailure: null,
                  additionalScope: null,
                },
              },
            },
          }}
          pluginId="GetOrderHistory"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
  </View>
</Container>
