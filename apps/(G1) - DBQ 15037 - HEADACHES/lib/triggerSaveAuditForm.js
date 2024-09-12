if(actionType === 'submit') {
  if(!_.isEqual(varFormData.value,form1.data)) {
    await varFormData.setValue(form1.data);
    await saveAuditForm.trigger({additionalScope:{
            actionType: 'submit'
          }});
  }
} else {
  if(!!varFormData.value && !_.isEqual(varFormData.value,form1.data)) {
    await varFormData.setValue(form1.data);
    await saveAuditForm.trigger({additionalScope:{
            actionType: 'save'
          }});
  } 
}

