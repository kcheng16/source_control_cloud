<Container
  id="tabbedContainer14"
  _direction="vertical"
  _gap="20px"
  _type="stack"
  currentViewKey="{{ self.viewKeys[0] }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  margin="0"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <View id="00030" label="Bedrijfsgegevens">
    <Container
      id="clientGroupSelect"
      _direction="vertical"
      _gap="0px"
      footerPadding="4px 12px"
      headerPadding="0"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Container
          id="stack66"
          _flexWrap={true}
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="12px"
          showBody={true}
          showBorder={false}
        >
          <View id="00030" viewKey="View 1">
            <IconText
              id="iconText60"
              icon="bold/interface-hierarchy-2"
              style={{
                fontSize: "h5Font",
                fontWeight: "h5Font",
                fontFamily: "h5Font",
              }}
              text="{{ i18n.t('headers_company_details') }}"
            />
          </View>
        </Container>
      </Header>
      <View id="00030" viewKey="View 1">
        <Select
          id="selectClientGroup"
          captionByIndex=""
          colorByIndex=""
          data="{{ getClientGroupsForSelection.data }}"
          disabledByIndex=""
          emptyMessage="No options"
          fallbackTextByIndex=""
          hiddenByIndex=""
          iconBefore="bold/shopping-store-factory-building"
          iconByIndex=""
          imageByIndex=""
          label="Selecteer klant groep"
          labelPosition="top"
          labels="{{ item.label }}"
          overlayMaxHeight={375}
          showSelectionIndicator={true}
          style={{ map: { adornmentIcon: "primary" } }}
          tooltipByIndex=""
          value="{{ loadClientLocationData?.data?.groupId }}"
          values="{{ item.value }}"
        >
          <Event
            id="6e68639c"
            event="change"
            method="run"
            params={{
              map: { src: "  handleClientGroupDataInherit.trigger()" },
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
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
        <SegmentedControl
          id="segmentedControl7"
          itemMode="static"
          label="Gegevens van klant groep overnemen?"
          labelPosition="top"
          paddingType="spacious"
          style={{ map: { borderRadius: "8px" } }}
          value="{{ self.values[1] }}"
        >
          <Option id="00030" label="{{ i18n.t('options_yes') }}" value="true" />
          <Option id="00031" label="{{ i18n.t('options_no') }}" value="false" />
          <Event
            id="6f3c1eb9"
            event="change"
            method="trigger"
            params={{
              map: {
                options: {
                  object: {
                    onSuccess: null,
                    onFailure: null,
                    additionalScope: null,
                  },
                },
              },
            }}
            pluginId="handleClientGroupDataInherit"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </SegmentedControl>
      </View>
    </Container>
    <Form
      id="container456"
      footerPadding="4px 12px"
      headerPadding="0"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Container
          id="group618"
          _align="center"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="12px"
          showBody={true}
          showBorder={false}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <IconText
              id="iconText61"
              icon={'{{  "/icon:bold/shopping-store-factory-building"  }}'}
              style={{
                fontSize: "h5Font",
                fontWeight: "h5Font",
                fontFamily: "h5Font",
              }}
              text="{{ i18n.t('labels_client_location') }}"
            />
          </View>
        </Container>
      </Header>
      <Body>
        <TextInput
          id="companyName9"
          iconBefore="bold/shopping-store-factory-building"
          label="{{ i18n.t('form_company_name') }}"
          labelPosition="top"
          placeholder="{{ i18n.t('placeholders_company_name') }}"
          style={{ map: { adornmentIcon: "primary" } }}
          value="{{ loadClientLocationData?.data?.locationName }}"
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
          id="cocInput4"
          iconBefore="bold/mail-sign-hashtag"
          label="{{ i18n.t('labels_kvk_number') }}"
          labelPosition="top"
          maxLength="8"
          minLength="8"
          placeholder="{{ i18n.t('placeholders_coc_number') }}"
          style={{ map: { adornmentIcon: "primary" } }}
          value="{{ loadClientLocationData?.data?.cocNumber }}"
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
          id="sectorSelector4"
          data="{{ getSectorsForLocation.data }}"
          emptyMessage="{{ i18n.t('tables_no_options') }}"
          iconBefore="bold/shopping-store-factory"
          label="Sector"
          labelPosition="top"
          labels="{{ item.label }}"
          overlayMaxHeight={375}
          placeholder="{{ i18n.t('placeholders_select_sector') }}"
          showSelectionIndicator={true}
          style={{ map: { adornmentIcon: "primary" } }}
          value="{{ loadClientLocationData?.data?.parentSectorId }}"
          values="{{ item.value }}"
        >
          <Event
            event="change"
            method="trigger"
            params={{
              map: {
                options: {
                  map: {
                    additionalScope: {
                      map: { parentSectorId: "{{ sectorSelector4.value }}" },
                    },
                  },
                },
              },
            }}
            pluginId="getSubSectorsForLocation"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
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
        <Select
          id="select44"
          data="{{ getSubSectorsForLocation.data }}"
          disabled=""
          emptyMessage="{{ i18n.t('tables_no_options') }}"
          iconBefore="bold/shopping-store-factory"
          label="{{ i18n.t('form_sub_sector') }}"
          labelPosition="top"
          labels="{{ item.label }}"
          overlayMaxHeight={375}
          placeholder="{{ i18n.t('placeholders_select_sub_sector') }}"
          showSelectionIndicator={true}
          style={{ map: { adornmentIcon: "primary" } }}
          value="{{ loadClientLocationData?.data?.sectorId }}"
          values="{{ item.value }}"
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
        <Select
          id="clientProfileSelector4"
          data="{{ getCustomerProfilesForLocation.data }}"
          emptyMessage="{{ i18n.t('tables_no_options') }}"
          iconBefore="bold/interface-bookmark-tag"
          label="Klantprofiel
"
          labelPosition="top"
          labels="{{ item.label }}"
          overlayMaxHeight={375}
          placeholder="{{ i18n.t('placeholders_select_profile') }}"
          showSelectionIndicator={true}
          style={{ map: { adornmentIcon: "primary" } }}
          value="{{ loadClientLocationData?.data?.customerProfileId }}"
          values="{{ item.value }}"
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
        <Select
          id="relationSelector4"
          captionByIndex=""
          colorByIndex=""
          data="{{ getRelationManagersForLocation.data }}"
          disabled="true"
          disabledByIndex=""
          emptyMessage="{{ i18n.t('tables_no_options') }}"
          fallbackTextByIndex=""
          hiddenByIndex=""
          iconBefore="bold/interface-user-single"
          iconByIndex=""
          imageByIndex=""
          label="{{ i18n.t('form_relation_manager') }}"
          labelPosition="top"
          labels="{{ item.label }}"
          overlayMaxHeight={375}
          placeholder="{{ i18n.t('placeholders_select_relation') }}"
          showSelectionIndicator={true}
          style={{ map: { adornmentIcon: "primary" } }}
          tooltipByIndex=""
          value="{{ loadClientLocationData?.data?.relationManagerId }}"
          values="{{ item.value }}"
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
      </Body>
    </Form>
    <Form
      id="container457"
      footerPadding="4px 12px"
      headerPadding="0"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Container
          id="group621"
          _align="center"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="12px"
          showBody={true}
          showBorder={false}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <IconText
              id="iconText62"
              icon={'{{  "/icon:bold/travel-map-location-pin"  }}'}
              style={{
                fontSize: "h5Font",
                fontWeight: "h5Font",
                fontFamily: "h5Font",
              }}
              text="{{ i18n.t('headers_visit_address') }}"
            />
          </View>
        </Container>
      </Header>
      <Body>
        <Container
          id="group619"
          _align="center"
          _gap="0px"
          _justify="center"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          padding="0"
          showBody={true}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <Checkbox
              id="checkbox4"
              label="Adres is onbekend of niet aanwezig"
              labelWidth="500"
              labelWidthUnit="px"
              margin="8px 15px"
              style={{
                sharedLabelFontSize: "labelFont",
                sharedLabelFontWeight: "labelFont",
                sharedLabelFontFamily: "labelFont",
              }}
              value="{{ loadClientLocationData?.data?.addressId === undefined || loadClientLocationData?.data?.addressId === null }}"
            />
          </View>
        </Container>
        <Include src="./group620.rsx" />
      </Body>
    </Form>
    <Container
      id="group644"
      _align="center"
      _gap="0px"
      _type="stack"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      showBody={true}
      showBorder={false}
      style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
    >
      <View id="00030" viewKey="View 1">
        <Button
          id="button462"
          heightType="auto"
          iconAfter="bold/interface-arrows-right-alternate"
          style={{
            fontSize: "labelFont",
            fontWeight: "labelFont",
            fontFamily: "labelFont",
          }}
          text="Volgende"
        >
          <Event
            id="d60e764c"
            event="click"
            method="setCurrentView"
            params={{ map: { viewKey: "1" } }}
            pluginId="tabbedContainer14"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </View>
    </Container>
  </View>
  <View id="00031" label="Opdrachten">
    <Container
      id="container459"
      _direction="vertical"
      _gap="0px"
      footerPadding="4px 12px"
      headerPadding="0"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Container
          id="group622"
          _align="center"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="12px"
          showBody={true}
          showBorder={false}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <IconText
              id="iconText63"
              icon={'{{  "/icon:bold/travel-map-location-pin"  }}'}
              style={{
                fontSize: "h5Font",
                fontWeight: "h5Font",
                fontFamily: "h5Font",
              }}
              text="{{ i18n.t('headers_waste_pickup_address') }}"
            />
          </View>
        </Container>
      </Header>
      <View id="00030" viewKey="View 1">
        <Container
          id="group623"
          _align="end"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <SegmentedControl
              id="segmentedControl8"
              itemMode="static"
              label="Is het afval ophaaladres hetzelfde als het bezoekadres?"
              labelPosition="top"
              paddingType="spacious"
              style={{ map: { borderRadius: "8px" } }}
              value="{{ loadClientLocationData?.data?.pickupAddressId !== undefined && loadClientLocationData?.data?.pickupAddressId !== null }}"
            >
              <Option
                id="00030"
                label="{{ i18n.t('options_yes') }}"
                value="false"
              />
              <Option
                id="00031"
                label="{{ i18n.t('options_no') }}"
                value="true"
              />
              <Event
                event="change"
                method="setValue"
                params={{ map: { value: "true" } }}
                pluginId="isFormDirty"
                type="state"
                waitMs="0"
                waitType="debounce"
              />
            </SegmentedControl>
            <Button
              id="button446"
              heightType="auto"
              hidden="{{ segmentedControl8.selectedIndex == 0 }}"
              iconBefore="bold/interface-edit-write-1"
              style={{ map: { background: "tokens/649d910e" } }}
              text="{{ i18n.t('buttons_edit_address') }}"
            >
              <Event
                event="click"
                method="show"
                params={{}}
                pluginId="pickupAddressModal"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
              <Event
                event="click"
                method="clear"
                params={{}}
                pluginId="pickupAddressForm"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </Button>
          </View>
        </Container>
        <Container
          id="group624"
          _align="end"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          hidden="{{ segmentedControl8.selectedIndex == 0 }}"
          padding="0"
          showBody={true}
          showBorder={false}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <Text
              id="text399"
              disableMarkdown={true}
              style={{ map: { color: "primary" } }}
              value="Straat         
Huisnummer
Postcode
Stad
Land"
              verticalAlign="center"
            />
            <Text
              id="text400"
              disableMarkdown={true}
              value="{{ pickupAddressDraft?.value?.street }}         
{{ pickupAddressDraft?.value?.number }} {{ pickupAddressDraft?.value?.addition }}         
{{ pickupAddressDraft?.value?.zipcode }}   
{{ pickupAddressDraft?.value?.city }}   
{{ pickupAddressDraft?.value?.country }}   "
              verticalAlign="center"
            />
          </View>
        </Container>
      </View>
    </Container>
    <Container
      id="container460"
      _direction="vertical"
      _gap="0px"
      footerPadding="4px 12px"
      headerPadding="0"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Container
          id="group625"
          _align="center"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="12px"
          showBody={true}
          showBorder={false}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <IconText
              id="iconText64"
              icon={
                '{{  "/icon:bold/interface-time-clock-circle-alternate"  }}'
              }
              style={{
                fontSize: "h5Font",
                fontWeight: "h5Font",
                fontFamily: "h5Font",
              }}
              text="{{ i18n.t('headers_opening_hours') }}"
            />
          </View>
        </Container>
      </Header>
      <View id="00030" viewKey="View 1">
        <Container
          id="group626"
          _align="end"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <SegmentedControl
              id="segmentedControl9"
              itemMode="static"
              label="Wil je openingstijden toevoegen?"
              labelPosition="top"
              paddingType="spacious"
              style={{ map: { borderRadius: "8px" } }}
              value="{{ getOpenHoursQuery?.data?.length > 0 }}"
            >
              <Option
                id="00030"
                label="{{ i18n.t('options_yes') }}"
                value="true"
              />
              <Option
                id="00031"
                label="{{ i18n.t('options_no') }}"
                value="false"
              />
              <Event
                event="change"
                method="setValue"
                params={{ map: { value: "true" } }}
                pluginId="isFormDirty"
                type="state"
                waitMs="0"
                waitType="debounce"
              />
            </SegmentedControl>
            <Button
              id="button447"
              heightType="auto"
              hidden="{{ segmentedControl9.selectedIndex == 1 }}"
              iconBefore="bold/interface-edit-write-1"
              style={{ map: { background: "tokens/649d910e" } }}
              text="Openingstijden bewerken"
            >
              <Event
                event="click"
                method="show"
                params={{}}
                pluginId="openHoursModal"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </Button>
          </View>
        </Container>
        <Container
          id="group627"
          _align="end"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          hidden="{{ segmentedControl9.selectedIndex == 1 }}"
          padding="0"
          showBody={true}
          showBorder={false}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <Text
              id="text401"
              value="Maandag
Dinsdag
Woensdag
Donderdag
Vrijdag
Zaterdag
Zondag"
              verticalAlign="center"
            />
            <Text
              id="text402"
              heightType="fill"
              overflowType="hidden"
              value="{{ openHours.value[0].isOpen ? `Open (${openHours.value[0].openTime}-${openHours.value[0].closeTime})` : 'Gesloten' }}
{{ openHours.value[1].isOpen ? `Open (${openHours.value[1].openTime}-${openHours.value[1].closeTime})` : 'Gesloten' }}
{{ openHours.value[2].isOpen ? `Open (${openHours.value[2].openTime}-${openHours.value[2].closeTime})` : 'Gesloten' }}
{{ openHours.value[3].isOpen ? `Open (${openHours.value[3].openTime}-${openHours.value[3].closeTime})` : 'Gesloten' }}
{{ openHours.value[4].isOpen ? `Open (${openHours.value[4].openTime}-${openHours.value[4].closeTime})` : 'Gesloten' }}
{{ openHours.value[5].isOpen ? `Open (${openHours.value[5].openTime}-${openHours.value[5].closeTime})` : 'Gesloten' }}
{{ openHours.value[6].isOpen ? `Open (${openHours.value[6].openTime}-${openHours.value[6].closeTime})` : 'Gesloten' }}"
            />
          </View>
        </Container>
      </View>
    </Container>
    <Container
      id="container470"
      _direction="vertical"
      _gap="0px"
      footerPadding="4px 12px"
      headerPadding="0"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Container
          id="group642"
          _align="center"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="12px"
          showBody={true}
          showBorder={false}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <IconText
              id="iconText65"
              icon="bold/interface-alert-information-circle"
              style={{
                fontSize: "h5Font",
                fontWeight: "h5Font",
                fontFamily: "h5Font",
              }}
              text="Informatie voor afvalpartners (optioneel)"
            />
          </View>
        </Container>
      </Header>
      <View id="00030" viewKey="View 1">
        <Container
          id="stack53"
          _direction="vertical"
          _flexWrap={true}
          _gap="10px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
        >
          <View id="00030" viewKey="View 1">
            <Text
              id="text408"
              style={{}}
              value="Deze informatie wordt bij elke opdracht van de vestiging meegestuurd naar de afvalpartner."
              verticalAlign="center"
            />
            <TextArea
              id="textArea1"
              autoResize={true}
              label=""
              labelPosition="top"
              minLines={2}
              placeholder="Informatie voor afvalpartners..."
              value="{{ loadClientLocationData?.data?.wastePartnersInfo }}"
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
            </TextArea>
          </View>
        </Container>
      </View>
    </Container>
    <Container
      id="container471"
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
          id="button463"
          heightType="auto"
          horizontalAlign="left"
          iconBefore="bold/interface-arrows-left-alternate"
          style={{ map: { background: "tokens/8ca1af49" } }}
          text="{{ i18n.t('buttons_previous') }}"
        >
          <Event
            id="6fbd0cc9"
            event="click"
            method="setCurrentView"
            params={{ map: { viewKey: "0" } }}
            pluginId="tabbedContainer14"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Button
          id="button464"
          heightType="auto"
          iconAfter="bold/interface-arrows-right-alternate"
          text="{{ i18n.t('buttons_next') }}"
        >
          <Event
            id="37a73fa3"
            event="click"
            method="setCurrentView"
            params={{ map: { viewKey: "2" } }}
            pluginId="tabbedContainer14"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </View>
    </Container>
  </View>
  <View id="00032" label="Facturen">
    <Container
      id="container462"
      _direction="vertical"
      _gap="0px"
      footerPadding="4px 12px"
      headerPadding="0"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Container
          id="group628"
          _align="center"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="12px"
          showBody={true}
          showBorder={false}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <IconText
              id="iconText66"
              icon={'{{  "/icon:bold/travel-map-location-pin"  }}'}
              style={{
                fontSize: "h5Font",
                fontWeight: "h5Font",
                fontFamily: "h5Font",
              }}
              text="Factuuradres"
            />
          </View>
        </Container>
      </Header>
      <View id="00030" viewKey="View 1">
        <Container
          id="group629"
          _align="end"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <SegmentedControl
              id="segmentedControl10"
              itemMode="static"
              label="Is het factuuradres hetzelfde als het bezoekadres?"
              labelPosition="top"
              paddingType="spacious"
              style={{
                checkedLabel: "primary",
                labels: "primary",
                borderRadius: "8px",
              }}
              value="{{ loadClientLocationData?.data?.invoiceAddressId !== undefined && loadClientLocationData?.data?.invoiceAddressId !== null }}"
            >
              <Option
                id="00030"
                label="{{ i18n.t('options_yes') }}"
                value="false"
              />
              <Option
                id="00031"
                label="{{ i18n.t('options_no') }}"
                value="true"
              />
              <Event
                event="change"
                method="setValue"
                params={{ map: { value: "true" } }}
                pluginId="isFormDirty"
                type="state"
                waitMs="0"
                waitType="debounce"
              />
            </SegmentedControl>
            <Button
              id="button449"
              heightType="auto"
              hidden="{{ segmentedControl10.selectedIndex == 0 }}"
              iconBefore="bold/interface-edit-write-1"
              style={{ map: { background: "tokens/649d910e" } }}
              text="{{ i18n.t('buttons_edit_address') }}"
            >
              <Event
                event="click"
                method="show"
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
          id="group630"
          _align="end"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          hidden="{{ segmentedControl10.selectedIndex == 0 }}"
          padding="0"
          showBody={true}
          showBorder={false}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <Container
              id="group645"
              _align="end"
              _gap="0px"
              _type="stack"
              footerPadding="4px 12px"
              headerPadding="4px 12px"
              hidden="{{ segmentedControl8.selectedIndex == 0 }}"
              margin="0"
              padding="0"
              showBody={true}
              showBorder={false}
              style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
            >
              <View id="00030" viewKey="View 1">
                <Text
                  id="text409"
                  disableMarkdown={true}
                  style={{}}
                  value="Straat         
Huisnummer
Postcode
Stad
Land"
                  verticalAlign="center"
                />
                <Text
                  id="text410"
                  disableMarkdown={true}
                  value="{{ invoiceAddressDraft?.value?.street }}         
{{ invoiceAddressDraft?.value?.number }} {{ invoiceAddressDraft?.value?.addition }}         
{{ invoiceAddressDraft?.value?.zipcode }}   
{{ invoiceAddressDraft?.value?.city }}   
{{ invoiceAddressDraft?.value?.country }}   "
                  verticalAlign="center"
                />
              </View>
            </Container>
          </View>
        </Container>
      </View>
    </Container>
    <Container
      id="container463"
      _direction="vertical"
      _gap="0px"
      footerPadding="4px 12px"
      headerPadding="0"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Container
          id="group633"
          _align="center"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="12px"
          showBody={true}
          showBorder={false}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <IconText
              id="iconText67"
              icon={'{{  "/icon:bold/interface-setting-wrench"  }}'}
              style={{
                fontSize: "h5Font",
                fontWeight: "h5Font",
                fontFamily: "h5Font",
              }}
              text="{{ i18n.t('headers_preferences') }}"
            />
          </View>
        </Container>
      </Header>
      <View id="00030" viewKey="View 1">
        <Container
          id="group634"
          _align="end"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="0"
          showBody={true}
          showBorder={false}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <SegmentedControl
              id="segmentedControl11"
              itemMode="static"
              label="Wanneer factureren we de klant?"
              labelPosition="top"
              paddingType="spacious"
              style={{ map: { borderRadius: "8px" } }}
              value={
                '{{ loadClientLocationData?.data?.invoiceFreq || "weekly" }}'
              }
            >
              <Option
                id="00030"
                label="{{ i18n.t('options_weekly') }}"
                value="weekly"
              />
              <Option
                id="00031"
                label="{{ i18n.t('options_monthly') }}"
                value="mounthly"
              />
              <Event
                event="change"
                method="setValue"
                params={{ map: { value: "true" } }}
                pluginId="isFormDirty"
                type="state"
                waitMs="0"
                waitType="debounce"
              />
            </SegmentedControl>
            <SegmentedControl
              id="segmentedControl12"
              itemMode="static"
              label="Hoe wilt de klant de factuur ontvangen?"
              labelPosition="top"
              paddingType="spacious"
              style={{ map: { borderRadius: "8px" } }}
              value={
                '{{ loadClientLocationData?.data?.invoiceSendingChannel || "email" }}'
              }
            >
              <Option
                id="00030"
                label="{{ i18n.t('options_email') }}"
                value="email"
              />
              <Option
                id="00031"
                label="{{ i18n.t('options_email_and_post') }}"
                value="email_post"
              />
              <Event
                event="change"
                method="setValue"
                params={{ map: { value: "true" } }}
                pluginId="isFormDirty"
                type="state"
                waitMs="0"
                waitType="debounce"
              />
            </SegmentedControl>
          </View>
        </Container>
      </View>
    </Container>
    <Form
      id="container464"
      footerPadding="4px 12px"
      headerPadding="0"
      padding="12px"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Container
          id="group635"
          _align="center"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="12px"
          showBody={true}
          showBorder={false}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <IconText
              id="iconText68"
              icon={'{{  "/icon:bold/money-bank"  }}'}
              style={{
                fontSize: "h5Font",
                fontWeight: "h5Font",
                fontFamily: "h5Font",
              }}
              text="{{ i18n.t('labels_client_location') }}"
            />
          </View>
        </Container>
      </Header>
      <Body>
        <TextInput
          id="companyName10"
          iconBefore="bold/mail-send-email"
          label="{{ i18n.t('labels_invoice_email') }}"
          labelPosition="top"
          patternType="email"
          placeholder="{{ i18n.t('placeholders_email') }}"
          style={{ map: { adornmentIcon: "primary" } }}
          value="{{ loadClientLocationData?.data?.invoiceEmail }}"
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
        <NumberInput
          id="companyName12"
          currency="USD"
          iconBefore="bold/interface-calendar-alternate"
          inputValue={0}
          label="{{ i18n.t('labels_payment_terms') }}"
          labelPosition="top"
          placeholder="{{ i18n.t('placeholders_payment_terms') }}"
          showSeparators={true}
          showStepper={true}
          style={{ map: { adornmentIcon: "primary" } }}
          value="{{ loadClientLocationData?.data?.paymentTermDays }}"
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
        </NumberInput>
        <TextInput
          id="companyName11"
          iconBefore="bold/mail-sign-hashtag"
          label="{{ i18n.t('labels_debtor_number') }}"
          labelPosition="top"
          placeholder="{{ i18n.t('placeholders_debtor_number') }}"
          style={{ map: { adornmentIcon: "primary" } }}
          value="{{ loadClientLocationData?.data?.debtorNumber }}"
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
          id="companyName13"
          iconBefore="bold/mail-sign-hashtag"
          label="{{ i18n.t('labels_vat_number') }}"
          labelPosition="top"
          placeholder="{{ i18n.t('placeholders_vat_number') }}"
          style={{ sharedLabel: "primary", adornmentIcon: "primary" }}
          value="{{ loadClientLocationData?.data?.btwNumber }}"
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
      </Body>
    </Form>
    <Container
      id="container472"
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
          id="button465"
          heightType="auto"
          horizontalAlign="left"
          iconBefore="bold/interface-arrows-left-alternate"
          style={{ map: { background: "tokens/8ca1af49" } }}
          text="{{ i18n.t('buttons_previous') }}"
        >
          <Event
            id="6fbd0cc9"
            event="click"
            method="setCurrentView"
            params={{ map: { viewKey: "1" } }}
            pluginId="tabbedContainer14"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Button
          id="button466"
          heightType="auto"
          iconAfter="bold/interface-arrows-right-alternate"
          text="{{ i18n.t('buttons_next') }}"
        >
          <Event
            id="37a73fa3"
            event="click"
            method="setCurrentView"
            params={{ map: { viewKey: "3" } }}
            pluginId="tabbedContainer14"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </View>
    </Container>
  </View>
  <View
    id="99be0"
    disabled={false}
    hidden={false}
    iconPosition="left"
    label="Contactpersonen"
  >
    <Container
      id="container465"
      _direction="vertical"
      _gap="0px"
      footerPadding="4px 12px"
      headerPadding="0"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Container
          id="group637"
          _align="center"
          _gap="0px"
          _justify="space-between"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="0"
          padding="12px"
          showBody={true}
          showBorder={false}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <IconText
              id="iconText54"
              icon="bold/interface-alert-information-circle"
              style={{
                fontSize: "h5Font",
                fontWeight: "h5Font",
                fontFamily: "h5Font",
              }}
              text="De volgende contactpersonen zijn al toegevoegd op klantgroep niveau."
            />
            <IconText
              id="iconText55"
              icon="bold/interface-hierarchy-2"
              style={{
                fontSize: "h5Font",
                fontWeight: "h5Font",
                fontFamily: "h5Font",
              }}
              text="Contactpersonen klant groep"
            />
          </View>
        </Container>
      </Header>
      <View id="00030" viewKey="View 1">
        <Container
          id="container466"
          _align="center"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          hidden="{{ table5?.data?.length }}"
          padding="12px"
          showBody={true}
          style={{ map: { background: "canvas" } }}
        >
          <View id="00030" viewKey="View 1">
            <IconText
              id="iconText56"
              icon="bold/interface-alert-information-circle"
              style={{}}
              text="Er zijn op dit moment nog geen contactpersonen voor deze klantgroep"
            />
          </View>
        </Container>
        <Table
          id="table5"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ getClientGroupContactPersonsQuery3.data }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="{{ i18n.default('no_rows_found') }}"
          enableSaveActions={true}
          heightType="auto"
          hidden="{{ !table5?.data?.length }}"
          primaryKeyColumnId="4fc64"
          rowHeight="small"
          showBorder={true}
          showHeader={true}
          toolbarPosition="bottom"
        >
          <Column
            id="4fc64"
            alignment="right"
            editable={false}
            editableOptions={{ showStepper: true }}
            format="decimal"
            formatOptions={{ showSeparators: true, notation: "standard" }}
            groupAggregationMode="sum"
            hidden="true"
            key="contactPersonId"
            label="Contact person ID"
            placeholder="Enter value"
            position="center"
            size={0}
            summaryAggregationMode="none"
          />
          <Column
            id="6ed91"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="contactPersonName"
            label="Contactpersoon"
            placeholder="Enter value"
            position="center"
            size={218}
            summaryAggregationMode="none"
          />
          <Column
            id="a7c5c"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="contactPersonFunctionName"
            label="Functie"
            placeholder="Enter value"
            position="center"
            size={136}
            summaryAggregationMode="none"
          />
          <Column
            id="d8511"
            alignment="left"
            format="link"
            formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
            groupAggregationMode="none"
            key="contactPersonEmail"
            label="Email"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
        </Table>
      </View>
    </Container>
    <Container
      id="container467"
      _direction="vertical"
      _gap="0px"
      footerPadding="4px 12px"
      headerPadding="0"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Container
          id="group638"
          _align="center"
          _gap="0px"
          _justify="space-between"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="4px 0px 4px"
          padding="12px"
          showBody={true}
          showBorder={false}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <IconText
              id="iconText57"
              icon="bold/shopping-store-factory-building"
              style={{
                fontSize: "h5Font",
                fontWeight: "h5Font",
                fontFamily: "h5Font",
              }}
              text="Contactpersonen klant vestiging"
            />
          </View>
        </Container>
      </Header>
      <View id="00030" viewKey="View 1">
        <Container
          id="container468"
          _align="center"
          _gap="0px"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          hidden="{{ table6?.data?.length }}"
          padding="12px"
          showBody={true}
          style={{ map: { background: "canvas" } }}
        >
          <View id="00030" viewKey="View 1">
            <IconText
              id="iconText58"
              icon="bold/interface-alert-information-circle"
              style={{}}
              text="Er zijn op dit moment nog geen contactpersonen voor deze klant vestiging"
            />
          </View>
        </Container>
        <Table
          id="table6"
          cellSelection="none"
          clearChangesetOnSave={true}
          data="{{ [...contactPersonsDraft1.value, ...(getClientLocationContactPersonQuery.data || [])] }}"
          defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
          emptyMessage="{{ i18n.default('no_rows_found') }}"
          enableSaveActions={true}
          heightType="auto"
          hidden="{{ !table6?.data?.length }}"
          primaryKeyColumnId="b1c01"
          rowHeight="small"
          showBorder={true}
          showHeader={true}
          toolbarPosition="bottom"
        >
          <Column
            id="b1c01"
            alignment="right"
            format="decimal"
            formatOptions={{ notation: "standard" }}
            groupAggregationMode="countDistinct"
            hidden="true"
            key="id"
            label="ID"
            position="center"
            size={32}
            summaryAggregationMode="none"
          />
          <Column
            id="d513c"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="firstName"
            label="Contactpersoon"
            placeholder="Enter value"
            position="center"
            size={153}
            summaryAggregationMode="none"
          />
          <Column
            id="91895"
            alignment="left"
            format="string"
            groupAggregationMode="none"
            key="departmentName"
            label="Functie"
            placeholder="Enter value"
            position="center"
            referenceId="column3"
            size={180}
            summaryAggregationMode="none"
          />
          <Column
            id="c1942"
            alignment="left"
            format="link"
            formatOptions={{ showUnderline: "hover", underlineStyle: "solid" }}
            groupAggregationMode="none"
            key="email"
            label="Email"
            placeholder="Enter value"
            position="center"
            size={194}
            summaryAggregationMode="none"
          />
          <Column
            id="93748"
            alignment="left"
            editableOptions={{ showStepper: true }}
            format="string"
            formatOptions={{
              showFormatting: true,
              showCountryCallingCode: true,
              restrictToCountry: false,
            }}
            groupAggregationMode="sum"
            key="phone"
            label="Telefoon"
            placeholder="Enter value"
            position="center"
            size={100}
            summaryAggregationMode="none"
          />
        </Table>
        <Button
          id="button452"
          heightType="auto"
          iconBefore="bold/interface-add-circle"
          style={{ map: { background: "tokens/649d910e" } }}
          text="Contactpersoon toevoegen"
        >
          <Event
            event="click"
            method="show"
            params={{}}
            pluginId="addClientContactPersonModal"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="click"
            method="clear"
            params={{}}
            pluginId="addContactPersonForm2"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
          <Event
            event="click"
            method="setValue"
            params={{ map: { value: "true" } }}
            pluginId="isFormDirty"
            type="state"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </View>
    </Container>
    <Container
      id="container473"
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
          id="button467"
          heightType="auto"
          horizontalAlign="left"
          iconBefore="bold/interface-arrows-left-alternate"
          style={{ map: { background: "tokens/8ca1af49" } }}
          text="{{ i18n.t('buttons_previous') }}"
        >
          <Event
            id="6fbd0cc9"
            event="click"
            method="setCurrentView"
            params={{ map: { viewKey: "2" } }}
            pluginId="tabbedContainer14"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Button
          id="button468"
          heightType="auto"
          iconAfter="bold/interface-arrows-right-alternate"
          text="{{ i18n.t('buttons_next') }}"
        >
          <Event
            id="37a73fa3"
            event="click"
            method="setCurrentView"
            params={{ map: { viewKey: "4" } }}
            pluginId="tabbedContainer14"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </View>
    </Container>
  </View>
  <View
    id="c1f99"
    disabled={false}
    hidden={false}
    iconPosition="left"
    label="Gebruikers"
  >
    <Container
      id="container469"
      _direction="vertical"
      _gap="0px"
      footerPadding="4px 12px"
      headerPadding="0"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Container
          id="group640"
          _align="center"
          _gap="0px"
          _justify="space-between"
          _type="stack"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          margin="4px 0px 4px"
          padding="12px"
          showBody={true}
          showBorder={false}
          style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
        >
          <View id="00030" viewKey="View 1">
            <IconText
              id="iconText59"
              icon="bold/interface-user-circle"
              style={{
                fontSize: "h5Font",
                fontWeight: "h5Font",
                fontFamily: "h5Font",
              }}
              text="Gebruikers klant groep"
            />
          </View>
        </Container>
      </Header>
      <View id="00030" viewKey="View 1" />
    </Container>
    <Container
      id="group641"
      _align="center"
      _gap="0px"
      _type="stack"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      showBody={true}
      showBorder={false}
      style={{ map: { background: "rgba(255, 255, 255, 0)" } }}
    >
      <View id="00030" viewKey="View 1">
        <Button
          id="button455"
          heightType="auto"
          horizontalAlign="left"
          iconBefore="bold/interface-arrows-left-alternate"
          style={{ map: { background: "tokens/8ca1af49" } }}
          text="{{ i18n.t('buttons_previous') }}"
        >
          <Event
            id="6fbd0cc9"
            event="click"
            method="setCurrentViewIndex"
            params={{ map: { viewIndex: "3" } }}
            pluginId="tabbedContainer14"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <Button
          id="button456"
          heightType="auto"
          iconAfter="bold/interface-validation-check-circle"
          style={{
            fontSize: "labelFont",
            fontWeight: "labelFont",
            fontFamily: "labelFont",
          }}
          text="Afronden"
        >
          <Event
            event="click"
            method="trigger"
            params={{
              map: {
                options: {
                  map: {
                    additionalScope: { map: { transitToActive: "true" } },
                  },
                },
              },
            }}
            pluginId="saveClientLocation"
            type="datasource"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </View>
    </Container>
  </View>
  <Event
    event="change"
    method="trigger"
    params={{}}
    pluginId="handleSwitchTabs"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
</Container>
