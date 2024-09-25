let getValues = (input) => {
  let values = input.split('\n').map(x => x.trim()).filter(x => x)
  return values.length > 0 ? values : undefined
}

return {
  opportunityId: {{opportunityModel.value.id}},
  assets:{
    headlines: getValues({{ headlinesTextArea.value}}),
    descriptions: getValues({{ descriptionsTextArea.value}}),
    forcekeys: getValues({{ forcekeysTextArea.value }})
  }
}