if (trnIsValid_SamplingRound.value.length > 0)
{
  throw new Error(trnIsValid_SamplingRound.value.join('\n'));
}
else
{  
  //Update varSelectedSoilSamplingRound
  let newData = trnUpdatedSoilRoundData.value;
  let currData = varSelectedSamplingRound.value;
  currData.cf_staff_as_sampler_ids = newData.cf_staff_as_sampler_ids;
  currData.cf_staff_as_samplers_display = newData.cf_staff_as_samplers_display;
  currData.sampling_scheduled_date = newData.sampling_scheduled_date;
  currData.forecast_date_override = newData.forecast_date_override;
  currData.forecast_date = currData.forecast_date_override == undefined ? currData.forecast_date_calculated : currData.forecast_date_override;
  currData.num_of_mobs = newData.num_of_mobs;
  currData.num_of_livestocks = newData.num_of_livestocks;
  currData.num_of_paddocks = newData.num_of_paddocks;
  currData.total_grazing_area = newData.total_grazing_area;
  currData.note = newData.note;

  if (currData.year == undefined && currData.sampling_type == 'type_yearly')
    currData.year = txtYear.value;
  
  await varSelectedSamplingRound.setValue(currData);
  
  //Save to local storage
  let offlineJobId = await saveSamplingRoundData.trigger();
  currData.offline_job_id = offlineJobId;
  
  await varSelectedSamplingRound.setValue(currData);
}