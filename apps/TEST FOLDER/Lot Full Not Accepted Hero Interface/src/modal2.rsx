<Modal
  id="modal2"
  buttonText="Request Receipt - Same Facility"
  events={[
    {
      ordered: [
        { event: "open" },
        { type: "datasource" },
        { method: "trigger" },
        { pluginId: "assign_RID_to_case__c" },
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
    id="text89"
    marginType="normal"
    value="##### Request Receipt From Same Facility"
    verticalAlign="center"
  />
  <Text
    id="text90"
    marginType="normal"
    value={
      "*\"I'm sorry for the trouble! I'll send you an email, please reply to that email with the receipt from the same facility and we'll look into this for you!\"*"
    }
    verticalAlign="center"
  />
  <Button
    id="button35"
    disabled="{{set_need_receipt_status.isFetching}}"
    hidden=""
    marginType="normal"
    style={{
      ordered: [{ background: "rgb(18, 113, 235)" }, { borderRadius: "40px" }],
    }}
    text="Send Email"
  >
    <Event
      event="click"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="set_need_receipt_status"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
</Modal>
