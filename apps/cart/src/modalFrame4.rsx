<ModalFrame
  id="modalFrame4"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
  showOverlay={true}
  size="medium"
>
  <Header>
    <Button
      id="modalCloseButton5"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ map: { border: "transparent" } }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ map: { hidden: true } }}
        pluginId="modalFrame4"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="run"
        params={{ map: { src: "shipmentItems.value(null)" } }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="modalTitle6"
      value="#### Shipment Items for Order ID - {{ shipmentItems.value?.[0].order_id }}"
      verticalAlign="center"
    />
  </Header>
  <Body>
    <ListViewBeta
      id="listView7"
      data="{{ shipmentItems.value?.[0]?.items }}"
      itemWidth="200px"
      margin="0"
      numColumns={3}
      padding="0"
    >
      <Container
        id="container71"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        padding="12px"
        showBody={true}
      >
        <Header>
          <Text
            id="containerTitle73"
            value="#### {{ item.name }}"
            verticalAlign="center"
          />
        </Header>
        <View id="00030" viewKey="View 1">
          <Text
            id="text117"
            disableMarkdown={true}
            value="{{ item.name }}"
            verticalAlign="center"
          />
          <Text
            id="text118"
            value="Qty: {{ item.quantity }}"
            verticalAlign="center"
          />
        </View>
      </Container>
    </ListViewBeta>
  </Body>
</ModalFrame>
