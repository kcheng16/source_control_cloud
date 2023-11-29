// Update the state of the selected interstitial. newState is passed in via additionalScope

const interstitialName = selectedInterstitial.value.name

const interstitialContent = await getInterstitial.trigger({
  additionalScope: {
    interstitialName: interstitialName
  }
}).then(res => res.content)

interstitialContent.state = newState // passed via additionalScope

patchInterstitial.trigger({
  additionalScope: {
    interstitialName,
    interstitialContent
  },
  onSuccess: () => {
    getInterstitialsPage.trigger()
    getSelectedInterstitial.trigger()
  },
  onFailure: (error) => {
    let errorMessage = "An error has occurred"

    try {
      const errorData = JSON.parse(error)

      if (errorData?.data?.data?.message) {
        errorMessage = errorData.data.data.message
      }
    } catch {}

    errorMessage.setValue(errorMessage)
  }
})