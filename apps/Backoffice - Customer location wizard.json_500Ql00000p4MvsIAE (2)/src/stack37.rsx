<Container
  id="stack37"
  _direction="vertical"
  _flexWrap={true}
  _gap="0px"
  _type="stack"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  margin="0"
  padding="0"
  showBody={true}
  showBorder={false}
  showHeader={true}
  showHeaderBorder={false}
>
  <Header>
    <Text
      id="text395"
      margin="0"
      value="Open of gesloten?"
      verticalAlign="center"
    />
  </Header>
  <View id="00030" viewKey="View 1">
    <Container
      id="stack38"
      _align="center"
      _flexWrap={true}
      _gap="0px"
      _justify="center"
      _type="stack"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      overflowType="hidden"
      padding="0"
      showBody={true}
    >
      <View id="00030" viewKey="View 1">
        <Switch
          id="switch1"
          label="{{ switch1.value ? 'Open' : 'Gesloten' }}"
          value="{{ getOpenHoursQuery?.data[0]?.isOpen || true }}"
        />
      </View>
    </Container>
    <Container
      id="stack39"
      _align="center"
      _flexWrap={true}
      _gap="0px"
      _justify="center"
      _type="stack"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      overflowType="hidden"
      padding="0"
      showBody={true}
    >
      <View id="00030" viewKey="View 1">
        <Switch
          id="switch2"
          label="{{ switch2.value ? 'Open' : 'Gesloten' }}"
          value="{{ getOpenHoursQuery?.data[1]?.isOpen || true }}"
        />
      </View>
    </Container>
    <Container
      id="stack40"
      _align="center"
      _flexWrap={true}
      _gap="0px"
      _justify="center"
      _type="stack"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      overflowType="hidden"
      padding="0"
      showBody={true}
    >
      <View id="00030" viewKey="View 1">
        <Switch
          id="switch3"
          label="{{ switch3.value ? 'Open' : 'Gesloten' }}"
          value="{{ getOpenHoursQuery?.data[2]?.isOpen || true }}"
        />
      </View>
    </Container>
    <Container
      id="stack41"
      _align="center"
      _flexWrap={true}
      _gap="0px"
      _justify="center"
      _type="stack"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      overflowType="hidden"
      padding="0"
      showBody={true}
    >
      <View id="00030" viewKey="View 1">
        <Switch
          id="switch4"
          label="{{ switch4.value ? 'Open' : 'Gesloten' }}"
          value="{{ getOpenHoursQuery?.data[3]?.isOpen || true }}"
        />
      </View>
    </Container>
    <Container
      id="stack42"
      _align="center"
      _flexWrap={true}
      _gap="0px"
      _justify="center"
      _type="stack"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      overflowType="hidden"
      padding="0"
      showBody={true}
    >
      <View id="00030" viewKey="View 1">
        <Switch
          id="switch5"
          label="{{ switch5.value ? 'Open' : 'Gesloten' }}"
          value="{{ getOpenHoursQuery?.data[4]?.isOpen || true }}"
        />
      </View>
    </Container>
    <Container
      id="stack43"
      _align="center"
      _flexWrap={true}
      _gap="0px"
      _justify="center"
      _type="stack"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      overflowType="hidden"
      padding="0"
      showBody={true}
    >
      <View id="00030" viewKey="View 1">
        <Switch
          id="switch6"
          label="{{ switch6.value ? 'Open' : 'Gesloten' }}"
          value="{{ getOpenHoursQuery?.data[5]?.isOpen }}"
        />
      </View>
    </Container>
    <Container
      id="stack44"
      _align="center"
      _flexWrap={true}
      _gap="0px"
      _justify="center"
      _type="stack"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      overflowType="hidden"
      padding="0"
      showBody={true}
    >
      <View id="00030" viewKey="View 1">
        <Switch
          id="switch7"
          label="{{ switch7.value ? 'Open' : 'Gesloten' }}"
          value="{{ getOpenHoursQuery?.data[6]?.isOpen }}"
        />
      </View>
    </Container>
  </View>
</Container>
