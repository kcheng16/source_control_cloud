<Container
  id="container39"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  heightType="fixed"
  margin="0"
  marginType="normal"
  overflowType="hidden"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle43"
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="d82f0" viewKey="paymentProgress">
    <Image
      id="image21"
      dbBlobId="ed9f248c-a238-4ec0-9b2c-253730a1e23f"
      fit="contain"
      heightType="fixed"
      horizontalAlign="center"
      marginType="normal"
      retoolFileObject=""
      src="https://ik.imagekit.io/xp8c4ep1p/Society%20Store/Payment%20options/Union.png?updatedAt=1743165137697"
    />
    <SegmentedControl
      id="paymentOptionsDisabled4"
      disabled="true"
      itemMode="static"
      label=""
      labelPosition="top"
      marginType="normal"
      paddingType="spacious"
      value="Cash"
    >
      <Option id="f4b5f" value="Cash" />
    </SegmentedControl>
    <Text
      id="text79"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value="<b>To Be Paid</b>"
      verticalAlign="center"
    />
    <Text
      id="text80"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.92)" }] }}
      value={'<h1 style="font-weight:500;">₹{{ toBePaid.value }}</h1>'}
      verticalAlign="center"
    />
    <Button
      id="confirmOrderBtn4"
      disabled="{{  CreateOrderCash.isFetching }}"
      hidden=""
      loading="{{ ConfirmOrderCash.isFetching || CreateOrderCash.isFetching }}"
      marginType="normal"
      style={{
        ordered: [{ borderRadius: "10px" }, { background: "rgb(255, 82, 0)" }],
      }}
      text="Accept Cash From Customer"
    >
      <Event
        event="click"
        method="show"
        params={{}}
        pluginId="modalFrame1"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="refreshBtn4"
      disabled="{{ GetOrderStatus.isFetching }}"
      hidden="true"
      horizontalAlign="right"
      iconBefore="bold/interface-arrows-synchronize"
      loading=""
      marginType="normal"
      style={{
        ordered: [{ border: "rgba(0, 0, 0, 0)" }, { label: "rgb(255, 82, 0)" }],
      }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="GetOrderStatus"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Container
      id="container41"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      hidden="true"
      marginType="normal"
      padding="0"
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text
          id="containerTitle42"
          marginType="normal"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="f85dc" viewKey="View 1">
        <Container
          id="container42"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          heightType="fixed"
          hidden="{{ true }}"
          marginType="normal"
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
              id="containerTitle41"
              marginType="normal"
              value="#### Container title"
              verticalAlign="center"
            />
          </Header>
          <View id="d7502" viewKey="View 1">
            <IconText
              id="iconText8"
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
      </View>
    </Container>
    <Container
      id="container40"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      hidden="true"
      marginType="normal"
      padding="0"
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text
          id="containerTitle40"
          marginType="normal"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="f85dc" viewKey="View 1">
        <QRCode
          id="qrCode4"
          heightType="fixed"
          hidden="{{ paymentOptions.selectedIndex !== 0 }}"
          horizontalAlign="center"
          marginType="normal"
          value="{{qrCodeUrl.value}}"
        />
      </View>
    </Container>
  </View>
  <View
    id="53172"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="paymentDone"
  />
</Container>
