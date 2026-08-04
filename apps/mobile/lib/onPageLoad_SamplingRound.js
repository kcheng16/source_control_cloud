if (varSelectedSamplingRound.value.sampling_type == 'type_yearly' && varSelectedSamplingRound.value.year == undefined)
{
  
}
else
{

//Check online or not
//If online, retrieved the queries used
//Then re-assigned the selected variable

//if (retoolContext.networkStatus == 'CONNECTED')
//{

  await get_soil_round_and_project_data.trigger();
  await get_soil_sampling_data.trigger();
  await get_soil_sampling_yearly_result.trigger();

  //let samplingRound = get_soil_round_and_project_data.data.find((x) => (varSelectedSamplingRound.value.sampling_type == 'type_official' && x.reporting_period == varSelectedSamplingRound.value.reporting_period) || (varSelectedSamplingRound.value.sampling_type == 'type_yearly' && x.year == varSelectedSamplingRound.value.year));
  
  //await varSelectedSamplingRound.setValue(samplingRound);
//}

  await varTempSoilRoundData.setValue(varSelectedSamplingRound.value);
  await setSelectedSoilSamplingRound.trigger();

  await sampling_site_display_union_tables.trigger();
  await sampling_site_display.trigger();
}