<App>
  <Include src="./functions.rsx" />
  <GlobalWidgetProp id="errorMessage" />
  <GlobalWidgetProp id="formType" value="create" />
  <GlobalWidgetProp id="interstitialName" defaultValue="test99" />
  <GlobalWidgetOutput id="output1" value="{{isDisabled.value}}" />
  <GlobalWidgetProp id="selectedInterstitial" />
  <GlobalWidgetProp id="submitFormTrigger" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    paddingType="normal"
    sticky={null}
    type="main"
  >
    <ModuleContainerWidget
      id="moduleContainer"
      backgroundColor="white"
      formType="create"
      isGlobalWidgetContainer={true}
      selectedInterstitial=""
      shouldSubmitForm=""
    >
      <Form
        id="createInterstitialForm"
        disabled="{{isDisabled.value}}"
        disableSubmit=""
        hidden=""
        requireValidation={true}
        showBody={true}
        showBorder={false}
      >
        <Alert
          id="createErrorMessageAlert"
          description="{{errorMessage.value}}"
          hidden="{{!errorMessage.value}}"
          title=""
          type="error"
        />
        <Text
          id="createScheduleHeader"
          value="##### Schedule"
          verticalAlign="center"
        />
        <DateTime
          id="createStartTimeInput"
          dateFormat="yyyy-MM-dd"
          disabled="{{ !createStartTimeSwitch.value }}"
          displayTimeZone="00:00"
          iconBefore="bold/interface-calendar"
          label=""
          manageTimeZone={true}
          minuteStep={15}
          required="{{createStartTimeSwitch.value}}"
          textAfter="UTC"
          timeFormat="H:mm"
          value="{{ selectedInterstitial.value?.startTime }}"
          valueTimeZone="00:00"
        />
        <Switch
          id="createStartTimeSwitch"
          disabled=""
          label="Start Time"
          value="{{!!(selectedInterstitial?.value?.startTime)}}"
        />
        <Spacer id="spacer29" />
        <DateTime
          id="createEndTimeInput"
          customValidation={
            '{{moment.utc(self.value).valueOf() < moment.utc(createStartTimeInput.value).valueOf() ? "Cannot be before start date" : null}}'
          }
          dateFormat="yyyy-MM-dd"
          disabled="{{ !createEndTimeSwitch.value }}"
          displayTimeZone="00:00"
          iconBefore="bold/interface-calendar"
          label=""
          manageTimeZone={true}
          minuteStep={15}
          required="{{createEndTimeSwitch.value}}"
          textAfter="UTC"
          timeFormat="H:mm"
          value="{{ selectedInterstitial.value?.endTime 
}}"
          valueTimeZone="00:00"
        />
        <Switch
          id="createEndTimeSwitch"
          label="End Time"
          value="{{!!(selectedInterstitial.value?.endTime)}}"
        />
        <Spacer id="spacer30" />
        <Divider id="divider13" />
        <Spacer id="spacer31" />
        <Text
          id="createTargetingHeader"
          value="##### Targeting"
          verticalAlign="center"
        />
        <Select
          id="createAudienceInput"
          emptyMessage="No options"
          itemMode="static"
          label="Audience"
          labelPosition="top"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
          value="{{selectedInterstitial.value?.audience}}"
        >
          <Option id="33b51" label="Everyone" value="everyone" />
        </Select>
        <Spacer id="spacer32" />
        <NumberInput
          id="createPriorityInput"
          allowNull={true}
          currency="USD"
          inputTooltip="`Enter` to save, `Esc` to cancel"
          inputValue={0}
          label="Priority"
          labelCaption="0-100, interstitials with a higher number will be shown first."
          labelPosition="top"
          max="100"
          min="0"
          placeholder="Enter value"
          required={true}
          showSeparators={true}
          value="{{selectedInterstitial.value?.priority ?? 40}}"
        />
        <Spacer id="spacer33" />
        <Switch
          id="createPriorityOverrideSwitch"
          label="Priority Override"
          labelCaption="This will set this interstitial to the highest priority and shown first before any other interstitials. If multiple interstitials have the priority override set, they will be sorted in the order of their priority."
          labelWrap={true}
          value="{{!!selectedInterstitial.value?.priorityOverride}}"
        />
        <Spacer id="spacer34" />
        <Divider id="divider10" />
        <Spacer id="spacer35" />
        <Text
          id="createLayoutAndContentHeader"
          value="##### Layout & Content"
          verticalAlign="center"
        />
        <Text
          id="createLayoutAndContentDescription"
          style={{ ordered: [{ color: "secondary" }] }}
          value="Select the layout & content for your interstitial."
          verticalAlign="center"
        />
        <Spacer id="spacer36" />
        <TextInput
          id="createHeaderTextInput"
          label="Header Text"
          labelCaption="52 characters max"
          labelPosition="top"
          maxLength="52"
          placeholder="Enter value"
          value="{{selectedInterstitial.value?.data?.content?.header ?? ''}}"
        />
        <Spacer id="spacer38" />
        <FileInput
          id="createLayoutImageInput"
          accept="['png', 'jpg', 'jpeg']"
          iconBefore="bold/programming-browser-search"
          label="Image"
          labelCaption="Upload image in PNG, JPEG, or JPG format"
          labelPosition="top"
          placeholder="{{selectedInterstitial.value?.data?.content?.imageUrl ?? null}}"
          textBefore="Browse"
        />
        <Image
          id="createLayoutImageInputImage"
          heightType="fixed"
          horizontalAlign="center"
          src="{{selectedInterstitial.value?.data?.content?.imageUrl ?? null}}"
        />
        <Spacer id="spacer39" />
        <Divider id="divider11" />
        <Spacer id="spacer40" />
        <Text
          id="createButtonsHeader"
          value="##### Buttons"
          verticalAlign="center"
        />
        <Spacer id="spacer41" />
        <TextInput
          id="createButtonAffirmativeInput"
          disabled=""
          label="Button Affirmative"
          labelCaption="14 characters max"
          labelPosition="top"
          maxLength="14"
          minLength="1"
          placeholder="Enter value"
          value="{{selectedInterstitial?.value?.data?.content?.buttonAffirmative ?? ''}}"
        />
        <Spacer id="spacer42" />
        <TextInput
          id="createButtonNegativeInput"
          disabled=""
          label="Button Negative"
          labelCaption="14 characters max"
          labelPosition="top"
          maxLength="14"
          minLength="1"
          placeholder="Enter value"
          value="{{selectedInterstitial?.value?.data?.content?.buttonNegative ?? ''}}"
        />
        <Spacer id="spacer47" />
        <Divider id="divider12" />
        <Spacer id="spacer48" />
        <Text
          id="createMenuIconsHeader"
          value="##### Menu Icons"
          verticalAlign="center"
        />
        <Text
          id="createMenuIconsDescription"
          style={{ ordered: [{ color: "secondary" }] }}
          value="Set the appearance of the menu icon for your interstitial."
          verticalAlign="center"
        />
        <Spacer id="spacer49" />
        <Switch
          id="createDisplayInHudSwitch"
          label="Display in HUD"
          value="{{!!(selectedInterstitial.value?.data?.menuIcon?.isDisplayed)}}"
        />
        <Spacer id="spacer50" />
        <TextInput
          id="createHudLabelInput"
          disabled="{{!createDisplayInHudSwitch.value}}"
          hidden=""
          label="HUD Label"
          labelCaption="X characters max. To show no label, leave this field blank."
          labelPosition="top"
          placeholder="Enter value"
          value="{{selectedInterstitial.value?.data?.menuIcon?.label}}"
        />
        <Spacer id="spacer51" />
        <FileInput
          id="createMenuIconInput"
          accept="['png', 'jpg', 'jpeg']"
          disabled="{{!createDisplayInHudSwitch.value}}"
          iconBefore="bold/programming-browser-search"
          label="Icon"
          labelCaption="Upload image in PNG, JPEG, or JPG format"
          labelPosition="top"
          placeholder="{{selectedInterstitial.value?.data?.menuIcon?.imageUrl ?? null}}"
          required="{{!!createDisplayInHudSwitch.value && !selectedInterstitial.value?.data?.menuIcon?.imageUrl}}"
          textBefore="Browse"
        />
        <Image
          id="createMenuIconInputImage"
          heightType="fixed"
          horizontalAlign="center"
          src="{{selectedInterstitial.value?.data?.menuIcon?.imageUrl ?? null}}"
        />
        <Spacer id="spacer52" />
        <NumberInput
          id="createDisplayHourLimitInput"
          allowNull={true}
          currency="USD"
          inputTooltip="`Enter` to save, `Esc` to cancel"
          inputValue={0}
          label="Display Hour Limit"
          labelCaption="Independent of the interstitials end time, this determines how long the HUD icon should be displayed to the player."
          labelPosition="top"
          labelWrap={true}
          min="0"
          placeholder="Enter value"
          readOnly="{{!createDisplayInHudSwitch.value}}"
          showSeparators={true}
          showStepper={true}
          value="{{selectedInterstitial.value?.data?.menuIcon?.hourLimit ?? null}}"
        />
        <Spacer id="spacer53" />
        <Switch
          id="createShowAsCountdownTimerSwitch"
          disabled="{{!createDisplayInHudSwitch.value}}"
          label="Show as Countdown Timer"
          labelCaption="This value will default between whichever ends soonest between Interstitial End Time and Display Hour Limit."
          labelWrap={true}
          value="{{!!selectedInterstitial.value?.data?.menuIcon?.showAsCountdownTimer}}"
        />
        <Event
          event="submit"
          method="run"
          params={{
            ordered: [
              {
                src: "if (formType.value === 'create') {\n  saveDraft.trigger()\n} else {\n  updateDraft.trigger()\n}",
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </Form>
    </ModuleContainerWidget>
  </Frame>
</App>
