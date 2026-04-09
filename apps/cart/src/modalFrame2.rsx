<ModalFrame
  id="modalFrame2"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showOverlay={true}
  size="large"
>
  <Button
    id="modalCloseButton3"
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
      pluginId="modalFrame2"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Text
    id="modalTitle4"
    marginType="normal"
    style={{ ordered: [{ color: "rgba(13, 13, 13, 0.75)" }] }}
    value="#### {{selected_item_for_variant.value.product_name}}"
    verticalAlign="center"
  />
  <Divider id="divider56" style={{ map: { color: "surfacePrimary" } }} />
  <Divider id="divider57" style={{ map: { color: "surfacePrimary" } }} />
  <Divider id="divider58" style={{ map: { color: "surfacePrimary" } }} />
  <Container
    id="container68"
    footerPadding="4px 12px"
    headerPadding="4px 12px"
    padding="12px"
    showBody={true}
    showBorder={false}
  >
    <Header>
      <Text
        id="containerTitle70"
        value="#### Container title"
        verticalAlign="center"
      />
    </Header>
    <View id="00030" viewKey="View 1">
      <ListViewBeta
        id="listView6"
        _primaryKeys=""
        data="{{ selected_item_for_variant.value?.combo_details }}"
        enableInstanceValues={true}
        heightType="auto"
        itemWidth="200px"
        layoutType="grid"
        margin="0"
        marginType="none"
        numColumns="2"
        padding="0"
      >
        <Include src="./container67.rsx" />
        <Include src="./container65.rsx" />
        <Container
          id="container66"
          _gap="0px"
          disabled=""
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          loading=""
          marginType="normal"
          padding="12px"
          showBody={true}
        >
          <View id="9eee4" viewKey="View 1" />
        </Container>
      </ListViewBeta>
    </View>
  </Container>
  <Divider id="divider51" style={{ map: { color: "surfacePrimary" } }} />
  <Divider id="divider52" style={{ map: { color: "surfacePrimary" } }} />
  <Divider id="divider53" style={{ map: { color: "surfacePrimary" } }} />
  <Divider id="divider54" style={{ map: { color: "surfacePrimary" } }} />
  <Divider id="divider59" style={{ map: { color: "surfacePrimary" } }} />
  <Divider id="divider55" style={{ map: { color: "surfacePrimary" } }} />
</ModalFrame>
