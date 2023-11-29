// Ends interstitial by changing the endTime to now and the startTime to (endTime - 10000)

const interstitialName = selectedInterstitial.value.name

const interstitialContent = await getInterstitial.trigger({
  additionalScope: {
    interstitialName: interstitialName
  }
}).then(res => res.content)

interstitialContent.endTime = moment.utc().valueOf()
interstitialContent.startTime = interstitialContent.endTime - 10000

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