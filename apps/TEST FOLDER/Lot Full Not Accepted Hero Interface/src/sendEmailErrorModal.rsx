<Modal
  id="sendEmailErrorModal"
  _disclosedFields={{ array: [] }}
  buttonText="sendEmailErrorModal"
  hidden="{{!sendEmailErrorModal.opened}}"
  modalHeightType="auto"
>
  <Text
    id="text39"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="##### Uh oh! Something went wrong!"
    verticalAlign="center"
  />
  <Text
    id="text41"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="Something seems to have gone wrong sending this email to the customer, please make sure that a case number is populated. If you have further problems, please speak to a sidekick."
    verticalAlign="center"
  />
  <Text
    id="text40"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="**Error:** {{Set_Status_pending_automation.data.message}}"
    verticalAlign="center"
  />
</Modal>
