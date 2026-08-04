let newData = {{ trnUpdatedSoilRoundData.value }};
let currData = {{ varSelectedSamplingRound.value }};
let isDirty = false;

if (newData.cf_staff_as_sampler_ids.length > 0)
  newData.cf_staff_as_sampler_ids = newData.cf_staff_as_sampler_ids.sort((x, y) => x - y);

if (currData.cf_staff_as_sampler_ids?.length > 0)
  currData.cf_staff_as_sampler_ids = currData.cf_staff_as_sampler_ids.sort((x, y) => x - y);

if ( 
      (JSON.stringify(newData.cf_staff_as_sampler_ids) != JSON.stringify((currData.cf_staff_as_sampler_ids || []))) ||
      (newData.sampling_scheduled_date != currData.sampling_scheduled_date) ||
      (newData.forecast_date_override != currData.forecast_date_override) ||
      (newData.num_of_paddocks != currData.num_of_paddocks) ||
      (newData.num_of_mobs != currData.num_of_mobs) ||
      (newData.num_of_livestocks != currData.num_of_livestocks) ||
      (newData.total_grazing_area != currData.total_grazing_area) ||
      (currData.sampling_type == 'type_yearly' && currData.year == undefined) ||
      (newData.note != (currData.note ?? ''))
  )
  isDirty = true;

return isDirty;