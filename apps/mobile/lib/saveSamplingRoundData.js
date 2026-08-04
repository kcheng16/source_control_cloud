//Check for validity first

//Process
let resultData = varSelectedSamplingRound.value;

let friendlyPayload = {
  "Entity": "Soil Sampling Round",
  "Project": varSelectedProject.value.project_name,
  "Sampling type": varSelectedSamplingRound.value.sampling_type_display,
  "Year/RP": varSelectedSamplingRound.value.sampling_type == 'type_yearly' ? varSelectedSamplingRound.value.year : varSelectedProject.value.reporting_period,
  "Scheduled date": resultData.sampling_scheduled_date,
  "CF Staff as samplers": resultData.cf_staff_as_samplers_display,
  "Total Livestocks": resultData.num_of_livestocks,
  "Total Mobs": resultData.num_of_mobs,
  "Total Paddocks": resultData.num_of_paddocks,
  "Total Grazing Area (ha)": resultData.total_grazing_area,
  "Note": resultData.note,
  "Created Date": moment().format("MMM D, yyyy HH:mm")
  };

let isOffline = await JobQueueClass.trigger({additionalScope:{methodToCall: 'isOffline'}});

if (isOffline)
{
  let currJob = await JobQueueClass.trigger({additionalScope:{methodToCall: 'getJobByJobId', jsonParameter:{id: resultData?.offline_job_id}}});
  
  let queryString = upsert_soil_sampling_round.query;
  let postgreObject = await PendingJobClass.trigger({additionalScope:{methodToCall: 'postgreSPToObject', jsonParameters: {sql: queryString}}});
  
  if (currJob != undefined)
  {
    currJob.payload = resultData;
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
          fromPage: 'SamplingRoundAddEdit',
          fromComponent: 'btnSave_OnClick',
          payload: resultData,
          friendlyPayload: friendlyPayload,
          spToCall: postgreObject.procedure_name,
          parameters: postgreObject.parameters,
          metaData: '',
          entity_name: 'soil_sampling_round',
          entity_id: resultData.id,
          display_name: 'Update soil sampling round',
          display_body: `${varSelectedProject.value.project_name}`,
          dependencyID: undefined, 
          dependencyFieldName: undefined,
          readyToUpload: true
        }
      }
    });

    await JobQueueClass.trigger({additionalScope:{methodToCall: 'addJob', jsonParameter: {job: newJob}}});
    
    return newJob.id;
  }  
}
else
{
  //upsert_soil_sampling.trigger();
  //Refresh data?
  //If exist in local storage, remove it?
}