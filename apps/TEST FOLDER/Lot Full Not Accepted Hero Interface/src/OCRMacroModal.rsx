<Modal
  id="OCRMacroModal"
  _disclosedFields={{ array: ["border-radius", "accent-background"] }}
  buttonText="OCR email Modal"
  closeOnOutsideClick={true}
  events={[]}
  hidden="{{!OCRMacroModal.opened}}"
  modalHeightType="auto"
  style={{
    ordered: [
      { "border-radius": "40px" },
      { "accent-foreground": "" },
      { "accent-background": "rgb(18, 113, 235)" },
      { "border-color": "" },
    ],
  }}
>
  <Text
    id="containerTitle4"
    _disclosedFields={{ array: ["color"] }}
    marginType="normal"
    style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
    value="##### Request Alternate Receipt"
    verticalAlign="center"
  />
  <Text
    id="text11"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value={
      "*\"I'm sorry that we weren't able to help you find alternate parking. I will be sending you an email, please only respond with the receipt of your alternate parking to be reimbursed.\"*"
    }
    verticalAlign="center"
  />
  <Button
    id="triggerSFDCEmailSend"
    _disclosedFields={{ array: ["label", "border", "background"] }}
    disabled="{{findReservationObj.data['0'].Name === null}}"
    marginType="normal"
    style={{
      ordered: [
        { label: "rgb(255, 255, 255)" },
        { border: "rgb(18, 113, 235)" },
        { background: "rgb(18, 113, 235)" },
      ],
    }}
    text="Send Email"
  >
    <Event
      event="click"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="Set_Status_pending_automation"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Include src="./sendEmailErrorModal.rsx" />
  <Include src="./emailSentSuccessModal.rsx" />
</Modal>
