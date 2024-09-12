const arrList = [ ti_split_typeoftestprocedure, ti_split_datediagnostic,  ta_split_resultsdiagnostic];

let arr = '';

let promises = arrList.map(data => new Promise(resolve => {
  if( data.selectedLabels && (data.id == 'courseCheckbox' || data.id == 'testingCheckbox')){
    console.log('data -'+data.id+data.values);
     arr += `${data.label} ${data.selectedLabels}\n`;
    
  }
  else if(data.value){
    arr += `${data.label} ${data.value}\n`;
  }
    resolve();
  }));

textAreaDiagnosticTestingExample.setValue(arr.trim());