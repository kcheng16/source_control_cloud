if (trnIsValid.value.length > 0)
  throw new Error(trnIsValid.value.join("\n"));
else
{
  if (varSelectedSamplingRound.value.id == undefined)
  {
    let samplingRound_OfflineJobId = await saveSamplingRoundData.trigger();
  
    //updating job id
    let currSamplingRound = varSelectedSamplingRound.value;
    currSamplingRound.offline_job_id = samplingRound_OfflineJobId;
    await varSelectedSamplingRound.setValue(currSamplingRound);
  
    let offlineJobId = await saveSamplingSite.trigger({
      additionalScope:{
        samplingRoundOfflineJobId: samplingRound_OfflineJobId
      }
    }); 
    
    if (varSelectedSamplingRound.value.sampling_type == 'type_yearly' && chkAddResultData.value)
    {
      await saveYearlyResultData.trigger({
        additionalScope:{
          offline_job_id: offlineJobId
        }
      });
    }
     
  }
  else
  {
    let offlineJobId = await saveSamplingSite.trigger({
      additionalScope:{
        samplingRoundOfflineJobId: undefined
      }
    }); 
      
    if (varSelectedSamplingRound.value.sampling_type == 'type_yearly' && chkAddResultData.value)
    {
      await saveYearlyResultData.trigger({
        additionalScope:{
          offline_job_id: offlineJobId
        }
      });
    }
  }
  
  
  
  
  navigator.navigateTo("SamplingRoundAddEdit");
}
