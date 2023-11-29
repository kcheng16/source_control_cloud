<SidebarFrame
  id="sidebarFrame1"
  isHiddenOnMobile={true}
  isInEditMode={false}
  showFooter={true}
  showHeader={true}
>
  <Header>
    <Module
      id="Common"
      AllAppPermissions="{{AllAppPermissions.value}}"
      APPS="{{APPS.value}}"
      AvailableSpaceKeys="{{AvailableSpaceKeys.value}}"
      CurrentAppPermissions="{{CurrentAppPermissions.value}}"
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
    <Module
      id="sidebarHeader1"
      name="Sidebar Header"
      pageUuid="a3c9f17b-cba6-48df-8390-d296a82e8ceb"
    />
  </Header>
  <Body>
    <Module
      id="sidebarBody1"
      name="Sidebar Body"
      pageUuid="79b534cd-c72d-4bbe-a19a-07f64f99b229"
    />
  </Body>
  <Footer>
    <Avatar
      id="avatar1"
      fallback="{{ current_user.fullName }}"
      imageSize={32}
      label="{{ current_user.fullName }}"
      labelCaption="{{ current_user.email }}"
      src="{{ current_user.profilePhotoUrl }}"
      style={{ ordered: [{ background: "automatic" }] }}
    />
  </Footer>
</SidebarFrame>
