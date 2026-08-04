/*WITH yearly_data as (
  --Existing data from DB/pending update
  Select
    coalesce(tbl_offline.soil_sampling_id, tbl_online.soil_sampling_id) as soil_sampling_id,
    count(coalesce(tbl_offline.id, tbl_online.id)) as total_id
  FROM { get_soil_sampling_yearly_result.data }} tbl_online
    LEFT JOIN { localStorage.values.cf_job_queue.filter((x) => x?.entity?.name == 'soil_sampling_yearly_result_data' && x?.entity?.id != undefined && x?.status != 'FINISHED' && (x.readyToUpload == undefined || x.readyToUpload == true)).map((x) => { return {...x.payload, job_id: x.id, readyToUpload: x.readyToUpload} }) }} tbl_offline
      ON tbl_online.id = tbl_offline.id
  GROUP BY coalesce(tbl_offline.soil_sampling_id, tbl_online.soil_sampling_id)
  
  UNION
  
  --New data from local storage
  select
    COALESCE(soil_sampling_id, parent_id) as soil_sampling_id,
    count(id) as total_id
  FROM { localStorage.values.cf_job_queue.filter((x) => x?.entity?.name == 'soil_sampling_yearly_result_data' && x?.entity?.id == undefined && x?.status != 'FINISHED' && (x.readyToUpload == undefined || x.readyToUpload == true)).map((x) => {return {...x.payload, jobId: x.id, parent_id: x.operationDependency.jobId, readyToUpload: x.readyToUpload} }) }}
  GROUP BY COALESCE(soil_sampling_id, parent_id)
)
  */

--New data from local storage
SELECT union_table.id,
  union_table.soil_sampling_round_id,
  union_table.site_number,
  union_table.site_name,
  union_table.lat,
  union_table.lon,
  union_table.geom,
  union_table.note,
  union_table.paddock_use_as,
  union_table.paddock_use_as_other,
  CASE 
    WHEN union_table.paddock_use_as_other IS NOT NULL and union_table.paddock_use_as_other != '' THEN union_table.paddock_use_as_other
    ELSE lo_paddock_use_as.option_name
  END AS paddock_use_as_display,
  union_table.sample_taken_date,
  union_table.cea,
  union_table.strata,
  union_table.property,
  union_table.is_deleted,
  union_table.created_on,
  union_table.created_by,
  union_table.modified_on,
  union_table.modified_by,
  union_table.pending_update,
  union_table.offline_job_id
FROM (

  SELECT tbl.id as id,
    tbl.soil_sampling_round_id,
    tbl.site_number,
    tbl.site_name,
    tbl.latitude as lat,
    tbl.longitude as lon,
    NULL as geom,
    tbl.note,
    tbl.paddock_use_as,    
    tbl.paddock_use_as_other,   
    tbl.sample_taken_date,
    tbl.cea,
    tbl.strata,
    tbl.property,
    false as is_deleted,
    null as created_on,
    null as created_by,
    null as modified_on,
    null as modified_by,
    true as pending_update, --need to get data from soil_sampling_yearly_result as well.
    job_id as offline_job_id
    --,yearly_data.total_id as total_yearly_result
  FROM {{ localStorage.values.cf_job_queue.filter((x) => x?.entity?.name == 'soil_sampling' && x?.entity?.id == undefined && x?.status != 'FINISHED').map((x) => { return {...x.payload, job_id: x.id, dependency_job_id: x.operationDependency.jobId} }) }} tbl
    --LEFT JOIN yearly_data
      --ON yearly_data.soil_sampling_id = tbl.id
  WHERE ({{ varSelectedSamplingRound.value.id }} IS NOT NULL AND tbl.soil_sampling_round_id = {{ varSelectedSamplingRound.value.id }}) OR (
    ({{ varSelectedSamplingRound.value.id }} IS NULL AND tbl.dependency_job_id IS NOT NULL AND tbl.dependency_job_id in (
      SELECT local_sr.job_id
      FROM {{ localStorage.values.cf_job_queue.filter((x) => x?.entity?.name == 'soil_sampling_round' && x?.entity?.id == undefined).map((x) => { return {...x.payload, job_id: x.id} }) }} local_sr
      WHERE local_sr.project_id = {{ varSelectedSamplingRound.value.project_id  }} AND
          (
            {{varSelectedSamplingRound.value.sampling_type == 'type_yearly' }} AND COALESCE(local_sr.year, '') = COALESCE({{ varSelectedSamplingRound.value.year }}, '')
          )  or
          (
            {{varSelectedSamplingRound.value.sampling_type == 'type_official' }} AND COALESCE(local_sr.reporting_period, '') = COALESCE({{ varSelectedSamplingRound.value.reporting_period }}, '')
          )
    ))  
  )
  
  UNION
  
  --Existing data from DB/pending update
  SELECT coalesce(tbl_offline.id, tbl_online.id) as id,
    coalesce(tbl_offline.soil_sampling_round_id, tbl_online.soil_sampling_round_id) as soil_sampling_round_id,
    coalesce(tbl_offline.site_number, tbl_online.site_number) as site_number,
    coalesce(tbl_offline.site_name, tbl_online.site_name) as site_name,
    coalesce(tbl_offline.lat, tbl_online.lat) as lat,
    coalesce(tbl_offline.lon, tbl_online.lon) as lon,
    coalesce(tbl_offline.geom, tbl_online.geom) as geom,
    coalesce(tbl_offline.note, tbl_online.note) as note,
    coalesce(tbl_offline.paddock_use_as, tbl_online.paddock_use_as) as paddock_use_as,    
    coalesce(tbl_offline.paddock_use_as_other, tbl_online.paddock_use_as_other) as paddock_use_as_other,   
    coalesce(tbl_offline.sample_taken_date, tbl_online.sample_taken_date) as sample_taken_date, 
    coalesce(tbl_offline.cea, tbl_online.cea) as cea,
    coalesce(tbl_offline.strata, tbl_online.strata) as strata,
    coalesce(tbl_offline.property, tbl_online.property) as property,
    coalesce(tbl_offline.is_deleted, tbl_online.is_deleted) as is_deleted,
    coalesce(tbl_offline.created_on, tbl_online.created_on) as created_on,
    coalesce(tbl_offline.created_by, tbl_online.created_by) as created_by,
    coalesce(tbl_offline.modified_on, tbl_online.modified_on) as modified_on,
    coalesce(tbl_offline.modified_by, tbl_online.modified_by) as modified_by,
    (tbl_offline.id IS NOT NULL) as pending_update,
    (tbl_offline.job_id) as offline_job_id
    --,yearly_data.total_id as total_yearly_result
  FROM {{ get_soil_sampling_data.data }} tbl_online
    LEFT JOIN {{ localStorage.values.cf_job_queue.filter((x) => x?.entity?.name == 'soil_sampling' && x?.entity?.id != undefined && x?.status != 'FINISHED').map((x) => { return {...x.payload, job_id: x.id} }) }} tbl_offline
      ON tbl_online.id = tbl_offline.id
    --LEFT JOIN yearly_data
      --ON yearly_data.soil_sampling_id = coalesce(tbl_offline.id, tbl_online.id)
  WHERE soil_sampling_round_id = {{ varSelectedSamplingRound.value.id }}
) union_table
  LEFT JOIN {{ get_list_options.data.filter((x) => x.list_key == 'soil_paddock_use_as') }} lo_paddock_use_as
    ON union_table.paddock_use_as = lo_paddock_use_as.option_key