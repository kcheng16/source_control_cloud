;with case_events as
(
	select 
		t.casedetailtype_id
		, cd.*
		, row_number() over (partition by cd.case_id, left(t.casedetailtype_id, 1)
							 order by t.casedetailtype_id desc, cd.casedetail_add_datetime desc) as rn_class_enhanced --Used by Milestone class whose items are strictly ordered
        , row_number() over (partition by cd.case_id, left(t.casedetailtype_id, 1)
							 order by cd.casedetail_add_datetime desc) as rn_class_general
        , row_number() over (partition by cd.case_id, left(t.casedetailtype_id, 2)
                             order by cd.casedetail_add_datetime desc) as rn_subclass_general --Used by Audit subclass specifically
		, row_number() over (partition by cd.case_id, t.casedetailtype_id
							 order by cd.casedetail_add_datetime desc) as rn_type
	from
		MISCData.dbo.Retool_HSClaims_GrievancesDisputesAppeals_CaseDetail cd
		join MISCData.dbo.Retool_HSClaims_GrievancesDisputesAppeals_CaseDetailTypeRef t
		on cd.casedetailtype_description = t.casedetailtype_description
	where
        left(t.casedetailtype_id, 1) in ('A', 'R', 'M', 'I')
        and left(t.casedetailtype_id, 2) <> 'AO' --Exclude Audit-Other
)
select 
    'View' as Button
	, h.*
    , p.casedetail_info as Reference_Provider_Name
    , c.casedetail_info as Reference_Provider_Contract
	, r.casedetail_info as Case_Received_Date
    , o.casedetail_info as Case_Owner
    , sn.casedetail_info as ServiceNow_Ticket_No
    , a.casedetailtype_id as latest_audit_event_id
	, a.casedetailtype_description as latest_audit_event
	, a.casedetail_add_datetime as latest_audit_datetime
	, m.casedetailtype_description as latest_milestone_event
	, m.casedetail_info as latest_milestone_datetime
    , case
        when h.lob = 'PHP'
        then case
              when h.casetype_description in ('Dispute', 'Post-Service Appeal') 
                   and h.case_initiator = 'Member Representative' then 'Require AOR'
              when h.casetype_description in ('Dispute', 'Post-Service Appeal') 
                   and h.case_initiator = 'Provider' and c.casedetail_info != 'CP' then 'Require WOL'
             else 'Not Required' end
        when h.lob = 'PHC' then 'Not Required'
        when h.lob = 'AHF' then 'Not Required'
      end as WOLAOR_req
from
	MISCData.dbo.Retool_HSClaims_GrievancesDisputesAppeals_CaseHeader h

	join case_events r
	on h.case_id = r.case_id
	and r.casedetailtype_description = 'Case_Received_Date'
    and r.rn_type = 1

	join case_events o
	on h.case_id = o.case_id
	and o.casedetailtype_description = 'Case_Owner'
    and o.rn_type = 1  

    join case_events p
	on h.case_id = p.case_id
	and p.casedetailtype_description = 'Reference_Provider_Name'
    and p.rn_type = 1

  	join case_events c
	on h.case_id = c.case_id
	and c.casedetailtype_description = 'Reference_Provider_Contract'
    and c.rn_type = 1

    left join case_events sn
    on h.case_id = sn.case_id
    and sn.casedetailtype_description = 'ServiceNow_Ticket_No'
    and sn.rn_type = 1

	join case_events a
	on h.case_id = a.case_id
	and a.casedetailtype_id like 'A%'
	and a.rn_class_general = 1

	join case_events m
	on h.case_id = m.case_id
	and m.casedetailtype_id like 'M%'
	and m.rn_class_enhanced = 1
where
  {{ global_trigger_bit.value }} = {{ global_trigger_bit.value }}