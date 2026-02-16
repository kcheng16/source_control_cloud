<ModalFrame
  id="invoiceAddressModal"
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
    id="container474"
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
        id="closeButton11"
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
          pluginId="invoiceAddressModal"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Button>
    </View>
  </Container>
  <Container
    id="container475"
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
        id="invoiceAddressForm"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        padding="0"
        requireValidation={true}
        resetAfterSubmit={true}
        showBody={true}
        showBorder={false}
      >
        <Container
          id="container476"
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
              id="addressInput7"
              iconBefore="bold/mail-sign-hashtag"
              label="Huisnummer + toevoeging"
              labelPosition="top"
              placeholder="Huisnummer + toevoeging"
              required={true}
              value="{{ invoiceAddressDraft?.value?.number }} {{ invoiceAddressDraft?.value?.addition }}"
            />
            <TextInput
              id="addressInput6"
              iconBefore="bold/travel-map-location-pin"
              label="Straatnaam"
              labelPosition="top"
              placeholder="Straat"
              required={true}
              value="{{ invoiceAddressDraft?.value?.street }}"
            />
          </View>
        </Container>
        <Container
          id="container477"
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
              id="addressInput9"
              iconBefore="bold/shopping-building"
              label="Stad"
              labelPosition="top"
              placeholder="Stad"
              required={true}
              value="{{ invoiceAddressDraft?.value?.city }}"
            />
            <TextInput
              id="addressInput8"
              iconBefore="bold/mail-send-envelope"
              label="Postcode"
              labelPosition="top"
              placeholder="Postcode"
              required={true}
              value="{{ invoiceAddressDraft?.value?.zipcode }}"
            />
          </View>
        </Container>
        <Container
          id="container478"
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
              id="addressInput10"
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
              value="{{ invoiceAddressDraft?.value?.countryId }}"
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
                          map: { departmentId: "{{ addressInput10.value }}" },
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
          id="container479"
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
              id="button469"
              style={{ map: { background: "tokens/8ca1af49" } }}
              text="Annuleren"
            >
              <Event
                event="click"
                method="hide"
                params={{}}
                pluginId="invoiceAddressModal"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </Button>
            <Button
              id="button470"
              submit={true}
              submitTargetId="invoiceAddressForm"
              text="Opslaan"
            />
          </View>
        </Container>
        <Event
          event="submit"
          method="trigger"
          params={{}}
          pluginId="handleAddInvoiceAddress"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="submit"
          method="hide"
          params={{}}
          pluginId="invoiceAddressModal"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </Form>
      <Text id="text411" value="### Factuuradres" verticalAlign="center" />
    </View>
  </Container>
</ModalFrame>
