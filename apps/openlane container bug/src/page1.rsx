<Screen
  id="page1"
  _customShortcuts={[]}
  _hashParams={[]}
  _searchParams={[]}
  browserTitle=""
  title="Page 1"
  urlSlug=""
>
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    type="main"
  >
    <Container
      id="container1"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="containerTitle1"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <ListViewBeta
          id="listView1"
          data={
            '["Fluffy", "Whiskers", "Fido", "Mittens", "Rex", "Snowball", "Spot", "Lucky", "Princess", "Buddy", "Milo", "Cleo", "Lola", "Simba", "Rocky", "Ginger", "Spike", "Max", "Cupcake", "Oreo"]'
          }
          itemWidth="200px"
          margin="0"
          numColumns={3}
          padding="0"
        >
          <Container
            id="container2"
            footerPadding="4px 12px"
            headerPadding="4px 12px"
            padding="12px"
            showBody={true}
            showHeader={true}
          >
            <Header>
              <Text
                id="containerTitle2"
                value="#### {{ item }}"
                verticalAlign="center"
              />
            </Header>
            <View id="00030" viewKey="View 1">
              <Container
                id="container3"
                _align="center"
                _gap="0px"
                _type="stack"
                footerPadding="4px 12px"
                headerPadding="4px 12px"
                padding="12px"
                showBody={true}
                showHeader={true}
              >
                <Header>
                  <Text
                    id="containerTitle3"
                    value="#### Container title"
                    verticalAlign="center"
                  />
                </Header>
                <View id="00030" viewKey="View 1">
                  <Button
                    id="button1"
                    hidden="false"
                    iconBefore="bold/interface-align-layers-3-alternate"
                    style={{ map: { background: "surfacePrimary" } }}
                    text="BUTTON"
                  />
                  <Button id="button2" text="Button" />
                  <Link id="link1" text="Link" />
                </View>
              </Container>
            </View>
          </Container>
        </ListViewBeta>
      </View>
    </Container>
  </Frame>
</Screen>
