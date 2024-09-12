const cb_11 = cb_11_reviewofavailablerecords.value
const cb_12 = cb_12_reviewofavailablerecords.value
const validationCheckboxes = cb_11 || cb_12

const parentCheckboxes = ['DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_13_NOTREQUESTED',
'DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_16_NORECORDSWEREREVIEWED']

const childrenCheckboxes = ['DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_14_VACLAIMSFILEHARDCOPYPAPERCFILE','DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_15_VAEFOLDER','DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_17_VAELECTRONICHEALTHRECORD','DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_18_OTHERPLEASESPECIFYINCOMMENTSBOX']

let evidenceCheckboxData = cbg_evidencereview.value

let validationOutput = {}
validationOutput.childrenDisabled = false
validationOutput.parentDisabled = false
validationOutput.requiredValidation = true
validationOutput.otherCommentRequired = false
validationOutput.ACEreasons = false
validationOutput.ACEnumberofattempts = false
validationOutput.ACEdateandtime = false

if(cb_11) {
  validationOutput.ACEreasons = true
  validationOutput.ACEnumberofattempts = true
} else {
  validationOutput.ACEreasons = false
  validationOutput.ACEnumberofattempts = false
  ta_split_ACEreasons.clearValue()
  ta_split_ACEnumberofattempts.clearValue()
}

if(cb_12) {
  validationOutput.ACEdateandtime = true
} else {
  validationOutput.ACEdateandtime = false
  ta_split_ACEdateandtime.clearValue()
}

if(validationCheckboxes) {
  validationOutput.parentDisabled = true
  if(evidenceCheckboxData.some(r => parentCheckboxes.includes(r))) {
  evidenceCheckboxData = evidenceCheckboxData.filter( ( el ) => !parentCheckboxes.includes( el ) );
}

}

if(evidenceCheckboxData.some(r => parentCheckboxes.includes(r))) {
  evidenceCheckboxData = evidenceCheckboxData.filter( ( el ) => !childrenCheckboxes.includes( el ) );
  validationOutput.childrenDisabled = true
}

//if other checkbox is selected then comments are required, if any child besides other is selected its either the "All available records" checkbox or evidence comments
if(evidenceCheckboxData.some(r => childrenCheckboxes.includes(r))) {
  validationOutput.otherCommentRequired = true
} else {
  ta_19_evidencecomments.clearValue()
  checkboxERAllAvailable.clearValue()
}

cbg_evidencereview.setValue(evidenceCheckboxData)
return validationOutput