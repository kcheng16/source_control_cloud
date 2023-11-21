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
      <Modal
        id="modal1"
        buttonText="Open Modal"
        events={[
          {
            ordered: [
              { event: "open" },
              { type: "datasource" },
              { method: "trigger" },
              { pluginId: "query1" },
              { targetId: null },
              { params: { ordered: [] } },
              { waitType: "debounce" },
              { waitMs: "0" },
            ],
          },
        ]}
      >
        <Button id="button1" styleVariant="solid" text="trigger query" />
        <JSONExplorer id="jsonExplorer1" value="{{query1.data.args}}" />
      </Modal>
    </ModuleContainerWidget>
  </Frame>
</App>
