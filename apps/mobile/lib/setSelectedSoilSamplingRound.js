let data = get_soil_round_and_project_data.data;
let selectedRound = varTempSoilRoundData.value;

data = data.find((x) => x.project_id == selectedRound.project_id && x.sampling_type == selectedRound.sampling_type && x.year == selectedRound.year && x.reporting_period == selectedRound.reporting_period);

await varTempSoilRoundData.setValue(data);
data = await get_selected_soil_round_data.trigger();

varSelectedSamplingRound.setValue(data);
