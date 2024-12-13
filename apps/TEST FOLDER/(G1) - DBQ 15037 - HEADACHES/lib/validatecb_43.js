if (cb_43_theveterandoesnothaveacu.value) {return null;}
let checkboxesSection1 = ['DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_70_MIGRAINEINCLUDINGMIGRAINEVARIANTS','DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_73_TENSION','DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_76_CLUSTER','DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_157_OTHERSPECIFYTYPEOFHEADACHE']; 

let validation = 'Please select at least one option from the checkboxes below or check that the veteran does not have a current diagnosis.'; 
let formData = form1.data; 

for (let i = 0; i < checkboxesSection1.length; i++) {
  if (formData[checkboxesSection1[i]]) {
    validation = null; 
    i = checkboxesSection1.length; 
  }
}


return validation;