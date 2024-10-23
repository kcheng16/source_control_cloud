<Modal
  id="cancelErrorModal"
  _disclosedFields={{ array: [] }}
  buttonText="cancelErrorModal"
  hidden="{{!cancelErrorModal.opened}}"
  modalHeightType="auto"
>
  <Text
    id="text23"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="##### Uh oh! something went wrong!"
    verticalAlign="center"
  />
  <Text
    id="text24"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    verticalAlign="center"
  />
  <Text
    id="text25"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="Please make sure you have all required fields selected for this action to be performed and return to main screen and try to cancel the reservation again before continuing:"
    verticalAlign="center"
  />
  <Text
    id="text26"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="Rental ID must be selected in order to perform this action."
    verticalAlign="center"
  />
  <Text
    id="text27"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="**Message of Error:** {{displayErrorMessageCancelRes.value}}"
    verticalAlign="center"
  />
  <Button
    id="button22"
    _disclosedFields={{
      array: ["background", "border", "label", "borderRadius"],
    }}
    marginType="normal"
    style={{
      ordered: [
        { background: "rgb(18, 113, 235)" },
        { border: "rgb(18, 113, 235)" },
        { label: "rgb(255, 255, 255)" },
        { borderRadius: "40px" },
      ],
    }}
    text="Return To Main Screen"
  >
    <Event
      event="click"
      method="close"
      params={{ ordered: [] }}
      pluginId="cancelErrorModal"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="close"
      params={{ ordered: [{ options: { ordered: [{ block: "nearest" }] } }] }}
      pluginId="customerSolvedModal"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
</Modal>
