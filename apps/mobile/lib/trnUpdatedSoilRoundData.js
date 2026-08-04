return {
  sampling_scheduled_date: {{dtScheduledDate.value == '' ? undefined : dtScheduledDate.value}} ,
  cf_staff_as_sampler_ids: {{ selCFAsSamplers.value}} ,
  cf_staff_as_samplers_display: {{get_staffs.data.filter((x) => selCFAsSamplers.value.includes(x.id)).map((x) => x.name) }} ,
  num_of_paddocks: {{ txtNumOfPaddock.value}} ,
  num_of_mobs: {{ txtNumOfMobs.value}} ,
  num_of_livestocks: {{ txtNumOfLivestock.value}} ,
  total_grazing_area: {{ txtTotalGrazingArea.value}},
  forecast_date_override: {{ dtForecastDate.value == '' ? undefined : dtForecastDate.value }},
  note: {{ txtNote_SamplingRound.value }}
}