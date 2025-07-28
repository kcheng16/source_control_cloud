// Add LOB to CurrentCaseInput
let init_value = CurrentCaseInput.value;
let added_value = {'LOB': 'PHP'};
CurrentCaseInput.setValue({...init_value, ...added_value});

// Pre-validate the Case Info form content
PHP_CaseInfo_form.validate();

