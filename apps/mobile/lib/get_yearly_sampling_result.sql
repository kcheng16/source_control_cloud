--Existing data from DB/pending update
Select
  coalesce(tbl_offline.id, tbl_online.id) as id,
  coalesce(tbl_offline.soil_sampling_id, tbl_online.soil_sampling_id) as soil_sampling_id,
  coalesce(tbl_offline.groundcover_bare_ground_count, tbl_online.groundcover_bare_ground_count) as groundcover_bare_ground_count,
  coalesce(tbl_offline.groundcover_grass_count, tbl_online.groundcover_grass_count) as groundcover_grass_count,
  coalesce(tbl_offline.groundcover_legume_count, tbl_online.groundcover_legume_count) as groundcover_legume_count,
  coalesce(tbl_offline.groundcover_forb_count, tbl_online.groundcover_forb_count) as groundcover_forb_count,
  coalesce(tbl_offline.groundcover_other_count, tbl_online.groundcover_other_count) as groundcover_other_count,
  coalesce(tbl_offline.plant_diversity_forb_count, tbl_online.plant_diversity_forb_count) as plant_diversity_forb_count,
  coalesce(tbl_offline.plant_diversity_grass_count, tbl_online.plant_diversity_grass_count) as plant_diversity_grass_count,
  coalesce(tbl_offline.plant_diversity_legume_count, tbl_online.plant_diversity_legume_count) as plant_diversity_legume_count,
  coalesce(tbl_offline.plant_diversity_other_count, tbl_online.plant_diversity_other_count) as plant_diversity_other_count,
  coalesce(tbl_offline.water_infiltration_sample_1, tbl_online.water_infiltration_sample_1) as water_infiltration_sample_1,
  coalesce(tbl_offline.water_infiltration_sample_2, tbl_online.water_infiltration_sample_2) as water_infiltration_sample_2,
  coalesce(tbl_offline.water_infiltration_sample_3, tbl_online.water_infiltration_sample_3) as water_infiltration_sample_3,
  coalesce(tbl_offline.aggregate_stability_topsoil_slaking, tbl_online.aggregate_stability_topsoil_slaking) as aggregate_stability_topsoil_slaking,
  coalesce(tbl_offline.aggregate_stability_topsoil_dispersion, tbl_online.aggregate_stability_topsoil_dispersion) as aggregate_stability_topsoil_dispersion,
  coalesce(tbl_offline.aggregate_stability_subsoil_slaking, tbl_online.aggregate_stability_subsoil_slaking) as aggregate_stability_subsoil_slaking,
  coalesce(tbl_offline.aggregate_stability_subsoil_dispersion, tbl_online.aggregate_stability_subsoil_dispersion) as aggregate_stability_subsoil_dispersion,
  coalesce(tbl_offline.topsoil_depth_in_cm, tbl_online.topsoil_depth_in_cm) as topsoil_depth_in_cm,
  coalesce(tbl_offline.soil_organisms_diversity_count, tbl_online.soil_organisms_diversity_count) as soil_organisms_diversity_count,
  coalesce(tbl_offline.soil_organisms_earthworm_count, tbl_online.soil_organisms_earthworm_count) as soil_organisms_earthworm_count,
  coalesce(tbl_offline.is_legume_nodules_present, tbl_online.is_legume_nodules_present) as is_legume_nodules_present,
  coalesce(tbl_offline.is_legume_nodules_red, tbl_online.is_legume_nodules_red) as is_legume_nodules_red,
  coalesce(tbl_offline.humus_smell_level_at_5cm, tbl_online.humus_smell_level_at_5cm) as humus_smell_level_at_5cm,
  coalesce(tbl_offline.site_rest_days_per_year, tbl_online.site_rest_days_per_year) as site_rest_days_per_year,
  coalesce(tbl_offline.site_graze_days_per_year, tbl_online.site_graze_days_per_year) as site_graze_days_per_year,
  coalesce(tbl_offline.note, tbl_online.note) as note,
  coalesce(tbl_offline.is_deleted, tbl_online.is_deleted) as is_deleted,
  coalesce(tbl_offline.created_on, tbl_online.created_on) as created_on,
  coalesce(tbl_offline.created_by, tbl_online.created_by) as created_by,
  coalesce(tbl_offline.modified_on, tbl_online.modified_on) as modified_on,
  coalesce(tbl_offline.modified_by, tbl_online.modified_by) as modified_by,
  (tbl_offline.id IS NOT NULL) as pending_update,
  tbl_offline.job_id as offline_job_id,
  tbl_offline.readyToUpload as ready_to_upload
FROM {{ get_soil_sampling_yearly_result.data }} tbl_online
  LEFT JOIN {{ localStorage.values.cf_job_queue.filter((x) => x?.entity?.name == 'soil_sampling_yearly_result_data' && x?.entity?.id != undefined && x?.status != 'FINISHED').map((x) => { return {...x.payload, job_id: x.id, readyToUpload: x.readyToUpload} }) }} tbl_offline
    ON tbl_online.id = tbl_offline.id
WHERE soil_sampling_id = {{ varSelectedSamplingSite.value.id }}

UNION

--New data from local storage
select
  id,
  soil_sampling_id,
  groundcover_bare_ground_count,
  groundcover_grass_count,
  groundcover_legume_count,
  groundcover_forb_count,
  groundcover_other_count,
  plant_diversity_forb_count,
  plant_diversity_grass_count,
  plant_diversity_legume_count,
  plant_diversity_other_count,
  water_infiltration_sample_1,
  water_infiltration_sample_2,
  water_infiltration_sample_3,
  aggregate_stability_topsoil_slaking,
  aggregate_stability_topsoil_dispersion,
  aggregate_stability_subsoil_slaking,
  aggregate_stability_subsoil_dispersion,
  topsoil_depth_in_cm,
  soil_organisms_diversity_count,
  soil_organisms_earthworm_count,
  is_legume_nodules_present,
  is_legume_nodules_red,
  humus_smell_level_at_5cm,
  site_rest_days_per_year,
  site_graze_days_per_year,
  note,
  is_deleted,
  created_on,
  created_by,
  modified_on,
  modified_by,
  true as pending_update, --need to get data from soil_sampling_yearly_result as well.
  jobId as offline_job_id,
  readyToUpload as ready_to_upload
FROM {{ localStorage.values.cf_job_queue.filter((x) => x?.entity?.name == 'soil_sampling_yearly_result_data' && x?.entity?.id == undefined && x?.status != 'FINISHED').map((x) => {return {...x.payload, jobId: x.id, parent_id: x.operationDependency.jobId, readyToUpload: x.readyToUpload} }) }}
WHERE (soil_sampling_id = {{ varSelectedSamplingSite.value.id }} and {{ varSelectedSamplingSite.value.id != undefined }}) OR
  (
    {{ varSelectedSamplingSite.value.id == undefined }} AND
    parent_id = {{ varSelectedSamplingSite.value.offline_job_id }}
  )