  return `
CALL non_spatial.sp_soil_sampling_upsert(
  out_id => ${obj.id === undefined ? "null" : obj.soil_sampling_id}::UUID,
  p_soil_sampling_round_id => ${obj.soil_sampling_round_id}::UUID,
  p_site_number => ${obj.site_number}::INTEGER,
  p_site_name => '${obj.site_name}'::TEXT,
  p_lat => ${obj.lat}::NUMERIC,
  p_lon => ${obj.lon}::NUMERIC,
  p_sample_taken_date => '${obj.sample_taken_date}'::DATE,
  p_paddock_use_as => '${obj.paddock_use_as}'::TEXT,
  p_paddock_use_as_other => '${obj.paddock_use_as_other}'::TEXT,
  p_cea => ${obj.cea}::INT,
  p_strata => ${obj.strata}::INT,
  p_property => '${obj.property}'::TEXT,
  p_note => '${obj.note == undefined ? '' : obj.note}'::TEXT,
  p_is_deleted => ${obj.is_deleted ?? false}::BOOLEAN,
  p_modified_by => '${obj.modified_by}'::UUID,
  p_history_context => 'YMKA Mobile - SamplingSiteAddEdit'::TEXT
)
`;