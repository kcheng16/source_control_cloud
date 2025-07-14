<Screen
  id="myProfileScreen"
  title="My Profile"
  uuid="3bc0d221-4db9-4e11-90b3-b73bfedd44d5"
>
  <Container
    id="container1"
    align="flex-start"
    cornerType="square"
    gap={8}
    justify="flex-start"
    layout="row"
    padding={{ left: 0, right: 0, top: 0, bottom: 0 }}
    widthGrowFactor={1}
  >
    <Container
      id="container2"
      align="flex-start"
      cornerType="square"
      gap={8}
      hidden="{{!current_user.profilePhotoUrl}}"
      justify="flex-start"
      layout="column"
      padding={{ left: 0, right: 0, top: 0, bottom: 0 }}
      widthGrowFactor={1}
    >
      <Image
        id="image2"
        mode="center"
        ratio={1.3333333333333333}
        src="{{current_user.profilePhotoUrl}}"
      />
    </Container>
    <Container
      id="container3"
      align="flex-start"
      cornerType="square"
      gap={8}
      justify="flex-start"
      layout="column"
      padding={{ left: 0, right: 0, top: 0, bottom: 0 }}
      widthGrowFactor={2}
    >
      <Heading
        id="heading1"
        size="h1"
        value="{{ current_user.firstName || 'User' }}"
      />
      <Text
        id="text1"
        size="medium"
        value="{{ current_user.email }}"
        weight="semibold"
      />
    </Container>
  </Container>
</Screen>
