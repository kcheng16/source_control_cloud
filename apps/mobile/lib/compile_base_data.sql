
    SELECT
        {{varSelectedSamplingSiteResult.value.id}} as id,
        {{varSelectedSamplingSiteResult.value.soil_sampling_id}} as soil_sampling_id,

        {{varSelectedSamplingSiteResult.value.groundcover_bare_ground_count}} as groundcover_bare_ground_count,
        {{varSelectedSamplingSiteResult.value.groundcover_grass_count}} as groundcover_grass_count,
        {{varSelectedSamplingSiteResult.value.groundcover_legume_count}} as groundcover_legume_count,
        {{varSelectedSamplingSiteResult.value.groundcover_forb_count}} as groundcover_forb_count,
        {{varSelectedSamplingSiteResult.value.groundcover_other_count}} as groundcover_other_count,

        (
            Number(COALESCE({{varSelectedSamplingSiteResult.value.groundcover_bare_ground_count}}, 0)) +
            Number(COALESCE({{varSelectedSamplingSiteResult.value.groundcover_grass_count}}, 0)) +
            Number(COALESCE({{varSelectedSamplingSiteResult.value.groundcover_legume_count}}, 0)) +
            Number(COALESCE({{varSelectedSamplingSiteResult.value.groundcover_forb_count}}, 0)) +
            Number(COALESCE({{varSelectedSamplingSiteResult.value.groundcover_other_count}}, 0))
        ) as total_ground_cover_element_count,

        {{varSelectedSamplingSiteResult.value.plant_diversity_forb_count}} as plant_diversity_forb_count,
        {{varSelectedSamplingSiteResult.value.plant_diversity_grass_count}} as plant_diversity_grass_count,
        {{varSelectedSamplingSiteResult.value.plant_diversity_legume_count}} as plant_diversity_legume_count,
        {{varSelectedSamplingSiteResult.value.plant_diversity_other_count}} as plant_diversity_other_count,

        {{varSelectedSamplingSiteResult.value.water_infiltration_sample_1}} as water_infiltration_sample_1,
        {{varSelectedSamplingSiteResult.value.water_infiltration_sample_2}} as water_infiltration_sample_2,
        {{varSelectedSamplingSiteResult.value.water_infiltration_sample_3}} as water_infiltration_sample_3,

        {{varSelectedSamplingSiteResult.value.aggregate_stability_topsoil_slaking}} as aggregate_stability_topsoil_slaking,
        {{varSelectedSamplingSiteResult.value.aggregate_stability_topsoil_dispersion}} as aggregate_stability_topsoil_dispersion,

        {{varSelectedSamplingSiteResult.value.aggregate_stability_subsoil_slaking}} as aggregate_stability_subsoil_slaking,
        {{varSelectedSamplingSiteResult.value.aggregate_stability_subsoil_dispersion}} as aggregate_stability_subsoil_dispersion,

        {{varSelectedSamplingSiteResult.value.topsoil_depth_in_cm}} as topsoil_depth_in_cm,

        {{varSelectedSamplingSiteResult.value.soil_organisms_diversity_count}} as soil_organisms_diversity_count,
        {{varSelectedSamplingSiteResult.value.soil_organisms_earthworm_count}} as soil_organisms_earthworm_count,

        {{varSelectedSamplingSiteResult.value.is_legume_nodules_present}} as is_legume_nodules_present,
        {{varSelectedSamplingSiteResult.value.is_legume_nodules_red}} as is_legume_nodules_red,

        {{varSelectedSamplingSiteResult.value.humus_smell_level_at_5cm}} as humus_smell_level_at_5cm,

        {{varSelectedSamplingSiteResult.value.site_rest_days_per_year}} as site_rest_days_per_year,
        {{varSelectedSamplingSiteResult.value.site_graze_days_per_year}} as site_graze_days_per_year,

        {{varSelectedSamplingSiteResult.value.is_deleted}} as is_deleted,
        {{varSelectedSamplingSiteResult.value.created_on}} as created_on,
        {{varSelectedSamplingSiteResult.value.created_by}} as created_by,
        {{varSelectedSamplingSiteResult.value.modified_on}} as modified_on,
        {{varSelectedSamplingSiteResult.value.modified_by}} as modified_by
