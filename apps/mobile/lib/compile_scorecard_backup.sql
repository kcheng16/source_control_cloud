SELECT base_data.id,
    soil_sampling_id,

    --GROUND COVER
    groundcover_bare_ground_count,
    groundcover_grass_count,
    groundcover_legume_count,
    groundcover_forb_count,
    groundcover_other_count,

    CASE
        WHEN total_ground_cover_element_count > 0 THEN ROUND(groundcover_grass_count / total_ground_cover_element_count, 4)
        ELSE 0
    END as groundcover_grass_proportion,

    CASE
        WHEN total_ground_cover_element_count > 0 THEN ROUND(groundcover_legume_count / total_ground_cover_element_count, 4)
        ELSE 0
    END as groundcover_legume_proportion,

    CASE
        WHEN total_ground_cover_element_count > 0 THEN ROUND(groundcover_forb_count / total_ground_cover_element_count, 4)
        ELSE 0
    END as groundcover_forb_proportion,

    CASE
        WHEN total_ground_cover_element_count > 0 THEN ROUND(groundcover_other_count / total_ground_cover_element_count, 4)
        ELSE 0
    END as groundcover_other_proportion,

    CASE
        WHEN total_ground_cover_element_count > 0 THEN ROUND((total_ground_cover_element_count - groundcover_bare_ground_count) / total_ground_cover_element_count, 4)
        ELSE 0
    END as groundcover_overall_proportion,

    CASE
        WHEN 
            CASE
                WHEN total_ground_cover_element_count > 0 THEN ROUND((total_ground_cover_element_count - groundcover_bare_ground_count) / total_ground_cover_element_count, 4)
                ELSE 0
            END < 0.5 THEN 0
        WHEN
            CASE
                WHEN total_ground_cover_element_count > 0 THEN ROUND((total_ground_cover_element_count - groundcover_bare_ground_count) / total_ground_cover_element_count, 4)
                ELSE 0
            END <= 0.7 THEN 1
        WHEN 
            CASE
                WHEN total_ground_cover_element_count > 0 THEN ROUND((total_ground_cover_element_count - groundcover_bare_ground_count) / total_ground_cover_element_count, 4)
                ELSE 0
            END <= 0.9 THEN 2
        ELSE 3
    END AS groundcover_score,

    --PLANT DIVERSITY
    plant_diversity_forb_count,
    plant_diversity_grass_count,
    plant_diversity_legume_count,
    plant_diversity_other_count,

    --WATER INFILTRATION
    water_infiltration_sample_1,
    water_infiltration_sample_2,
    water_infiltration_sample_3,

    water_infiltration_sample_1 * 10 as water_infiltration_sample_1_mm_ph,
    water_infiltration_sample_2 * 10 as water_infiltration_sample_2_mm_ph,
    water_infiltration_sample_3 * 10 as water_infiltration_sample_3_mm_ph,

    (
        water_infiltration_sample_1 * 10 +
        water_infiltration_sample_2 * 10 +
        water_infiltration_sample_3 * 10
    ) / 3 AS water_infiltration_avg_mm_ph,

    CASE
        WHEN (water_infiltration_sample_1 * 10 + water_infiltration_sample_2 * 10 + water_infiltration_sample_3 * 10) / 3 <= 100 THEN 0
        WHEN (water_infiltration_sample_1 * 10 + water_infiltration_sample_2 * 10 + water_infiltration_sample_3 * 10) / 3 <= 250 THEN 1
        WHEN (water_infiltration_sample_1 * 10 + water_infiltration_sample_2 * 10 + water_infiltration_sample_3 * 10) / 3 <= 500 THEN 2
        ELSE 3
    END AS water_infiltration_score,

    --AGGREGATE STABILITY
    aggregate_stability_topsoil_slaking,
    aggregate_stability_topsoil_dispersion,
    lo_top_soil_dispersion.option_name as aggregate_stability_topsoil_dispersion_display,

    aggregate_stability_subsoil_slaking,
    aggregate_stability_subsoil_dispersion,
    lo_sub_soil_dispersion.option_name as aggregate_stability_subsoil_dispersion_display,

    CASE
        WHEN aggregate_stability_topsoil_slaking > 0.7 THEN 0
        WHEN aggregate_stability_topsoil_slaking >= 0.3 THEN 1
        WHEN aggregate_stability_topsoil_slaking >= 0.01 THEN 2
        ELSE 3
    END AS aggregate_stability_topsoil_slaking_score,

    CASE
        WHEN aggregate_stability_subsoil_slaking > 0.7 THEN 0
        WHEN aggregate_stability_subsoil_slaking >= 0.3 THEN 1
        WHEN aggregate_stability_subsoil_slaking >= 0.01 THEN 2
        ELSE 3
    END AS aggregate_stability_subsoil_slaking_score,

    lo_top_soil_dispersion.order_column as aggregate_stability_topsoil_dispersion_score,
    lo_sub_soil_dispersion.order_column as aggregate_stability_subsoil_dispersion_score,

    --TOP SOIL DEPTH
    topsoil_depth_in_cm,
    CASE
        WHEN topsoil_depth_in_cm < 5 then 0
        WHEN topsoil_depth_in_cm <= 10 then 1
        WHEN topsoil_depth_in_cm <= 15 then 2
        ELSE 3
    END AS topsoil_depth_score,

    --ORGANISM DIVERSITY
    soil_organisms_diversity_count,
    soil_organisms_earthworm_count,

    CASE
        WHEN soil_organisms_diversity_count <= 1 then 0
        WHEN soil_organisms_diversity_count <= 4 then 1
        WHEN soil_organisms_diversity_count <= 8 then 2
        ELSE 3
    END as soil_organisms_diversity_score,

    is_legume_nodules_present,
    is_legume_nodules_red,

    humus_smell_level_at_5cm,
    lo_humus_smell_level.option_name as humus_smell_level_at_5cm_display,

    site_rest_days_per_year,
    site_graze_days_per_year,

    CASE
        WHEN site_graze_days_per_year = 0 THEN 0
        ELSE ROUND(site_rest_days_per_year/site_graze_days_per_year, 4)
    END as site_rest_to_graze_ratio,

    base_data.created_on,
    base_data.created_by,
    base_data.modified_on,
    base_data.modified_by

FROM {{ compile_base_data.data }} base_data
    LEFT JOIN {{ get_list_options.data }} lo_top_soil_dispersion
        ON lo_top_soil_dispersion.option_key = base_data.aggregate_stability_topsoil_dispersion
    LEFT JOIN {{ get_list_options.data }} lo_sub_soil_dispersion
        ON lo_sub_soil_dispersion.option_key = base_data.aggregate_stability_subsoil_dispersion
    LEFT JOIN {{ get_list_options.data }} lo_humus_smell_level
        ON lo_humus_smell_level.option_key = base_data.humus_smell_level_at_5cm
WHERE COALESCE(base_data.is_deleted, false) = false;
