/*
let data = get_soil_round_and_project_data.data;

//data = data.find((x) => x.project_id == selectedRound.project_id && x.id == selectedRound.soil_sampling_round_id && x.year == selectedRound.year && x.reporting_period == selectedRound.reporting_period);

data = data.find((x) => x.project_id == selectedRound.project_id && x.sampling_type == selectedRound.sampling_type && x.year == selectedRound.year && x.reporting_period == selectedRound.reporting_period);

await varTempSoilRoundData.setValue(data);
data = await get_selected_soil_round_data.trigger();

varSelectedSamplingRound.setValue(data);
*/

await varTempSoilRoundData.setValue(selectedRound);
await setSelectedSoilSamplingRound.trigger();
navigator.navigateTo('SamplingRoundAddEdit');
