select * 
from MISCData.dbo.Retool_HSClaims_GrievancesDisputesAppeals_CaseAttachment with (nowait)
where attachment_id = {{ CaseViewer_CaseAttachments.selectedRow.attachment_id }}
