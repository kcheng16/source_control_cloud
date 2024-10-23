<Modal
  id="emailSentSuccessModal"
  _disclosedFields={{ array: [] }}
  buttonText="emailSentSuccessModal"
  closeOnOutsideClick={true}
  hidden="{{!emailSentSuccessModal.opened}}"
  modalHeightType="auto"
>
  <Text
    id="text42"
    _disclosedFields={{ array: [] }}
    horizontalAlign="center"
    marginType="normal"
    value="##### You succesfully sent the email to the customer! You can continue to Step 4!"
    verticalAlign="center"
  />
  <Alert2 id="alert2" />
  <Button
    id="button21"
    _disclosedFields={{ array: ["border", "label", "background"] }}
    marginType="normal"
    style={{
      ordered: [
        { border: "rgb(18, 113, 235)" },
        { label: "rgb(255, 255, 255)" },
        { background: "rgb(18, 113, 235)" },
      ],
    }}
    text="Continue to Solve Case"
  >
    <Event
      event="click"
      method="close"
      params={{ ordered: [] }}
      pluginId="emailSentSuccessModal"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="close"
      params={{ ordered: [] }}
      pluginId="OCRMacroModal"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
</Modal>
