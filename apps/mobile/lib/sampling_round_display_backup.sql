SELECT 
  CASE
    WHEN tbl_online.sampling_type = 'type_yearly' THEN 'Yearly Sampling'
    ELSE 'Official Sampling'
  END as title,    
  CASE
    WHEN tbl_online.sampling_type = 'type_yearly' then year
    ELSE CONCAT(tbl_online.round_name, ' - RP ', tbl_online.reporting_period)
  END as body,
  CONCAT(
    tbl_online.status,
    ' - ',
    CASE
      WHEN tbl_online.status = 'Complete' THEN tbl_online.sampling_median_date
      WHEN tbl_online.status = 'Forecasted' THEN tbl_online.forecast_date
      ELSE tbl_online.sampling_scheduled_date
    END
  ) as caption,
  tbl_online.id as soil_sampling_round_id,
  tbl_online.project_id,
  tbl_online.year,
  tbl_online.reporting_period,
  tbl_online.sampling_type,
  tbl_online.round_name,
  (tbl_offline.job_id is NOT NULL) as pending_update
from {{ get_soil_round_and_project_data.data }} tbl_online
  LEFT JOIN {{ localStorage.values.cf_job_queue.filter((x) => x?.entity?.name == 'soil_sampling_round' && x?.status != 'FINISHED').map((x) => { return {...x.payload, job_id: x.id} }) }} tbl_offline
    ON tbl_online.project_id = tbl_offline.project_id AND
        (
          (tbl_online.id IS NOT NULL AND tbl_online.id = tbl_offline.id) OR
          (tbl_online.id IS NULL AND 
            (
              tbl_online.sampling_type = 'type_yearly' AND tbl_online.year = tbl_offline.year
            )  or
            (
              tbl_online.sampling_type = 'type_official' AND tbl_online.reporting_period = tbl_offline.reporting_period
            )
          )
        )
where tbl_online.project_id = {{ varSelectedProject.value.project_id }}
order by tbl_online.sampling_median_date, tbl_online.sampling_scheduled_date, tbl_online.forecast_date