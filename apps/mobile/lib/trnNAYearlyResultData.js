return {
  groundcover_grass_count: {{ chkGC_GrassCount.value }},
  groundcover_legume_count: {{ chkGC_LegumeCount.value }},
  groundcover_forb_count: {{ chkGC_ForbCount.value }},
  groundcover_other_count: {{ chkGC_OtherCount.value }},
  groundcover_bare_ground_count: {{ chkGC_BareGroundCount.value }},

  plant_diversity_grass_count: {{ chkPD_GrassCount.value }},
  plant_diversity_legume_count: {{ chkPD_LegumeCount.value }},
  plant_diversity_forb_count: {{ chkPD_ForbCount.value }},
  plant_diversity_other_count: {{ chkPD_OtherCount.value }},

  water_infiltration_sample_1: {{ chkWI_Sample1.value }},
  water_infiltration_sample_2: {{ chkWI_Sample2.value }},
  water_infiltration_sample_3: {{ chkWI_Sample3.value }},

  aggregate_stability_topsoil_slaking: {{ chkAS_SlakingTopSoil.value }},
  aggregate_stability_topsoil_dispersion: {{ chkAS_DispersionTopSoil.value }},
  aggregate_stability_subsoil_slaking: {{ chkAS_SlakingSubSoil.value }},
  aggregate_stability_subsoil_dispersion: {{ chkAS_DispersionSubSoil.value }},

  topsoil_depth_in_cm: {{ chkOt_TopsoilDepth.value }},
  humus_smell_level_at_5cm: {{ chkOt_HumusSmell.value }},
  is_legume_nodules_present: {{ chkOt_LegumePresent.value }},
  is_legume_nodules_red: {{ chkOt_LegumeIsRed.value }},
  soil_organisms_diversity_count: {{ chkOt_SpeciesCount.value }},
  soil_organisms_earthworm_count: {{ chkOt_EarthwormCount.value }},
  site_rest_days_per_year: {{ chkOt_RestDay.value }},
  site_graze_days_per_year: {{ chkOt_GrazeDay.value }}
}
