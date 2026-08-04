CALL non_spatial.sp_soil_sampling_upsert(
  out_id => {{ trnSiteData.value?.id == undefined ? null :  trnSiteData.value?.soil_sampling_id}}::UUID ,
  p_soil_sampling_round_id => {{ trnSiteData.value?.soil_sampling_round_id}}::UUID ,
  p_site_number => {{ trnSiteData.value?.site_number}}::INTEGER ,
  p_site_name => {{ trnSiteData.value?.site_name }}::TEXT,
  p_lat => {{ trnSiteData.value?.latitude }}::NUMERIC,
  p_lon => {{ trnSiteData.value?.longitude }}::NUMERIC,
  p_sample_taken_date => {{ trnSiteData.value?.sample_taken_date}} ::DATE,
  p_paddock_use_as => {{ trnSiteData.value?.paddock_use_as }}::TEXT,
  p_paddock_use_as_other => {{ trnSiteData.value?.paddock_use_as_other }}::TEXT,
  p_cea => {{ trnSiteData.value?.cea }}::INT,
  p_strata => {{ trnSiteData.value?.strata }}::INT,
  p_property => {{ trnSiteData.value?.property }}::TEXT,
  p_note => {{ trnSiteData.value?.note}} ::TEXT,
  p_is_deleted => {{ false }}::BOOLEAN,
  p_modified_by => {{ get_my_info.data?.id}} ::UUID,
  p_history_context => 'YMKA Mobile - SamplingSiteAddEdit'::TEXT
)