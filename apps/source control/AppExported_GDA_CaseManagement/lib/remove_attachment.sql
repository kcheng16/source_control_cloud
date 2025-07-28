exec MISCData.dbo.spRetool_HSClaims_GrievancesDisputesAppeals_AddDetail
  @case_id = {{ global_case_id.value }},
  @casedetailtype_description = '_RemoveAttachment',
  @casedetail_info = {{ CaseViewer_CaseAttachments.selectedRow.attachment_id }},
  @operator = {{ current_user.email }}
