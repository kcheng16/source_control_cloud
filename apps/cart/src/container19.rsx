<Container
  id="container19"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  marginType="normal"
  padding="12px"
  showBody={true}
  style={{ ordered: [{ borderRadius: "16px" }] }}
>
  <Header>
    <Text
      id="containerTitle20"
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="dfd3a" viewKey="View 1">
    <Icon
      id="icon3"
      horizontalAlign="center"
      icon="bold/interface-validation-check-circle"
      marginType="normal"
      style={{ ordered: [{ color: "rgb(27, 166, 114)" }] }}
    />
    <Text
      id="text60"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgb(27, 166, 114)" }] }}
      value={'<h4 style="font-weight:600;">Order Placed Successfully</h4>'}
      verticalAlign="center"
    />
    <Container
      id="container20"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      hidden="{{ true }}"
      marginType="normal"
      padding="12px"
      showBody={true}
      style={{
        ordered: [
          { border: "rgba(27, 166, 114, 0.5)" },
          { borderRadius: "8px" },
          { background: "rgba(200, 249, 229, 0.3)" },
        ],
      }}
    >
      <Header>
        <Text
          id="containerTitle19"
          marginType="normal"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="d82f0" viewKey="View 1">
        <IconText
          id="iconText4"
          horizontalAlign="center"
          icon="bold/shopping-store-discount-percent-circle"
          marginType="normal"
          style={{
            ordered: [
              { iconColor: "rgb(27, 166, 114)" },
              { color: "rgb(27, 166, 114)" },
            ],
          }}
          text="{{ GetCart?.data?.data?.bill?.savingDescription }}"
          textSize="default"
        />
      </View>
    </Container>
    <Text
      id="text61"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.45)" }] }}
      value={'<h5 style="font-weight:500;">Order ID</h5>'}
      verticalAlign="center"
    />
    <Text
      id="text62"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.92)" }] }}
      value={'<h5 style="font-weight:600;">{{orderJobId.value}}</h5>'}
      verticalAlign="center"
    />
    <Button
      id="button15"
      disabled="{{ GenerateInvoice.isFetching || GetOrderSummary.isFetching }}"
      marginType="normal"
      style={{
        ordered: [{ borderRadius: "10px" }, { background: "rgb(255, 82, 0)" }],
      }}
      text="Print {{ orderItems.value?.every(item => item.picked === true) ? 'Invoice' : 'Order Summary' }} & Finish Transaction"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "// All experience store items\nconst allExpStoreItems =  orderItems.value?.every(item => item.picked === true);\n\nif (allExpStoreItems) {\n  GenerateInvoice.trigger();  \n} else {\n  GetOrderSummary.trigger();\n}",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="text63"
      hidden="{{ !orderItems.value?.every(item => item.picked === true) }}"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="Need physical order summary?"
      verticalAlign="center"
    />
    <Button
      id="button14"
      disabled="{{ GenerateInvoice.isFetching || GetOrderSummary.isFetching }}"
      hidden="{{ !orderItems.value?.every(item => item.picked === true) }}"
      marginType="normal"
      style={{ ordered: [{ label: "rgb(255, 82, 0)" }] }}
      styleVariant="outline"
      text="Print Order Summary"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="GetOrderSummary"
        type="datasource"
        waitMs="300"
        waitType="debounce"
      />
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: '// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "print-copy",\n  object_value: {\n    payment_total: toBePaid.value,\n    order_id: orderJobId.value || ""\n  }\n});',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
