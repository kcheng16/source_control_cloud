const samplingData = {{ get_soil_sampling_data.data ?? [] }};
const currSites = {{ sampling_site_display.data ?? [] }};
const currRound = {{ varSelectedSamplingRound.value }};

if (currRound.sampling_type == 'type_yearly' && samplingData.length > 0 && currSites.length == 0)
{
  const lastYearRoundData = {{  get_soil_round_and_project_data.data.find((x) => x.sampling_type == 'type_yearly' && x.year == varSelectedSamplingRound.value.year - 1 && x.project_id == varSelectedSamplingRound.value.project_id)}};
  const samplingSites = {{ get_soil_sampling_data.data}};
  const lastYearSamplingSites = samplingSites.filter((x) => x.soil_sampling_round_id == (lastYearRoundData?.id));

  if (lastYearSamplingSites.length > 0)
    return true;
  else
    return false;
}
  
else
  return false;
