const arrList = [ ti_split_dateofonset, ti_split_detailsofonset, rg_split_courseofcondition, ti_split_medhistoryotherdescribe, ti_split_currentsymptoms,ti_split_anytreatment,rg_split_anypreviousxrays];

let arr = '';

let promises = arrList.map(data => new Promise(resolve => {
  if( data.selectedLabels && (data.id == 'courseCheckbox' || data.id == 'testingCheckbox')){

     arr += `${data.label}: ${data.selectedLabels}\n`;
    
  }
  else if(data.value){
    arr += `${data.label}: ${data.value}\n`;
  }
    resolve();
  }));

textAreaMedicalHistoryExample.setValue(arr.trim());