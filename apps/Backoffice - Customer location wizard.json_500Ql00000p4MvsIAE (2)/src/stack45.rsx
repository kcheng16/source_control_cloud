<Container
  id="stack45"
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
    <Text id="text396" margin="0" value="Vanaf" verticalAlign="center" />
  </Header>
  <View id="00030" viewKey="View 1">
    <Container
      id="stack46"
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
          id="time8"
          iconBefore="bold/interface-time-clock-circle-alternate"
          label=""
          labelPosition="top"
          margin="0"
          placeholder="00:00"
          style={{ map: { border: "rgba(224, 224, 224, 0)" } }}
          value="{{ getOpenHoursQuery?.data[0]?.openTime || '08:00' }}"
        />
      </View>
    </Container>
    <Container
      id="stack54"
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
          id="time9"
          iconBefore="bold/interface-time-clock-circle-alternate"
          label=""
          labelPosition="top"
          margin="0"
          placeholder="00:00"
          style={{ map: { border: "rgba(224, 224, 224, 0)" } }}
          value="{{ getOpenHoursQuery?.data[1]?.openTime || '08:00' }}"
        />
      </View>
    </Container>
    <Container
      id="stack55"
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
          id="time10"
          iconBefore="bold/interface-time-clock-circle-alternate"
          label=""
          labelPosition="top"
          margin="0"
          placeholder="00:00"
          style={{ map: { border: "rgba(224, 224, 224, 0)" } }}
          value="{{ getOpenHoursQuery?.data[2]?.openTime || '08:00' }}"
        />
      </View>
    </Container>
    <Container
      id="stack56"
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
          id="time11"
          iconBefore="bold/interface-time-clock-circle-alternate"
          label=""
          labelPosition="top"
          margin="0"
          placeholder="00:00"
          style={{ map: { border: "rgba(224, 224, 224, 0)" } }}
          value="{{ getOpenHoursQuery?.data[3]?.openTime || '08:00' }}"
        />
      </View>
    </Container>
    <Container
      id="stack57"
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
          id="time12"
          iconBefore="bold/interface-time-clock-circle-alternate"
          label=""
          labelPosition="top"
          margin="0"
          placeholder="00:00"
          style={{ map: { border: "rgba(224, 224, 224, 0)" } }}
          value="{{ getOpenHoursQuery?.data[4]?.openTime || '08:00' }}"
        />
      </View>
    </Container>
    <Container
      id="stack58"
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
          id="time13"
          iconBefore="bold/interface-time-clock-circle-alternate"
          label=""
          labelPosition="top"
          margin="0"
          placeholder="00:00"
          style={{ map: { border: "rgba(224, 224, 224, 0)" } }}
          value="{{ getOpenHoursQuery?.data[5]?.openTime }}"
        />
      </View>
    </Container>
    <Container
      id="stack59"
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
          id="time14"
          iconBefore="bold/interface-time-clock-circle-alternate"
          label=""
          labelPosition="top"
          margin="0"
          placeholder="00:00"
          style={{ map: { border: "rgba(224, 224, 224, 0)" } }}
          value="{{ getOpenHoursQuery?.data[6]?.openTime }}"
        />
      </View>
    </Container>
  </View>
</Container>
