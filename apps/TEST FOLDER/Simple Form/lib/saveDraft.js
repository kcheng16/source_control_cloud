const formData = createInterstitialForm.data
const layout = 'simple'

const menuIcon = {
  label: formData.createHudLabelInput,
  isDisplayed: !!formData.createDisplayInHudSwitch,
  showAsCountdownTimer: !!formData.createShowAsCountdownTimerSwitch,
}

if (formData.createDisplayHourLimitInput !== null) {
  menuIcon.hourLimit = formData.createDisplayHourLimitInput
}

const content = {
  header: formData.createHeaderTextInput,
}

const imageFileMap = {
  layoutImage: { ...createLayoutImageInput.files[0], "data":  createLayoutImageInput.value[0] }
}

if (formData.createDisplayInHudSwitch) {
  imageFileMap.menuIconImage = { ...createMenuIconInput.files[0], "data":  createMenuIconInput.value[0] }
}

// Kick off uploads in parallel and return result map
const { layoutImage, menuIconImage } = await uploadImages.trigger({
  additionalScope: {
    imageFileMap
  }
})

if (!layoutImage?.image?.url) {
  setErrorMessage.trigger({
    additionalScope: {
      errorValue: 'An error occurred when uploading layout image'
    }
  })

  return
}

content.imageUrl = layoutImage.image.url

if (formData.createDisplayInHudSwitch) {
  if (!menuIconImage?.image?.url) {
    setErrorMessage.trigger({
      additionalScope: {
        errorValue: 'An error occurred when uploading menu icon image'
      }
    })

    return
  }

  menuIcon.imageUrl = menuIconImage.image.url
}

if (formData.createButton1SegmentedControl) {
  content.button1 = {
    buttonType: formData.createButton1SegmentedControl,
    label: formData.createButton1LabelInput
  }

  if (formData.createButton1SegmentedControl === 'link') {
    content.button1.trigger = formData.createButton1TriggerInput
  }
}

if (formData.createButton2SegmentedControl) {
  content.button2 = {
    buttonType: formData.createButton2SegmentedControl,
    label: formData.createButton2LabelInput
  }

  if (formData.createButton2SegmentedControl === 'link') {
    content.button2.trigger = formData.createButton2TriggerInput
  }
}

const configData = {
  menuIcon,
  layout,
  content
}

const createConfigResponse = await postConfig.trigger({
  additionalScope: {
    configData,
    configKey: interstitialName.value
  }
})

const interstitialContent = {
  name: interstitialName.value,
  state: "draft",
  paused: false,
  priority: formData.createPriorityInput,
  priorityOverride: !!formData.createPriorityOverrideSwitch,
  audience: formData.createAudienceInput,
  draftPlayers: [],
  testPlayers: [],
  startTime: null,
  endTime: null,
  config: {
    schemaName: "cen-interstitial",
    schemaVersion: 1,
    key: createConfigResponse.config.key,
    hash: createConfigResponse.config.hash
  }
}

if (formData.createStartTimeSwitch && formData.createStartTimeInput) {
  interstitialContent.startTime = moment(formData.createStartTimeInput).valueOf()
}

if (formData.createEndTimeSwitch && formData.createEndTimeInput) {
  interstitialContent.endTime = moment(formData.createEndTimeInput).valueOf()
}

await putInterstitial.trigger({
  additionalScope: {
    interstitialContent,
    interstitialName: interstitialName.value
  },
  onSuccess: () => {
    setErrorMessage.trigger({
      additionalScope: {
        errorValue: null
      }
    })
    getInterstitialsPage.trigger()
    hideCreateDrawerFrame.trigger()
    createInterstitialForm.clear()
    setSelectedInterstitialName.trigger({
      additionalScope: {
        interstitialName: interstitialName.value
       }
    })
    getSelectedInterstitial.trigger()
    showViewDrawerFrame.trigger()
  },
  onFailure: (error) => {
    let errorMessageStr = "An error has occurred"

    try {
      const errorData = JSON.parse(error)

      if (errorData?.data?.data?.message) {
        errorMessageStr = errorData.data.data.message
      }
    } catch {}

    setErrorMessage.trigger({
      additionalScope: {
        errorValue: errorMessageStr
      }
    })
  }
})