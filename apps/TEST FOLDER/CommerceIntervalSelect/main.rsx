<App>
  <Include src="./functions.rsx" />
  <GlobalWidgetOutput id="interval" value="{{frequencySelect.value}}" />
  <GlobalWidgetOutput
    id="intervalMilliseconds"
    description="returns interval value as milliseconds "
    value="{{tranformIntervalToMS.value}}"
  />
  <GlobalWidgetProp id="startDate" defaultValue={'"2024-07-06"'} />
  <GlobalWidgetProp id="endDate" defaultValue={'"2024-08-06"'} />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <ModuleContainerWidget
      id="moduleContainer"
      backgroundColor="white"
      hidden=""
      isGlobalWidgetContainer={true}
      showFrequenc="{{false}}"
      showFrequency="{{true}}"
      showInterval=""
    >
      <Select
        id="frequencySelect"
        emptyMessage="No options"
        hidden=""
        hideLabel={false}
        itemMode="static"
        label=""
        labelPosition="top"
        marginType="normal"
        overlayMaxHeight={375}
        placeholder="Select an option"
        showSelectionIndicator={true}
        value="day"
      >
        <Option id="74445" label="Daily" value="day" />
        <Option
          id="91e91"
          caption="{{moment(endDate.value).diff(startDate.value , 'weeks') <= 1 ? 'Choose a longer date range to select' : ''}}"
          disabled="{{moment(endDate.value).diff(startDate.value , 'weeks') <= 1}}"
          label="Weekly"
          value="week"
        />
        <Option
          id="3c367"
          caption="{{moment(endDate.value).diff(startDate.value , 'months') <= 1 ? 'Choose a longer date range to select' : ''}}"
          disabled="{{moment(endDate.value).diff(startDate.value , 'months') <= 1}}"
          label="Monthly"
          value="month"
        />
        <Option
          id="61ef8"
          caption="{{moment(endDate.value).diff(startDate.value , 'years') <= 1 ? 'Choose a longer date range to select' : ''}}"
          disabled="{{moment(endDate.value).diff(startDate.value , 'years') <= 1}}"
          hidden={false}
          label="Yearly"
          value="year"
        />
        <Event
          event="change"
          method="trigger"
          params={{ ordered: [] }}
          pluginId=""
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
      </Select>
      <Text
        id="text1"
        horizontalAlign="right"
        value={
          '<duv style="color:#262626; font-family: Inter; font-size: 12px; font-style: normal; font-weight: 500; line-height: 16px;">Interval</div>'
        }
        verticalAlign="center"
      />
    </ModuleContainerWidget>
  </Frame>
</App>
