const formData = createInterstitialForm.data
const layout = 'standard'

const menuIcon = {
  label: formData.createHudLabelInput,
  isDisplayed: !!formData.createDisplayInHudSwitch,
  showAsCountdownTimer: !!formData.createShowAsCountdownTimerSwitch,
  imageUrl: selectedInterstitial.value.data.menuIcon.imageUrl
}

const content = {
  header: formData.createHeaderTextInput,
  imageUrl: selectedInterstitial.value.data.content.imageUrl,
  artImageUrl: selectedInterstitial.value.data.content.artImageUrl,
  description: formData.createDescriptionTextArea
}

if (formData.createDisplayHourLimitInput !== null) {
  menuIcon.hourLimit = formData.createDisplayHourLimitInput
}

const hasArtImageUpload = createArtImageInput.files[0] && createArtImageInput.value[0]
const hasLayoutImageUpload = createLayoutImageInput.files[0] && createLayoutImageInput.value[0]
const hasMenuIconImageUpload = formData.createDisplayInHudSwitch && createMenuIconInput.files[0] && createMenuIconInput.value[0]

// Upload images if there are selected files
if (hasArtImageUpload || hasLayoutImageUpload || hasMenuIconImageUpload) {
  const imageFileMap = {}
  
  if (hasArtImageUpload) {
    imageFileMap.artImage = { ...createArtImageInput.files[0], "data":  createArtImageInput.value[0] }
  }

  if (hasLayoutImageUpload) {
    imageFileMap.layoutImage = { ...createLayoutImageInput.files[0], "data":  createLayoutImageInput.value[0] }
  }
  
  if (hasMenuIconImageUpload) {
    imageFileMap.menuIconImage = { ...createMenuIconInput.files[0], "data":  createMenuIconInput.value[0] }
  }

  // Kick off uploads in parallel and return result map
  const { artImage, layoutImage, menuIconImage } = await uploadImages.trigger({
    additionalScope: {
      imageFileMap
    }
  })

  // Return if art image upload failed. Otherwise set the new URL
  if (hasArtImageUpload) {
    if (!artImage?.image?.url) {
      setErrorMessage.trigger({
        additionalScope: {
          errorValue: 'An error occurred when uploading art image'
        }
      })

      return
    }
  
    content.artImageUrl = artImage.image.url
  }

  // Return if layout image upload failed. Otherwise set the new URL
  if (hasLayoutImageUpload) {
    if (!layoutImage?.image?.url) {
      setErrorMessage.trigger({
        additionalScope: {
          errorValue: 'An error occurred when uploading layout image'
        }
      })

      return
    }
  
    content.imageUrl = layoutImage.image.url
  }

  // Return if menu icon upload failed. Otherwise set the new URL
  if (hasMenuIconImageUpload) {
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

const updateConfigResponse = await postConfig.trigger({
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
  draftPlayers: selectedInterstitial.value.draftPlayers,
  testPlayers: selectedInterstitial.value.testPlayers,
  startTime: null,
  endTime: null,
  config: {
    schemaName: "cen-interstitial",
    schemaVersion: 1,
    key: updateConfigResponse.config.key,
    hash: updateConfigResponse.config.hash
  }
}

if (formData.createStartTimeSwitch && formData.createStartTimeInput) {
  interstitialContent.startTime = moment(formData.createStartTimeInput).valueOf()
}

if (formData.createEndTimeSwitch && formData.createEndTimeInput) {
  interstitialContent.endTime = moment(formData.createEndTimeInput).valueOf()
}

await patchInterstitial.trigger({
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
    getSelectedInterstitial.trigger()
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