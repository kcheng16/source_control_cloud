let data = {{ trnYearlyResultData.value }};
let naData = {{ trnNAYearlyResultData.value }};
let error = [];

function convertEmptyStringToNull(s)
{
  return s == '' ? undefined : s;
}

if ({{ varSelectedSamplingRound.value.sampling_type == 'type_yearly' }} && {{ !swcDraft.value }})
{
  //Ground cover
  if (Number(convertEmptyStringToNull(data.groundcover_forb_count) ?? -1) < 0 && !naData.groundcover_forb_count)
    error.push("• Invalid groundcover forb count");
  
  if (Number(convertEmptyStringToNull(data.groundcover_grass_count) ?? -1) < 0 && !naData.groundcover_grass_count)
    error.push("• Invalid groundcover grass count");
  
  if (Number(convertEmptyStringToNull(data.groundcover_legume_count) ?? -1) < 0 && !naData.groundcover_legume_count)
    error.push("• Invalid groundcover legume count");
  
  if (Number(convertEmptyStringToNull(data.groundcover_other_count) ?? -1) < 0 && !naData.groundcover_other_count)
    error.push("• Invalid groundcover other count");
  
  if (Number(convertEmptyStringToNull(data.groundcover_bare_ground_count) ?? -1) < 0 && !naData.groundcover_bare_ground_count)
    error.push("• Invalid groundcover bare ground count");
  
  //Plant diversity
  if (Number(convertEmptyStringToNull(data.plant_diversity_forb_count) ?? -1) < 0 && !naData.plant_diversity_forb_count)
    error.push("• Invalid plant diversity forb count");
  
  if (Number(convertEmptyStringToNull(data.plant_diversity_grass_count) ?? -1) < 0 && !naData.plant_diversity_grass_count)
    error.push("• Invalid plant diversity grass count");
  
  if (Number(convertEmptyStringToNull(data.plant_diversity_legume_count) ?? -1) < 0 && !naData.plant_diversity_legume_count)
    error.push("• Invalid plant diversity legume count");
  
  if (Number(convertEmptyStringToNull(data.plant_diversity_other_count) ?? -1) < 0 && !naData.plant_diversity_other_count)
    error.push("• Invalid plant diversity other count");
  
  //Aggregate stability
  if ((Number(convertEmptyStringToNull(data.aggregate_stability_topsoil_slaking) ?? -1) < 0 || Number(data.aggregate_stability_topsoil_slaking ?? -1) > 1) && !naData.aggregate_stability_topsoil_slaking)
      error.push('• Invalid aggregate stability topsoil slaking');
    
  if ((data.aggregate_stability_topsoil_dispersion ?? '') == '' && !naData.aggregate_stability_topsoil_dispersion)
    error.push('• Invalid aggregate stability topsoil dispersion');

  if ((Number(convertEmptyStringToNull(data.aggregate_stability_subsoil_slaking) ?? -1) < 0 || Number(data.aggregate_stability_subsoil_slaking ?? -1) > 1) && !naData.aggregate_stability_subsoil_slaking)
    error.push('• Invalid aggregate stability subsoil slaking');
  
  if ((data.aggregate_stability_subsoil_dispersion ?? '') == '' && !naData.aggregate_stability_subsoil_dispersion)
    error.push('• Invalid aggregate stability subsoil dispersion');
  
  //Other
  if (Number(convertEmptyStringToNull(data.topsoil_depth_in_cm) ?? -1) < 0 && !naData.topsoil_depth_in_cm)
      error.push('• Invalid topsoil depth (cm)');
  
  if (Number(convertEmptyStringToNull(data.soil_organisms_diversity_count) ?? -1) < 0 && !naData.soil_organisms_diversity_count)
      error.push('• Invalid soil organisms species count');
  
  if (Number(convertEmptyStringToNull(data.soil_organisms_earthworm_count) ?? -1) < 0 && !naData.soil_organisms_earthworm_count)
      error.push('• Invalid soil earthworm count');
  
  if ((data.humus_smell_level_at_5cm ?? '') == '' && !naData.humus_smell_level_at_5cm)
      error.push('• Invalid humus smell');
  
  if ((data.is_legume_nodules_present ?? '') == '' && !naData.is_legume_nodules_present)
      error.push('• Invalid legume nodules present');
  
  if ((data.is_legume_nodules_red ?? '') == '' && !naData.is_legume_nodules_red)
      error.push('• Invalid legume nodules is red');

  if (Number(convertEmptyStringToNull(data.site_rest_days_per_year) ?? -1) < 0 && !naData.site_rest_days_per_year)
      error.push('• Invalid rest days per year');
  
  if (Number(convertEmptyStringToNull(data.site_graze_days_per_year) ?? -1) < 0 && !naData.site_graze_days_per_year)
      error.push('• Invalid graze days per year');
  
  if ((Number(convertEmptyStringToNull(data.site_rest_days_per_year) ?? -1) >= 0) && (Number(convertEmptyStringToNull(data.site_graze_days_per_year) ?? -1) >= 0))
  {
    let totalDaysInYear = 365; //need to check leapyear
    let year = {{  varSelectedSamplingRound.value.year }};
    if (moment([year]).isLeapYear())
      totalDaysInYear = 366;
    
    let totalInputDays = Number(data.site_rest_days_per_year) + Number(data.site_graze_days_per_year);

    if (totalInputDays != totalDaysInYear)
      error.push(`• Sum of rest and graze days need to equal ${totalDaysInYear} days`);
  } 

  if (Object.values(naData).includes(true) && data.note == '')
      error.push(`• Please write reason why some data marked as N/A in the note section`);
  
}
return error;