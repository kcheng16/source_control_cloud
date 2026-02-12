<ModalFrame
  id="pickupAddressModal"
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
    id="container446"
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
        id="closeButton10"
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
          pluginId="pickupAddressModal"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
    </View>
  </Container>
  <Container
    id="container447"
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
      <Form
        id="pickupAddressForm"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        padding="0"
        requireValidation={true}
        resetAfterSubmit={true}
        showBody={true}
        showBorder={false}
      >
        <Container
          id="container449"
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
              id="addressInput2"
              iconBefore="bold/mail-sign-hashtag"
              label="Huisnummer + toevoeging"
              labelPosition="top"
              placeholder="Huisnummer + toevoeging"
              required={true}
              value="{{ pickupAddressDraft?.value?.number }} {{ pickupAddressDraft?.value?.addition }}"
            />
            <TextInput
              id="addressInput1"
              iconBefore="bold/travel-map-location-pin"
              label="Straatnaam"
              labelPosition="top"
              placeholder="Straat"
              required={true}
              value="{{ pickupAddressDraft?.value?.street }}"
            />
          </View>
        </Container>
        <Container
          id="container450"
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
              id="addressInput4"
              iconBefore="bold/shopping-building"
              label="Stad"
              labelPosition="top"
              placeholder="Stad"
              required={true}
              value="{{ pickupAddressDraft?.value?.city }}"
            />
            <TextInput
              id="addressInput3"
              iconBefore="bold/mail-send-envelope"
              label="Postcode"
              labelPosition="top"
              placeholder="Postcode"
              required={true}
              value="{{ pickupAddressDraft?.value?.zipcode }}"
            />
          </View>
        </Container>
        <Container
          id="container451"
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
              id="addressInput5"
              data="{{ loadCountriesQuery.data }}"
              emptyMessage="No options"
              iconBefore="bold/programming-web"
              iconByIndex=""
              label="Land"
              labelPosition="top"
              labels="{{ item.name }}"
              overlayMaxHeight={375}
              placeholder="Selecteer land"
              required={true}
              showSelectionIndicator={true}
              value="{{ pickupAddressDraft?.value?.countryId }}"
              values="{{ item.id }}"
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
                          map: { departmentId: "{{ addressInput5.value }}" },
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
          </View>
        </Container>
        <Container
          id="container453"
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
              id="button440"
              style={{ map: { background: "tokens/8ca1af49" } }}
              text="Annuleren"
            >
              <Event
                event="click"
                method="hide"
                params={{}}
                pluginId="pickupAddressModal"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </Button>
            <Button
              id="button441"
              submit={true}
              submitTargetId="pickupAddressForm"
              text="Opslaan"
            />
          </View>
        </Container>
        <Event
          event="submit"
          method="trigger"
          params={{}}
          pluginId="handleAddPickupAddress"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="submit"
          method="hide"
          params={{}}
          pluginId="pickupAddressModal"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Form>
      <Text id="text389" value="### Afval ophaaladres" verticalAlign="center" />
    </View>
  </Container>
</ModalFrame>
