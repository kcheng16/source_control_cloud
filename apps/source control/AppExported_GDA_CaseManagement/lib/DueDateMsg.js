// Reference external variables with curly brackets or using JS variables
const DueIn = 
  {{ DueDateCalculation({LOB: CaseBasicInfo.value.lob,
                         CaseType: CaseBasicInfo.value.casetype_description,
                         CasePriority: CaseBasicInfo.value.case_priority,
                         MilestoneEvent: CaseBasicInfo.value.latest_milestone_event,
                         MilestoneDate: CaseBasicInfo.value.latest_milestone_datetime,
                         TimeFrame: duedate_TimeFrame.value,
                         WOLAOR_req: CaseBasicInfo.value.WOLAOR_req == 'Not Required' ? false : true})
  }};

let DueMsg;
if (
  formatDataAsArray({{ pull_CaseDetail.data }})
   .filter(x => x.casedetailtype_id.startsWith('AC9'))
   .length > 0
) {
  DueMsg = "Case Closed";
} else if (DueIn == null || !['Case_Open', 'Health_Plan_Reconsideration'].includes({{ CaseBasicInfo.value.latest_audit_event }})) {
  DueMsg = 'Due Date Not Applicable'
} else if (DueIn?.days == 'ASAP') {
  DueMsg = 'No Due Date, ASAP'
} else if (DueIn?.days < 0) {
  DueMsg = "Over Due " + (-DueIn?.days) + " Day(s) " + (-DueIn?.hours) + " Hour(s)";
} else {
  DueMsg = "Due in " + DueIn?.days + " Day(s) " + DueIn?.hours + " Hour(s)";
}

return DueMsg;
