<ModalFrame
  id="openHoursModal"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showHeader={true}
  showHeaderBorder={false}
  showOverlay={true}
  size="large"
>
  <Header>
    <Text id="modalTitle6" value="### Openingstijden" verticalAlign="center" />
    <Button
      id="modalCloseButton11"
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
        pluginId="openHoursModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Container
      id="container454"
      _direction="vertical"
      _gap="20px"
      _type="stack"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      margin="0"
      overflowType="hidden"
      padding="12px"
      showBody={true}
      showBorder={false}
    >
      <View id="00030" viewKey="View 1">
        <Container
          id="stack1"
          _flexWrap={true}
          _gap="0"
          _justify="center"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
        >
          <View id="00030" viewKey="View 1">
            <Include src="./stack4.rsx" />
            <Include src="./stack37.rsx" />
            <Include src="./stack20.rsx" />
            <Include src="./stack45.rsx" />
          </View>
        </Container>
        <Container
          id="stack2"
          _flexWrap={true}
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
        >
          <View id="00030" viewKey="View 1">
            <Button
              id="button442"
              heightType="auto"
              style={{ map: { background: "tokens/8ca1af49" } }}
              text="Annuleren"
            >
              <Event
                event="click"
                method="hide"
                params={{}}
                pluginId="openHoursModal"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </Button>
            <Button id="button443" heightType="auto" style={{}} text="Opslaan">
              <Event
                event="click"
                method="trigger"
                params={{}}
                pluginId="addOpenHours"
                type="datasource"
                waitMs="0"
                waitType="debounce"
              />
              <Event
                event="click"
                method="hide"
                params={{}}
                pluginId="openHoursModal"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </Button>
          </View>
        </Container>
      </View>
    </Container>
  </Body>
</ModalFrame>
