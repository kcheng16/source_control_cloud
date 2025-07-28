<Container
  id="CMSAppeal_WOL"
  disabled="{{ CaseBasicInfo.value.latest_audit_event != 'Health_Plan_Reconsideration' }}"
  footerPadding="0"
  headerPadding="4px 12px"
  heightType="fixed"
  hidden="{{ CaseBasicInfo.value.WOLAOR_req != 'Require WOL' }}"
  padding="12px"
  showBody={true}
  showFooter={true}
>
  <Header>
    <Text
      id="containerTitle2"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="44204" viewKey="View 1">
    <Date
      id="CMSAppeal_WOL1stRequestDate_input"
      dateFormat="MM/dd/yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      iconBefore="bold/interface-calendar"
      label="WOL 1st Request Date"
      labelWidth="50"
      labelWrap={true}
      margin="0"
      showClear={true}
      value="{{ CaseBasicInfo.value?.WOL_1st_Request_Date }}"
    />
    <Date
      id="CMSAppeal_WOL2ndRequestDate_input"
      dateFormat="MM/dd/yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      disabled="{{ formatDataAsArray(pull_CaseDetail.data)
    .filter(x => x.casedetailtype_description == 'WOL_1st_Request_Date')
    .length == 0
}}"
      iconBefore="bold/interface-calendar"
      label="WOL 2nd Request Date"
      labelWidth="50"
      labelWrap={true}
      margin="0"
      showClear={true}
      value="{{ CaseBasicInfo.value?.WOL_2nd_Request_Date }}"
    />
    <Date
      id="CMSAppeal_WOL3rdRequestDate_input"
      dateFormat="MM/dd/yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      disabled="{{ formatDataAsArray(pull_CaseDetail.data)
    .filter(x => x.casedetailtype_description == 'WOL_2nd_Request_Date')
    .length == 0
}}"
      iconBefore="bold/interface-calendar"
      label="WOL 3rd Request Date"
      labelWidth="50"
      labelWrap={true}
      margin="0"
      showClear={true}
      value="{{ CaseBasicInfo.value?.WOL_3rd_Request_Date }}"
    />
    <Date
      id="CMSAppeal_WOLReceivedDate_input"
      dateFormat="MM/dd/yyyy"
      datePlaceholder="{{ self.dateFormat.toUpperCase() }}"
      disabled="{{ check_RequiredDocuments.data?.filter(x => x?.['Required Doc'] == 'Waiver of Liability')[0]?.Status == 'Not Found' }}"
      iconBefore="bold/interface-calendar"
      label="WOL Received Date"
      labelCaption="Upload WOL in advance"
      labelPosition="top"
      labelWidth="50"
      labelWrap={true}
      margin="0"
      required="{{  CaseBasicInfo.value.WOLAOR_req == 'Require WOL' }}"
      showClear={true}
      value="{{ CaseBasicInfo.value?.WOL_Received_Date }}"
    />
  </View>
  <Footer>
    <Button
      id="button18"
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
              src: "let RequestDt_1st = \n  formatDataAsArray(pull_CaseDetail.data)\n    .filter(x => x.casedetailtype_description == 'WOL_1st_Request_Date' && x.rn_type == 1)\n    .map(x => x.casedetail_info)[0];\nRequestDt_1st = [undefined, null, ''].includes(RequestDt_1st) ? 'Invalid date' : RequestDt_1st;\nlet RequestDt_2nd = \n  formatDataAsArray(pull_CaseDetail.data)\n    .filter(x => x.casedetailtype_description == 'WOL_2nd_Request_Date' && x.rn_type == 1)\n    .map(x => x.casedetail_info)[0];\nRequestDt_2nd = [undefined, null, ''].includes(RequestDt_2nd) ? 'Invalid date' : RequestDt_2nd;\nlet RequestDt_3rd = \n  formatDataAsArray(pull_CaseDetail.data)\n    .filter(x => x.casedetailtype_description == 'WOL_3rd_Request_Date' && x.rn_type == 1)\n    .map(x => x.casedetail_info)[0];\nRequestDt_3rd = [undefined, null, ''].includes(RequestDt_3rd) ? 'Invalid date' : RequestDt_3rd;\nlet ReceiveDt = \n  formatDataAsArray(pull_CaseDetail.data)\n    .filter(x => x.casedetailtype_description == 'WOL_Received_Date' && x.rn_type == 1)\n    .map(x => x.casedetail_info)[0];\nReceiveDt = [undefined, null, ''].includes(ReceiveDt) ? 'Invalid date' : ReceiveDt;\n\n\nif (RequestDt_1st != moment(CMSAppeal_WOL1stRequestDate_input.value).format('MM/DD/yyyy')){\n  add_CaseDetail_General.trigger({\n    additionalScope: {\n      case_id: global_case_id.value,\n      casedetailtype_description: 'WOL_1st_Request_Date',\n      casedetail_info: (CMSAppeal_WOL1stRequestDate_input.value == '' ?\n                        '':\n                        moment(CMSAppeal_WOL1stRequestDate_input.value).format('MM/DD/yyyy'))\n    }\n  })\n};\nif (RequestDt_2nd != moment(CMSAppeal_WOL2ndRequestDate_input.value).format('MM/DD/yyyy')){\n  add_CaseDetail_General.trigger({\n    additionalScope: {\n      case_id: global_case_id.value,\n      casedetailtype_description: 'WOL_2nd_Request_Date',\n      casedetail_info: (CMSAppeal_WOL2ndRequestDate_input.value == '' ?\n                        '':\n                        moment(CMSAppeal_WOL2ndRequestDate_input.value).format('MM/DD/yyyy'))\n    }\n  })\n};\nif (RequestDt_3rd != moment(CMSAppeal_WOL3rdRequestDate_input.value).format('MM/DD/yyyy')){\n  add_CaseDetail_General.trigger({\n    additionalScope: {\n      case_id: global_case_id.value,\n      casedetailtype_description: 'WOL_3rd_Request_Date',\n      casedetail_info: (CMSAppeal_WOL3rdRequestDate_input.value == ''?\n                        '':\n                        moment(CMSAppeal_WOL3rdRequestDate_input.value).format('MM/DD/yyyy'))\n    }\n  })\n};\nif (ReceiveDt != moment(CMSAppeal_WOLReceivedDate_input.value).format('MM/DD/yyyy')){\n  add_CaseDetail_General.trigger({\n    additionalScope: {\n      case_id: global_case_id.value,\n      casedetailtype_description: 'WOL_Received_Date',\n      casedetail_info: (CMSAppeal_WOLReceivedDate_input.value == ''\n                        ? ''\n                        : moment(CMSAppeal_WOLReceivedDate_input.value).format('MM/DD/yyyy'))\n    }\n  })\n};",
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
