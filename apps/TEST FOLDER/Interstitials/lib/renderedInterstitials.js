// Combines interstitial and config data. Filters the results based on user selections

const interstitialsData = []
const interstitialConfigs = {{getConfigs.data}} || {}
const interstitialPage = {{getInterstitialsPage.data?.content}}

if (interstitialPage) {
  interstitialPage.forEach(interstiatial => {
    if (!interstiatial.config) {
      return
    }

    const interstitialConfig = interstitialConfigs[interstiatial.config.hash]

    interstitialsData.push({
      ...interstiatial,
      lastModified: `${moment.utc(interstiatial.updatedAt).format("YYYY-MM-DD H:mm")} UTC`,
      createdTime: `${moment.utc(interstiatial.createdAt).format("YYYY-MM-DD H:mm")} UTC`,
      ...(interstitialConfig || {})
    })
  })
}

return interstitialsData