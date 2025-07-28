exec MISCData.dbo.spRetool_HSClaims_GrievancesDisputesAppeals_AddDetail
  @case_id = {{ global_case_id.value }},
  @casedetailtype_description = {{ casedetailtype_description }} ,
  @casedetail_info = {{ casedetail_info }},
  @operator = {{ current_user.email }},
  @addson1 = {{ addson1 }},
  @addson2 = {{ addson2 }},
  @addson3 = {{ addson3 }}