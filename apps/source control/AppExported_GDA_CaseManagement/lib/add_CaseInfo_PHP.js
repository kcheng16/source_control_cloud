// Add Case Info to CurrentCaseInput
let init_value = CurrentCaseInput.value;

let case_info_basic = {
  'Case Type': PHP_CaseType_input.value,
  'Case Priority': ['Pre-Service Appeal'].includes(PHP_CaseType_input.value) ? PHP_Priority_input.value : 'NA',
  'Case Received Date': (PHP_CaseType_input.value == 'Pre-Service Appeal' && PHP_Priority_input.value == 'Expedited' ?
                         moment(PHP_CaseReceivedDate_input.value.substring(0, 10) + ' ' + PHP_CaseReceivedTime_input.value).format('MM/DD/yyyy HH:mm:ss.SSS') :
                         moment(PHP_CaseReceivedDate_input.value).format('MM/DD/yyyy')),
  'Case Initiator': PHP_CaseInitiator_input.value,
  'Case Open Comment': PHP_OpenComment_input.value,
  'ServiceNow Ticket No': PHP_SNTicketNo_input.value == '' ? 'NA' : PHP_SNTicketNo_input.value
};

let ref_value;
if (PHP_CaseRef_Container.currentViewKey == 'Automatic Fill'){
  ref_value = {
    'Member ID': (PHP_CaseType_input.value == 'Pre-Service Appeal' ?
                  PAViewer_table.selectedRow.fldMemberID :
                  ClaimViewer_table.selectedRow.MemberID),
    'Member Name': (PHP_CaseType_input.value == 'Pre-Service Appeal' ?
                    PAViewer_table.selectedRow.MemberName :
                    ClaimViewer_table.selectedRow.MemberName),
    'Case Reference': (PHP_CaseType_input.value == 'Pre-Service Appeal' ?
                       PAViewer_table.selectedRow.fldHSAuthID :
                       ClaimViewer_table.selectedRow.ClaimNumber),
    'Case Reference Type': PHP_CaseType_input.value == 'Pre-Service Appeal' ? 'PA' : 'Claim',
    'Reference Start Date': (PHP_CaseType_input.value == 'Pre-Service Appeal' ?
                             moment(PAViewer_table.selectedRow.fldBeginDate).format('MM/DD/yyyy') :
                             moment(ClaimViewer_table.selectedRow.ClaimFromDate).format('MM/DD/yyyy')),
    'Reference End Date': (PHP_CaseType_input.value == 'Pre-Service Appeal' ?
                           moment(PAViewer_table.selectedRow.fldEndDate).format('MM/DD/yyyy') :
                           moment(ClaimViewer_table.selectedRow.ClaimToDate).format('MM/DD/yyyy')),
    'Reference Provider ID': (PHP_CaseType_input.value == 'Pre-Service Appeal' ?
                             PAViewer_table.selectedRow.ServProvID :
                             ClaimViewer_table.selectedRow.BillingProvID),
    'Reference Provider Name': (PHP_CaseType_input.value == 'Pre-Service Appeal' ?
                                PAViewer_table.selectedRow.ServProvName :
                                ClaimViewer_table.selectedRow.BillingProvName),
    'Reference Provider Contract': (PHP_CaseType_input.value == 'Pre-Service Appeal' ?
                                    'NA' :
                                    ClaimViewer_table.selectedRow.fldBillingProvContract),
    'Reference Bill Amount': (PHP_CaseType_input.value == 'Pre-Service Appeal' ?
                              null :
                              ClaimViewer_table.selectedRow.BillAmount),
  };
} else if (PHP_CaseRef_Container.currentViewKey == 'Manual Input'){
  ref_value = {
    'Member ID': MemberViewer_table.selectedRow.MembID,
    'Member Name': MemberViewer_table.selectedRow.FirstNM + ' ' + MemberViewer_table.selectedRow.LastNM,
    'Case Reference': PHP_CaseRef_input.value,
    'Case Reference Type': PHP_CaseRefType_input.value,
    'Reference Start Date': PHP_CaseRefStartDate_input.value,
    'Reference End Date': PHP_CaseRefEndDate_input.value,
    'Reference Provider ID': PHP_CaseRefProviderID_input.value,
    'Reference Provider Name': PHP_CaseRefProviderName_input.value,
    'Reference Provider Contract': PHP_CaseRefProviderContract_input.value,
    'Reference Bill Amount': PHP_BillAmount_input.value,
  };
}


CurrentCaseInput.setValue({...init_value, ...case_info_basic, ...ref_value});