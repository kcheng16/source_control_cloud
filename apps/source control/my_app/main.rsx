<App>
  <Include src="./functions.rsx" />
  <Frame
    id="$master"
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="master"
  >
    <Text
      id="text1"
      marginType="normal"
      value="# this is my app"
      verticalAlign="center"
    />
    <Image
      id="image1"
      heightType="fixed"
      horizontalAlign="center"
      src="https://picsum.photos/id/1025/800/600"
    />
  </Frame>
</App>
