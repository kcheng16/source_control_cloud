SELECT coalesce(tbl_offline.cf_staff_as_sampler_ids, tbl_online.cf_staff_as_sampler_ids) as cf_staff_as_sampler_ids,
  coalesce(tbl_offline.cf_staff_as_samplers_display, tbl_online.cf_staff_as_samplers_display) as cf_staff_as_samplers_display,
  coalesce(tbl_offline.erf_id, tbl_online.erf_id) as erf_id,
  coalesce(tbl_offline.external_sampler_client_id, tbl_online.external_sampler_client_id) as external_sampler_client_id,
  coalesce(tbl_offline.external_sampler_contact_id, tbl_online.external_sampler_contact_id) as external_sampler_contact_id,
  coalesce(tbl_offline.forecast_date, tbl_online.forecast_date) as forecast_date,
  coalesce(tbl_offline.forecast_date_calculated, tbl_online.forecast_date_calculated) as forecast_date_calculated,
  coalesce(tbl_offline.forecast_date_override, tbl_online.forecast_date_override) as forecast_date_override,
  coalesce(tbl_offline.id, tbl_online.id) as id,
  coalesce(tbl_offline.last_possible_sampling_date, tbl_online.last_possible_sampling_date) as last_possible_sampling_date,
  coalesce(tbl_offline.livestock_to_total_grazing_area_ratio, tbl_online.livestock_to_total_grazing_area_ratio) as livestock_to_total_grazing_area_ratio,
  coalesce(tbl_offline.num_of_livestocks, tbl_online.num_of_livestocks) as num_of_livestocks,
  coalesce(tbl_offline.num_of_mobs, tbl_online.num_of_mobs) as num_of_mobs,
  coalesce(tbl_offline.num_of_paddocks, tbl_online.num_of_paddocks) as num_of_paddocks,
  coalesce(tbl_offline.paddock_to_mob_ratio, tbl_online.paddock_to_mob_ratio) as paddock_to_mob_ratio,
  coalesce(tbl_offline.project_id, tbl_online.project_id) as project_id,
  coalesce(tbl_offline.project_manager, tbl_online.project_manager) as project_manager,
  coalesce(tbl_offline.project_name, tbl_online.project_name) as project_name,
  coalesce(tbl_offline.project_state, tbl_online.project_state) as project_state,
  coalesce(tbl_offline.project_status, tbl_online.project_status) as project_status,
  coalesce(tbl_offline.reporting_period, tbl_online.reporting_period) as reporting_period,
  coalesce(tbl_offline.round_name, tbl_online.round_name) as round_name,
  coalesce(tbl_offline.sampling_median_date, tbl_online.sampling_median_date) as sampling_median_date,
  coalesce(tbl_offline.sampling_median_date_calculated, tbl_online.sampling_median_date_calculated) as sampling_median_date_calculated,
  coalesce(tbl_offline.sampling_median_date_override, tbl_online.sampling_median_date_override) as sampling_median_date_override,
  coalesce(tbl_offline.sampling_scheduled_date, tbl_online.sampling_scheduled_date) as sampling_scheduled_date,
  coalesce(tbl_offline.sampling_type, tbl_online.sampling_type) as sampling_type,
  coalesce(tbl_offline.sampling_type_display, tbl_online.sampling_type_display) as sampling_type_display,
  coalesce(tbl_offline.status, tbl_online.status) as status,
  coalesce(tbl_offline.total_grazing_area, tbl_online.total_grazing_area) as total_grazing_area,
  coalesce(tbl_offline.total_sampling, tbl_online.total_sampling) as total_sampling,
  coalesce(tbl_offline.warning, tbl_online.warning) as warning,
  coalesce(tbl_offline.year, tbl_online.year) as year,
  (tbl_offline.job_id IS NOT NULL) as pending_update,
  (tbl_offline.job_id) as offline_job_id 
FROM {{ get_soil_round_and_project_data.data }} tbl_online
  LEFT JOIN {{ localStorage.values.cf_job_queue.filter((x) => x?.entity?.name == 'soil_sampling_round' && x?.status != 'FINISHED').map((x) => { return {...x.payload, job_id: x.id} }) }} tbl_offline
    ON tbl_online.project_id = tbl_offline.project_id AND
        (
          --(tbl_online.id IS NOT NULL AND tbl_online.id = tbl_offline.id) OR
          (--tbl_online.id IS NULL AND 
            (
              tbl_online.sampling_type = 'type_yearly' AND tbl_online.year = tbl_offline.year
            )  or
            (
              tbl_online.sampling_type = 'type_official' AND tbl_online.reporting_period = tbl_offline.reporting_period
            )
          )
        )
WHERE project_id = {{ varSelectedProject.value.project_id }} AND
  (
    --({varTempSoilRoundData.value.id}} IS NOT NULL AND COALESCE(id, '') = COALESCE({ varTempSoilRoundData.value.id }}, '')) OR
    --({varTempSoilRoundData.value.id }} IS NULL AND 
      (
        {{varTempSoilRoundData.value.sampling_type == 'type_yearly' }} AND COALESCE(year, '') = COALESCE({{ varTempSoilRoundData.value.year }}, '')
      )  or
      (
        {{varTempSoilRoundData.value.sampling_type == 'type_official' }} AND COALESCE(reporting_period, '') = COALESCE({{ varTempSoilRoundData.value.reporting_period }}, '')
      )
    --)
  )