<Modal
  id="CloseCaseErrorModal"
  _disclosedFields={{ array: [] }}
  buttonText="submitErr"
  hidden="{{!CloseCaseErrorModal.opened}}"
  modalHeightType="auto"
>
  <Text
    id="text44"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="##### Uh oh! Something went wrong closing the case!"
    verticalAlign="center"
  />
  <Text
    id="text45"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="Please return to the Tagging and Details screen to resubmit - check all of the required inputs and ensure they are correct. If the error persists, please reach out to a Sidekick for assistance. "
    verticalAlign="center"
  />
  <Text
    id="text46"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="**ERROR:** {{ closeCaseErrorMessage.value }}"
    verticalAlign="center"
  />
  <Button
    id="button23"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    text="Return to Tagging and Details"
  >
    <Event
      event="click"
      method="close"
      params={{ ordered: [] }}
      pluginId="CloseCaseErrorModal"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
</Modal>
