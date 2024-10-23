<Container
  id="confirmationContainer"
  _gap={0}
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  hoistFetching={true}
  marginType="normal"
  padding="12px"
  paddingType="normal"
  showBody={true}
  showHeader={true}
  style={{ ordered: [{ border: "rgb(203, 212, 222)" }] }}
>
  <Header>
    <Text
      id="containerTitle6"
      _disclosedFields={{ array: ["color"] }}
      marginType="normal"
      style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
      value="###### Step 2: Gather information"
      verticalAlign="center"
    />
  </Header>
  <View id="5f8b1" viewKey="View 1">
    <Text
      id="text2"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="Is the customer at the right place and with the correct reservation times? Make sure to check the parking pass."
      verticalAlign="center"
    />
    <Button
      id="parkingPassButton"
      _disclosedFields={{
        array: ["tooltipText", "borderRadius", "border", "label"],
      }}
      marginType="normal"
      style={{ ordered: [] }}
      text="View Parking Pass"
      tooltipText="You can click this link to open the parking pass for the selected reservation. Make sure there are no vehicle or time restrictions!"
    >
      <Event
        event="click"
        method="openUrl"
        params={{
          ordered: [
            { url: "https://spothero.com/pass/{{reservationForCase.value}}" },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Divider
      id="divider3"
      _disclosedFields={{ array: ["color"] }}
      marginType="normal"
      style={{ ordered: [{ color: "rgb(203, 212, 222)" }] }}
      textSize="default"
    />
    <Text
      id="text69"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="Select tag that applies to the case."
      verticalAlign="center"
    />
    <Select
      id="select5"
      data="{{ HeroTags.data }}"
      emptyMessage="No options"
      label=""
      labels="{{ item.Name }}"
      marginType="normal"
      overlayMaxHeight={375}
      placeholder="Select Hero Tag"
      showSelectionIndicator={true}
      values="{{ item.Hero_Tag__c }}"
    />
    <TextArea
      id="detailsForRevenue"
      autoResize={true}
      label="Details"
      labelPosition="top"
      marginType="normal"
      minLines={2}
      placeholder="Enter value"
      value="{{transferDetailsForSupply.value}}"
    />
    <DateTime
      id="dateTime4"
      _disclosedFields={{ array: ["iconBefore"] }}
      dateFormat="MMM d, yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      iconBefore="bold/interface-calendar"
      label="Time Issued Occured"
      marginType="normal"
      minuteStep={15}
      value="{{UTCtoTimezoneForDefaultDateTimeSelect.value}}"
    />
    <TextInput
      id="Licnese_plate_input"
      hidden="{{!licensePlate_boolean.value.licensePlate_required}}"
      label="Blocking License Plate"
      marginType="normal"
      placeholder="Enter value"
      tooltipText="gather the plate of the car who is in the spot the customer reserved"
      value="{{ noOffendingPlateDefaultValue.value }}"
    />
    <Checkbox
      id="checkbox1"
      hidden="{{!licensePlate_boolean.value.licensePlate_required}}"
      label="No Offending License Plate"
      labelPosition="left"
      marginType="normal"
    />
    <Module
      id="interfaceSwitch1"
      callTime="{{urlparams.hash.callTime}}"
      customerEmail="{{customerEmail.value}}"
      input1="{{interface_switch_inputs.value.input1}}"
      input2="{{interface_switch_inputs.value.input2}}"
      interactionId="{{interactionID.value}}"
      isOpen=""
      margin="0"
      name="Interface_Switch"
      notesForSupply="{{detailsForRevenue.value}}"
      output1="{{output1.value}}"
      pageUuid="5e0f218e-ed73-4bbf-9a91-e1958ec20485"
      reservationForCase="{{reservationForCase.value}}"
      workaroundQuery=""
    />
  </View>
</Container>
