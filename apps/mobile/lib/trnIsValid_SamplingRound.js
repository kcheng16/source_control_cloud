let data = {{ trnSamplingRoundData.value }};
let error = [];

if (data.num_of_mobs != '' && Number(data.num_of_mobs) < 0)
  error.push("Mobs count needs to be positive");

if (data.num_of_livestocks != '' && Number(data.num_of_livestocks) < 0)
  error.push("Livestocks count needs to be positive");

if (data.num_of_paddocks != '' && Number(data.num_of_paddocks) < 0)
  error.push("Paddocks count needs to be positive");

if (data.total_grazing_area != '' && Number(data.total_grazing_area) < 0)
  error.push("Total grazing area needs to be positive");

return error;