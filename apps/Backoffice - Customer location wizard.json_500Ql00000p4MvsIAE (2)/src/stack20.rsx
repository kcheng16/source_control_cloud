<Container
  id="stack20"
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
    <Text id="text393" margin="0" value="Tot" verticalAlign="center" />
  </Header>
  <View id="00030" viewKey="View 1">
    <Container
      id="stack22"
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
        <TextInput
          id="time1"
          iconBefore="bold/interface-time-clock-circle-alternate"
          label=""
          labelPosition="top"
          margin="0"
          placeholder="00:00"
          style={{ map: { border: "rgba(224, 224, 224, 0)" } }}
          value="{{ getOpenHoursQuery?.data[0]?.closeTime || '17:00' }}"
        />
      </View>
    </Container>
    <Container
      id="stack60"
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
        <TextInput
          id="time15"
          iconBefore="bold/interface-time-clock-circle-alternate"
          label=""
          labelPosition="top"
          margin="0"
          placeholder="00:00"
          style={{ map: { border: "rgba(224, 224, 224, 0)" } }}
          value="{{ getOpenHoursQuery?.data[1]?.closeTime || '17:00' }}"
        />
      </View>
    </Container>
    <Container
      id="stack61"
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
        <TextInput
          id="time16"
          iconBefore="bold/interface-time-clock-circle-alternate"
          label=""
          labelPosition="top"
          margin="0"
          placeholder="00:00"
          style={{ map: { border: "rgba(224, 224, 224, 0)" } }}
          value="{{ getOpenHoursQuery?.data[2]?.closeTime || '17:00' }}"
        />
      </View>
    </Container>
    <Container
      id="stack62"
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
        <TextInput
          id="time17"
          iconBefore="bold/interface-time-clock-circle-alternate"
          label=""
          labelPosition="top"
          margin="0"
          placeholder="00:00"
          style={{ map: { border: "rgba(224, 224, 224, 0)" } }}
          value="{{ getOpenHoursQuery?.data[3]?.closeTime || '17:00' }}"
        />
      </View>
    </Container>
    <Container
      id="stack63"
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
        <TextInput
          id="time18"
          iconBefore="bold/interface-time-clock-circle-alternate"
          label=""
          labelPosition="top"
          margin="0"
          placeholder="00:00"
          style={{ map: { border: "rgba(224, 224, 224, 0)" } }}
          value="{{ getOpenHoursQuery?.data[4]?.closeTime || '17:00' }}"
        />
      </View>
    </Container>
    <Container
      id="stack64"
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
        <TextInput
          id="time19"
          iconBefore="bold/interface-time-clock-circle-alternate"
          label=""
          labelPosition="top"
          margin="0"
          placeholder="00:00"
          style={{ map: { border: "rgba(224, 224, 224, 0)" } }}
          value="{{ getOpenHoursQuery?.data[5]?.closeTime }}"
        />
      </View>
    </Container>
    <Container
      id="stack65"
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
        <TextInput
          id="time20"
          iconBefore="bold/interface-time-clock-circle-alternate"
          label=""
          labelPosition="top"
          margin="0"
          placeholder="00:00"
          style={{ map: { border: "rgba(224, 224, 224, 0)" } }}
          value="{{ getOpenHoursQuery?.data[0]?.closeTime }}"
        />
      </View>
    </Container>
  </View>
</Container>
