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
      <Button id="button1" styleVariant="solid" text="trigger query">
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="trigger_query_js"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
      <JSONExplorer id="jsonExplorer1" value="{{query1.data.args}}" />
      <Image
        id="image2"
        horizontalAlign="center"
        src="https://placekitten.com/400/300"
      />
      <Button id="button2" styleVariant="solid" text="trigger 2nd query">
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="query456"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
      <Button id="button3" styleVariant="solid" text="trigger 3rd query">
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="query3"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
      <Image
        id="image1"
        horizontalAlign="center"
        src="https://placekitten.com/400/300"
      />
    </ModuleContainerWidget>
  </Frame>
</App>
