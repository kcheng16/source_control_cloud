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
      <Text id="text1" value="# This is my module" verticalAlign="center" />
      <Image
        id="image1"
        horizontalAlign="center"
        src="https://placekitten.com/400/300"
      />
      <Image
        id="image2"
        horizontalAlign="center"
        src="https://placekitten.com/400/300"
      />
      <Image
        id="image3"
        horizontalAlign="center"
        src="https://placekitten.com/400/300"
      />
      <JSONExplorer id="jsonExplorer1" value="{{my_get_request.data}}" />
      <Button id="button1" styleVariant="solid" text="Trigger query1">
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="my_get_request"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
      <TextInput
        id="textInput1"
        label="my_key is"
        placeholder="Enter value"
        value="12345"
      />
    </ModuleContainerWidget>
  </Frame>
</App>
