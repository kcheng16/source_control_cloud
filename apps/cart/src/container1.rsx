<Container
  id="container1"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  heightType="fixed"
  hidden="true"
  hoistFetching={true}
  loading="false"
  marginType="normal"
  padding="12px"
  showBody={true}
  style={{ ordered: [{ borderRadius: "12px" }] }}
>
  <Header>
    <Text
      id="containerTitle1"
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="a4f18" viewKey="View 1">
    <Container
      id="container4"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      marginType="normal"
      overflowType="hidden"
      padding="0"
      showBody={true}
      style={{
        ordered: [
          { background: "rgb(246, 246, 249)" },
          { borderRadius: "6px" },
        ],
      }}
    >
      <Header>
        <Text
          id="containerTitle4"
          marginType="normal"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="a4f18" viewKey="View 1">
        <Image
          id="image1"
          fit="contain"
          heightType="fixed"
          horizontalAlign="center"
          marginType="normal"
          src="https://ik.imagekit.io/xp8c4ep1p/Society%20Store/Group%201686557791.png?updatedAt=1742882615527"
        />
        <Text
          id="text1"
          heightType="fixed"
          marginType="normal"
          overflowType="hidden"
          style={{ ordered: [{ color: "rgba(2, 6, 12, 0.7)" }] }}
          value={
            '<span style="font-weight:500">{{ \nlocalStorage?.values?.userData?.isGuestLogin ? localStorage?.values?.storeData?.name : localStorage?.values?.userData?.name?.toUpperCase() || "" }}</span>'
          }
          verticalAlign="center"
        />
        <Text
          id="text2"
          marginType="normal"
          style={{ ordered: [{ color: "rgba(2, 6, 12, 0.3)" }] }}
          value={
            '{{ maskMobileNumber(localStorage?.values?.userData?.mobile || "") }}'
          }
          verticalAlign="center"
        />
      </View>
    </Container>
    <TextInput
      id="hiddenInputCart"
      disabled=""
      hidden=""
      label=""
      labelPosition="top"
      marginType="normal"
      placeholder="Scanned barcode"
      showClear={true}
    >
      <Event
        enabled=""
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: 'const barcodeValue = hiddenInputCart2.value;\n\nif (hiddenInputCart2.value.length > 0) {\n  BarcodeScanByPaste.trigger();\n} else {\n  hiddenInputCart2.clearValidation();\n  hiddenInputCart2.clearValue();\n  hiddenInputCart2.focus();\n}\n\n// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "item-scanned",\n  object_value: {\n    barcode: barcodeValue\n  }\n});\n',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="300"
        waitType="debounce"
      />
    </TextInput>
    <Button
      id="button1"
      disabled="{{ BarcodeScanByPaste.isFetching }}"
      iconBefore="bold/interface-search"
      marginType="normal"
      style={{
        ordered: [
          { label: "rgb(255, 82, 0)" },
          { border: "rgba(2, 6, 12, 0.1)" },
        ],
      }}
      styleVariant="outline"
      text="Search Items"
    >
      <Event
        event="click"
        method="openApp"
        params={{ ordered: [{ uuid: "0371326a-a0ef-414f-8e8f-2548e71fe4cf" }] }}
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
              src: '// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "search-item-cta-click",\n  object_value: ""\n});\n',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button2"
      disabled="{{ BarcodeScanByPaste.isFetching || AddCart.isFetching || GetCart.isFetching }}"
      iconBefore="bold/interface-add-1"
      marginType="normal"
      style={{
        ordered: [
          { label: "rgb(255, 82, 0)" },
          { border: "rgba(2, 6, 12, 0.1)" },
        ],
      }}
      styleVariant="outline"
      text="Scan Items"
    >
      <Event
        event="click"
        method="run"
        params={{ ordered: [{ src: "//  scanItemModal.show();" }] }}
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
            src: "hiddenInputCart2.clearValidation();\nhiddenInputCart2.clearValue();\nhiddenInputCart2.focus();\n",
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button8"
      disabled="{{ BarcodeScanByPaste.isFetching || AddCart.isFetching || GetCart.isFetching }}"
      iconBefore="bold/interface-add-1"
      marginType="normal"
      style={{
        ordered: [
          { label: "rgb(255, 82, 0)" },
          { border: "rgba(2, 6, 12, 0.1)" },
        ],
      }}
      styleVariant="outline"
      text="Add Item Manually"
    >
      <Event
        event="click"
        method="run"
        params={{ ordered: [{ src: "addItemModal.show();" }] }}
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
            src: "hiddenInputCart2.clearValidation();\nhiddenInputCart2.clearValue();\nhiddenInputCart2.focus();\n",
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button3"
      disabled="{{ ClearCart.isFetching || BarcodeScanByPaste.isFetching }}"
      iconBefore="bold/interface-delete-bin-5-alternate"
      loading="{{ ClearCart.isFetching }}"
      marginType="normal"
      style={{
        ordered: [
          { label: "rgb(255, 82, 0)" },
          { border: "rgba(2, 6, 12, 0.1)" },
        ],
      }}
      styleVariant="outline"
      text="Clear Cart"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="ClearCart"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: '// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "clear-cart",\n  object_value: ""\n});',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Container
      id="container7"
      disabled="false"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      hoistFetching={true}
      loading="false"
      marginType="normal"
      overflowType="hidden"
      padding="12px"
      showBody={true}
      showBorder={false}
      style={{
        ordered: [
          { background: "rgba(2, 6, 12, 0.05)" },
          { borderRadius: "8px" },
        ],
      }}
    >
      <Header>
        <Text
          id="containerTitle7"
          marginType="normal"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="a9466" viewKey="View 1">
        <Text
          id="text22"
          marginType="normal"
          style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
          value={
            '<span style="font-weight:600">Items ({{GetCart?.data?.transformedData?.length || 0}})</span>'
          }
          verticalAlign="center"
        />
        <Text
          id="text23"
          horizontalAlign="center"
          marginType="normal"
          style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
          value={
            '<span style="font-weight:600">Qty ({{GetCart?.data?.transformedData?.reduce((acc, item) => acc + (item.quantity || 0), 0) || 0}})</span>'
          }
          verticalAlign="center"
        />
        <Text
          id="text24"
          marginType="normal"
          style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
          value={'<span style="font-weight:600">Subtotal</span>'}
          verticalAlign="center"
        />
      </View>
    </Container>
    <ListViewBeta
      id="listView1"
      _primaryKeys=""
      data="{{ GetCart?.data?.transformedData?.length ? GetCart.data.transformedData : [] }}"
      hidden="{{ GetCart?.data?.transformedData?.length ? false : true }}"
      itemWidth="200px"
      margin="0"
      marginType="none"
      numColumns={3}
      padding="0"
    >
      <Include src="./container6.rsx" />
    </ListViewBeta>
    <Container
      id="container9"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      hidden="{{ GetCart?.data?.transformedData?.length ? true: false }}"
      marginType="normal"
      overflowType="hidden"
      padding="12px"
      showBody={true}
    >
      <Header>
        <Text
          id="containerTitle9"
          marginType="normal"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="1647d" viewKey="View 1">
        <Image
          id="image4"
          dbBlobId="3dac1618-39e1-4772-8cc0-b0ee6c02169a"
          fit="contain"
          heightType="fixed"
          horizontalAlign="center"
          marginType="normal"
          src="https://ik.imagekit.io/xp8c4ep1p/Society%20Store/scan%20to%20add%20items.png?updatedAt=1743569222878"
        />
        <Text
          id="text30"
          horizontalAlign="center"
          marginType="normal"
          style={{ ordered: [{ color: "rgba(2, 6, 12, 0.45)" }] }}
          value="#### Click on Add Items"
          verticalAlign="center"
        />
      </View>
    </Container>
  </View>
</Container>
