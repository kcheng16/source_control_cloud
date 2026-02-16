<App>
  <Include src="./functions.rsx" />
  <AppStyles id="$appStyles" css={include("./lib/$appStyles.css", "string")} />
  <CustomAppTheme
    id="$appTheme"
    _migrated={true}
    automatic={[
      "#fde68a",
      "#eecff3",
      "#a7f3d0",
      "#bfdbfe",
      "#c7d2fe",
      "#fecaca",
      "#fcd6bb",
    ]}
    borderRadius="4px"
    canvas="#f6f6f6"
    danger="#cf000f"
    defaultFont={{ size: "14px", fontWeight: "400" }}
    defaultFontId="da646369"
    fontIds={["da646369"]}
    fontMap={{
      map: {
        da646369: {
          name: "Lato",
          source:
            "https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900",
          fontWeights: ["100", "300", "400", "700", "900"],
        },
      },
    }}
    h1Font={{ size: "36px", fontWeight: "700" }}
    h2Font={{ size: "28px", fontWeight: "700" }}
    h3Font={{ size: "24px", fontWeight: "700" }}
    h4Font={{ size: "18px", fontWeight: "700" }}
    h5Font={{ size: "16px", fontWeight: "700" }}
    h6Font={{ size: "14px", fontWeight: "700" }}
    highlight="#fde68a"
    info="#3170f9"
    labelEmphasizedFont={{ size: "14px", fontWeight: "600" }}
    labelFont={{ size: "14px", fontWeight: "500" }}
    primary="#2b3860"
    secondary="#1fa2ab"
    success="#009944"
    surfacePrimary="#ffffff"
    surfacePrimaryBorder="#d5d7df"
    surfaceSecondary="#ffffff"
    surfaceSecondaryBorder=""
    tertiary="#da7f35"
    textDark="#0d0d0d"
    textLight="#ffffff"
    warning="#cd6f00"
  />
  <Include src="./src/clientLocationWizard.rsx" />
  <Include src="./src/readPermissionErrorModal.rsx" />
  <Include src="./sidebar.rsx" />
  <Container
    id="group405"
    _direction="vertical"
    _gap="0px"
    _type="stack"
    footerPadding="4px 12px"
    headerPadding="4px 12px"
    margin="0"
    padding="0"
    showBody={true}
    showBorder={false}
    style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
  >
    <View id="00030" viewKey="View 1">
      <Container
        id="group404"
        _align="center"
        _gap="0px"
        _type="stack"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        padding="0"
        showBody={true}
        showBorder={false}
        style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
      >
        <View id="00030" viewKey="View 1">
          <Container
            id="statusIndicator5"
            _gap="0px"
            _type="stack"
            enableFullBleed={true}
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            heightType="fixed"
            overflowType="hidden"
            padding="12px"
            showBody={true}
          >
            <Header>
              <Text
                id="containerTitle91"
                value="#### Container title"
                verticalAlign="center"
              />
            </Header>
            <View id="00030" viewKey="View 1">
              <Text
                id="statusIndicatorText5"
                horizontalAlign="center"
                style={{
                  background: "success",
                  fontSize: "14px",
                  fontWeight: "400",
                  fontFamily: "Lato",
                }}
                value="Actief"
                verticalAlign="center"
              />
            </View>
          </Container>
        </View>
      </Container>
    </View>
  </Container>
  <Container
    id="group406"
    _align="center"
    _gap="0px"
    _type="stack"
    footerPadding="4px 12px"
    headerPadding="4px 12px"
    margin="0px 8px"
    padding="12px"
    showBody={true}
    style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
  >
    <View id="00030" viewKey="View 1">
      <Container
        id="group407"
        _flexWrap={true}
        _gap="0px"
        _type="stack"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        margin="0"
        padding="0"
        showBody={true}
        showBorder={false}
        style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
      >
        <View id="00030" viewKey="View 1">
          <Tabs
            id="clientGroupAddModalTabs19"
            itemMode="static"
            style={{
              selectedBackground: "surfacePrimaryBorder",
              selectedText: "#2b3860",
              unselectedText: "primary",
              hoverText: "primary",
              fontSize: "labelEmphasizedFont",
              fontWeight: "labelEmphasizedFont",
              fontFamily: "labelEmphasizedFont",
              pillBorderRadius: "6px",
            }}
            targetContainerId=""
            value="{{ self.values[0] }}"
          >
            <Option id="00030" value="Tab 1" />
            <Option id="00031" value="Tab 2" />
            <Option id="00032" value="Tab 3" />
          </Tabs>
        </View>
      </Container>
    </View>
  </Container>
  <Container
    id="container44"
    _gap="0px"
    _type="stack"
    footerPadding="4px 12px"
    headerPadding="4px 12px"
    padding="12px"
    showBody={true}
    showBorder={false}
  >
    <View id="00030" viewKey="View 1" />
  </Container>
  <Container
    id="container45"
    _align="center"
    _gap="0px"
    _type="stack"
    footerPadding="4px 12px"
    headerPadding="4px 12px"
    heightType="fixed"
    margin="0"
    overflowType="hidden"
    padding="0"
    showBody={true}
    showBorder={false}
  >
    <View id="00030" viewKey="View 1">
      <Icon
        id="icon6"
        horizontalAlign="center"
        icon="bold/interface-bookmark-tag"
      />
      <Text
        id="containerTitle25"
        value="#### Rol intern"
        verticalAlign="center"
      />
    </View>
  </Container>
</App>
