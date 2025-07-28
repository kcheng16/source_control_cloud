insert into MISCData.dbo.Retool_HSClaims_GrievancesDisputesAppeals_CaseAttachment
  (case_id, attachment_name, attachment_desc, attachment_type, attachment_data, attachment_sizeBytes,
   attachment_upload_by, attachment_upload_datetime, attachment_delete_by, attachment_delete_datetime)
  select
    {{ step1_dup_case.data?.case_id[0] }} , attachment_name, attachment_desc, attachment_type, attachment_data, attachment_sizeBytes,
    attachment_upload_by, attachment_upload_datetime, attachment_delete_by, attachment_delete_datetime
  from MISCData.dbo.Retool_HSClaims_GrievancesDisputesAppeals_CaseAttachment
  where case_id = {{ global_case_id.value }}