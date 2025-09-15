<App>
  <Include src="./functions.rsx" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <ModuleContainerWidget
      id="moduleContainer"
      backgroundColor="white"
      isGlobalWidgetContainer={true}
      module_input_query="initial_query"
      query3="initial_query"
    >
      <JSONExplorer id="jsonExplorer1" value="{{ module_input_query.data }}" />
      <Button id="button1" text="Button">
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="module_input_query"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
    </ModuleContainerWidget>
  </Frame>
</App>
