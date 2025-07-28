<SidebarFrame
  id="sidebarFrame1"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  isHiddenOnMobile={true}
  padding="8px 12px"
  showFooter={true}
  width="large"
>
  <Body>
    <Button
      id="button1"
      disabled="{{ retoolContext.currentPage != 'CaseList' }}"
      text="Create New Case"
    >
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="Modal_NewCase"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Navigation
      id="navigation1"
      itemMode="static"
      orientation="vertical"
      src={null}
      srcType={null}
    >
      <Option
        id="2861b"
        icon="bold/interface-text-formatting-list-bullets"
        iconPosition="left"
        itemType="custom"
        label="Case List"
        screenTargetId="CaseList"
      >
        <Event
          event="click"
          method="openPage"
          params={{
            ordered: [
              { options: { ordered: [{ passDataWith: "urlParams" }] } },
              { pageName: "CaseList" },
            ],
          }}
          pluginId=""
          type="util"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="setValue"
          params={{ ordered: [{ value: "Math.random()" }] }}
          pluginId="global_trigger_bit"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </Option>
      <Option
        id="8e592"
        icon="bold/interface-setting-zoom-area"
        iconPosition="left"
        itemType="page"
        label="Case Viewer"
        screenTargetId="CaseViewer"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId=""
        targetId="26a57"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Navigation>
  </Body>
  <Footer>
    <Avatar
      id="avatar1"
      fallback="{{ current_user.fullName }}"
      imageSize={32}
      label="{{ current_user.fullName }}"
      labelCaption="{{ current_user.email }}"
      margin="4px 4px"
      src="{{ current_user.profilePhotoUrl }}"
      style={{ ordered: [{ background: "automatic" }] }}
    />
  </Footer>
</SidebarFrame>
