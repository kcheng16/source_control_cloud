select *
from MISCData.dbo.Retool_HSClaims_GrievancesDisputesAppeals_CaseHeader
where case_id = {{ global_case_id.value }}