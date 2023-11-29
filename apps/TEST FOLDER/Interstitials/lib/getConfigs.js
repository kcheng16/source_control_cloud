// Creates a map of the interstitial configs by hash

const hashes = []

// filter interstitials without config values
getInterstitialsPage.data.content.forEach(interstitial => {
  if (interstitial.config?.hash && interstitial.config?.key) {
    hashes.push({
      configHash: interstitial.config.hash,
      configKey: interstitial.config.key
    })
  }
})

const latestConfigs = await Promise.all(
  hashes.map(({configHash, configKey}) => {  
    return getConfigHash.trigger({
      additionalScope: {
        configHash,
        configKey
      }
    }).then(data => data.config)
  })
)

return latestConfigs.reduce((a, b) => ({...a, [b.hash]: b}), {})