<Modal
  id="creditModal"
  _disclosedFields={{
    array: ["primary-text", "accent-background", "border-radius"],
  }}
  buttonText="Add Credit
"
  events={[
    {
      ordered: [
        { event: "open" },
        { type: "widget" },
        { method: null },
        { pluginId: "blackoutModal" },
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
      { "accent-foreground": "" },
      { "primary-text": "rgb(0, 0, 0)" },
      { "border-radius": "40px" },
    ],
  }}
>
  <Text
    id="text70"
    _disclosedFields={{ array: ["color"] }}
    marginType="normal"
    value="##### Add Credit"
    verticalAlign="center"
  />
  <Text
    id="text20"
    _disclosedFields={{ array: [] }}
    marginType="normal"
    value="This will apply to user with email: {{customerEmail.value}}"
    verticalAlign="center"
  />
  <Alert2 id="alert1" />
  <TextInput
    id="textInput90"
    _disclosedFields={{
      array: [
        "text",
        "border",
        "sharedValidation",
        "background",
        "adornmentBackground",
        "accent",
      ],
    }}
    label="Credit Amount"
    marginType="normal"
    placeholder="Enter value"
    required={true}
    style={{
      ordered: [
        { border: "rgb(203, 212, 222)" },
        { sharedValidation: "rgb(224, 20, 56)" },
        { adornmentBackground: "rgb(255, 255, 255)" },
        { accent: "rgb(18, 113, 235)" },
      ],
    }}
    value="5"
  />
  <Select
    id="select4"
    data="{{ creditReasons.data }}"
    emptyMessage="No options"
    label="Reason"
    labels=""
    marginType="normal"
    overlayMaxHeight={375}
    placeholder="Select an option"
    required={true}
    showSelectionIndicator={true}
    style={{
      ordered: [
        { border: "rgb(203, 212, 222)" },
        { adornmentBackground: "rgb(255, 255, 255)" },
        { sharedValidation: "rgb(224, 20, 56)" },
        { accent: "rgb(18, 113, 235)" },
        { highlightBackground: "rgb(241, 247, 254)" },
      ],
    }}
    values="{{ item.Name }}"
  />
  <Button
    id="addCreditButton"
    _disclosedFields={{ array: ["background", "border", "borderRadius"] }}
    disabled={'{{select4.value == null || select4.value === ""}}'}
    loading="{{ addCreditToUser.isFetching }}"
    marginType="normal"
    style={{
      ordered: [
        { background: "rgb(18, 113, 235)" },
        { border: "rgb(18, 113, 235)" },
        { borderRadius: "40px" },
      ],
    }}
    text="Apply Credit"
  >
    <Event
      event="click"
      method="close"
      params={{ ordered: [] }}
      pluginId="creditModal"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="addCreditToUser"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
</Modal>
