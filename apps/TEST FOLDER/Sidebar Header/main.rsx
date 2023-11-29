<App>
  <Frame
    id="$main"
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    sticky={false}
    type="main"
  >
    <ModuleContainerWidget
      id="moduleContainer"
      backgroundColor="white"
      isGlobalWidgetContainer={true}
    >
      <Link
        id="LandingPageLink"
        iconBefore="bold/interface-arrows-left"
        marginType="normal"
        showUnderline="never"
        style={{ ordered: [{ text: "secondary" }] }}
        text="Space Selection"
      >
        <Event
          event="click"
          method="openApp"
          params={{
            ordered: [{ uuid: "b59b40ce-d26a-11ed-aece-7301caeae6e8" }],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Link>
      <Select
        id="SpaceSelect"
        captionByIndex=""
        data="{{ Object.keys(Common.SPACES) }}"
        disabledByIndex=""
        emptyMessage="No options"
        fallbackTextByIndex=""
        hiddenByIndex="{{!Common.AvailableSpaceKeys.includes(item)}}"
        label=""
        labels="{{Common.SPACES[item].name}}"
        marginType="normal"
        overlayMaxHeight={375}
        placeholder="Select an option"
        searchMode="disabled"
        showSelectionIndicator={true}
        value="{{Common.CurrentSpaceKey}}"
        values="{{item}}"
      >
        <Event
          event="change"
          method="setValue"
          params={{
            ordered: [
              { key: "{{Common.KEY_CURRENT_SPACE_KEY}}" },
              { newValue: "{{self.value}}" },
            ],
          }}
          pluginId=""
          type="localStorage"
          waitMs="0"
          waitType="debounce"
        />
      </Select>
      <Icon
        id="SpaceSettingsIcon"
        horizontalAlign="center"
        icon="bold/interface-setting-cog"
        marginType="normal"
        style={{ ordered: [{ color: "" }] }}
        styleVariant="transparent"
      >
        <Event
          event="click"
          method="openApp"
          params={{
            ordered: [{ uuid: "690db24a-468d-11ee-9ece-73bd2e2eb800" }],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
      </Icon>
      <Module
        id="Common"
        AvailableSpaceKeys="{{AvailableSpaceKeys.value}}"
        CurrentRole="{{CurrentRole.value}}"
        CurrentRoleId="{{CurrentRoleId.value}}"
        CurrentRoleKey="{{CurrentRoleKey.value}}"
        CurrentSpace="{{CurrentSpace.value}}"
        CurrentSpaceId="{{CurrentSpaceId.value}}"
        CurrentSpaceKey="{{CurrentSpaceKey.value}}"
        hidden="true"
        KEY_CURRENT_SPACE_KEY="{{KEY_CURRENT_SPACE_KEY.value}}"
        name="Common"
        pageUuid="6881bc8d-d513-46f8-b7fa-5dc9dc831515"
        ROLES="{{ROLES.value}}"
        SPACES="{{SPACES.value}}"
      />
    </ModuleContainerWidget>
  </Frame>
</App>
