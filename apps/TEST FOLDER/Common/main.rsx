<App>
  <Include src="./functions.rsx" />
  <GlobalWidgetOutput
    id="AllAppPermissions"
    value="{{_allAppPermissions.value}}"
  />
  <GlobalWidgetOutput id="APPS" value="{{_APPS.value}}" />
  <GlobalWidgetOutput
    id="AvailableSpaceKeys"
    value="{{_availableSpaceKeys.value}}"
  />
  <GlobalWidgetOutput
    id="CurrentAppPermissions"
    value="{{_currentAppPermissions.value}}"
  />
  <GlobalWidgetOutput id="CurrentRole" value="{{_currentRole.value}}" />
  <GlobalWidgetOutput id="CurrentRoleId" value="{{_currentRoleId.value}}" />
  <GlobalWidgetOutput id="CurrentRoleKey" value="{{_currentRoleKey.value}}" />
  <GlobalWidgetOutput id="CurrentSpace" value="{{_currentSpace.value}}" />
  <GlobalWidgetOutput id="CurrentSpaceId" value="{{_currentSpaceId.value}}" />
  <GlobalWidgetOutput id="CurrentSpaceKey" value="{{_currentSpaceKey.value}}" />
  <GlobalWidgetOutput
    id="KEY_CURRENT_SPACE_KEY"
    value="{{_KEY_CURRENT_SPACE_KEY.value}}"
  />
  <GlobalWidgetOutput id="ROLES" value="{{_ROLES.value}}" />
  <GlobalWidgetOutput id="SPACES" value="{{_SPACES.value}}" />
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
    />
  </Frame>
</App>
