<ModalFrame
  id="addItemModal"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showOverlay={true}
  style={{ ordered: [{ borderRadius: "16px" }] }}
>
  <Header>
    <Text
      id="modalTitle1"
      marginType="normal"
      value="### Container title"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton1"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      marginType="normal"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="addItemModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Icon
      id="icon1"
      horizontalAlign="center"
      icon="line/interface-delete-1"
      marginType="normal"
    >
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="addItemModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text
      id="text25"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.92)" }] }}
      value="<h3>Add item manually</h3>"
      verticalAlign="center"
    />
    <Text
      id="text26"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.6)" }] }}
      value={
        '<p style="font-size:15px; font-weight:500;">Enter barcode to find item</p>'
      }
      verticalAlign="center"
    />
    <TextInput
      id="enterBarcodeInput"
      label=""
      labelPosition="top"
      marginType="normal"
      placeholder="Enter Barcode"
      style={{ ordered: [{ borderRadius: "6px" }] }}
    />
    <Button
      id="button5"
      disabled="{{ !enterBarcodeInput.value || BarcodeScanManually.isFetching || AddCart.isFetching }}"
      iconBefore="bold/interface-search"
      loading="{{ BarcodeScanManually.isFetching || AddCart.isFetching }}"
      marginType="normal"
      style={{
        ordered: [{ borderRadius: "6px" }, { background: "rgb(255, 82, 0)" }],
      }}
      text="Search"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="BarcodeScanManually"
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
              src: '// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "enter-barcode-search",\n  object_value: enterBarcodeInput.value\n});',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <ListViewBeta
      id="addItemManualList"
      _primaryKeys=""
      data="{{ BarcodeScanManually?.data?.data?.skus || [] }}"
      enableInstanceValues={true}
      itemWidth="200px"
      margin="0"
      marginType="none"
      numColumns={3}
      padding="0"
    >
      <Include src="./container8.rsx" />
    </ListViewBeta>
  </Body>
  <Event
    event="hide"
    method="reset"
    params={{ ordered: [] }}
    pluginId="BarcodeScanManually"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="hide"
    method="clearValue"
    params={{ ordered: [] }}
    pluginId="enterBarcodeInput"
    type="widget"
    waitMs="0"
    waitType="debounce"
  />
</ModalFrame>
