//Get sites
const lastYearRoundData = get_soil_round_and_project_data.data.find((x) => x.sampling_type == 'type_yearly' && x.year == varSelectedSamplingRound.value.year - 1 && x.project_id == varSelectedSamplingRound.value.project_id);
const samplingSites = get_soil_sampling_data.data.filter((x) => x.soil_sampling_round_id == (lastYearRoundData?.id));

//Save locally
for (const samplingSite of samplingSites)
{
  //resetting the value
  samplingSite.id = undefined;
  samplingSite.soil_sampling_round_id = varSelectedSamplingRound.value.id;
  samplingSite.sample_taken_date = moment().format("yyyy-MM-D");
  
  let s = await buildUpsertSoilSampling.trigger({
    additionalScope:{
      obj:samplingSite
    }
  });

  await saveSamplingSite_Copy.trigger({
    additionalScope:{
      obj: samplingSite,
      qryStr: s
    }
  });  
}
//re-fire sampling_site_display
await sampling_site_display_union_tables.trigger();
await sampling_site_display.trigger();