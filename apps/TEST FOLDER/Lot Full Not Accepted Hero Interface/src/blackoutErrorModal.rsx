<Modal
  id="blackoutErrorModal"
  _disclosedFields={{ array: [] }}
  buttonText="Open Modal"
  hidden="{{!blackoutErrorModal.opened}}"
>
  <Text
    id="text32"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="#### Uh Oh! Something Went Wrong!"
    verticalAlign="center"
  />
  <Text
    id="text33"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="Please make sure you have all required fields selected for this action to be performed:"
    verticalAlign="center"
  />
  <Text
    id="text34"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="Please speak to Sidekick about if a blackout is necessary"
    verticalAlign="center"
  />
  <Text
    id="text35"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="**Message of Error:** {{createBlackout.data.data.data.errors[0].message['0']}}"
    verticalAlign="center"
  />
</Modal>
