let BatchContent = [];
for (let key in changeset){
  switch (key) {
    case 'Case Received Date':
      BatchContent.push({
        'case_id': global_case_id.value,
        'casedetailtype_description': 'Case_Received_Date',
        'casedetail_info': (CaseBasicInfo.value.case_priority == 'Expedited' 
                            ? moment(changeset[key]).format('MM/DD/yyyy HH:mm:ss.SSS')
                            : moment(changeset[key]).format('MM/DD/yyyy')
                           ) ,
        'operator': current_user.email
      });
      break;

    case 'Case Owner':
      BatchContent.push({
        'case_id': global_case_id.value,
        'casedetailtype_description': 'Case_Owner',
        'casedetail_info': changeset[key],
        'operator': current_user.email
      });
      break;      
      
    case 'Reference Provider Contract':
      BatchContent.push({
        'case_id': global_case_id.value,
        'casedetailtype_description': 'Reference_Provider_Contract',
        'casedetail_info': changeset[key],
        'operator': current_user.email
      });
      break;

    case 'ServiceNow Ticket No':
      BatchContent.push({
        'case_id': global_case_id.value,
        'casedetailtype_description': 'ServiceNow_Ticket_No',
        'casedetail_info': changeset[key],
        'operator': current_user.email
      });
      break;
  }
}

return BatchContent