<Modal
  id="creditErrorModal"
  _disclosedFields={{ array: [] }}
  buttonText="Open Modal"
  hidden="{{!creditErrorModal.opened}}"
>
  <Text
    id="text28"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="#### Uh Oh! Something Went Wrong!"
    verticalAlign="center"
  />
  <Text
    id="text29"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="Please make sure you have all required fields selected for this action to be performed:"
    verticalAlign="center"
  />
  <Text
    id="text31"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="* Rental ID must be selected
* User must be selected
* Reason//hero Tag must be selected"
    verticalAlign="center"
  />
  <Text
    id="text30"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="**Message Of Error:** {{addCreditToUser.data.data.data.errors[0].field_name}}: {{addCreditToUser.data.data.data.errors[0].messages}}"
    verticalAlign="center"
  />
</Modal>
