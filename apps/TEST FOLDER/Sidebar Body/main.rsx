<App>
  <Include src="./functions.rsx" />
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
      <ListView
        id="ListView"
        instances="{{AppsAndCategories.value.length}}"
        marginType="normal"
        paddingType="normal"
        rowKeys=""
        showBorder={false}
        showDropShadow={false}
        style={{ ordered: [{ "primary-surface": "rgba(255, 255, 255, 0)" }] }}
      >
        <Text
          id="Headers"
          hidden={'{{AppsAndCategories.value[i].type !== "category"}}'}
          marginType="normal"
          style={{ ordered: [{ color: "secondary" }] }}
          value="**{{AppsAndCategories.value[i].name}}**"
          verticalAlign="center"
        />
        <Button
          id="Links"
          hidden={
            '{{AppsAndCategories.value[i].type !== "link" && AppsAndCategories.value[i].type !== "external_link"}}'
          }
          horizontalAlign="left"
          iconAfter={
            '{{AppsAndCategories.value[i].type == "external_link" ?  "/icon:bold/interface-link-square-alternate"  : null}}'
          }
          iconBefore="{{AppsAndCategories.value[i].icon}}"
          marginType="normal"
          style={{ ordered: [{ border: "rgba(10, 14, 20, 0)" }] }}
          styleVariant="outline"
          text="{{AppsAndCategories.value[i].name}}"
        >
          <Event
            event="click"
            method="openUrl"
            params={{
              ordered: [
                { url: "{{AppsAndCategories.value[i].url}}" },
                { options: { ordered: [{ newTab: false }] } },
              ],
            }}
            pluginId=""
            type="util"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Button
          id="ActiveLink"
          hidden={'{{AppsAndCategories.value[i].type !== "active_link"}}'}
          horizontalAlign="left"
          iconBefore="{{AppsAndCategories.value[i].icon}}"
          marginType="normal"
          style={{
            ordered: [
              { background: "highlight" },
              { border: "rgba(214, 149, 99, 0)" },
            ],
          }}
          styleVariant="solid"
          text="{{AppsAndCategories.value[i].name}}"
        >
          <Event
            event="click"
            method="openUrl"
            params={{
              ordered: [
                { url: "{{AppsAndCategories.value[i].url}}" },
                { options: { ordered: [{ newTab: false }] } },
              ],
            }}
            pluginId=""
            type="util"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </ListView>
    </ModuleContainerWidget>
  </Frame>
</App>
