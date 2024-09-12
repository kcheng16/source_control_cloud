//Verify your comment field names, in this example ta_149_8aremarksifanypleaseide is DBQ specific
const arrList = [ta_split_ACEreasons, ta_split_ACEnumberofattempts, ta_split_ACEdateandtime,ta_split_explainfindingsandreasons, ta_149_8aremarksifanypleaseide, rg_split_criticalfindingyesno, rg_split_criticalfindingifyes, rg_split_criticalfindinglifethreatening, rg_split_criticalfindinghomeless,  customRemarks];

//Update dbqRemarkId based on the specific DBQ remarks field
let dbqRemarkId = ta_149_8aremarksifanypleaseide


let arr = '';
let reviewRemark = ''
let diagnosisLabel = 'Regarding the diagnosis section: The Veteran does not have a diagnosis associated with the claimed condition(s). '

let promises = arrList.map(data => new Promise(resolve => {
  if( data.id == 'customRemarks' ){
    let remarkObj = data.value
    if (remarkObj) {
      Object.keys(remarkObj).map((key) => {
        if(remarkObj[key]) {
          arr += key + ': ' + remarkObj[key] + '\n'  
        }
      }); 
    } 
  }
  else if(data.id == 'ta_split_explainfindingsandreasons') {
    if(data.value.length > 0 ){
          arr += diagnosisLabel + data.value + '\n'
          reviewRemark += diagnosisLabel + data.value + '\n'
    }
  }
  //
  else if(data.id == dbqRemarkId.id) {
    if(data.value) {
      arr += data.value + '\n'
    }
  }
  else if(data.value){
    arr += `${data.label} ${data.value}\n`;
    
    if(['ta_split_ACEreasons', 'ta_split_ACEnumberofattempts', 'ta_split_ACEdateandtime','ta_split_explainfindingsandreasons'].includes(data.id)) {
      reviewRemark += `${data.label} ${data.value}\n`;
    }
  }
    resolve();
  }));

ta_split_remarks.setValue(reviewRemark.trim())
textAreaRemarksExample.setValue(arr.trim());