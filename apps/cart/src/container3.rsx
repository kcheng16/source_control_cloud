<Container
  id="container3"
  _gap="0px"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  heightType="fixed"
  hidden="true"
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
      id="containerTitle3"
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="a4f18" viewKey="View 1">
    <Text
      id="text6"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.82)" }] }}
      value={'<h4 style="font-weight:600">Bill Details</h4>'}
      verticalAlign="center"
    />
    <Text
      id="text7"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value={
        '{{ deliveryModeOptions.selectedIndex === 0 ? "Item Total" : "Sub Total" }}'
      }
      verticalAlign="center"
    />
    <Text
      id="text8"
      horizontalAlign="right"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="{{ `₹${GetCart?.data?.data?.bill?.itemTotal || 0}`}}"
      verticalAlign="center"
    />
    <Divider id="divider3" style={{ map: { color: "surfacePrimary" } }} />
    <Text
      id="text9"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="Handling Fee"
      verticalAlign="center"
    />
    <Text
      id="text10"
      horizontalAlign="right"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="{{ `₹${GetCart?.data?.data?.bill?.storePackingCharges || 0}`}}"
      verticalAlign="center"
    />
    <Divider id="divider7" style={{ map: { color: "surfacePrimary" } }} />
    <Text
      id="text11"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="Delivery Fee"
      verticalAlign="center"
    />
    <Text
      id="text12"
      horizontalAlign="right"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="{{ `₹${GetCart?.data?.data?.bill?.deliveryCharges || 0}`}}"
      verticalAlign="center"
    />
    <Divider id="divider4" style={{ map: { color: "surfacePrimary" } }} />
    <Text
      id="text13"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="GST & Taxes"
      verticalAlign="center"
    />
    <Text
      id="text14"
      horizontalAlign="right"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="{{ `₹${GetCart?.data?.data?.bill?.gst || 0}`}}"
      verticalAlign="center"
    />
    <Divider id="divider6" style={{ map: { color: "surfacePrimary" } }} />
    <Text
      id="text34"
      hidden="{{ !GetCart?.data?.data?.bill?.surgeFee }}"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="Surge Fee"
      verticalAlign="center"
    />
    <Text
      id="text35"
      hidden="{{ !GetCart?.data?.data?.bill?.surgeFee }}"
      horizontalAlign="right"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="{{ `₹${GetCart?.data?.data?.bill?.surgeFee || 0}`}}"
      verticalAlign="center"
    />
    <Divider id="divider5" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider8" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider9" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider10" style={{ map: { color: "surfacePrimary" } }} />
    <Text
      id="text15"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.82)" }] }}
      value={'<h5 style="font-weight:600">To Be Paid</h5>'}
      verticalAlign="center"
    />
    <Text
      id="text16"
      horizontalAlign="right"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.82)" }] }}
      value={
        '<h5 style="font-weight:600">₹{{GetCart?.data?.data?.bill?.toPayWithoutDelFee || 0}}</h5>'
      }
      verticalAlign="center"
    />
    <Container
      id="container10"
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
          id="containerTitle10"
          marginType="normal"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="fa11c" viewKey="View 1">
        <Container
          id="container5"
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
              id="containerTitle5"
              marginType="normal"
              value="#### Container title"
              verticalAlign="center"
            />
          </Header>
          <View id="d7502" viewKey="View 1">
            <IconText
              id="iconText2"
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
        <Divider id="divider11" />
      </View>
    </Container>
    <Divider id="divider12" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider13" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider14" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider15" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider16" style={{ map: { color: "surfacePrimary" } }} />
    <Button
      id="button4"
      disabled="{{ AddCart.isFetching || (GetCart?.data?.transformedData?.length || 0) <= 0 ? true : false }}"
      iconAfter="bold/interface-arrows-right"
      loading=""
      marginType="normal"
      style={{ ordered: [{ background: "rgb(255, 82, 0)" }] }}
      text="Proceed To Payment"
    >
      <Event
        event="click"
        method="openApp"
        params={{
          ordered: [
            { uuid: "dcea0b28-e092-4dc0-948c-edb59a86985b" },
            { options: { ordered: [{ queryParams: [] }] } },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
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
    </Button>
    <Divider id="divider17" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider18" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider19" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider20" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider21" style={{ map: { color: "surfacePrimary" } }} />
    <Divider id="divider22" style={{ map: { color: "surfacePrimary" } }} />
  </View>
</Container>
