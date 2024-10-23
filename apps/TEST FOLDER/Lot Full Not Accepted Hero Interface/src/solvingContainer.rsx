<Container
  id="solvingContainer"
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
      id="containerTitle8"
      _disclosedFields={{ array: ["color"] }}
      marginType="normal"
      style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
      value="###### Step 4: Solving the case"
      verticalAlign="center"
    />
  </Header>
  <View id="5f8b1" viewKey="View 1">
    <Text
      id="text67"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="Add courtesy credit here, if applicable!"
      verticalAlign="center"
    />
    <Include src="./creditModal.rsx" />
    <Divider
      id="divider2"
      _disclosedFields={{ array: ["color"] }}
      marginType="normal"
      style={{ ordered: [{ color: "rgb(203, 212, 222)" }] }}
      textSize="default"
    />
    <Text
      id="text68"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="To finish, add tag and details by clicking below to finish your work on this case."
      verticalAlign="center"
    />
    <Modal
      id="customerSolvedModal"
      _disclosedFields={{ array: ["border-radius", "accent-background"] }}
      buttonText="Tagging and Details"
      closeOnOutsideClick={true}
      events={[
        {
          ordered: [
            { event: "open" },
            { type: "datasource" },
            { method: "trigger" },
            { pluginId: "findReservationObj" },
            { targetId: null },
            { params: { ordered: [] } },
            { waitType: "debounce" },
            { waitMs: "0" },
          ],
        },
        {
          ordered: [
            { event: "open" },
            { type: "datasource" },
            { method: "trigger" },
            { pluginId: "getCaseNumber" },
            { targetId: null },
            { params: { ordered: [] } },
            { waitType: "debounce" },
            { waitMs: "0" },
          ],
        },
      ]}
      modalHeight="280px"
      modalHeightType="auto"
      modalOverflowType="visible"
      modalWidth="45%"
      style={{
        ordered: [
          { "border-radius": "15px" },
          { "accent-background": "rgb(18, 113, 235)" },
        ],
      }}
    >
      <Form
        id="form1"
        footerPadding="4px 12px"
        footerPaddingType="normal"
        headerPadding="4px 12px"
        headerPaddingType="normal"
        hoistFetching={true}
        loading=""
        marginType="normal"
        padding="12px"
        paddingType="normal"
        requireValidation={true}
        showBody={true}
        showFooter={true}
        showHeader={true}
      >
        <Header>
          <Text
            id="taggingDetailsForm"
            _disclosedFields={{ array: [] }}
            marginType="normal"
            value="##### Tagging and Details"
            verticalAlign="center"
          />
        </Header>
        <Body>
          <Text
            id="text47"
            _disclosedFields={{ array: ["color"] }}
            disableMarkdown={true}
            marginType="normal"
            style={{ ordered: [{ color: "rgb(83, 116, 149)" }] }}
            value="* indicates required field"
            verticalAlign="center"
          />
          <TextInput
            id="textInput87"
            _disclosedFields={{
              array: [
                "required",
                "borderRadius",
                "border",
                "accent",
                "text",
                "sharedValidation",
                "adornmentBackground",
              ],
            }}
            label="Rental ID"
            marginType="normal"
            placeholder="Enter value"
            required={true}
            style={{
              ordered: [
                { borderRadius: "4px" },
                { border: "rgb(203, 212, 222)" },
                { text: "rgb(0, 0, 0)" },
                { sharedValidation: "rgb(224, 20, 56)" },
                { adornmentBackground: "surfacePrimary" },
              ],
            }}
            value="{{reservationForCase.value}}"
          />
          <TextInput
            id="textInput91"
            _disclosedFields={{
              array: [
                "required",
                "border",
                "borderRadius",
                "text",
                "accent",
                "sharedValidation",
                "adornmentBackground",
              ],
            }}
            disabled="true"
            label="Case Number"
            marginType="normal"
            placeholder="Enter value"
            required={true}
            style={{
              ordered: [
                { sharedLabel: "" },
                { border: "rgb(203, 212, 222)" },
                { borderRadius: "4px" },
                { text: "rgb(0, 0, 0)" },
                { accent: "rgb(18, 113, 235)" },
                { sharedValidation: "rgb(224, 20, 56)" },
                { adornmentBackground: "surfaceSecondary" },
              ],
            }}
            value="{{getCaseNumber.data['0'].CaseNumber}}"
          />
          <Select
            id="select3"
            data="{{select5.data}}"
            emptyMessage="No options"
            label="Hero Tag"
            labels="{{ item.Name }}"
            marginType="normal"
            overlayMaxHeight={375}
            placeholder="Select an option"
            required={true}
            showSelectionIndicator={true}
            style={{ ordered: [{ borderRadius: "4px" }] }}
            value="{{select5.value}}"
            values="{{ item.Hero_Tag__c }}"
          />
          <TextArea
            id="details"
            autoResize={true}
            label="Details"
            labelPosition="top"
            marginType="normal"
            minLines={2}
            placeholder="Enter value"
            required={true}
            style={{ ordered: [{ borderRadius: "4px" }] }}
            value="{{detailsForRevenue.value}}"
          />
          <DateTime
            id="dateTime3"
            _disclosedFields={{
              array: [
                "required",
                "iconBefore",
                "borderRadius",
                "border",
                "accent",
                "text",
                "sharedValidation",
                "adornmentBackground",
              ],
            }}
            dateFormat="MMM d, yyyy"
            datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
            iconBefore="bold/interface-calendar"
            label="Time Issue Occured"
            marginType="normal"
            minuteStep={15}
            required={true}
            style={{
              ordered: [
                { borderRadius: "4px" },
                { border: "rgb(203, 212, 222)" },
                { text: "rgb(0, 0, 0)" },
                { sharedValidation: "rgb(224, 20, 56)" },
                { adornmentBackground: "surfacePrimary" },
              ],
            }}
            value="{{dateTime4.value}}"
          />
          <TextInput
            id="required_license_plate_input"
            _disclosedFields={{ array: ["borderRadius", "required"] }}
            disabled=""
            hidden="{{!licensePlate_boolean.value.licensePlate_required}}"
            label="Blocking License Plate"
            marginType="normal"
            placeholder="Enter License Plate"
            required={true}
            style={{ ordered: [{ borderRadius: "4px" }] }}
            tooltipText="gather the plate of the car who is in the spot the customer reserved"
            value="{{Licnese_plate_input.value}}"
          />
          <TextInput
            id="internalNotes"
            _disclosedFields={{ array: ["borderRadius"] }}
            label="Internal Notes"
            marginType="normal"
            placeholder="Summary of resolution"
            style={{ ordered: [{ borderRadius: "4px" }] }}
          />
        </Body>
        <Footer>
          <Include src="./CloseCaseErrorModal.rsx" />
          <Include src="./blackoutModal.rsx" />
          <Modal
            id="delayModal"
            _disclosedFields={{
              array: [
                "border-color",
                "accent-foreground",
                "accent-background",
                "border-radius",
              ],
            }}
            buttonText="Find Rental in SFDC"
            disabled="{{findReservationObj.data[0].Id}}"
            events={[
              {
                ordered: [
                  { event: "open" },
                  { type: "datasource" },
                  { method: "trigger" },
                  { pluginId: "findReservationObj" },
                  { targetId: null },
                  { params: { ordered: [] } },
                  { waitType: "debounce" },
                  { waitMs: "0" },
                ],
              },
            ]}
            hidden="{{findReservationObj.data.length >= 1}}"
            modalHeightType="auto"
            style={{
              ordered: [
                { "border-color": "rgb(203, 212, 222)" },
                { "accent-foreground": "rgb(18, 113, 235)" },
                { "accent-background": "rgb(255, 255, 255)" },
                { "border-radius": "40px" },
              ],
            }}
          >
            <Button
              id="button14"
              _disclosedFields={{ array: [] }}
              marginType="normal"
              text="return to conclude case"
            >
              <Event
                event="click"
                method="close"
                params={{ ordered: [] }}
                pluginId="delayModal"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </Button>
          </Modal>
          <Button
            id="formButton2"
            _disclosedFields={{ array: [] }}
            hidden=""
            marginType="normal"
            submit={true}
            submitTargetId="form1"
            text="Submit"
          />
        </Footer>
        <Event
          enabled="{{!licensePlate_boolean.value.licensePlate_required}}"
          event="submit"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="assignRIDForClose"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          enabled="{{!licensePlate_boolean.value.licensePlate_required}}"
          event="submit"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="addLicensePlateForClose"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="submit"
          method="setValue"
          params={{ ordered: [{ value: "{{ form1.data }}" }] }}
          pluginId="closeCaseFormDataCache"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </Form>
      <Text
        id="text159"
        hidden="{{ !assignRIDForClose.isFetching && !assignNotesToCase.isFetching && !assignHeroTagForClose.isFetching && !solveCaseQuery.isFetching }}"
        horizontalAlign="center"
        marginType="normal"
        value="##### Please be patient while the case closes"
        verticalAlign="center"
      />
    </Modal>
  </View>
</Container>
