select * 
from MISCData.dbo.Retool_HSClaims_GrievancesDisputesAppeals_CaseEscalation
where case_id = {{ global_case_id.value }}
order by caseescalation_initiateddate
