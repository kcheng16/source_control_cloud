let samplingSite = selectedItem;
let yearlyResult = undefined;

let yearlyResultAvailable = '';

if (samplingSite == undefined)
{
  samplingSite = {
    id: undefined,
    soil_sampling_round_id: varSelectedSamplingRound.value.id,
    site_number: 0,
    site_name: undefined,
    sample_taken_date: undefined,
    latitude: undefined,
    longitude: undefined,
    note: undefined
  };

  await varSelectedSamplingSite.setValue(samplingSite);
  await varSelectedSamplingSiteResult.setValue(yearlyResult);

  yearlyResultAvailable = 'No result data available';
}
else
{
  await varSelectedSamplingSite.setValue(samplingSite);
  
  if (varSelectedSamplingRound.value.sampling_type == 'type_yearly')
  {
    yearlyResult = await get_yearly_sampling_result.trigger();
    
    await varSelectedSamplingSiteResult.setValue(yearlyResult[0]);

    if (yearlyResult[0] == undefined) 
      yearlyResultAvailable = 'No result data available';
    else if (yearlyResult[0].ready_to_upload == false)
    {
      let isValid = await checkScorecardValid.trigger({
        additionalScope:{
          data: yearlyResult[0]
        }
      });

      if (!isValid)
        yearlyResultAvailable = 'Some result fields in draft mode have invalid value';
    }
      
  } 
}

if (yearlyResultAvailable == '')
  navigator.navigateTo('SamplingYearlyResultScore');
else
  throw new Error(yearlyResultAvailable);
  