add_CaseDetail_General.trigger({
  additionalScope: {
    casedetailtype_description: 'Case_Converted',
    casedetail_info: step1_dup_case.data?.case_id[0]
  }
})