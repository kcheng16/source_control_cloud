<ModalFrame
  id="addClientContactPersonModal"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showOverlay={true}
  size="medium"
>
  <Container
    id="container371"
    _gap="0px"
    _justify="end"
    _type="stack"
    footerPadding="4px 12px"
    headerPadding="4px 12px"
    margin="0"
    padding="0"
    showBody={true}
    showBorder={false}
  >
    <View id="00030" viewKey="View 1">
      <Button
        id="closeButton4"
        ariaLabel="Close"
        heightType="auto"
        horizontalAlign="right"
        iconBefore="bold/interface-delete-circle"
        margin="0"
        style={{ map: { border: "transparent" } }}
        styleVariant="outline"
      >
        <Event
          event="click"
          method="hide"
          params={{}}
          pluginId="addClientContactPersonModal"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
    </View>
  </Container>
  <Container
    id="container372"
    _direction="vertical"
    _gap="10px"
    _type="stack"
    footerPadding="4px 12px"
    headerPadding="4px 12px"
    padding="12px"
    showBody={true}
    showBorder={false}
  >
    <View id="00030" viewKey="View 1">
      <Container
        id="container373"
        _gap="0"
        _type="stack"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        padding="5px"
        showBody={true}
        style={{ map: { background: "canvas" } }}
      >
        <View id="00030" viewKey="View 1">
          <IconText
            id="iconText33"
            icon="bold/interface-alert-information-circle"
            text="Je voegt nu een contactpersoon toe voor de klantvestiging {{ getClientGroupDataForInherit?.data?.customerName[0] }}"
          />
        </View>
      </Container>
      <Form
        id="addContactPersonForm2"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        padding="0"
        requireValidation={true}
        resetAfterSubmit={true}
        showBody={true}
        showBorder={false}
      >
        <Container
          id="container374"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
        >
          <View id="00030" viewKey="View 1">
            <TextInput
              id="contactPersonLastNameInput4"
              label="Achternaam"
              labelPosition="top"
              placeholder="Achternaam"
              required={true}
            />
            <TextInput
              id="contactPersonFirstNameInput4"
              label="Voornaam"
              labelPosition="top"
              placeholder="Voornaam"
              required={true}
            />
          </View>
        </Container>
        <Container
          id="container375"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
        >
          <View id="00030" viewKey="View 1">
            <TextInput
              id="contactPersonPhoneInput4"
              label="Telefoon"
              labelPosition="top"
              placeholder="06 1234 5678"
            />
            <TextInput
              id="contactPersonEmailInput4"
              customValidation="{{ table6?.data?.map(item => item.email).includes(contactPersonEmailInput4.value) ? 'This email is already used for the customer location' : '' }}"
              label="E-mail"
              labelPosition="top"
              patternType="email"
              placeholder="E-mail"
              required={true}
            />
          </View>
        </Container>
        <Container
          id="container376"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
        >
          <View id="00030" viewKey="View 1">
            <Select
              id="contactPersonDepartmentInput4"
              data="{{ getDepartmentQuery5.data }}"
              emptyMessage="No options"
              label="Afdeling"
              labelPosition="top"
              labels="{{ item.departmentName }}"
              overlayMaxHeight={375}
              placeholder="{{ i18n.default('select_placeholder') }}"
              required={true}
              showSelectionIndicator={true}
              values="{{ item.departmentId }}"
            >
              <Event
                id="a943092f"
                event="change"
                method="trigger"
                params={{
                  map: {
                    options: {
                      map: {
                        additionalScope: {
                          map: {
                            departmentId:
                              "{{ contactPersonDepartmentInput4.value }}",
                          },
                        },
                      },
                    },
                  },
                }}
                pluginId="getContactPersonFunctionByDepartmentQuery4"
                type="datasource"
                waitMs="0"
                waitType="debounce"
              />
            </Select>
            <Select
              id="contactPersonFunctionInput4"
              data="{{ getContactPersonFunctionByDepartmentQuery4.data }}"
              emptyMessage="No options"
              label="Functie"
              labelPosition="top"
              labels="{{ item.contactPersonFunctionName }}"
              overlayMaxHeight={375}
              placeholder="Functie"
              required={true}
              showSelectionIndicator={true}
              values="{{ item.contactPersonFunctionId }}"
            />
          </View>
        </Container>
        <Container
          id="container377"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
        >
          <View id="00030" viewKey="View 1">
            <Select
              id="contactPersonStatusInput4"
              data="{{ contactPersonStatuses3.value }}"
              emptyMessage="No options"
              label="Status"
              labelPosition="top"
              labels="{{ item.configurationStatusName }}"
              overlayMaxHeight={375}
              placeholder="{{ i18n.default('select_placeholder') }}"
              required={true}
              showSelectionIndicator={true}
              value="1"
              values="{{ item.configurationStatusId }}"
            />
            <TextInput
              id="contactPersonRemarkInput4"
              label="Opmerking (optioneel)"
              labelPosition="top"
              placeholder="Opmerking..."
            />
          </View>
        </Container>
        <Container
          id="container378"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
        >
          <View id="00030" viewKey="View 1">
            <Button
              id="button392"
              heightType="auto"
              style={{ map: { background: "tokens/8ca1af49" } }}
              text="Annuleren"
            >
              <Event
                id="b9d77567"
                event="click"
                method="hide"
                params={{}}
                pluginId="addClientContactPersonModal"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </Button>
            <Button
              id="button393"
              heightType="auto"
              submit={true}
              submitTargetId="addContactPersonForm2"
              text="Opslaan"
            />
          </View>
        </Container>
        <Event
          event="submit"
          method="trigger"
          params={{}}
          pluginId="handleAddContactPerson2"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Form>
      <Text
        id="text368"
        value="### Contactpersoon voor de vestiging"
        verticalAlign="center"
      />
    </View>
  </Container>
</ModalFrame>
