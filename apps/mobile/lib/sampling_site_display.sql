
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
FROM {{ sampling_site_display_union_tables.data }} union_table
  LEFT JOIN {{ get_list_options.data.filter((x) => x.list_key == 'soil_paddock_use_as') }} lo_paddock_use_as
    ON union_table.paddock_use_as = lo_paddock_use_as.option_key