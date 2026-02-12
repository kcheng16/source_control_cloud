<Container
  id="group620"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="{{ checkbox4.value }}"
  margin="0"
  padding="0"
  showBody={true}
  showBorder={false}
  style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
>
  <View id="00030" viewKey="View 1">
    <TextInput
      id="streetInput4"
      iconBefore="bold/travel-map-location-pin"
      label="{{ i18n.t('form_street') }}"
      labelPosition="top"
      placeholder="{{ i18n.t('placeholders_street') }}"
      style={{ map: { adornmentIcon: "primary" } }}
      value="{{ loadClientLocationData?.data?.street }}"
    >
      <Event
        event="change"
        method="setValue"
        params={{ map: { value: "true" } }}
        pluginId="isFormDirty"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="houseNumberInput4"
      iconBefore="bold/interface-home-5"
      label="{{ i18n.t('form_house_number') }}"
      labelPosition="top"
      placeholder="{{ i18n.t('placeholders_house_number') }}"
      style={{ map: { adornmentIcon: "primary" } }}
      value="{{ loadClientLocationData?.data?.houseNumber }} {{ loadClientLocationData?.data?.addition }}"
    >
      <Event
        event="change"
        method="setValue"
        params={{ map: { value: "true" } }}
        pluginId="isFormDirty"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="postcalCodeInput4"
      iconBefore="bold/mail-send-envelope"
      label="{{ i18n.t('form_postal_code') }}"
      labelPosition="top"
      placeholder="{{ i18n.t('placeholders_postal_code') }}"
      style={{ map: { adornmentIcon: "primary" } }}
      value="{{ loadClientLocationData?.data?.zipCode }}"
    >
      <Event
        event="change"
        method="setValue"
        params={{ map: { value: "true" } }}
        pluginId="isFormDirty"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="cityInput4"
      iconBefore="bold/travel-map-location-pin"
      label="{{ i18n.t('form_city') }}"
      labelPosition="top"
      placeholder="{{ i18n.t('placeholders_city') }}"
      style={{ map: { adornmentIcon: "primary" } }}
      value="{{ loadClientLocationData?.data?.city }}"
    >
      <Event
        event="change"
        method="setValue"
        params={{ map: { value: "true" } }}
        pluginId="isFormDirty"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <Select
      id="countrySelector4"
      captionByIndex=""
      colorByIndex=""
      data="{{ loadCountriesQuery.data }}"
      disabledByIndex=""
      emptyMessage="{{ i18n.t('tables_no_options') }}"
      fallbackTextByIndex=""
      hiddenByIndex=""
      iconBefore="bold/travel-map-earth-1"
      iconByIndex=""
      imageByIndex=""
      label="{{ i18n.t('form_country') }}"
      labelPosition="top"
      labels="{{ item.name }}"
      overlayMaxHeight={375}
      placeholder="{{ i18n.t('placeholders_select_country') }}"
      showSelectionIndicator={true}
      style={{ map: { adornmentIcon: "primary" } }}
      tooltipByIndex=""
      value="{{ loadClientLocationData?.data?.countryId }}"
      values="{{ item.id }}"
    >
      <Event
        event="change"
        method="setValue"
        params={{ map: { value: "true" } }}
        pluginId="isFormDirty"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Select>
  </View>
</Container>
