//Check online or not
//If online, retrieved the queries used
//Then re-assigned the selected variable

if (retoolContext.networkStatus == 'CONNECTED')
{
  await get_soil_round_and_project_data.trigger();
  await varSelectedProject.setValue(varSelectedProject.value);
}

sampling_round_display.trigger();