<Container
  id="quickLinksContainer"
  _gap={0}
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  hoistFetching={true}
  marginType="normal"
  padding="12px"
  paddingType="normal"
  showBody={true}
  showHeader={true}
  style={{ ordered: [{ border: "rgb(203, 212, 222)" }] }}
>
  <Header>
    <Text
      id="containerTitle7"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="###### Quick Links"
      verticalAlign="center"
    />
  </Header>
  <View id="0eb3f" viewKey="View 1">
    <Button
      id="salesforceCaseButton2"
      _disclosedFields={{
        array: ["tooltipText", "label", "border", "borderRadius"],
      }}
      marginType="normal"
      style={{
        ordered: [
          { label: "rgb(18, 113, 235)" },
          { border: "rgb(203, 212, 222)" },
          { borderRadius: "40px" },
        ],
      }}
      styleVariant="outline"
      text="Go to Salesforce Case"
      tooltipText="If you need to do a request, like sending to S2 or checkpoint, click here! You can also click if it's not a lot full or not accepted and add a new tag in Salesforce."
    >
      <Event
        event="click"
        method="openUrl"
        params={{
          ordered: [
            {
              url: "https://spothero.lightning.force.com/lightning/r/Case/{{getCaseNumber.data['0'].Id}}/view",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button20"
      _disclosedFields={{ array: ["label", "borderRadius", "border"] }}
      marginType="normal"
      style={{
        ordered: [
          { label: "rgb(18, 113, 235)" },
          { borderRadius: "40px" },
          { border: "rgb(203, 212, 222)" },
        ],
      }}
      styleVariant="outline"
      text="Lot Full Bloomfire"
    >
      <Event
        event="click"
        method="openUrl"
        params={{
          ordered: [
            {
              url: "https://spothero.bloomfire.com/posts/3241851-phone-support",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="viewCustomerAdminPage"
      _disclosedFields={{
        array: ["tooltipText", "label", "borderRadius", "border"],
      }}
      marginType="normal"
      style={{
        ordered: [
          { label: "rgb(18, 113, 235)" },
          { borderRadius: "40px" },
          { border: "rgb(203, 212, 222)" },
        ],
      }}
      styleVariant="outline"
      text="View Customer Information"
      tooltipText="Click here to go to the user page!"
    >
      <Event
        event="click"
        method="openUrl"
        params={{
          ordered: [
            {
              url: "https://spothero.com/admin/users/{{getSingleRentalTransaction.data.data.results['0'].renter_pk}}/",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="button38"
      marginType="normal"
      style={{
        ordered: [
          { label: "rgb(18, 113, 235)" },
          { border: "rgb(203, 212, 222)" },
        ],
      }}
      styleVariant="outline"
      text="Reservation Backend"
    >
      <Event
        event="click"
        method="openUrl"
        params={{
          ordered: [
            {
              url: "https://spothero.com/admin/rentals/{{reservationForCase.value}}/update",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
