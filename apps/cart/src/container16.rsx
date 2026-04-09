<Container
  id="container16"
  _gap="0px"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  heightType="fixed"
  hoistFetching={true}
  loading=""
  marginType="normal"
  overflowType="hidden"
  padding="12px"
  showBody={true}
  style={{ ordered: [{ borderRadius: "12px" }] }}
>
  <Header>
    <Text
      id="containerTitle18"
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="a4f18" viewKey="View 1">
    <Text
      id="text56"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.82)" }] }}
      value={'<h4 style="font-weight:600">Bill Details</h4>'}
      verticalAlign="center"
    />
    <Text
      id="text57"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value={
        '{{ deliveryModeOptions.selectedIndex === 0 ? "Item Total" : "Sub Total" }}'
      }
      verticalAlign="center"
    />
    <Text
      id="text58"
      horizontalAlign="right"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="{{ `₹${GetCart?.data?.data?.bill?.itemTotal || 0}`}}"
      verticalAlign="center"
    />
    <Divider id="divider24" style={{ map: { color: "surfacePrimary" } }} />
    <Text
      id="text59"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="Handling Fee"
      verticalAlign="center"
    />
    <Text
      id="text47"
      horizontalAlign="right"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="{{ `₹${GetCart?.data?.data?.bill?.storePackingCharges || 0}`}}"
      verticalAlign="center"
    />
    <Divider id="divider28" style={{ map: { color: "surfacePrimary" } }} />
    <Text
      id="text48"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="Delivery Fee"
      verticalAlign="center"
    />
    <Text
      id="text49"
      horizontalAlign="right"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="{{ `₹${GetCart?.data?.data?.bill?.deliveryCharges || 0}`}}"
      verticalAlign="center"
    />
    <Divider id="divider25" style={{ map: { color: "surfacePrimary" } }} />
    <Text
      id="text50"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="GST & Taxes"
      verticalAlign="center"
    />
    <Text
      id="text51"
      horizontalAlign="right"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="{{ `₹${GetCart?.data?.data?.bill?.gst || 0}`}}"
      verticalAlign="center"
    />
    <Divider id="divider27" style={{ map: { color: "surfacePrimary" } }} />
    <Text
      id="text54"
      hidden="{{ !GetCart?.data?.data?.bill?.surgeFee }}"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="Surge Fee"
      verticalAlign="center"
    />
    <Text
      id="text55"
      hidden="{{ !GetCart?.data?.data?.bill?.surgeFee }}"
      horizontalAlign="right"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="{{ `₹${GetCart?.data?.data?.bill?.surgeFee || 0}`}}"
      verticalAlign="center"
    />
    <Divider id="divider26" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider29" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider30" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider31" style={{ map: { color: "surfacePrimary" } }} />
    <Text
      id="text52"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.82)" }] }}
      value={'<h5 style="font-weight:600">To Be Paid</h5>'}
      verticalAlign="center"
    />
    <Text
      id="text53"
      horizontalAlign="right"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.82)" }] }}
      value={
        '<h5 style="font-weight:600">₹{{GetCart?.data?.data?.bill?.toPayWithoutDelFee || 0}}</h5>'
      }
      verticalAlign="center"
    />
    <Container
      id="container17"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      hidden="true"
      marginType="normal"
      overflowType="hidden"
      padding="0"
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text
          id="containerTitle17"
          marginType="normal"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="fa11c" viewKey="View 1">
        <Container
          id="container18"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          heightType="fixed"
          hidden="{{ !GetCart?.data?.data?.bill?.savingDescription }}"
          marginType="normal"
          overflowType="hidden"
          padding="12px"
          showBody={true}
          showBorder={false}
          style={{
            ordered: [
              { borderRadius: "8px" },
              { background: "rgba(200, 249, 229, 0.3)" },
            ],
          }}
        >
          <Header>
            <Text
              id="containerTitle16"
              marginType="normal"
              value="#### Container title"
              verticalAlign="center"
            />
          </Header>
          <View id="d7502" viewKey="View 1">
            <IconText
              id="iconText3"
              horizontalAlign="center"
              icon="bold/shopping-store-discount-percent-circle"
              marginType="normal"
              style={{
                ordered: [
                  { iconColor: "rgb(27, 166, 114)" },
                  { color: "rgb(27, 166, 114)" },
                ],
              }}
              text={
                '{{ GetCart?.data?.data?.bill?.savingDescription || \n"No Savings" }}'
              }
              textSize="default"
            />
          </View>
        </Container>
        <Divider id="divider23" />
      </View>
    </Container>
    <Divider id="divider32" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider33" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider34" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider35" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider36" style={{ map: { color: "surfacePrimary" } }} />
    <Button
      id="button13"
      disabled="{{ AddCart.isFetching || (GetCart?.data?.transformedData?.length || 0) <= 0 ? true : false || cartStatusCodes.value[AddCart.data?.statusCode] || cartStatusCodes.value[GetCart.data?.statusCode] }}"
      iconAfter="bold/interface-arrows-right"
      loading=""
      marginType="normal"
      style={{ ordered: [{ background: "rgb(255, 82, 0)" }] }}
      text="Proceed To Payment"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: '// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "proceed-to-payment",\n  object_value: GetCart?.data?.data?.bill\n});',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="run"
        params={{
          map: {
            src: "tabbedContainer1.setCurrentViewIndex(1);\nmainContainer.setCurrentViewIndex(0);\nGetCartForPayment.trigger();",
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Divider id="divider37" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider38" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider39" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider40" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider41" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider42" style={{ map: { color: "surfacePrimary" } }} />
  </View>
</Container>
