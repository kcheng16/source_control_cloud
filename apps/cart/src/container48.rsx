<Container
  id="container48"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="{{textInput1.value.trim().length > 1}}"
  marginType="normal"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle50"
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="c0a59" viewKey="View 1">
    <Spacer id="spacer10" marginType="normal" />
    <Icon
      id="icon6"
      horizontalAlign="center"
      icon="bold/interface-search"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.15)" }] }}
    />
    <Text
      id="text89"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.5)" }] }}
      value="**Your search results will appear here**"
      verticalAlign="center"
    />
    <Spacer id="spacer11" marginType="normal" />
  </View>
</Container>
