<Container
  id="actionLinksContainer"
  _gap={0}
  currentViewKey="{{tabs1.value}}"
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
      id="containerTitle2"
      _disclosedFields={{ array: ["color"] }}
      marginType="normal"
      style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
      value="###### Step 3: Explanations and solutions"
      verticalAlign="center"
    />
    <Tabs
      id="tabs1"
      itemMode="static"
      marginType="normal"
      value="{{ self.values[0] }}"
    >
      <Option id="e153b" value="Lot Full" />
      <Option id="02708" value="Not Accepted" />
    </Tabs>
  </Header>
  <View id="5f8b1" viewKey="Lot Full">
    <Text
      id="text48"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value={
        "*\"Would you like me to help rebook you with us, or have you found parking somewhere else? We'll be sure to cover any price difference for the new spot.*"
      }
      verticalAlign="center"
    />
    <Alert2
      id="alert5"
      hidden="{{ !reservationIsPreTaxOrSH4B.value.isBusinessOrPreTax }}"
    />
    <Alert2 id="alert7" hidden="{{!isTicketmaster.value}}" margin="0" />
    <Text
      id="text160"
      hidden="{{!isTicketmaster.value}}"
      horizontalAlign="center"
      value="**To rebook a reservation for a Ticketmaster customer, proceed to the 'Cancel Reservation' button below.**"
      verticalAlign="center"
    />
    <Button
      id="rebookURLButton"
      _disclosedFields={{ array: ["borderRadius", "background"] }}
      disabled="{{rebookBoolean.value || isTicketmaster.value}}"
      marginType="normal"
      style={{
        ordered: [
          { borderRadius: "40px" },
          { label: "" },
          { background: "rgb(18, 113, 235)" },
          { border: "" },
        ],
      }}
      text="Rebook Customer"
      tooltipText="reminder: SH4b, partner, and pretax are not eligible for rebook"
    >
      <Event
        event="click"
        method="openUrl"
        params={{
          ordered: [
            {
              url: '"https://spothero.com/search?latitude={{getSingleFacility.data.data.latitude}}&longitude={{getSingleFacility.data.data.longitude}}&{{rebookUrlFormattedTimes.value}}&rebook_reservation_id={{reservationForCase.value}}"',
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="open"
        params={{ ordered: [] }}
        pluginId="continueToSolveCaseModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Divider
      id="divider1"
      _disclosedFields={{ array: ["color"] }}
      marginType="normal"
      style={{ ordered: [{ color: "rgb(203, 212, 222)" }] }}
      text="or"
      textSize="default"
    />
    <Button
      id="add_RID_and_user_to_Case"
      marginType="normal"
      style={{
        ordered: [
          { background: "rgb(18, 113, 235)" },
          { borderRadius: "40px" },
        ],
      }}
      text="Alternate Parking Found"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="assign_RID_and_user_to_case__c"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="text57"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="If the above solutions don't work, you can offer to cancel if customer is within refund policy."
      verticalAlign="center"
    />
    <Button id="button36" marginType="normal" text="Cancel Reservation">
      <Event
        event="click"
        method="open"
        params={{ ordered: [] }}
        pluginId="cancelResModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="refundReasons"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
  <View
    id="63f0a"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="Not Accepted"
  >
    <Text
      id="text83"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value={
        "*\"Would you like me to help rebook you with us, or have you found parking somewhere else? We'll be sure to cover any price difference for the new spot.*"
      }
      verticalAlign="center"
    />
    <Alert2
      id="alert6"
      hidden="{{ !reservationIsPreTaxOrSH4B.value.isBusinessOrPreTax }}"
    />
    <Alert2 id="alert9" hidden="{{!isTicketmaster.value}}" margin="0" />
    <Text
      id="text162"
      horizontalAlign="center"
      value="**To rebook a reservation for a Ticketmaster customer, proceed to the 'Cancel Reservation' button below.**"
      verticalAlign="center"
    />
    <Button
      id="rebookURLButton2"
      _disclosedFields={{ array: ["borderRadius", "background"] }}
      disabled="{{rebookBoolean.value || isTicketmaster.value}}"
      marginType="normal"
      style={{
        ordered: [
          { borderRadius: "40px" },
          { label: "" },
          { background: "rgb(18, 113, 235)" },
          { border: "" },
        ],
      }}
      text="Rebook Customer"
      tooltipText="reminder: SH4b, partner, and pretax are not eligible for rebook"
    >
      <Event
        event="click"
        method="openUrl"
        params={{
          ordered: [
            {
              url: '"https://spothero.com/search?latitude={{getSingleFacility.data.data.latitude}}&longitude={{getSingleFacility.data.data.longitude}}&{{rebookUrlFormattedTimes.value}}&rebook_reservation_id={{reservationForCase.value}}"',
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="open"
        params={{ ordered: [] }}
        pluginId="continueToSolveCaseModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Divider
      id="divider5"
      _disclosedFields={{ array: ["color"] }}
      marginType="normal"
      style={{ ordered: [{ color: "rgb(203, 212, 222)" }] }}
      text="or"
      textSize="default"
    />
    <Text
      id="text91"
      marginType="normal"
      value={
        'If the customer has found a different location to park, request the receipt from the **new** facility and select the "Alternat Parking Found" button. If the customer is at the same facility select the "Request Receipt - Same Facility" button. '
      }
      verticalAlign="center"
    />
    <Button
      id="add_RID_and_user_to_Case2"
      disabled="{{assign_RID_and_user_to_case__c.isFetching}}"
      marginType="normal"
      style={{
        ordered: [
          { background: "rgb(18, 113, 235)" },
          { borderRadius: "40px" },
        ],
      }}
      text="Alternate Parking Found"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="assign_RID_and_user_to_case__c"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Include src="./modal2.rsx" />
    <Text
      id="text84"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="If the above solutions don't work, you can offer to cancel if customer is within refund policy."
      verticalAlign="center"
    />
    <Button id="button37" marginType="normal" text="Cancel Reservation">
      <Event
        event="click"
        method="open"
        params={{ ordered: [] }}
        pluginId="cancelResModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
