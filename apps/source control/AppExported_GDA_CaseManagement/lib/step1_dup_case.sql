exec MISCData.dbo.spRetool_HSClaims_GrievancesDisputesAppeals_CreateCase
  @lob = {{ CaseBasicInfo.value.lob }} ,
  @casetype_description = {{ casetype_description }} ,
  @case_priority = {{ CaseBasicInfo.value.case_priority }},
  @case_received_on = {{ CaseBasicInfo.value.Case_Received_Date }},
  @case_initiator = {{ CaseBasicInfo.value.case_initiator }},
  @case_memberid = {{ CaseBasicInfo.value.case_memberid }},
  @case_membername = {{ CaseBasicInfo.value.Reference_Member_Name }},
  @case_ref = {{ CaseBasicInfo.value.case_ref }},
  @case_ref_type = {{ CaseBasicInfo.value.case_ref_type }},
  @case_ref_start_date = {{ CaseBasicInfo.value.Reference_Start_Date }},
  @case_ref_end_date = {{ CaseBasicInfo.value.Reference_End_Date }},
  @case_ref_bill_amount = {{ CaseBasicInfo.value.Reference_Bill_Amount }},
  @case_ref_providerid = {{ CaseBasicInfo.value.Reference_Provider_ID }},
  @case_ref_providername = {{ CaseBasicInfo.value.Reference_Provider_Name }},
  @case_ref_providercontract = {{ CaseBasicInfo.value.Reference_Provider_Contract }},
  @case_open_comment = {{ 'Converted from Case '
                          + global_case_id.value
                          + ' on '
                          + new Date().toLocaleString() }},
  @operator = {{ current_user.email }}