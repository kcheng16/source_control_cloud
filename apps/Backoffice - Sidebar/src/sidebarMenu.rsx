<Container
  id="sidebarMenu"
  _direction="vertical"
  _gap="0px"
  _type="stack"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <View id="00030" viewKey="View 1">
    <Button
      id="button58"
      heightType="auto"
      horizontalAlign="center"
      iconBefore={'{{ "/icon:bold/interface-arrows-left-circle-2" }}'}
      style={{}}
      styleVariant="outline"
      submitTargetId=""
    >
      <Event
        event="click"
        method="run"
        params={{
          map: {
            src: 'if (sidebarFrame1.width === "medium" || sidebarFrame1.width === "190px") {\n  sidebarFrame1.setWidth("small");\n} else {\n  sidebarFrame1.setWidth("medium");\n}',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Container
      id="container8"
      enableFullBleed={true}
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      hidden=""
      margin="0"
      overflowType="hidden"
      padding="5px"
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text
          id="containerTitle8"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="4a976" viewKey="View 1">
        <Image
          id="image4"
          aspectRatio=""
          dbBlobId="fa8cae38-ff01-4e16-9570-b3b2eeff50aa"
          fit="contain"
          heightType="fixed"
          horizontalAlign="center"
          retoolStorageFileId="2d7e06bd-ac48-4827-ab72-4c842437793c"
          src="https://www.rondo.nl/media/kkwh4qkp/rondo_logo_cmyk.png?width=400&rnd=133293066557230000"
          srcType="dbBlobId"
          style={{ ordered: [] }}
        />
      </View>
    </Container>
    <Navigation
      id="navigation3"
      appTargetByIndex=""
      captionByIndex=""
      data=""
      disabledByIndex=""
      hiddenByIndex=""
      highlightByIndex=""
      iconByIndex=""
      iconPositionByIndex=""
      itemMode="static"
      itemTypeByIndex=""
      keyByIndex=""
      labels=""
      orientation="vertical"
      parentKeyByIndex=""
      screenTargetByIndex=""
      screenTargetIdByIndex=""
      src={null}
      srcType={null}
      style={{
        highlightText: "#2b3860",
        color: "primary",
        fontSize: "labelFont",
        fontWeight: "labelFont",
        fontFamily: "labelFont",
      }}
      tooltipByIndex=""
    >
      <Option
        id="80eff"
        hidden="{{ !userPermissions?.value?.Orders?.read }}"
        icon="bold/shopping-cart-2"
        iconPosition="left"
        key="bc652"
        label="Opdrachten"
      />
      <Option
        id="6c59e"
        appTarget="383ca144-b896-11f0-b937-1b6cd74f3d25"
        disabled={false}
        hidden={false}
        iconPosition="left"
        itemType="app"
        label="Nieuw"
        parentKey="bc652"
        screenTargetId="orders"
      />
      <Option
        id="ecf23"
        disabled={false}
        hidden={false}
        iconPosition="left"
        itemType="app"
        label="Nader beoordelen"
        parentKey="bc652"
      />
      <Option
        id="49541"
        disabled={false}
        hidden={false}
        iconPosition="left"
        itemType="app"
        label="In uitvoering"
        parentKey="bc652"
      />
      <Option
        id="1c785"
        disabled={false}
        hidden={false}
        iconPosition="left"
        itemType="app"
        label="Afgerond"
        parentKey="bc652"
      />
      <Option
        id="7c5b4"
        appTarget="383ca144-b896-11f0-b937-1b6cd74f3d25"
        disabled={false}
        iconPosition="left"
        itemType="app"
        label="Geannuleerd"
        parentKey="bc652"
        screenTargetId="cancelledOrders"
      />
      <Option
        id="97602"
        hidden="{{ !userPermissions?.value?.Invoices?.read }}"
        icon="bold/interface-file-clipboard-text"
        iconPosition="left"
        itemType="page"
        key="7ae3e"
        label="{{ i18n.t('navigation_invoices') }}"
      />
      <Option
        id="7fd21"
        disabled={false}
        hidden={'{{ sidebarFrame1.width == "small" }}'}
        iconPosition="left"
        itemType="page"
        label="Regels controleren"
        parentKey="7ae3e"
      />
      <Option
        id="7b928"
        hidden="{{ !userPermissions?.value?.Sale?.read }}"
        icon="bold/money-graph"
        iconPosition="left"
        itemType="page"
        key="815e4"
        label="{{ i18n.t('navigation_sales') }}"
      />
      <Option
        id="3380a"
        disabled={false}
        hidden="{{ !userPermissions?.value?.Reporting?.read }}"
        highlight={false}
        icon="bold/interface-setting-gauge-dashboard-1"
        iconPosition="left"
        itemType="page"
        label="{{ i18n.t('navigation_reporting') }}"
      />
      <Event
        event="click"
        method="openPage"
        params={{ ordered: [{ pageName: "{{ item.id }}" }] }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Navigation>
    <Divider id="divider1" />
    <Navigation
      id="navigation4"
      appTargetByIndex=""
      captionByIndex=""
      data=""
      disabledByIndex=""
      hiddenByIndex=""
      highlightByIndex=""
      iconByIndex=""
      iconPositionByIndex=""
      itemMode="static"
      itemTypeByIndex=""
      keyByIndex=""
      labels=""
      orientation="vertical"
      parentKeyByIndex=""
      screenTargetByIndex=""
      screenTargetIdByIndex=""
      src={null}
      srcType={null}
      style={{
        color: "primary",
        highlightText: "primary",
        fontSize: "labelFont",
        fontWeight: "labelFont",
        fontFamily: "labelFont",
      }}
      tooltipByIndex=""
    >
      <Option
        id="80eff"
        hidden="{{ !userPermissions?.value?.Customers?.read }}"
        icon="bold/shopping-store-factory-building"
        iconPosition="left"
        itemType="page"
        key="bc652"
        label="{{ i18n.t('navigation_customers') }}"
      />
      <Option
        id="16e78"
        appTarget="383ca144-b896-11f0-b937-1b6cd74f3d25"
        disabled={false}
        iconPosition="left"
        itemType="app"
        label={'{{ i18n.t("navigation_client_groups")}}'}
        parentKey="bc652"
        screenTargetId="clientGroups"
      />
      <Option
        id="457b9"
        appTarget="383ca144-b896-11f0-b937-1b6cd74f3d25"
        disabled={false}
        iconPosition="left"
        itemType="app"
        label={'{{ i18n.t("navigation_client_locations")}}'}
        parentKey="bc652"
        screenTargetId="clientLocations"
      />
      <Option
        id="97602"
        hidden="{{ !userPermissions?.value?.Partners?.read }}"
        icon="bold/interface-user-multiple"
        iconPosition="left"
        itemType="page"
        key="7ae3e"
        label="{{ i18n.t('navigation_partners') }}"
      />
      <Option
        id="afd08"
        appTarget="383ca144-b896-11f0-b937-1b6cd74f3d25"
        disabled={false}
        iconPosition="left"
        itemType="app"
        label={'{{ i18n.t("navigation_partner_groups") }}'}
        parentKey="7ae3e"
        screenTargetId="partnerGroups"
      />
      <Option
        id="22ce0"
        appTarget="383ca144-b896-11f0-b937-1b6cd74f3d25"
        disabled={false}
        hidden={false}
        iconPosition="left"
        itemType="app"
        label={'{{ i18n.t("navigation_partner_locations") }}'}
        parentKey="7ae3e"
        screenTargetId="partnerLocations"
      />
      <Option
        id="7b928"
        icon="bold/interface-security-shield-2"
        iconPosition="left"
        itemType="page"
        key="815e4"
        label="{{ i18n.t('navigation_legal') }}"
      />
      <Option
        id="08668"
        appTarget="d0d93fe0-b68c-11f0-9a9b-d756aae20469"
        disabled={false}
        hidden="{{ !userPermissions.value.Services.read }}"
        icon="bold/interface-setting-wrench"
        iconPosition="left"
        itemType="app"
        label={'{{ i18n.t("navigation_services") }}'}
        screenTargetId="services"
      />
      <Event
        event="click"
        method="openPage"
        params={{ ordered: [{ pageName: "{{ item.id }}" }] }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Navigation>
    <Divider id="divider2" />
    <Navigation
      id="navigation5"
      appTargetByIndex=""
      captionByIndex=""
      data=""
      disabledByIndex=""
      hiddenByIndex=""
      highlightByIndex=""
      iconByIndex=""
      iconPositionByIndex=""
      itemMode="static"
      itemTypeByIndex=""
      keyByIndex=""
      labels=""
      orientation="vertical"
      parentKeyByIndex=""
      screenTargetByIndex=""
      screenTargetIdByIndex=""
      src={null}
      srcType={null}
      style={{ color: "primary", highlightText: "primary" }}
      tooltipByIndex=""
    >
      <Option
        id="3273e"
        disabled={false}
        hidden="{{ !userPermissions?.value?.Configurations?.read }}"
        icon="bold/interface-bookmark-tag"
        iconPosition="left"
        itemType="app"
        key="dff0d"
        label="{{ i18n.t('navigation_configurations') }}"
      />
      <Option
        id="756ea"
        appTarget="383ca144-b896-11f0-b937-1b6cd74f3d25"
        disabled={false}
        iconPosition="left"
        itemType="app"
        label={'{{ i18n.t("navigation_categories") }}'}
        parentKey="dff0d"
        screenTargetId="configurationCategories"
      />
      <Option
        id="0dcfb"
        appTarget="383ca144-b896-11f0-b937-1b6cd74f3d25"
        disabled={false}
        iconPosition="left"
        itemType="app"
        label={'{{ i18n.t("navigation_administration") }}'}
        parentKey="dff0d"
        screenTargetId="administration"
      />
      <Option
        id="d838a"
        appTarget="383ca144-b896-11f0-b937-1b6cd74f3d25"
        disabled={false}
        iconPosition="left"
        itemType="app"
        label="Sectoren"
        parentKey="dff0d"
        screenTargetId="configurationSectors"
      />
      <Option
        id="194ce"
        appTarget="383ca144-b896-11f0-b937-1b6cd74f3d25"
        disabled={false}
        iconPosition="left"
        itemType="app"
        label={'{{ i18n.t("label_services") }}'}
        parentKey="dff0d"
        screenTargetId="services"
      />
      <Option
        id="97602"
        hidden="{{ !userPermissions?.value?.Users?.read }}"
        icon="bold/interface-user-circle"
        iconPosition="left"
        itemType="page"
        key="7ae3e"
        label="{{ i18n.t('navigation_users') }}"
      />
      <Option
        id="36363"
        appTarget="383ca144-b896-11f0-b937-1b6cd74f3d25"
        disabled={false}
        iconPosition="left"
        itemType="app"
        label="Klant gebruikers"
        parentKey="7ae3e"
        screenTargetId="clientUsers"
      />
      <Option
        id="edb65"
        appTarget="383ca144-b896-11f0-b937-1b6cd74f3d25"
        disabled={false}
        hidden={false}
        iconPosition="left"
        itemType="app"
        label="Klant rollen"
        parentKey="7ae3e"
        screenTargetId="clientRoles"
      />
      <Option
        id="8037e"
        appTarget="383ca144-b896-11f0-b937-1b6cd74f3d25"
        disabled={false}
        iconPosition="left"
        itemType="app"
        label="Medewerkers"
        parentKey="7ae3e"
        screenTargetId="employees"
      />
      <Option
        id="5f02e"
        appTarget="383ca144-b896-11f0-b937-1b6cd74f3d25"
        disabled={false}
        hidden={false}
        iconPosition="left"
        itemType="app"
        label="Rollen intern"
        parentKey="7ae3e"
        screenTargetId="internalRoles"
      />
      <Option
        id="7b928"
        icon="bold/interface-setting-cog"
        iconPosition="left"
        itemType="page"
        key="815e4"
        label="{{ i18n.t('navigation_settings') }}"
      />
      <Event
        event="click"
        method="trigger"
        params={{}}
        pluginId=""
        targetId="94936"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="openPage"
        params={{ ordered: [{ pageName: "{{ item.id }}" }] }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Navigation>
  </View>
</Container>
