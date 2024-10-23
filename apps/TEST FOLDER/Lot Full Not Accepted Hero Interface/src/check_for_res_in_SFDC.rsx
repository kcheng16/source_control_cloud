<Modal
  id="check_for_res_in_SFDC"
  buttonText="Find Reservation in SFFDC"
  events={[
    {
      ordered: [
        { event: "open" },
        { type: "datasource" },
        { method: "trigger" },
        { pluginId: "findReservationObj" },
        { targetId: null },
        { params: { ordered: [] } },
        { waitType: "debounce" },
        { waitMs: "0" },
      ],
    },
  ]}
  modalHeightType="auto"
  style={{
    ordered: [
      { "accent-background": "rgb(18, 113, 235)" },
      { "border-radius": "40px" },
    ],
  }}
>
  <Text
    id="text79"
    horizontalAlign="center"
    marginType="normal"
    value="#### You may need to:"
    verticalAlign="center"
  />
  <Button
    id="button28"
    disabled="{{findReservationObj.data}}"
    marginType="normal"
    text="Create Reservation in SFDC"
  >
    <Event
      event="click"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="create_reservation_record"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Text
    id="text80"
    marginType="normal"
    value="but if that button is disabled or you already pressed it you may close this modal:"
    verticalAlign="center"
  />
  <Button id="button29" marginType="normal" text="Close Modal">
    <Event
      event="click"
      method="close"
      params={{ ordered: [] }}
      pluginId="check_for_res_in_SFDC"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="close"
      params={{ ordered: [] }}
      pluginId="assign_rid_to_case_error_modal"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
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
</Modal>
