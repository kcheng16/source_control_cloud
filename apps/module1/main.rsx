<App>
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
      overflowType="hidden"
    >
      <Text id="text1" value="# Module 1" verticalAlign="center" />
      <Text
        id="text2"
        value="### new commit and merge"
        verticalAlign="center"
      />
      <Image
        id="image1"
        heightType="fixed"
        horizontalAlign="center"
        src="https://picsum.photos/id/1025/800/600"
      />
    </ModuleContainerWidget>
  </Frame>
</App>
