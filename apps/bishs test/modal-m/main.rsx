<App>
  <Include src="./functions.rsx" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    paddingType="normal"
    sticky={null}
    type="main"
  >
    <ModuleContainerWidget
      id="moduleContainer"
      backgroundColor="white"
      isGlobalWidgetContainer={true}
    >
      <Modal id="modal1" buttonText="Open Modal" events={[]}>
        <Button id="button1" styleVariant="solid" text="trigger query">
          <Event
            event="click"
            method="trigger"
            params={{ ordered: [] }}
            pluginId="query2"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <JSONExplorer id="jsonExplorer1" value="{{query1.data.args}}" />
      </Modal>
      <Image
        id="image2"
        horizontalAlign="center"
        src="https://placekitten.com/400/300"
      />
      <Image
        id="image1"
        horizontalAlign="center"
        src="https://placekitten.com/400/300"
      />
    </ModuleContainerWidget>
  </Frame>
</App>
