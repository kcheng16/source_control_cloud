// Update the viewers of the selected interstitial

const getUniqueIdsFromString = idString => Array.from(new Set(idString.replace(/\s/g, '').split(',').filter(id => id)))
const interstitialName = selectedInterstitialName.value

const interstitialContent = await getInterstitial.trigger({
  additionalScope: {
    interstitialName: interstitialName
  }
}).then(res => res.content)

interstitialContent.draftPlayers = getUniqueIdsFromString(viewersDraftPlayersTextArea.value)
interstitialContent.testPlayers = getUniqueIdsFromString(viewersTestPlayersTextArea.value)

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