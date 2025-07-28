<Container
  id="CMSAppeal_AOR"
  disabled="{{ CaseBasicInfo.value.latest_audit_event != 'Health_Plan_Reconsideration' }}"
  footerPadding="0"
  headerPadding="4px 12px"
  heightType="fixed"
  hidden="{{ CaseBasicInfo.value.WOLAOR_req != 'Require AOR' }}"
  padding="12px"
  showBody={true}
  showFooter={true}
>
  <Header>
    <Text
      id="containerTitle3"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="44204" viewKey="View 1">
    <Date
      id="CMSAppeal_AOR1stRequestDate_input"
      dateFormat="MM/dd/yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      iconBefore="bold/interface-calendar"
      label="AOR 1st Request Date"
      labelWidth="50"
      labelWrap={true}
      margin="0"
      showClear={true}
      value="{{ CaseBasicInfo.value?.AOR_1st_Request_Date }}"
    />
    <Date
      id="CMSAppeal_AOR2ndRequestDate_input"
      dateFormat="MM/dd/yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      disabled="{{ formatDataAsArray(pull_CaseDetail.data)
    .filter(x => x.casedetailtype_description == 'AOR_1st_Request_Date')
    .length == 0
}}"
      iconBefore="bold/interface-calendar"
      label="AOR 2nd Request Date"
      labelWidth="50"
      labelWrap={true}
      margin="0"
      showClear={true}
      value="{{ CaseBasicInfo.value?.AOR_2nd_Request_Date }}"
    />
    <Date
      id="CMSAppeal_AOR3rdRequestDate_input"
      dateFormat="MM/dd/yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      disabled="{{ formatDataAsArray(pull_CaseDetail.data)
    .filter(x => x.casedetailtype_description == 'AOR_2nd_Request_Date')
    .length == 0
}}"
      iconBefore="bold/interface-calendar"
      label="AOR 3rd Request Date"
      labelWidth="50"
      labelWrap={true}
      margin="0"
      showClear={true}
      value="{{ CaseBasicInfo.value?.AOR_3rd_Request_Date }}"
    />
    <Date
      id="CMSAppeal_AORReceivedDate_input"
      dateFormat="MM/dd/yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      disabled="{{ check_RequiredDocuments.data?.filter(x => x?.['Required Doc'] == 'Appointment of Representative')[0]?.Status == 'Not Found' }}"
      iconBefore="bold/interface-calendar"
      label="AOR Received Date"
      labelPosition="top"
      labelWidth="50"
      labelWrap={true}
      margin="0"
      required="{{  CaseBasicInfo.value.WOLAOR_req == 'Require AOR' }}"
      showClear={true}
      value="{{ CaseBasicInfo.value?.AOR_Received_Date }}"
    />
  </View>
  <Footer>
    <Button
      id="button19"
      style={{ ordered: [] }}
      styleVariant="outline"
      submitTargetId=""
      text="Update"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "let RequestDt_1st = \n  formatDataAsArray(pull_CaseDetail.data)\n    .filter(x => x.casedetailtype_description == 'AOR_1st_Request_Date' && x.rn_type == 1)\n    .map(x => x.casedetail_info)[0];\nRequestDt_1st = [undefined, null, ''].includes(RequestDt_1st) ? 'Invalid date' : RequestDt_1st;\nlet RequestDt_2nd = \n  formatDataAsArray(pull_CaseDetail.data)\n    .filter(x => x.casedetailtype_description == 'AOR_2nd_Request_Date' && x.rn_type == 1)\n    .map(x => x.casedetail_info)[0];\nRequestDt_2nd = [undefined, null, ''].includes(RequestDt_2nd) ? 'Invalid date' : RequestDt_2nd;\nlet RequestDt_3rd = \n  formatDataAsArray(pull_CaseDetail.data)\n    .filter(x => x.casedetailtype_description == 'AOR_3rd_Request_Date' && x.rn_type == 1)\n    .map(x => x.casedetail_info)[0];\nRequestDt_3rd = [undefined, null, ''].includes(RequestDt_3rd) ? 'Invalid date' : RequestDt_3rd;\nlet ReceiveDt = \n  formatDataAsArray(pull_CaseDetail.data)\n    .filter(x => x.casedetailtype_description == 'AOR_Received_Date' && x.rn_type == 1)\n    .map(x => x.casedetail_info)[0];\nReceiveDt = [undefined, null, ''].includes(ReceiveDt) ? 'Invalid date' : ReceiveDt;\n\n\nif (RequestDt_1st != moment(CMSAppeal_AOR1stRequestDate_input.value).format('MM/DD/yyyy')){\n  add_CaseDetail_General.trigger({\n    additionalScope: {\n      case_id: global_case_id.value,\n      casedetailtype_description: 'AOR_1st_Request_Date',\n      casedetail_info: (CMSAppeal_AOR1stRequestDate_input.value == '' ?\n                        '':\n                        moment(CMSAppeal_AOR1stRequestDate_input.value).format('MM/DD/yyyy'))\n    }\n  })\n};\nif (RequestDt_2nd != moment(CMSAppeal_AOR2ndRequestDate_input.value).format('MM/DD/yyyy')){\n  add_CaseDetail_General.trigger({\n    additionalScope: {\n      case_id: global_case_id.value,\n      casedetailtype_description: 'AOR_2nd_Request_Date',\n      casedetail_info: (CMSAppeal_AOR2ndRequestDate_input.value == '' ?\n                        '':\n                        moment(CMSAppeal_AOR2ndRequestDate_input.value).format('MM/DD/yyyy'))\n    }\n  })\n};\nif (RequestDt_3rd != moment(CMSAppeal_AOR3rdRequestDate_input.value).format('MM/DD/yyyy')){\n  add_CaseDetail_General.trigger({\n    additionalScope: {\n      case_id: global_case_id.value,\n      casedetailtype_description: 'AOR_3rd_Request_Date',\n      casedetail_info: (CMSAppeal_AOR3rdRequestDate_input.value == ''?\n                        '':\n                        moment(CMSAppeal_AOR3rdRequestDate_input.value).format('MM/DD/yyyy'))\n    }\n  })\n};\nif (ReceiveDt != moment(CMSAppeal_AORReceivedDate_input.value).format('MM/DD/yyyy')){\n  add_CaseDetail_General.trigger({\n    additionalScope: {\n      case_id: global_case_id.value,\n      casedetailtype_description: 'AOR_Received_Date',\n      casedetail_info: (CMSAppeal_AORReceivedDate_input.value == ''\n                        ? ''\n                        : moment(CMSAppeal_AORReceivedDate_input.value).format('MM/DD/yyyy'))\n    }\n  })\n};",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</Container>
