let data = {{ trnYearlyResultData.value }};
let total = 0;

if ({{ varSelectedSamplingRound.value.sampling_type == 'type_yearly' }})
{
  total = (Number(data.groundcover_bare_ground_count) || 0) +
    (Number(data.groundcover_forb_count) || 0) +
    (Number(data.groundcover_grass_count) || 0) +
    (Number(data.groundcover_legume_count) || 0) +
    (Number(data.groundcover_other_count) || 0);


  return `${total == 40 ? '' : 'Total groundcover should add up to 40 - one point on 40m transect. Are you sure to proceed?'}`
}
else
  return "";

