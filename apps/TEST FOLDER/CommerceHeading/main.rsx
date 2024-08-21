<App>
  <GlobalWidgetProp
    id="text"
    defaultValue={'"This is a Heading"'}
    value="This is a Noodle"
  />
  <GlobalWidgetProp
    id="type"
    defaultValue="h1"
    description="'h1' or 'h2'"
    value="h1"
  />
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
      text="This is a Noodle"
      type="h1"
    >
      <Text
        id="h1"
        heightType="fixed"
        hidden="{{type.value !== 'h1'}}"
        imageWidth="fill"
        marginType="normal"
        style={{ ordered: [{ color: "rgb(34, 34, 34)" }] }}
        value={
          '<div style="font-family: Reckless;font-size: 32px;font-style: normal;font-weight: 500;line-height: 125%;">{{text.value}}</div>'
        }
        verticalAlign="center"
      />
      <Text
        id="h3"
        heightType="fixed"
        hidden="{{type.value !== 'h3'}}"
        imageWidth="fill"
        marginType="normal"
        style={{ ordered: [{ color: "rgb(34, 34, 34)" }] }}
        value={
          '<div style="font-family: Reckless;font-size: 20px;font-style: normal;font-weight: 500;line-height: 125%;">{{text.value}}</div>'
        }
        verticalAlign="center"
      />
      <Text
        id="h2"
        heightType="fixed"
        hidden="{{ type.value !== 'h2' }}"
        imageWidth="fill"
        marginType="normal"
        style={{ ordered: [{ color: "rgb(34, 34, 34)" }] }}
        value={
          '<div style="font-family: Reckless;font-size: 24px;font-style: normal;font-weight: 300;line-height: 125%;">{{text.value}}</div>'
        }
        verticalAlign="center"
      />
    </ModuleContainerWidget>
  </Frame>
</App>
