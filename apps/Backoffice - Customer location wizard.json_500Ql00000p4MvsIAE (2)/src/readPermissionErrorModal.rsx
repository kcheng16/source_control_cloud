<ModalFrame
  id="readPermissionErrorModal"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showOverlay={true}
  size="medium"
>
  <Container
    id="container87"
    _direction="vertical"
    _gap="15px"
    _type="stack"
    footerPadding="4px 12px"
    headerPadding="4px 12px"
    heightType="fixed"
    padding="12px"
    showBody={true}
  >
    <View id="00030" viewKey="View 1">
      <Text
        id="text26"
        value="#### You don't have enough permissions to view this page."
        verticalAlign="center"
      />
      <Button id="button112" text="Close">
        <Event
          id="19c71e59"
          event="click"
          method="hide"
          params={{}}
          pluginId="readPermissionErrorModal"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
    </View>
  </Container>
</ModalFrame>
