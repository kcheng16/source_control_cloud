let samplingSite = selectedSite;
let yearlyResult = undefined;

if (samplingSite == undefined)
{
  samplingSite = {
    id: undefined,
    soil_sampling_round_id: varSelectedSamplingRound.value.id,
    site_number: 0,
    site_name: undefined,
    sample_taken_date: undefined,
    latitude: undefined,
    longitude: undefined,
    note: undefined,
    paddock_use_as: undefined,
    paddock_use_as_other: undefined,
    cea: undefined,
    strata: undefined,
    property: undefined
  };

  varSelectedSamplingSite.setValue(samplingSite);
  varSelectedSamplingSiteResult.setValue(yearlyResult);
}
else
{
  varSelectedSamplingSite.setValue(samplingSite);
  
  if (varSelectedSamplingRound.value.sampling_type == 'type_yearly')
  {
    yearlyResult = await get_yearly_sampling_result.trigger();
    
    varSelectedSamplingSiteResult.setValue(yearlyResult[0]);
  }
    
}



navigator.navigateTo('SamplingSiteAddEdit');