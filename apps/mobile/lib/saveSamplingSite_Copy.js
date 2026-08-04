//Logic the same as saveSamplingSite in SoilSamplingSite screen, only some adjustment like additional scopes, etc.

if (varSelectedSamplingRound.value.id == undefined && varSelectedSamplingRound.value.offline_job_id == undefined)
{
  await btnSave_OnClick.trigger({
    onSuccess: () => {
      saveSamplingSite_Copy.trigger({
        additionalScope:{
          obj,
          qryStr
        }
      });
    }
  });
}
else
{

  //Process
  let sampleData = obj;
  
  let friendlyPayload = {
    "Entity": "Soil Sampling Site",
    "Project": varSelectedProject.value.project_name,
    "Sampling type": varSelectedSamplingRound.value.sampling_type_display,
    "Year/RP": varSelectedSamplingRound.value.sampling_type == 'type_yearly' ? varSelectedSamplingRound.value.year : varSelectedProject.value.reporting_period,
    
    "Site Name": sampleData.site_name,
    "Paddock use as": sampleData.paddock_use_as_display,
    "Coordinate": `${sampleData.latitude}, ${sampleData.longitude}`,
    "Sample taken date": sampleData.sample_taken_date,
  
    "CEA": sampleData.cea,
    "Strata": sampleData.strata,
    "Property": sampleData.property,
    
    "Note": sampleData.note,
    
    "Created Date": moment().format("MMM D, yyyy HH:mm")
    };
  
  let isOffline = await JobQueueClass.trigger({additionalScope:{methodToCall: 'isOffline'}});
  
  if (isOffline)
  {
    let currJob = await JobQueueClass.trigger({additionalScope:{methodToCall: 'getJobByJobId', jsonParameter:{id: varSelectedSamplingSite.value?.offline_job_id}}});
    
    let queryString = qryStr;
    let postgreObject = await PendingJobClass.trigger({additionalScope:{methodToCall: 'postgreSPToObject', jsonParameters: {sql: queryString}}});
    
    if (currJob != undefined)
    {
      currJob.payload = sampleData;
      currJob.dbOperation.parameters = postgreObject.parameters;
      currJob.friendlyPayload = friendlyPayload;
  
      await JobQueueClass.trigger({additionalScope:{methodToCall: 'updateJob', jsonParameter: {job: currJob}}});
  
      return currJob.id;
    }
    else
    {    
      let newJob = await PendingJobClass.trigger({
        additionalScope:{
          methodToCall: 'constructor', 
          jsonParameters: {
            fromApp: 'SoilSamplingApp',
            fromPage: 'SamplingSiteAddEdit',
            fromComponent: 'btnDone_OnClick_2',
            payload: sampleData,
            friendlyPayload: friendlyPayload,
            spToCall: postgreObject.procedure_name,
            parameters: postgreObject.parameters,
            metaData: '',
            entity_name: 'soil_sampling',
            entity_id: obj.id,
            display_name: 'Add soil sampling data',
            display_body: `${varSelectedProject.value.project_name}`,
            dependencyID: undefined,
            dependencyFieldName: undefined,
            readyToUpload: true
          }
        }
      });
  
      //Update dependency
      if (varSelectedSamplingRound.value.offline_job_id != undefined)
      {
        newJob.operationDependency.field_name = 'p_soil_sampling_round_id';
        newJob.operationDependency.jobId = varSelectedSamplingRound.value.offline_job_id; //job id
      }
  
      await JobQueueClass.trigger({additionalScope:{methodToCall: 'addJob', jsonParameter: {job: newJob}}});
  
      return newJob.id;
    }  
  }
  else
  {
    //upsert_soil_sampling.trigger();
    //Refresh data?
    //If exist in local storage, remove it?
  
    //return what? the ID?
  }
}
