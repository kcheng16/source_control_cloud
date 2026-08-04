function nullToString(value)
{
  return (value == undefined ? 'Data not available' : value);
}

//Check for validity first

//Need to check if any data is entered or not.

//Process
let resultData = trnYearlyResultData.value;

let friendlyPayload = {
  "Entity": "Soil Sampling Yearly Result",
  "Project": varSelectedProject.value.project_name,
  "Sampling type": varSelectedSamplingRound.value.sampling_type_display,
  "Year/RP": varSelectedSamplingRound.value.sampling_type == 'type_yearly' ? varSelectedSamplingRound.value.year : varSelectedProject.value.reporting_period,
  
  "Site Name": trnSiteData.value.site_name,
  
  
  "Groundcover grass count": nullToString(resultData.groundcover_grass_count),
  "Groundcover legume count": nullToString(resultData.groundcover_legume_count),
  "Groundcover forb count": nullToString(resultData.groundcover_forb_count),
  "Groundcover other count": nullToString(resultData.groundcover_other_count),
  "Groundcover bare ground count": nullToString(resultData.groundcover_bare_ground_count),
  
  "Plant diversity grass count": nullToString(resultData.plant_diversity_grass_count),
  "Plant diversity legume count": nullToString(resultData.plant_diversity_legume_count),
  "Plant diversity forb count": nullToString(resultData.plant_diversity_forb_count),
  "Plant diversity other count": nullToString(resultData.plant_diversity_other_count),
  
  "Water infiltration sample 1 (mm/6min)": nullToString(resultData.water_infiltration_sample_1),
  "Water infiltration sample 2 (mm/6min)": nullToString(resultData.water_infiltration_sample_2),
  "Water infiltration sample 3 (mm/6min)": nullToString(resultData.water_infiltration_sample_3),
  
  "Aggregate stability - topsoil slaking (%)": nullToString(resultData.aggregate_stability_topsoil_slaking),
  "Aggregate stability - topsoil dispersion": nullToString(resultData.aggregate_stability_topsoil_dispersion),
  "Aggregate stability - subsoil slaking (%)": nullToString(resultData.aggregate_stability_subsoil_slaking),
  "Aggregate stability - subsoil dispersion": nullToString(resultData.aggregate_stability_subsoil_dispersion),
  
  "Topsoil depth (cm)": nullToString(resultData.topsoil_depth_in_cm),
  "Humus smell level at 5 cm": nullToString(resultData.humus_smell_level_at_5cm),
  
  "Legume nodules present": nullToString(resultData.is_legume_nodules_present),
  "Legume nodules red": nullToString(resultData.is_legume_nodules_red),
  
  "Soil organisms diversity count": nullToString(resultData.soil_organisms_diversity_count),
  "Earthworm count": nullToString(resultData.soil_organisms_earthworm_count),
  
  "Site rest days per year": nullToString(resultData.site_rest_days_per_year),
  "Site graze days per year": nullToString(resultData.site_graze_days_per_year),      

  "Note": resultData.note,
  
  "Created Date": moment().format("MMM D, yyyy HH:mm"),
  
  "Status": (swcDraft.value ? 'Draft' : 'Ready to Upload')
  };

let isOffline = await JobQueueClass.trigger({additionalScope:{methodToCall: 'isOffline'}});

if (isOffline)
{
  //incorrect
  let currJob = await JobQueueClass.trigger({additionalScope:{methodToCall: 'getJobByJobId', jsonParameter:{id: varSelectedSamplingSiteResult.value?.offline_job_id}}});
  
  let queryString = upsert_yearly_result_data.query;
  let postgreObject = await PendingJobClass.trigger({additionalScope:{methodToCall: 'postgreSPToObject', jsonParameters: {sql: queryString}}});
  
  if (currJob != undefined)
  {
    currJob.readyToUpload = !swcDraft.value;
    currJob.payload = resultData;
    currJob.dbOperation.parameters = postgreObject.parameters;
    currJob.friendlyPayload = friendlyPayload;
    currJob.friendlyPayload.status = (swcDraft.value ? 'Draft' : 'Ready to Upload');

    await JobQueueClass.trigger({additionalScope:{methodToCall: 'updateJob', jsonParameter: {job: currJob}}});
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
          payload: resultData,
          friendlyPayload: friendlyPayload,
          spToCall: postgreObject.procedure_name,
          parameters: postgreObject.parameters,
          metaData: '',
          entity_name: 'soil_sampling_yearly_result_data',
          entity_id: trnYearlyResultData.value.id,
          display_name: 'Add soil sampling yearly result data',
          display_body: `${varSelectedProject.value.project_name}`,
          dependencyID: undefined, 
          dependencyFieldName: undefined,
          readyToUpload: !swcDraft.value
        }
      }
    });

    //Update dependency
    if (resultData.soil_sampling_id == undefined)
    {
      newJob.operationDependency.field_name = 'p_soil_sampling_id';
      newJob.operationDependency.jobId = offline_job_id; //job id
    }

    await JobQueueClass.trigger({additionalScope:{methodToCall: 'addJob', jsonParameter: {job: newJob}}});
  }  
}
else
{
  //upsert_soil_sampling.trigger();
  //Refresh data?
  //If exist in local storage, remove it?
}