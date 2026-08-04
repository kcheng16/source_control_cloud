SELECT base_data.id,
    soil_sampling_id,

    --GROUND COVER
    CASE WHEN groundcover_bare_ground_count IS NULL THEN 'N/A' ELSE groundcover_bare_ground_count END as groundcover_bare_ground_count,
    CASE WHEN groundcover_grass_count IS NULL THEN 'N/A' ELSE groundcover_grass_count END AS groundcover_grass_count,
    CASE WHEN groundcover_legume_count IS NULL THEN 'N/A' ELSE groundcover_legume_count END AS groundcover_legume_count,
    CASE WHEN groundcover_forb_count IS NULL THEN 'N/A' ELSE groundcover_forb_count END AS groundcover_forb_count,
    CASE WHEN groundcover_other_count IS NULL THEN 'N/A' ELSE groundcover_other_count END AS groundcover_other_count,

    CASE
        WHEN groundcover_grass_count IS NULL then 'N/A'
        WHEN total_ground_cover_element_count > 0 THEN ROUND(groundcover_grass_count / total_ground_cover_element_count, 4)
        ELSE 0
    END as groundcover_grass_proportion,

    CASE
        WHEN groundcover_legume_count IS NULL then 'N/A'
        WHEN total_ground_cover_element_count > 0 THEN ROUND(groundcover_legume_count / total_ground_cover_element_count, 4)
        ELSE 0
    END as groundcover_legume_proportion,

    CASE
        WHEN groundcover_forb_count IS NULL then 'N/A'
        WHEN total_ground_cover_element_count > 0 THEN ROUND(groundcover_forb_count / total_ground_cover_element_count, 4)
        ELSE 0
    END as groundcover_forb_proportion,

    CASE
        WHEN groundcover_other_count IS NULL then 'N/A'
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
    CASE WHEN plant_diversity_forb_count IS NULL THEN 'N/A' ELSE plant_diversity_forb_count END AS plant_diversity_forb_count,
    CASE WHEN plant_diversity_grass_count IS NULL THEN 'N/A' ELSE plant_diversity_grass_count END AS plant_diversity_grass_count,
    CASE WHEN plant_diversity_legume_count IS NULL THEN 'N/A' ELSE plant_diversity_legume_count END AS plant_diversity_legume_count,
    CASE WHEN plant_diversity_other_count IS NULL THEN 'N/A' ELSE plant_diversity_other_count END AS plant_diversity_other_count,

    --WATER INFILTRATION
    CASE WHEN water_infiltration_sample_1 IS NULL THEN 'N/A' ELSE water_infiltration_sample_1 END AS water_infiltration_sample_1,
    CASE WHEN water_infiltration_sample_2 IS NULL THEN 'N/A' ELSE water_infiltration_sample_2 END AS water_infiltration_sample_2,
    CASE WHEN water_infiltration_sample_3 IS NULL THEN 'N/A' ELSE water_infiltration_sample_3 END AS water_infiltration_sample_3,

    case when water_infiltration_sample_1 IS NULL then 'N/A' else water_infiltration_sample_1 * 10 end as water_infiltration_sample_1_mm_ph,
    case when water_infiltration_sample_2 IS NULL then 'N/A' else water_infiltration_sample_2 * 10 end as water_infiltration_sample_2_mm_ph,
    case when water_infiltration_sample_3 IS NULL then 'N/A' else water_infiltration_sample_3 * 10 end as water_infiltration_sample_3_mm_ph,

    (
        case when water_infiltration_sample_1 IS NULL then 0 else water_infiltration_sample_1 * 10 end +
        case when water_infiltration_sample_2 IS NULL then 0 else water_infiltration_sample_2 * 10 end +
        case when water_infiltration_sample_3 IS NULL then 0 else water_infiltration_sample_3 * 10 end 
    ) / 3 AS water_infiltration_avg_mm_ph,

    CASE
        WHEN (
            case when water_infiltration_sample_1 IS NULL then 0 else water_infiltration_sample_1 * 10 end +
            case when water_infiltration_sample_2 IS NULL then 0 else water_infiltration_sample_2 * 10 end +
            case when water_infiltration_sample_3 IS NULL then 0 else water_infiltration_sample_3 * 10 end 
        ) / 3 <= 100 THEN 0
        WHEN (
            case when water_infiltration_sample_1 IS NULL then 0 else water_infiltration_sample_1 * 10 end +
            case when water_infiltration_sample_2 IS NULL then 0 else water_infiltration_sample_2 * 10 end +
            case when water_infiltration_sample_3 IS NULL then 0 else water_infiltration_sample_3 * 10 end 
        ) / 3 <= 250 THEN 1
        WHEN (
            case when water_infiltration_sample_1 IS NULL then 0 else water_infiltration_sample_1 * 10 end +
            case when water_infiltration_sample_2 IS NULL then 0 else water_infiltration_sample_2 * 10 end +
            case when water_infiltration_sample_3 IS NULL then 0 else water_infiltration_sample_3 * 10 end 
        ) / 3 <= 500 THEN 2
        ELSE 3
    END AS water_infiltration_score,

    --AGGREGATE STABILITY
    CASE WHEN aggregate_stability_topsoil_slaking IS NULL THEN 'N/A' ELSE aggregate_stability_topsoil_slaking END AS aggregate_stability_topsoil_slaking,
    CASE WHEN aggregate_stability_topsoil_dispersion IS NULL THEN 'N/A' ELSE aggregate_stability_topsoil_dispersion END AS aggregate_stability_topsoil_dispersion,
    CASE WHEN lo_top_soil_dispersion.option_name IS NULL THEN 'N/A' ELSE lo_top_soil_dispersion.option_name END AS aggregate_stability_topsoil_dispersion_display,
    
    CASE WHEN aggregate_stability_subsoil_slaking IS NULL THEN 'N/A' ELSE aggregate_stability_subsoil_slaking END AS aggregate_stability_subsoil_slaking,
    CASE WHEN aggregate_stability_subsoil_dispersion IS NULL THEN 'N/A' ELSE aggregate_stability_subsoil_dispersion END AS aggregate_stability_subsoil_dispersion,
    CASE WHEN lo_sub_soil_dispersion.option_name IS NULL THEN 'N/A' ELSE lo_sub_soil_dispersion.option_name END AS aggregate_stability_subsoil_dispersion_display,


    CASE
        WHEN aggregate_stability_topsoil_slaking IS NULL THEN 0
        WHEN CASE WHEN aggregate_stability_topsoil_slaking IS NULL THEN 0 ELSE aggregate_stability_topsoil_slaking END > 0.7 THEN 0
        WHEN CASE WHEN aggregate_stability_topsoil_slaking IS NULL THEN 0 ELSE aggregate_stability_topsoil_slaking END >= 0.3 THEN 1
        WHEN CASE WHEN aggregate_stability_topsoil_slaking IS NULL THEN 0 ELSE aggregate_stability_topsoil_slaking END >= 0.01 THEN 2
        ELSE 3
    END AS aggregate_stability_topsoil_slaking_score,

    CASE
        WHEN aggregate_stability_subsoil_slaking IS NULL THEN 0
        WHEN CASE WHEN aggregate_stability_subsoil_slaking IS NULL THEN 0 ELSE aggregate_stability_subsoil_slaking END > 0.7 THEN 0
        WHEN CASE WHEN aggregate_stability_subsoil_slaking IS NULL THEN 0 ELSE aggregate_stability_subsoil_slaking END >= 0.3 THEN 1
        WHEN CASE WHEN aggregate_stability_subsoil_slaking IS NULL THEN 0 ELSE aggregate_stability_subsoil_slaking END >= 0.01 THEN 2
        ELSE 3
    END AS aggregate_stability_subsoil_slaking_score,

    CASE WHEN lo_top_soil_dispersion.order_column IS NULL THEN 0 ELSE lo_top_soil_dispersion.order_column END as aggregate_stability_topsoil_dispersion_score,
    CASE WHEN lo_sub_soil_dispersion.order_column IS NULL THEN 0 ELSE lo_sub_soil_dispersion.order_column END as aggregate_stability_subsoil_dispersion_score,

    --TOP SOIL DEPTH
    CASE WHEN topsoil_depth_in_cm IS NULL THEN 'N/A' ELSE topsoil_depth_in_cm END as topsoil_depth_in_cm,

    CASE
        WHEN CASE WHEN topsoil_depth_in_cm IS NULL THEN 0 ELSE topsoil_depth_in_cm END < 5 then 0
        WHEN CASE WHEN topsoil_depth_in_cm IS NULL THEN 0 ELSE topsoil_depth_in_cm END <= 10 then 1
        WHEN CASE WHEN topsoil_depth_in_cm IS NULL THEN 0 ELSE topsoil_depth_in_cm END <= 15 then 2
        ELSE 3
    END AS topsoil_depth_score,

    --ORGANISM DIVERSITY
    CASE WHEN soil_organisms_diversity_count IS NULL THEN 'N/A' ELSE soil_organisms_diversity_count END AS soil_organisms_diversity_count,
    CASE WHEN soil_organisms_earthworm_count IS NULL THEN 'N/A' ELSE soil_organisms_earthworm_count END AS soil_organisms_earthworm_count,

    CASE
        WHEN CASE WHEN soil_organisms_diversity_count IS NULL THEN 0 ELSE soil_organisms_diversity_count END <= 1 then 0
        WHEN CASE WHEN soil_organisms_diversity_count IS NULL THEN 0 ELSE soil_organisms_diversity_count END <= 4 then 1
        WHEN CASE WHEN soil_organisms_diversity_count IS NULL THEN 0 ELSE soil_organisms_diversity_count END <= 8 then 2
        ELSE 3
    END as soil_organisms_diversity_score,

    CASE WHEN is_legume_nodules_present IS NULL THEN 'N/A' ELSE is_legume_nodules_present END AS is_legume_nodules_present,
    CASE WHEN is_legume_nodules_red IS NULL THEN 'N/A' ELSE is_legume_nodules_red END AS is_legume_nodules_red,
    
    CASE WHEN humus_smell_level_at_5cm IS NULL THEN 'N/A' ELSE humus_smell_level_at_5cm END AS humus_smell_level_at_5cm,
    CASE WHEN lo_humus_smell_level.option_name IS NULL THEN 'N/A' ELSE lo_humus_smell_level.option_name END AS humus_smell_level_at_5cm_display,
    
    CASE WHEN site_rest_days_per_year IS NULL THEN 'N/A' ELSE site_rest_days_per_year END AS site_rest_days_per_year,
    CASE WHEN site_graze_days_per_year IS NULL THEN 'N/A' ELSE site_graze_days_per_year END AS site_graze_days_per_year,


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
