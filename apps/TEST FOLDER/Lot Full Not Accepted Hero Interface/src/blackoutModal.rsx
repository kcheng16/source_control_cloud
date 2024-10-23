<Modal
  id="blackoutModal"
  _disclosedFields={{ array: [] }}
  buttonText="submit"
  disabled="{{findReservationObj.data[0] === undefined}}"
  events={[]}
  hidden="{{!blackoutModal.opened}}"
  modalHeight="336px"
  modalHeightType="auto"
>
  <Text
    id="text71"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="##### Create blackout"
    verticalAlign="center"
  />
  <Text
    id="text15"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value={
      'Due to the time this lot full occured, a blackout may be necessary. If the button below is available, please submit the blackout by selecting "create blackout.\n'
    }
    verticalAlign="center"
  />
  <Text
    id="text38"
    _disclosedFields={{ array: [] }}
    hidden="{{blackoutBoolean.value}}"
    marginType="normal"
    value="**It seems no blackout is necessary for this case! you're all done!**"
    verticalAlign="center"
  />
  <Button
    id="blackoutButton"
    _disclosedFields={{ array: ["border", "label"] }}
    disabled="{{!blackoutBoolean.value.activate}}"
    hidden=""
    loading="{{ createBlackout.isFetching }}"
    marginType="normal"
    style={{
      ordered: [
        { label: "rgb(18, 113, 235)" },
        { border: "rgb(203, 212, 222)" },
      ],
    }}
    styleVariant="outline"
    submitTargetId=""
    text="Create Blackout"
  >
    <Event
      event="click"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="createBlackout"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Text
    id="text16"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="After the blackout is created, or if the above button is not available, select the close button and you are now done with this case!"
    verticalAlign="center"
  />
  <Button
    id="closeModalsButton"
    _disclosedFields={{ array: ["background", "border"] }}
    marginType="normal"
    style={{ ordered: [{ border: "rgb(18, 113, 235)" }] }}
    text="Complete Case"
  >
    <Event
      event="click"
      method="close"
      params={{ ordered: [] }}
      pluginId="blackoutModal"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="close"
      params={{ ordered: [] }}
      pluginId="customerSolvedModal"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
</Modal>
