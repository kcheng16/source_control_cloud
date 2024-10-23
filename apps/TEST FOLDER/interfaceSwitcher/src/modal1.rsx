<Modal
  id="modal1"
  buttonText="Different Issue?"
  closeOnOutsideClick={true}
  events={[
    {
      ordered: [
        { event: "open" },
        { type: "script" },
        { method: "run" },
        { pluginId: "" },
        { targetId: null },
        {
          params: {
            ordered: [
              {
                src: "localStorage.setValue('detailsForSupplyTeam', notesForSupply.value)",
              },
            ],
          },
        },
        { waitType: "debounce" },
        { waitMs: "0" },
      ],
    },
  ]}
  modalHeight="240px"
  modalHeightType="auto"
  style={{
    ordered: [
      { "border-radius": "40px" },
      { "accent-background": "rgb(18, 113, 235)" },
    ],
  }}
>
  <Button
    id="button1"
    hidden="{{permission_groups_array.value.onsiteChange}}"
    marginType="normal"
    style={{
      ordered: [{ background: "rgb(18, 113, 235)" }, { borderRadius: "40px" }],
    }}
    text="Onsite Change Issue"
  >
    <Event
      event="click"
      method="openUrl"
      params={{ ordered: [{ url: "{{transformer3.value.onsiteChangeURL}}" }] }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Button
    id="button2"
    hidden="{{permission_groups_array.value.customerCancel}}"
    marginType="normal"
    style={{
      ordered: [{ background: "rgb(18, 113, 235)" }, { borderRadius: "40px" }],
    }}
    text="Customer Cancel Issue"
  >
    <Event
      event="click"
      method="openUrl"
      params={{ ordered: [{ url: "{{transformer3.value.custCancelURL}}" }] }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Button
    id="button3"
    hidden="{{permission_groups_array.value.equipmentError}}"
    marginType="normal"
    style={{
      ordered: [{ background: "rgb(18, 113, 235)" }, { borderRadius: "40px" }],
    }}
    text="Equipment Error Issue"
  >
    <Event
      event="click"
      method="openUrl"
      params={{
        ordered: [{ url: "{{transformer3.value.equipmentErrorURL}}" }],
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Button
    id="button4"
    hidden="{{permission_groups_array.value.lotFullNotAccepted}}"
    marginType="normal"
    style={{
      ordered: [{ background: "rgb(18, 113, 235)" }, { borderRadius: "40px" }],
    }}
    text="Lot Full - Not Accepted Issue"
  >
    <Event
      event="click"
      method="openUrl"
      params={{ ordered: [{ url: "{{transformer3.value.lotFullURL}}" }] }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Button
    id="button5"
    hidden="{{permission_groups_array.value.lotFullNotAccepted}}"
    marginType="normal"
    style={{
      ordered: [{ background: "rgb(18, 113, 235)" }, { borderRadius: "40px" }],
    }}
    text="General Hero Interface"
  >
    <Event
      event="click"
      method="openUrl"
      params={{ ordered: [{ url: "{{transformer3.value.prePurchaseURL}}" }] }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
</Modal>
