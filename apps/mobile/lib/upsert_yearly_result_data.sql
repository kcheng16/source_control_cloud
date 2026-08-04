CALL non_spatial.sp_soil_sampling_yearly_result_data_upsert(
    out_id                                 => {{ trnYearlyResultData.value.id }}::UUID,
    p_soil_sampling_id                     => {{ trnYearlyResultData.value.soil_sampling_id }}::UUID,

    p_groundcover_bare_ground_count        => {{ trnYearlyResultData.value.groundcover_bare_ground_count }}::INT,
    p_groundcover_grass_count              => {{ trnYearlyResultData.value.groundcover_grass_count }}::INT,
    p_groundcover_legume_count             => {{ trnYearlyResultData.value.groundcover_legume_count }}::INT,
    p_groundcover_forb_count               => {{ trnYearlyResultData.value.groundcover_forb_count }}::INT,
    p_groundcover_other_count              => {{ trnYearlyResultData.value.groundcover_other_count }}::INT,

    p_plant_diversity_forb_count           => {{ trnYearlyResultData.value.plant_diversity_forb_count }}::INT,
    p_plant_diversity_grass_count          => {{ trnYearlyResultData.value.plant_diversity_grass_count }}::INT,
    p_plant_diversity_legume_count         => {{ trnYearlyResultData.value.plant_diversity_legume_count }}::INT,
    p_plant_diversity_other_count          => {{ trnYearlyResultData.value.plant_diversity_other_count }}::INT,

    p_water_infiltration_sample_1          => {{ trnYearlyResultData.value.water_infiltration_sample_1 }}::INT,
    p_water_infiltration_sample_2          => {{ trnYearlyResultData.value.water_infiltration_sample_2 }}::INT,
    p_water_infiltration_sample_3          => {{ trnYearlyResultData.value.water_infiltration_sample_3 }}::INT,

    p_aggregate_stability_topsoil_slaking     => {{ trnYearlyResultData.value.aggregate_stability_topsoil_slaking }}::NUMERIC,
    p_aggregate_stability_topsoil_dispersion  => {{ trnYearlyResultData.value.aggregate_stability_topsoil_dispersion }}::TEXT,
    p_aggregate_stability_subsoil_slaking     => {{ trnYearlyResultData.value.aggregate_stability_subsoil_slaking }}::NUMERIC,
    p_aggregate_stability_subsoil_dispersion  => {{ trnYearlyResultData.value.aggregate_stability_subsoil_dispersion }}::TEXT,

    p_topsoil_depth_in_cm                 => {{ trnYearlyResultData.value.topsoil_depth_in_cm }}::NUMERIC,

    p_soil_organisms_diversity_count      => {{ trnYearlyResultData.value.soil_organisms_diversity_count }}::INT,
    p_soil_organisms_earthworm_count      => {{ trnYearlyResultData.value.soil_organisms_earthworm_count }}::INT,

    p_is_legume_nodules_present           => {{ trnYearlyResultData.value.is_legume_nodules_present }}::BOOLEAN,
    p_is_legume_nodules_red               => {{ trnYearlyResultData.value.is_legume_nodules_red }}::BOOLEAN,

    p_humus_smell_level_at_5cm            => {{ trnYearlyResultData.value.humus_smell_level_at_5cm }}::TEXT,

    p_site_rest_days_per_year             => {{ trnYearlyResultData.value.site_rest_days_per_year }}::INT,
    p_site_graze_days_per_year            => {{ trnYearlyResultData.value.site_graze_days_per_year }}::INT,

    p_is_deleted                          => FALSE::BOOLEAN,
    p_note => {{ trnYearlyResultData.value.note }}::TEXT,
    p_modified_by                         => {{ get_my_info.data?.id }}::UUID,
    p_history_context                     => 'YMKA Mobile - SamplingSiteAddEdit'::TEXT
);
