<Modal
  id="cancelResModal"
  _disclosedFields={{ array: ["border-radius", "accent-background"] }}
  buttonText="Cancel Reservation"
  hidden="true"
  modalHeight="464px"
  modalHeightType="auto"
  style={{
    ordered: [
      { "border-color": "" },
      { "primary-surface": "" },
      { "accent-foreground": "" },
      { "primary-foreground": "" },
      { "accent-background": "rgb(18, 113, 235)" },
      { "border-radius": "40px" },
      { "secondary-surface": "" },
      { "primary-text": "" },
      { "primary-background": "" },
    ],
  }}
>
  <Text
    id="text74"
    _disclosedFields={{ array: [] }}
    horizontalAlign="center"
    marginType="normal"
    value="#### Cancel and Refund"
    verticalAlign="center"
  />
  <Text
    id="text75"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="**Remember** we encourage refunds as credit. "
    verticalAlign="center"
  />
  <Alert2 id="alert3" hidden="{{!cancelBoolean.value.after48Hours}}" />
  <Text
    id="text76"
    _disclosedFields={{ array: [] }}
    hidden="{{!cancelBoolean.value.after48Hours}}"
    marginType="normal"
    value="{{step3ScriptWriter.value}}"
    verticalAlign="center"
  />
  <Select
    id="refundReason"
    data="{{ refundReasons.data }}"
    emptyMessage="No options"
    label="Refund Reason"
    loading="{{ refundReasons.isFetching }}"
    marginType="normal"
    overlayMaxHeight={375}
    placeholder="Select an option"
    required={true}
    showClear={true}
    showSelectionIndicator={true}
    value=""
    values="{{ item.Name }}"
  >
    <Option id="e5007" disabled={false} hidden={false} value="Lot Full" />
    <Option id="f7014" disabled={false} hidden={false} value="Not Accepted" />
    <Option id="e229a" disabled={false} hidden={false} value="Wasn't Present" />
    <Option id="fc768" disabled={false} hidden={false} value="Inaccessible" />
    <Option id="52041" disabled={false} hidden={false} value="Closed" />
  </Select>
  <Alert2 id="alert8" hidden="{{!isTicketmaster.value}}" />
  <Button
    id="button26"
    _disclosedFields={{ array: ["label"] }}
    disabled="{{reservationIsPreTaxOrSH4B.value.isBusinessOrPreTax || isTicketmaster.value}}"
    hidden={'{{refundReason.value === "" || refundReason.value === null}}'}
    loading="{{ cancelReservationAsCredit.isFetching }}"
    marginType="normal"
    style={{ ordered: [{ label: "rgba(194, 48, 48, 1)" }] }}
    styleVariant="outline"
    text="Refund as Credit"
  >
    <Event
      event="click"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="cancelReservationAsCredit"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Button
    id="button27"
    _disclosedFields={{ array: ["label"] }}
    disabled="{{cancelBoolean.value.after48Hours}}"
    hidden={'{{refundReason.value === "" || refundReason.value === null }}'}
    loading="{{ cancelReservationOriginalSource.isFetching }}"
    marginType="normal"
    style={{ ordered: [{ label: "rgb(194, 48, 48)" }] }}
    styleVariant="outline"
    text="Refund to Original Source"
  >
    <Event
      event="click"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="cancelReservationOriginalSource"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Text
    id="text161"
    hidden="{{!isTicketmaster.value}}"
    value="**If you are trying to book a new reservation for a Ticketmaster customer, please refund to the original source and proceed to admin to book a new reservation.**"
    verticalAlign="center"
  />
  <Button
    id="button39"
    disabled={'{{refundReason.value == "" || refundReason.value == null}}'}
    hidden="{{!isTicketmaster.value}}"
    text="Book New Reservation"
  >
    <Event
      event="click"
      method="openUrl"
      params={{
        ordered: [
          {
            url: '"https://spothero.com/search?latitude={{getSingleFacility.data.data.latitude}}&longitude={{getSingleFacility.data.data.longitude}}&{{rebookUrlFormattedTimes.value}}"',
          },
        ],
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Divider id="divider4" marginType="normal" text="Or" textSize="default" />
  <Text
    id="text81"
    marginType="normal"
    value="*Was receipt received for alternate parking? or did Sidekick approve this without documentation?*"
    verticalAlign="center"
  />
  <Button
    id="override_cancel_button"
    disabled={'{{refundReason.value === "" || refundReason.value === null }}'}
    marginType="normal"
    style={{
      ordered: [{ background: "rgb(18, 113, 235)" }, { borderRadius: "40px" }],
    }}
    text="Override Cancel"
  >
    <Event
      event="click"
      method="open"
      params={{ ordered: [] }}
      pluginId="modal1"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="close"
      params={{ ordered: [] }}
      pluginId="cancelResModal"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
</Modal>
