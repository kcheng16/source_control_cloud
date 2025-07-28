let template_list = [];
switch ({{ CaseBasicInfo.value.lob }}) {
  case 'PHP':
    if ({{ CaseBasicInfo.value.casetype_description.endsWith('Appeal') }}) {
      template_list.push({label: 'Acknowledge Letter',
                          value: 'PHP_Appeal_AKL'});
  
      template_list.push({label: 'Dismiss Letter',
                          value: 'PHP_Appeal_Dismiss'});
      template_list.push({label: 'Untimely Filling (ouside 60-day window)',
                          value:  'RSN_Untimely_Filling',
                          parent: 'PHP_Appeal_Dismiss'});
  
      template_list.push({label: 'Withdraw Letter',
                          value: 'PHP_Appeal_Withdraw'});

      if ({{ CaseBasicInfo.value.WOLAOR_req == 'Require WOL' }}) {
        template_list.push({label: 'WOL Request Letter',
                            value: 'PHP_Appeal_WOL_Request'});
        template_list.push({label: 'Did Not Received WOL',
                            value:  'RSN_No_WOL',
                            parent: 'PHP_Appeal_Dismiss'});        
      } else if ({{ CaseBasicInfo.value.WOLAOR_req == 'Require AOR' }}){
        template_list.push({label: 'AOR Request Letter',
                            value: 'PHP_Appeal_AOR_Request'});
        template_list.push({label: 'Did Not Received AOR',
                            value:  'RSN_No_AOR',
                            parent: 'PHP_Appeal_Dismiss'});   
      }
    } else if ({{ CaseBasicInfo.value.casetype_description == 'Reopen' }}) {
      //pass
    } else if ({{ CaseBasicInfo.value.casetype_description == 'Reopen' }}) {
      //pass
    }

    template_list.push({label: 'Resolution Letter',
                        value: 'PHP_Appeal_Resolution'});
    
    break;
  
  case 'PHC':
    break;
  
  case 'AHF':
    break;
}

return template_list