<App>
  <Include src="./functions.rsx" />
  <GlobalWidgetOutput id="startDate" value="{{dateRange.value.start}}" />
  <GlobalWidgetOutput id="endDate" value="{{dateRange.value.end}}" />
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
      <DateRange
        id="dateRange"
        dateFormat="MMM d, yyyy"
        endPlaceholder="End date"
        iconBefore="bold/interface-calendar-remove"
        label="Date range"
        labelPosition="top"
        labelWrap={true}
        marginType="normal"
        required={true}
        startPlaceholder="Start date"
        style={{ ordered: [] }}
        textBetween="-"
        tooltipText="Set a custom date range to show the data over that period of time. You will also see how the data changed when compared to the preceding period of time. "
        value={{
          ordered: [
            { start: "{{moment().subtract(1, 'month')}}" },
            { end: "{{moment()}}" },
          ],
        }}
      />
    </ModuleContainerWidget>
  </Frame>
</App>
