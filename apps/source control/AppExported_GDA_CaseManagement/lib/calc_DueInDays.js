let DueInDays_prep = 
  {{  
    formatDataAsArray(pull_CaseList.data)
    .map(x => [x.case_id,
               x.latest_audit_event_id.startsWith('AC9') || !['Health_Plan_Reconsideration', 'Case_Open'].includes(x.latest_audit_event)
                 ? null
                 : DueDateCalculation({LOB: x.lob,
                                       CaseType: x.casetype_description,
                                       CasePriority: x.case_priority,
                                       MilestoneEvent: x.latest_milestone_event,
                                       MilestoneDate: x.latest_milestone_datetime,
                                       TimeFrame: duedate_TimeFrame.value,
                                       WOLAOR_req: (x.WOLAOR_req == 'Not Required' ? false : true)})]
        ) 
  }};

let DueInDays_raw = DueInDays_prep.map(x => [x[0], x[1]?.days == 'ASAP' ? 'ASAP' : x[1]]);
let DueInDays_categorized = DueInDays_prep.map(x => [x[0], x[1]?.days == 'ASAP' ? 'ASAP' :
                                                           x[1]?.days < 0 ? 'Overdue' :
                                                           x[1]?.days < 3 ? 'Less than 3 days':
                                                           x[1]?.days < 10 ? '3-10 days' :
                                                           x[1]?.days > 10 ? 'Greater than 10 days' : 
                                                           'Not Applicable']);

return {'raw': Object.fromEntries(DueInDays_raw), 'categorized': Object.fromEntries(DueInDays_categorized)};