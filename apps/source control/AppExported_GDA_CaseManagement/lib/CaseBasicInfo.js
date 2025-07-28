let case_header =
  {{ global_case_header.value?.case_id == global_case_id.value }} ?
  {{ global_case_header.value }} :
  {{ formatDataAsArray(pull_CaseHeader.data)[0] }};

let case_detail_prep = 
  {{ formatDataAsArray(pull_CaseDetail.data)
     .filter(x => x.rn_type == 1 && ['R', 'C', 'M', 'I', 'AC91'].some(s => x.casedetailtype_id.startsWith(s)))
     .map(x => [x.casedetailtype_description, x.casedetail_info]) 
  }};
let case_detail_final = Object.fromEntries(case_detail_prep);

let milestone_prep = 
  {{ formatDataAsArray(pull_CaseDetail.data)
     .filter(x => x.rn_class_enhanced == 1 && x.casedetailtype_id.startsWith('M'))
     .map(x => [x.casedetailtype_description, x.casedetail_info])[0]
  }};
let milestone_final = {latest_milestone_event: milestone_prep[0],
                       latest_milestone_datetime: milestone_prep[1]};

let audit_prep = 
  {{ formatDataAsArray(pull_CaseDetail.data)
     .filter(x => x.casedetailtype_id.startsWith('A') && !x.casedetailtype_id.startsWith('AO'))
     .sort((a, b) => a.rn_class_general - b.rn_class_general)
     .map(x => [x.casedetailtype_description, x.casedetail_add_datetime])[0]
  }};
let audit_final = {latest_audit_event: audit_prep[0],
                   latest_audit_datetime: audit_prep[1]};

let case_owner =
    {{ formatDataAsArray(pull_CaseDetail.data)
     .filter(x => x.rn_type == 1 && x.casedetailtype_description == 'Case_Owner')
     .map(x => x.casedetail_info)[0]
  }};

let WOLAOR_req;
switch (case_header.lob) {
  case 'PHP':
    if (['Dispute', 'Post-Service Appeal'].includes(case_header.casetype_description)
        && case_header.case_initiator == 'Member Representative') {
      WOLAOR_req = 'Require AOR';
    } else if (['Dispute', 'Post-Service Appeal'].includes(case_header.casetype_description)
               && case_header.case_initiator == 'Provider' && case_detail_final.Reference_Provider_Contract != 'CP') {
      WOLAOR_req = 'Require WOL';
    } else {
      WOLAOR_req = 'Not Required';
    }
    break;
  case 'PHC':
    WOLAOR_req = 'Not Required';
    break;
  case 'AHF':
    WOLAOR_req = 'Not Required';
    break
};

let EndStage_YN =
  {{ formatDataAsArray(pull_CaseDetail.data)
     .filter(x => x.rn_class_general == 1 && ['AC91', 'AC92', 'AC93', 'AC99'].includes(x.casedetailtype_id))
     .length > 0
  }};

let RequiredDoc_All =
  {{ check_RequiredDocuments.data?.filter(x => x?.Status == 'Not Found').length == 0 }};

let RequiredDoc_RL =
  {{ check_RequiredDocuments.data?.filter(x => x?.Status == 'Found' && x?.['Required Doc'] == 'Resolution Letter').length > 0 }};

return {...case_header,
        ...case_detail_final,
        ...milestone_final,
        ...audit_final,
        ...{case_owner: case_owner,
            WOLAOR_req: WOLAOR_req,
            EndStage_YN: EndStage_YN,
            RequiredDoc_All: RequiredDoc_All,
            RequiredDoc_RL: RequiredDoc_RL}};