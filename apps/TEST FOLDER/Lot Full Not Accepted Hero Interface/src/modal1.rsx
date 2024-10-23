<Modal
  id="modal1"
  buttonText="Override Cancel"
  events={[]}
  hidden="{{!modal1.opened}}"
  modalHeight="224px"
  modalWidth="65%"
  style={{ ordered: [{ "primary-surface": "" }] }}
>
  <Text
    id="cancel_override_modal"
    horizontalAlign="center"
    marginType="normal"
    value="#### Customer Supplied Receipt or Sidekick approved Cancelation"
    verticalAlign="center"
  />
  <Text
    id="text82"
    marginType="normal"
    value="Refund to Original Source is only intended for situations if the customer has supplied receipt of parking (documentation) or a Sidekick has approved the refund to original source"
    verticalAlign="center"
  />
  <Alert2
    id="alert4"
    hidden="{{!reservationIsPreTaxOrSH4B.value.isBusinessOrPreTax}}"
  />
  <Alert2 id="alert10" hidden="{{!isTicketmaster.value}}" />
  <Button
    id="button31"
    marginType="normal"
    style={{
      ordered: [{ label: "rgb(18, 113, 235)" }, { borderRadius: "40px" }],
    }}
    styleVariant="outline"
    text="Refund Not Approved"
  >
    <Event
      event="click"
      method="close"
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
  <Button
    id="button30"
    disabled="{{reservationIsPreTaxOrSH4B.value.isBusinessOrPreTax || isTicketmaster.value}}"
    loading="{{ cancelReservationAsCredit.isFetching }}"
    marginType="normal"
    style={{
      ordered: [{ label: "rgb(194, 48, 48)" }, { borderRadius: "40px" }],
    }}
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
    id="button32"
    loading="{{ cancelReservationOriginalSource.isFetching }}"
    marginType="normal"
    style={{
      ordered: [{ label: "rgb(194, 48, 48)" }, { borderRadius: "40px" }],
    }}
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
</Modal>
