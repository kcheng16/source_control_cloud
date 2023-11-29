const interstitialName = selectedInterstitialName.value

const interstitialData = await getInterstitial.trigger({
  additionalScope: {
    interstitialName: interstitialName
  }
})

const configData = await getConfigHash.trigger({
  additionalScope: {
    configKey: interstitialData.content.config.key,
    configHash: interstitialData.content.config.hash
  }
})

return {
  ...configData.config,
  ...interstitialData.content,
  lastModified: `${moment.utc(interstitialData.content.updatedAt).format("YYYY-MM-DD H:mm")} UTC`,
  createdTime: `${moment.utc(interstitialData.content.createdAt).format("YYYY-MM-DD H:mm")} UTC`,
}