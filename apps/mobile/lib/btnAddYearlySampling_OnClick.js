const newData = {
  cf_staff_as_sampler_ids: null,
  cf_staff_as_samplers_display: null,
  erf_id: varSelectedProject.value.erf_id,
  external_sampler_client_id: null,
  external_sampler_contact_id: null,
  forecast_date: null,
  forecast_date_calculated: null,
  forecast_date_override: null,
  id: null,
  last_possible_sampling_date: null,
  livestock_to_total_grazing_area_ratio: null,
  num_of_livestocks: null,
  num_of_mobs: null,
  num_of_paddocks: null,
  offline_job_id: null,
  paddock_to_mob_ratio: null,
  pending_update: false,
  project_id: varSelectedProject.value.project_id,
  project_manager: varSelectedProject.value.project_manager,
  project_name: varSelectedProject.value.project_name,
  project_state: varSelectedProject.value.project_state,
  project_status: varSelectedProject.value.project_status,
  reporting_period: null,
  round_name: null,
  sampling_median_date: null,
  sampling_median_date_calculated: null,
  sampling_median_date_override: null,
  sampling_scheduled_date: null,
  sampling_type: "type_yearly",
  sampling_type_display: "Yearly Sampling",
  status: "Forecasted",
  total_grazing_area: null,
  total_sampling: null,
  warning: "",
  year: null
};

console.log(newData);

await varSelectedSamplingRound.setValue(newData);
navigator.navigateTo('SamplingRoundAddEdit');