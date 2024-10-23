<Frame
  id="$header"
  enableFullBleed={null}
  isHiddenOnDesktop={false}
  isHiddenOnMobile={true}
  paddingType="normal"
  sticky={true}
  type="header"
>
  <Navigation
    id="navigation1"
    itemMode="static"
    src="https://retool-edge.com/83d4d9a1f1ecd17d111e6b4a014043cd.svg"
  >
    <Option id="75c9a" label="Menu item 1" />
    <Option id="92c84" label="Menu item 2" />
    <Option id="4d5bb" label="Menu item 3" />
  </Navigation>
  <Text
    id="text1"
    value="👋 **Hello {{ current_user.firstName || 'friend' }}!**"
    verticalAlign="center"
  />
</Frame>
