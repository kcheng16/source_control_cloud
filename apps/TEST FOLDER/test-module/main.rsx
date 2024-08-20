<App>
  <Include src="./functions.rsx" />
  <Frame id="$main" padding="8px 12px" sticky={false} type="main">
    <ModuleContainerWidget
      id="moduleContainer"
      backgroundColor="white"
      isGlobalWidgetContainer={true}
      style={{ ordered: [] }}
    >
      <Text id="text2" value="# Test module" verticalAlign="center" />
      <TextInput
        id="gsearch"
        _defaultValue=""
        _disclosedFields={{ array: [] }}
        disabled=""
        hidden={null}
        iconBefore="search"
        label=""
        labelAlign="right"
        labelWrap={true}
        maintainSpaceWhenHidden={null}
        marginType="normal"
        placeholder="user@company.com, user-*, org-*"
        showClear={true}
        showInEditor={null}
        style={{ ordered: [] }}
      >
        <Event
          event="submit"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="search_start"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </TextInput>
      <Button
        id="search_button"
        _disclosedFields={{ array: [] }}
        disabled=""
        hidden={null}
        loading="{{search_start.isFetching || search_org_name.isFetching || search_user_email.isFetching}}"
        maintainSpaceWhenHidden={null}
        marginType="normal"
        showInEditor={null}
        style={{ ordered: [] }}
        text="→"
      >
        <Event
          event="click"
          method="trigger"
          pluginId="search_start"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
      <Include src="./src/modal1.rsx" />
      <Image
        id="image1"
        _disclosedFields={{ array: [] }}
        dbBlobId="6cf0021b-067a-496b-961d-75cf4e151303"
        fit="contain"
        heightType="fixed"
        hidden={null}
        horizontalAlign="center"
        maintainSpaceWhenHidden={null}
        marginType="normal"
        showInEditor={null}
        src="https://placekitten.com/g/200/300"
        srcType="dbBlobId"
      >
        <Event
          event="click"
          method="openApp"
          params={{
            ordered: [
              { uuid: "63f95756-250b-11eb-851a-23cbbe20bbaf" },
              {
                options: {
                  ordered: [
                    { queryParams: null },
                    { hashParams: null },
                    { newTab: false },
                  ],
                },
              },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Image>
    </ModuleContainerWidget>
  </Frame>
</App>
