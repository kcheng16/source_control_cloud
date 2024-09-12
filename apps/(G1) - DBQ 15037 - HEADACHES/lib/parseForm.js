//Retriet the form data element, this is tied to the componenets Form Data Key
let jsonData = form1.data; 

//Remove Medical History Form Data Keys
delete jsonData.ti_split_dateofonset;
delete jsonData.ti_split_detailsofonset;
delete jsonData.rg_split_courseofcondition;
delete jsonData.ti_split_medhistoryotherdescribe; 
delete jsonData.ti_split_currentsymptoms; 
delete jsonData.ti_split_anytreatment; 
delete jsonData.rg_split_anypreviousxrays; 

//Remove Diagnostic Testing Form Data Keys
delete jsonData.ti_split_typeoftestprocedure; 
delete jsonData.ti_split_datediagnostic; 
delete jsonData.ta_split_resultsdiagnostic;

//Remove Remarks Form Data Key
delete jsonData.textAreaRemarks
delete jsonData.ta_149_8aremarksifanypleaseide;
delete jsonData.ta_split_explainfindingsandreasons
delete jsonData.rg_split_criticalfindingyesno
delete jsonData.rg_split_criticalfindingifyes
delete jsonData.rg_split_criticalfindinglifethreatening
delete jsonData.rg_split_criticalfindinghomeless
delete jsonData.ta_split_remarks

//Remove Diagnosis Form Data Keys
delete jsonData.ta_42_1alisttheclaimedconditio

// Evidence Options
const evidenceOptions = formatDataAsObject(cbg_evidencereview.data).value;
evidenceOptions.forEach((e) => {
  jsonData[e] = jsonData.cbg_evidencereview.includes(e)
}); 

delete jsonData.cbg_evidencereview;
delete jsonData.checkboxERAllAvailable
delete jsonData.ta_split_ACEreasons
delete jsonData.ta_split_ACEnumberofattempts
delete jsonData.ta_split_ACEdateandtime

// How was the exam conducted?
const examOptions = formatDataAsObject(cbg_examination.data).value; 
examOptions.forEach((x) => {
  jsonData[x] = jsonData.cbg_examination.includes(x);
}); 

delete jsonData.cbg_examination; 




// Head Pain Checkbox
const headOptions = formatDataAsObject(cbg_headachepain.data).value; 
headOptions.forEach((h) =>  {
  jsonData[h] = jsonData.cbg_headachepain.includes(h); 
}); 

delete jsonData.cbg_headachepain; 

// Other Symptom Checkbox
const otherOptions = formatDataAsObject(cbg_nonheadache.data).value;
otherOptions.forEach((o) => {
  jsonData[o] = jsonData.cbg_nonheadache.includes(o)
});

delete jsonData.cbg_nonheadache; 

return JSON.stringify(jsonData, undefined, 4); 