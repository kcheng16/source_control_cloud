<Container
  id="formTabs"
  currentViewKey="{{ self.viewKeys[0] }}"
  disabled="{{ retoolContext.inEditorMode ? false : getDBQPermission.data?.isFormWritable != true }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  marginType="none"
  padding="12px"
  showBody={true}
  showBorder={false}
  style={{ ordered: [{ border: "rgba(224, 224, 224, 0)" }] }}
>
  <View
    id="31675"
    icon={
      "{{ validationMessages.value[0]?.invalid ? \"/icon:bold/interface-alert-warning-circle-alternate\" : '' }}"
    }
    iconPosition="left"
    viewKey="Exam Information"
  >
    <Container
      id="container20"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      marginType="normal"
      padding="12px"
      showBody={true}
      showHeader={true}
    >
      <Header>
        <Text
          id="text48"
          marginType="normal"
          value="**Note to examiner - The Veteran is applying to the U.S. Department of Veterans Affairs (VA) for disability benefits. VA will consider the information you provide on this questionnaire as part of their evaluation in processing the Veteran's claim.**"
          verticalAlign="center"
        />
      </Header>
      <View id="05ead" viewKey="View 1">
        <Container
          id="container2"
          footerPadding="4px 12px"
          headerPadding="4px 12px"
          marginType="normal"
          padding="12px"
          showBody={true}
        >
          <Header>
            <Text
              id="containerTitle2"
              marginType="normal"
              value="#### Container title"
              verticalAlign="center"
            />
          </Header>
          <View id="a8b47" viewKey="View 1">
            <RadioGroup
              id="rg_introyn"
              disabled="true"
              formDataKey="RG_IntroYN"
              groupLayout="wrap"
              itemMode="static"
              label="Is this questionnaire being completed in conjunction with a VA C&P examination request?"
              labelPosition="top"
              marginType="normal"
              required={true}
              value="{{ self.values[0] }}"
            >
              <Option id="993ad" value="Yes" />
              <Option id="ea7a8" value="No" />
            </RadioGroup>
            <CheckboxGroup
              id="cbg_examination"
              groupLayout="singleColumn"
              itemMode="static"
              label="How was the examination completed? (check all that apply)"
              labelPosition="top"
              marginType="normal"
              required={'{{rg_introyn.value  == "Yes"}}'}
              value=""
            >
              <Option
                id="54f2a"
                label="In-person examination"
                value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_6_INPERSONEXAMINATION"
              />
              <Option
                id="1b204"
                caption="If a record review was completed in conjunction with the exam, please select this option in addition to the correct exam type."
                label="Records reviewed"
                value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_7_RECORDSREVIEWED"
              />
              <Option
                id="8c7db"
                caption="All Tele-C&P exams must be pre-approved with VES and must be completed via HIPAA-compliant video platform."
                label="Examination via approved video telehealth"
                value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_8_EXAMINATIONVIAAPPROVEDVIDEOTELEHEALTH "
              />
              <Option
                id="ab9c2"
                disabled={false}
                hidden={false}
                label="Other, please specify in comment box"
                value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_9_OTHERPLEASESPECIFYINCOMMENTSBOX"
              />
              <Event
                enabled="{{!cbg_examination.value.includes('DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_9_OTHERPLEASESPECIFYINCOMMENTSBOX')}}"
                event="change"
                method="clearValue"
                params={{ ordered: [] }}
                pluginId="ta_10_comments"
                type="widget"
                waitMs="0"
                waitType="debounce"
              />
            </CheckboxGroup>
            <TextArea
              id="ta_10_comments"
              autoResize={true}
              disabled="{{!cbg_examination.value.includes('DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_9_OTHERPLEASESPECIFYINCOMMENTSBOX')}}"
              formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_10_COMMENTS"
              label="Comments "
              labelPosition="top"
              marginType="normal"
              minLines={2}
              required="{{cbg_examination.value.includes('DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_9_OTHERPLEASESPECIFYINCOMMENTSBOX')}}"
            />
          </View>
        </Container>
        <Include src="./container21.rsx" />
        <Include src="./container4.rsx" />
      </View>
    </Container>
  </View>
  <View
    id="4554a"
    icon={
      "{{ validationMessages.value[1]?.invalid ? \"/icon:bold/interface-alert-warning-circle-alternate\" : '' }}"
    }
    iconPosition="left"
    viewKey="I - Diagnosis"
  >
    <Include src="./container5.rsx" />
  </View>
  <View
    id="81857"
    icon={
      "{{ validationMessages.value[2]?.invalid ? \"/icon:bold/interface-alert-warning-circle-alternate\" : '' }}"
    }
    iconPosition="left"
    viewKey="II - Medical History"
  >
    <Include src="./container7.rsx" />
  </View>
  <View
    id="19910"
    disabled={false}
    hidden={false}
    icon={
      "{{ validationMessages.value[3]?.invalid ? \"/icon:bold/interface-alert-warning-circle-alternate\" : '' }}"
    }
    iconPosition="left"
    viewKey="III - Symptoms"
  >
    <Include src="./container9.rsx" />
  </View>
  <View
    id="9e700"
    disabled={false}
    hidden={false}
    icon={
      "{{ validationMessages.value[4]?.invalid ? \"/icon:bold/interface-alert-warning-circle-alternate\" : '' }}"
    }
    iconPosition="left"
    viewKey="IV - Prostrating Attacks"
  >
    <Include src="./container10.rsx" />
  </View>
  <View
    id="4ef6f"
    disabled={false}
    hidden={false}
    icon={
      "{{ validationMessages.value[5]?.invalid ? \"/icon:bold/interface-alert-warning-circle-alternate\" : '' }}"
    }
    iconPosition="left"
    viewKey="V - Other Pertinent Physical Findings"
  >
    <Include src="./container11.rsx" />
  </View>
  <View
    id="27bac"
    disabled={false}
    hidden={false}
    icon={
      "{{ validationMessages.value[6]?.invalid ? \"/icon:bold/interface-alert-warning-circle-alternate\" : '' }}"
    }
    iconPosition="left"
    viewKey="VI - Diagnostic Testing"
  >
    <Include src="./container12.rsx" />
  </View>
  <View
    id="3d84c"
    disabled={false}
    hidden={false}
    icon={
      "{{ validationMessages.value[7]?.invalid ? \"/icon:bold/interface-alert-warning-circle-alternate\" : '' }}"
    }
    iconPosition="left"
    viewKey="VII - Functional Impact"
  >
    <Include src="./container14.rsx" />
  </View>
  <View
    id="5197a"
    disabled={false}
    hidden={false}
    icon={
      "{{ validationMessages.value[8]?.invalid ? \"/icon:bold/interface-alert-warning-circle-alternate\" : '' }}"
    }
    iconPosition="left"
    viewKey="VIII - Remarks"
  >
    <Include src="./container15.rsx" />
  </View>
  <Event
    event="change"
    method="trigger"
    params={{ ordered: [] }}
    pluginId="parseForm"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="change"
    method="validate"
    params={{ ordered: [] }}
    pluginId="form1"
    type="widget"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="change"
    method="trigger"
    params={{ ordered: [] }}
    pluginId="validatecb_43"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    enabled="{{isSubmitAttempt.value}}"
    event="change"
    method="trigger"
    params={{ ordered: [] }}
    pluginId="errorValidation"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    enabled="{{!_.isEqual(varFormData.value,form1.data)}}"
    event="change"
    method="run"
    params={{
      ordered: [
        {
          src: "if(getDBQPermission.data.SignatureExists) {\nparent.postMessage('ClearSignature','*');\n  await new Promise(r => setTimeout(r, 5000));\n  await getDBQPermission.trigger();\n} else {\n  parent.postMessage('save','*');\n}",
        },
      ],
    }}
    pluginId=""
    type="script"
    waitMs="0"
    waitType="debounce"
  />
  <Event
    event="change"
    method="trigger"
    params={{
      ordered: [
        {
          options: {
            ordered: [
              { onSuccess: null },
              { onFailure: null },
              { additionalScope: { ordered: [{ actionType: "save" }] } },
            ],
          },
        },
      ],
    }}
    pluginId="triggerSaveAuditForm"
    type="datasource"
    waitMs="0"
    waitType="debounce"
  />
</Container>
