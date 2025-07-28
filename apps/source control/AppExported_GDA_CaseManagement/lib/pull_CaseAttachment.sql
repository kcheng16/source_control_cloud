select attachment_id, attachment_name, attachment_desc, attachment_sizeBytes, attachment_upload_by, attachment_upload_datetime
from MISCData.dbo.Retool_HSClaims_GrievancesDisputesAppeals_CaseAttachment with (nowait)
where case_id = {{ global_case_id.value }}
and attachment_delete_datetime is null