select 
    t.casedetailtype_id
    , cd.*
    , row_number() over (partition by cd.case_id, left(t.casedetailtype_id, 1)
                         order by t.casedetailtype_id desc, cd.casedetail_add_datetime desc) as rn_class_enhanced
    , row_number() over (partition by cd.case_id, left(t.casedetailtype_id, 1)
                         order by cd.casedetail_add_datetime desc) as rn_class_general
    , row_number() over (partition by cd.case_id, left(t.casedetailtype_id, 2)
                         order by cd.casedetail_add_datetime desc) as rn_subclass_general
    , row_number() over (partition by cd.case_id, t.casedetailtype_id
                         order by cd.casedetail_add_datetime desc) as rn_type
from
    MISCData.dbo.Retool_HSClaims_GrievancesDisputesAppeals_CaseDetail cd
    join MISCData.dbo.Retool_HSClaims_GrievancesDisputesAppeals_CaseDetailTypeRef t
    on cd.casedetailtype_description = t.casedetailtype_description
where case_id = {{ global_case_id.value }}