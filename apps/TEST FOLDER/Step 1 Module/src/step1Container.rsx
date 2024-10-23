<Container
  id="step1Container"
  currentViewKey=""
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  hoistFetching={true}
  marginType="normal"
  padding="12px"
  paddingType="normal"
  showBody={true}
  showHeader={true}
  style={{ ordered: [{ border: "rgb(203, 212, 222)" }] }}
>
  <Header>
    <Text
      id="actionContainerTitle"
      _disclosedFields={{ array: ["color"] }}
      marginType="normal"
      style={{ ordered: [{ color: "" }, { background: "" }, { links: "" }] }}
      value="###### Step 1:  Confirm you're talking to the right customer about the right reservation"
      verticalAlign="center"
    />
    <Tabs
      id="tabs1"
      hidden=""
      itemMode="static"
      marginType="normal"
      navigateContainer={true}
      targetContainerId="step1Container"
      value="{{ self.values[0] }}"
    >
      <Option id="1f8da" value="Recent Transactions" />
      <Option id="85fad" value="Search By Rental Id" />
    </Tabs>
  </Header>
  <View id="efe72" viewKey="Search By Email">
    <TextInput
      id="textInput2"
      hideLabel={false}
      label="Email"
      labelWidth="20"
      marginType="normal"
      placeholder="Enter email"
    />
    <Button
      id="button2"
      marginType="normal"
      style={{
        ordered: [
          { background: "rgb(18, 113, 235)" },
          { borderRadius: "40px" },
        ],
      }}
      text="Search By Email"
    >
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "{{textInput2.value}}" }] }}
        pluginId="parseCustomerContact"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getReservationTransactions"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="text1"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value={
        '**Please click on the correct reservation from the table below and click "Select Reservation" button before proceeding.**'
      }
      verticalAlign="center"
    />
    <Button
      id="changeReservationDataButton"
      _disclosedFields={{
        array: ["label", "border", "borderRadius", "tooltipText"],
      }}
      marginType="normal"
      style={{
        ordered: [
          { background: "rgb(18, 113, 235)" },
          { border: "rgb(18, 113, 235)" },
          { borderRadius: "40px" },
        ],
      }}
      text="Select Reservation"
    >
      <Event
        event="click"
        method="setValue"
        params={{
          ordered: [
            { value: "{{recentTransactionsTable.selectedRow.data.rental_id}}" },
          ],
        }}
        pluginId="parseRID"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Select
      id="selectDateRange"
      emptyMessage="No options"
      itemMode="static"
      label="Date Range for Search"
      marginType="normal"
      overlayMaxHeight={375}
      placeholder="Select an option"
      showSelectionIndicator={true}
      value="thirtyDays"
    >
      <Option id="61c68" label="Last 7 Days" value="sevenDays" />
      <Option id="5bb76" label="Last 30 Days" value="thirtyDays" />
      <Option id="41d8b" label="Last 90 Days" value="ninetyDays" />
      <Option
        id="b8a89"
        disabled={false}
        hidden={false}
        label="Last 365 Days"
        value="oneYear"
      />
      <Option
        id="b03e1"
        disabled={false}
        hidden={false}
        label="Custom Range"
        value="customRange"
      />
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getReservationTransactions"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
    <DateRange
      id="dateRange1"
      dateFormat="MM dd, yyyy"
      endPlaceholder="{{ymdToMdy.value.end}}"
      hidden={'{{selectDateRange.value != "customRange"}}'}
      iconBefore="bold/interface-calendar-remove"
      label="Select Custom Date Range"
      marginType="normal"
      startPlaceholder="{{ymdToMdy.value.start}}"
      textBetween="-"
      tooltipText="MM-DD-YYYY"
      value={{ ordered: [{ start: "" }, { end: "" }] }}
    />
    <TableLegacy
      id="recentTransactionsTable"
      _columns={[
        "created",
        "rental_id",
        "parking_spot_title",
        "parking_pass_url",
        "spothero_city_title",
        "entry_time",
        "starts",
        "ends",
        "renter_email",
        "card_type_string",
        "price",
        "reservation_status",
        "payment_status",
        "spothero_credit_used",
        "parking_spot_id",
        "rental_source_title",
        "rental_source_application",
        "rental_source_device_category",
        "rental_source_operating_system",
        "order_id",
        "order_detail_url",
        "subscription_pk",
        "subscription_id",
        "subscription_status",
        "display_id",
        "parking_spot_url",
        "rental_rule_type_title",
        "users_rental_history_url",
        "user_account_edit_url",
        "phone_number",
        "payment_type_title",
        "license_plate",
        "remit_amount",
        "payment_processor_fee",
        "discount_amount",
        "revenue",
        "refund_time",
        "is_valid_rental",
        "is_valid_payment",
        "is_business_rental",
        "purchased_with_commuter_card",
        "rental_is_refundable",
        "rental_is_rebookable",
        "can_send_receipt",
        "scanned_in_status",
        "scanned_out_status",
        "exit_time",
        "cancellation_reason",
        "account_manager_name",
        "account_manager_email",
        "renter_pk",
        "is_partner_rental",
        "latitude",
        "longitude",
        "currency_type",
        "currency_symbol",
        "stall",
        "product_type",
        "ended_more_than_three_months_ago",
        "created_timestamp",
        "starts_timestamp",
        "ends_timestamp",
        "times_can_be_updated_by_requesting_user",
      ]}
      _columnSummaryTypes={{
        ordered: [{ "Custom Column 1": "" }, { parking_pass_url: "" }],
      }}
      _columnSummaryValues={{
        ordered: [{ "Custom Column 1": "" }, { parking_pass_url: "" }],
      }}
      _columnVisibility={{
        ordered: [
          { users_rental_history_url: false },
          { cancellation_reason: false },
          { spothero_credit_used: false },
          { user_account_edit_url: false },
          { stall: false },
          { payment_processor_fee: false },
          { parking_spot_title: true },
          { renter_email: true },
          { reservation_status: true },
          { currency_symbol: false },
          { card_type_string: false },
          { rental_source_application: false },
          { times_can_be_updated_by_requesting_user: false },
          { spothero_city_title: true },
          { parking_pass_url: false },
          { currency_type: false },
          { starts_timestamp: false },
          { product_type: false },
          { latitude: false },
          { payment_type_title: false },
          { rental_is_refundable: false },
          { order_id: false },
          { exit_time: false },
          { is_business_rental: false },
          { is_valid_payment: false },
          { rental_source_title: false },
          { ends_timestamp: false },
          { account_manager_name: false },
          { longitude: false },
          { is_partner_rental: false },
          { can_send_receipt: false },
          { rental_is_rebookable: false },
          { parking_spot_id: false },
          { order_detail_url: false },
          { remit_amount: false },
          { scanned_out_status: false },
          { subscription_status: false },
          { refund_time: false },
          { renter_pk: false },
          { rental_source_operating_system: false },
          { discount_amount: false },
          { ended_more_than_three_months_ago: false },
          { license_plate: false },
          { display_id: false },
          { account_manager_email: false },
          { parking_spot_url: false },
          { purchased_with_commuter_card: false },
          { entry_time: true },
          { phone_number: false },
          { rental_rule_type_title: false },
          { revenue: false },
          { is_valid_rental: false },
          { subscription_pk: false },
          { scanned_in_status: false },
          { subscription_id: false },
          { rental_source_device_category: false },
          { created_timestamp: false },
        ],
      }}
      _compatibilityMode={false}
      _disclosedFields={{
        array: [
          "border",
          "headerBackground",
          "toolbarBackground",
          "headerText",
          "headerAccent",
          "cellAccent",
          "cellText",
          "toolbarText",
          "toolbarAccent",
          "selectedRowBackground",
          "hoverRowBackground",
          "summaryText",
          "background",
          "alternateRowBackground",
          "summaryBackground",
          "editedAccent",
          "summaryAccent",
          "summaryLabel",
        ],
      }}
      columnAlignment={{
        ordered: [
          { "Custom Column 1": "left" },
          { parking_pass_url: "left" },
          { rental_id: "left" },
          { price: "left" },
        ],
      }}
      columnColors={{
        ordered: [
          { users_rental_history_url: "" },
          { cancellation_reason: "" },
          { spothero_credit_used: "" },
          { user_account_edit_url: "" },
          { stall: "" },
          { payment_processor_fee: "" },
          { parking_spot_title: "" },
          { renter_email: "" },
          { reservation_status: "" },
          { currency_symbol: "" },
          { card_type_string: "" },
          { rental_source_application: "" },
          { times_can_be_updated_by_requesting_user: "" },
          { spothero_city_title: "" },
          { parking_pass_url: "" },
          { rental_self_service_cancellation_date: "" },
          { currency_type: "" },
          { starts_timestamp: "" },
          { created: "" },
          { price: "" },
          { product_type: "" },
          { payment_status: "" },
          { rental_restricted_cancellation: "" },
          { latitude: "" },
          { payment_type_title: "" },
          { rental_is_refundable: "" },
          { order_id: "" },
          { exit_time: "" },
          { is_business_rental: "" },
          { is_valid_payment: "" },
          { rental_source_title: "" },
          { ends_timestamp: "" },
          { account_manager_name: "" },
          { longitude: "" },
          { is_partner_rental: "" },
          { can_send_receipt: "" },
          { rental_is_rebookable: "" },
          { starts: "" },
          { parking_spot_id: "" },
          { order_detail_url: "" },
          { remit_amount: "" },
          { scanned_out_status: "" },
          { subscription_status: "" },
          { is_test_reservation: "" },
          { refund_time: "" },
          { renter_pk: "" },
          { rental_source_operating_system: "" },
          { discount_amount: "" },
          { rental_id: "" },
          { ended_more_than_three_months_ago: "" },
          { license_plate: "" },
          { display_id: "" },
          { account_manager_email: "" },
          { ends: "" },
          { parking_spot_url: "" },
          { purchased_with_commuter_card: "" },
          { entry_time: "" },
          { phone_number: "" },
          { rental_rule_type_title: "" },
          { revenue: "" },
          { is_valid_rental: "" },
          { subscription_pk: "" },
          { scanned_in_status: "" },
          { subscription_id: "" },
          { rental_source_device_category: "" },
          { created_timestamp: "" },
        ],
      }}
      columnEditable={{
        ordered: [
          { rental_source_device_category: false },
          { entry_time: false },
        ],
      }}
      columnFormats={{
        ordered: [
          { "Custom Column 1": "LinkDataCell" },
          { parking_pass_url: "LinkDataCell" },
        ],
      }}
      columnHeaderNames={{
        ordered: [
          { parking_spot_title: "Spot" },
          { renter_email: "Buyer Email" },
          { reservation_status: "Status" },
          { spothero_city_title: "City" },
          { created: "Purchased" },
          { price: "Total" },
          { payment_status: "Paid" },
          { starts: "Start Time" },
          { "Custom Column 1": "parking pass" },
          { rental_id: "Rental ID" },
          { ends: "End Time" },
          { entry_time: "Entry Time" },
        ],
      }}
      columnMappers={{
        ordered: [{ parking_spot_id: "" }, { "Custom Column 1": "" }],
      }}
      columnTypeProperties={{
        ordered: [
          { "Custom Column 1": { ordered: [{ openInNewTab: true }] } },
          { parking_pass_url: { ordered: [{ openInNewTab: true }] } },
        ],
      }}
      columnWidths={[
        { object: { id: "parking_spot_id", value: 136 } },
        { object: { id: "card_type_string", value: 148 } },
        { object: { id: "Custom Column 1", value: 186 } },
        { object: { id: "starts", value: 137 } },
        { object: { id: "ends", value: 144 } },
        { object: { id: "parking_pass_url", value: 134 } },
        { object: { id: "parking_spot_title", value: 209 } },
        { object: { id: "renter_email", value: 164 } },
        { object: { id: "entry_time", value: 89 } },
        { object: { id: "created", value: 118 } },
      ]}
      data="{{getReservationTransactions.data.data.results}}"
      doubleClickToEdit={true}
      overflowType="scroll"
      serverPaginated={true}
      showBoxShadow={false}
      style={{
        ordered: [
          { toolbarAccent: "rgb(18, 113, 235)" },
          { toolbarText: "rgb(83, 116, 149)" },
          { toolbarBackground: "rgb(246, 247, 249)" },
          { border: "rgb(203, 212, 222)" },
          { cellAccent: "rgb(18, 113, 235)" },
          { hoverRowBackground: "rgb(241, 247, 254)" },
          { selectedRowBackground: "rgb(241, 247, 254)" },
          { alternateRowBackground: "rgb(255, 255, 255)" },
          { background: "rgb(255, 255, 255)" },
          { summaryLabel: "rgb(83, 116, 149)" },
          { cellText: "rgb(0, 0, 0)" },
          { summaryAccent: "rgb(18, 113, 235)" },
          { summaryText: "rgb(0, 0, 0)" },
          { editedAccent: "rgb(18, 113, 235)" },
          { summaryBackground: "rgb(255, 255, 255)" },
          { headerAccent: "rgb(83, 116, 149)" },
          { headerText: "rgb(83, 116, 149)" },
          { headerBackground: "rgb(246, 247, 249)" },
        ],
      }}
    />
  </View>
  <View
    id="23dc5"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="Search By Rental ID"
  >
    <TextInput
      id="textInput1"
      label="Rental ID"
      marginType="normal"
      placeholder="Enter Rental ID"
    />
    <Button
      id="button1"
      marginType="normal"
      style={{
        ordered: [
          { background: "rgb(18, 113, 235)" },
          { borderRadius: "40px" },
        ],
      }}
      text="Search for Reservation"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getSingleReservationByID"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="textInput2"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="changeReservationDataButton2"
      _disclosedFields={{
        array: ["label", "border", "borderRadius", "tooltipText"],
      }}
      marginType="normal"
      style={{
        ordered: [
          { background: "rgb(18, 113, 235)" },
          { border: "rgb(18, 113, 235)" },
          { borderRadius: "40px" },
        ],
      }}
      text="Select Reservation"
    >
      <Event
        event="click"
        method="setValue"
        params={{
          ordered: [
            { value: "{{singleReservationTable.selectedRow.rental_id}}" },
          ],
        }}
        pluginId="parseRID"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{
          ordered: [
            { value: "{{singleReservationTable.selectedRow.renter_email}}" },
          ],
        }}
        pluginId="parseCustomerContact"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="text2"
      horizontalAlign="center"
      marginType="normal"
      value={
        '**After searching please make sure to hit the "Select Reservation" button.**'
      }
      verticalAlign="center"
    />
    <Table
      id="singleReservationTable"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{getSingleReservationByID.data.data.results}}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      enableSaveActions={true}
      primaryKeyColumnId="4ebcc"
      rowHeight="medium"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      style={{
        headerBackground: "rgb(246, 247, 249)",
        headerText: "rgb(83, 116, 149)",
        accent: "rgb(18, 113, 235)",
        cellText: "rgb(0, 0, 0)",
        border: "rgb(203, 212, 222)",
      }}
      toolbarPosition="bottom"
    >
      <Column
        id="013f4"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="created"
        label="Purchased"
        placeholder="Enter value"
        position="center"
        size={80}
        summaryAggregationMode="none"
      />
      <Column
        id="5aa03"
        alignment="right"
        editableOptions={{ map: { showStepper: true } }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="created_timestamp"
        label="Created timestamp"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="e095f"
        alignment="left"
        format="tag"
        formatOptions={{ map: { automaticColors: true } }}
        groupAggregationMode="none"
        hidden="true"
        key="rental_source_title"
        label="Rental source title"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="7fd82"
        alignment="left"
        format="tag"
        formatOptions={{ map: { automaticColors: true } }}
        groupAggregationMode="none"
        hidden="true"
        key="rental_source_application"
        label="Rental source application"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="d650d"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="rental_source_device_category"
        label="Rental source device category"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="d8e94"
        alignment="left"
        format="tag"
        formatOptions={{ map: { automaticColors: true } }}
        groupAggregationMode="none"
        hidden="true"
        key="rental_source_operating_system"
        label="Rental source operating system"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="4ebcc"
        alignment="right"
        editable="false"
        editableOptions={{ map: { showStepper: true } }}
        format="decimal"
        formatOptions={{ showSeparators: false, notation: "standard" }}
        groupAggregationMode="sum"
        key="rental_id"
        label="Rental ID"
        placeholder="Enter value"
        position="center"
        size={84}
        summaryAggregationMode="none"
      />
      <Column
        id="0c87d"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="order_id"
        label="Order ID"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="93296"
        alignment="left"
        format="link"
        formatOptions={{ map: { showUnderline: "hover" } }}
        groupAggregationMode="none"
        hidden="true"
        key="order_detail_url"
        label="Order detail URL"
        position="center"
        size={100}
        summaryAggregationMode="none"
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
        id="dee36"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="subscription_pk"
        label="Subscription pk"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="f59d3"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="subscription_id"
        label="Subscription ID"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="be0a4"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="subscription_status"
        label="Subscription status"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="89703"
        alignment="right"
        editableOptions={{ map: { showStepper: true } }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="display_id"
        label="Display ID"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="49ffe"
        alignment="left"
        format="link"
        formatOptions={{ map: { showUnderline: "hover" } }}
        groupAggregationMode="none"
        hidden="true"
        key="parking_pass_url"
        label="Parking pass URL"
        position="center"
        size={100}
        summaryAggregationMode="none"
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
        id="5307d"
        alignment="right"
        editableOptions={{ map: { showStepper: true } }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="parking_spot_id"
        label="Parking spot ID"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="f50f4"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="parking_spot_title"
        label="Spot"
        placeholder="Enter value"
        position="center"
        size={214}
        summaryAggregationMode="none"
      />
      <Column
        id="e84a0"
        alignment="left"
        format="string"
        formatOptions={{ map: { automaticColors: true } }}
        groupAggregationMode="none"
        key="spothero_city_title"
        label="City"
        placeholder="Enter value"
        position="center"
        size={88}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="7c587"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="entry_time"
        label="Entry time"
        placeholder="Enter value"
        position="center"
        size={91}
        summaryAggregationMode="none"
      />
      <Column
        id="dfaeb"
        alignment="left"
        format="link"
        formatOptions={{ map: { showUnderline: "hover" } }}
        groupAggregationMode="none"
        hidden="true"
        key="parking_spot_url"
        label="Parking spot URL"
        position="center"
        size={100}
        summaryAggregationMode="none"
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
        id="c8199"
        alignment="left"
        format="tag"
        formatOptions={{ map: { automaticColors: true } }}
        groupAggregationMode="none"
        hidden="true"
        key="rental_rule_type_title"
        label="Rental rule type title"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="4392b"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="starts"
        label="Start Time"
        placeholder="Enter value"
        position="center"
        size={133}
        summaryAggregationMode="none"
      />
      <Column
        id="ffaab"
        alignment="right"
        editableOptions={{ map: { showStepper: true } }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="starts_timestamp"
        label="Starts timestamp"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="d7df2"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="ends"
        label="End Time"
        placeholder="Enter value"
        position="center"
        size={129}
        summaryAggregationMode="none"
      />
      <Column
        id="dab81"
        alignment="right"
        editableOptions={{ map: { showStepper: true } }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="ends_timestamp"
        label="Ends timestamp"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="8c45a"
        alignment="left"
        format="link"
        formatOptions={{ map: { showUnderline: "hover" } }}
        groupAggregationMode="none"
        hidden="true"
        key="users_rental_history_url"
        label="Users rental history URL"
        position="center"
        size={100}
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
        id="b08a5"
        alignment="left"
        format="link"
        formatOptions={{ map: { showUnderline: "hover" } }}
        groupAggregationMode="none"
        hidden="true"
        key="user_account_edit_url"
        label="User account edit URL"
        position="center"
        size={100}
        summaryAggregationMode="none"
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
        id="e5260"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="phone_number"
        label="Phone number"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="00e91"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="card_type_string"
        label="Card type string"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="79a37"
        alignment="left"
        format="tag"
        formatOptions={{ map: { automaticColors: true } }}
        groupAggregationMode="none"
        hidden="true"
        key="payment_type_title"
        label="Payment type title"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="daa8f"
        alignment="left"
        format="tag"
        formatOptions={{ map: { automaticColors: true } }}
        groupAggregationMode="none"
        hidden="true"
        key="license_plate"
        label="License plate"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="425b8"
        alignment="left"
        format="string"
        formatOptions={{ map: { showUnderline: "hover" } }}
        groupAggregationMode="none"
        hidden="false"
        key="renter_email"
        label="Buyer Email"
        placeholder="Enter value"
        position="center"
        size={152}
        summaryAggregationMode="none"
      />
      <Column
        id="630ee"
        alignment="right"
        editableOptions={{ map: { showStepper: true } }}
        format="currency"
        formatOptions={{
          currency: "USD",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
        }}
        groupAggregationMode="sum"
        key="price"
        label="Price"
        placeholder="Enter value"
        position="center"
        size={96}
        summaryAggregationMode="none"
      />
      <Column
        id="32f3a"
        alignment="left"
        format="string"
        formatOptions={{ map: { automaticColors: true } }}
        groupAggregationMode="none"
        key="reservation_status"
        label="Status"
        placeholder="Enter value"
        position="center"
        size={66}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="50ebf"
        alignment="left"
        format="string"
        formatOptions={{ map: { automaticColors: true } }}
        groupAggregationMode="none"
        key="payment_status"
        label="Paid"
        placeholder="Enter value"
        position="center"
        size={102}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="ab250"
        alignment="right"
        editableOptions={{ map: { showStepper: true } }}
        format="percent"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="average"
        hidden="true"
        key="remit_amount"
        label="Remit amount"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="b1e1f"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="discount_amount"
        label="Discount amount"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="54e38"
        alignment="right"
        editableOptions={{ map: { showStepper: true } }}
        format="percent"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="average"
        hidden="true"
        key="spothero_credit_used"
        label="Spothero credit used"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="5e2d7"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="refund_time"
        label="Refund time"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="6b8bf"
        alignment="left"
        format="boolean"
        groupAggregationMode="none"
        hidden="true"
        key="is_valid_rental"
        label="Is valid rental"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="82960"
        alignment="left"
        format="boolean"
        groupAggregationMode="none"
        hidden="true"
        key="is_valid_payment"
        label="Is valid payment"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="b86f4"
        alignment="left"
        format="boolean"
        groupAggregationMode="none"
        hidden="true"
        key="is_business_rental"
        label="Is business rental"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="71ee6"
        alignment="left"
        format="boolean"
        groupAggregationMode="none"
        hidden="true"
        key="purchased_with_commuter_card"
        label="Purchased with commuter card"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="6084b"
        alignment="left"
        format="boolean"
        groupAggregationMode="none"
        hidden="true"
        key="rental_is_refundable"
        label="Rental is refundable"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="e8c33"
        alignment="left"
        format="boolean"
        groupAggregationMode="none"
        hidden="true"
        key="rental_is_rebookable"
        label="Rental is rebookable"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="8162e"
        alignment="left"
        format="boolean"
        groupAggregationMode="none"
        hidden="true"
        key="can_send_receipt"
        label="Can send receipt"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="c42d3"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="scanned_in_status"
        label="Scanned in status"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="8ecc3"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="scanned_out_status"
        label="Scanned out status"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="983c0"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="exit_time"
        label="Exit time"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="bd663"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="cancellation_reason"
        label="Cancellation reason"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="67a7e"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="account_manager_name"
        label="Account manager name"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="8f3c9"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="account_manager_email"
        label="Account manager email"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="1489c"
        alignment="right"
        editableOptions={{ map: { showStepper: true } }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="renter_pk"
        label="Renter pk"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="20b46"
        alignment="left"
        format="boolean"
        groupAggregationMode="none"
        hidden="true"
        key="is_partner_rental"
        label="Is partner rental"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="0e3f4"
        alignment="right"
        editableOptions={{ map: { showStepper: true } }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="latitude"
        label="Latitude"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="50fbf"
        alignment="right"
        editableOptions={{ map: { showStepper: true } }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="longitude"
        label="Longitude"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="e369f"
        alignment="left"
        format="tag"
        formatOptions={{ map: { automaticColors: true } }}
        groupAggregationMode="none"
        hidden="true"
        key="currency_type"
        label="Currency type"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="adb27"
        alignment="left"
        format="tag"
        formatOptions={{ map: { automaticColors: true } }}
        groupAggregationMode="none"
        hidden="true"
        key="currency_symbol"
        label="Currency symbol"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="110a9"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="stall"
        label="Stall"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="fda3d"
        alignment="left"
        format="tag"
        formatOptions={{ map: { automaticColors: true } }}
        groupAggregationMode="none"
        hidden="true"
        key="product_type"
        label="Product type"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="33a70"
        alignment="left"
        format="boolean"
        groupAggregationMode="none"
        hidden="true"
        key="ended_more_than_three_months_ago"
        label="Ended more than three months ago"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="62a4b"
        alignment="left"
        format="boolean"
        groupAggregationMode="none"
        hidden="true"
        key="times_can_be_updated_by_requesting_user"
        label="Times can be updated by requesting user"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="refresh"
          pluginId="singleReservationTable"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
  </View>
</Container>
