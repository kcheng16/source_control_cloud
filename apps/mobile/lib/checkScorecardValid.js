console.log(data);


let error = [];


  //Ground cover
  if (Number(data.groundcover_forb_count) < 0)
    error.push("• Invalid groundcover forb count");
  
  if (Number(data.groundcover_grass_count) < 0)
    error.push("• Invalid groundcover grass count");
  
  if (Number(data.groundcover_legume_count) < 0)
    error.push("• Invalid groundcover legume count");
  
  if (Number(data.groundcover_other_count) < 0)
    error.push("• Invalid groundcover other count");
  
  if (Number(data.groundcover_bare_ground_count) < 0)
    error.push("• Invalid groundcover bare ground count");
  
  //Plant diversity
  if (data.plant_diversity_forb_count <= 0)
    error.push("• Invalid plant diversity forb count");
  
  if (data.plant_diversity_grass_count <= 0)
    error.push("• Invalid plant diversity grass count");
  
  if (data.plant_diversity_legume_count <= 0)
    error.push("• Invalid plant diversity legume count");
  
  if (data.plant_diversity_other_count <= 0)
    error.push("• Invalid plant diversity other count");
  
  //Aggregate stability
  if (data.aggregate_stability_topsoil_slaking === '' || data.aggregate_stability_topsoil_slaking < 0 || data.aggregate_stability_topsoil_slaking > 1)
      error.push('• Invalid aggregate stability topsoil slaking');
    
    if (data.aggregate_stability_topsoil_dispersion === '' || data.aggregate_stability_topsoil_dispersion == undefined)
      error.push('• Invalid aggregate stability topsoil dispersion');
  
    if (data.aggregate_stability_subsoil_slaking === '' || data.aggregate_stability_subsoil_slaking < 0 || data.aggregate_stability_subsoil_slaking > 1)
      error.push('• Invalid aggregate stability subsoil slaking');
    
    if (data.aggregate_stability_subsoil_dispersion === ''  || data.aggregate_stability_topsoil_dispersion == undefined)
      error.push('• Invalid aggregate stability subsoil dispersion');
  
  //Other
  if (data.topsoil_depth_in_cm === '' || data.topsoil_depth_in_cm <= 0)
      error.push('• Invalid topsoil depth (cm)');
  
  if (data.soil_organisms_species_count === '' || data.soil_organisms_species_count < 0)
      error.push('• Invalid soil organisms species count');
  
  if (data.soil_organisms_earthworm_count === '' || data.soil_organisms_earthworm_count < 0)
      error.push('• Invalid soil earthworm count');
  
  if (data.humus_smell_level_at_5cm === '' || data.humus_smell_level_at_5cm == undefined)
      error.push('• Invalid humus smell');
  
  if (data.is_legume_nodules_present === '' || data.is_legume_nodules_present == undefined)
      error.push('• Invalid legume nodules present');
  
  if (data.is_legume_nodules_red === '' || data.is_legume_nodules_red == undefined)
      error.push('• Invalid legume nodules is red');

  if ((data.site_rest_days_per_year != '' && data.site_rest_days_per_year != undefined) ||
     (data.site_graze_days_per_year != '' && data.site_graze_days_per_year != undefined))
  {
    if (Number(data.site_rest_days_per_year) <= 0)
      error.push('• Invalid rest days per year');
  
    if (Number(data.site_graze_days_per_year) <= 0)
      error.push('• Invalid graze days per year');

    if (Number(data.site_rest_days_per_year > 0) && Number(data.site_graze_days_per_year) > 0)
    {
      let totalDaysInYear = 365; //need to check leapyear
      let year = varSelectedSamplingRound.value.year;
      if (moment([year]).isLeapYear())
        totalDaysInYear = 366;
      
      let totalInputDays = Number(data.site_rest_days_per_year) + Number(data.site_graze_days_per_year);

      if (totalInputDays != totalDaysInYear)
        error.push(`• Sum of rest and graze days need to equal ${totalDaysInYear} days`);
    }
  }
 
return error.length == 0;