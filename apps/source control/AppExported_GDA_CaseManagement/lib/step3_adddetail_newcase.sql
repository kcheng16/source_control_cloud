exec MISCData.dbo.spRetool_HSClaims_GrievancesDisputesAppeals_AddDetail
  @case_id = {{ step1_dup_case.data?.case_id[0] }},
  @casedetailtype_description = 'Previous_Case_ID_Hook' ,
  @casedetail_info = {{ global_case_id.value }},
  @operator = {{ current_user.email }}