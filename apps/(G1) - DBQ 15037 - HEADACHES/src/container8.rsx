<Container
  id="container8"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  margin="0"
  marginType="none"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle8"
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="a8b47" viewKey="View 1">
    <TextInput
      id="ti_split_dateofonset"
      label="Date of Onset"
      labelWidth="20"
      labelWrap={true}
      marginType="normal"
      required={true}
    >
      <Event
        event="blur"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="triggerMedicalHistoryConcat"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="ti_split_detailsofonset"
      label="Details of Onset"
      labelWidth="20"
      marginType="normal"
      required={true}
    >
      <Event
        event="blur"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="triggerMedicalHistoryConcat"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <RadioGroup
      id="rg_split_courseofcondition"
      groupLayout="wrap"
      itemMode="static"
      label="Course of condition since onset"
      labelPosition="top"
      marginType="normal"
      required={true}
      value="null"
    >
      <Option id="52b8f" value="Progressed/worsened" />
      <Option id="39cdb" value="Stayed the Same" />
      <Option id="a3555" value="Improved" />
      <Option id="c7b6e" disabled={false} hidden={false} value="Resolved" />
      <Option
        id="3b8c7"
        disabled={false}
        hidden={false}
        value="Other, please describe"
      />
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="triggerMedicalHistoryConcat"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{rg_split_courseofcondition.value != 'Other, please describe'}}"
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ti_split_medhistoryotherdescribe"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <TextInput
      id="ti_split_medhistoryotherdescribe"
      disabled="{{rg_split_courseofcondition.value != 'Other, please describe'}}"
      hidden=""
      label="Please describe course:"
      labelPosition="top"
      marginType="normal"
      required="{{rg_split_courseofcondition.value == 'Other, please describe'}}"
    >
      <Event
        event="blur"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="triggerMedicalHistoryConcat"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="ti_split_currentsymptoms"
      label="Current symptoms (or state if the condition has resolved)"
      labelWrap={true}
      marginType="normal"
      required={true}
    >
      <Event
        event="blur"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="triggerMedicalHistoryConcat"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="ti_split_anytreatment"
      label="Any treatment, medications or surgery? "
      labelWrap={true}
      marginType="normal"
      required={true}
    >
      <Event
        event="blur"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="triggerMedicalHistoryConcat"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <RadioGroup
      id="rg_split_anypreviousxrays"
      formDataKey="{{self.id}}"
      groupLayout="wrap"
      itemMode="static"
      label="Any previous x-rays/labs/testing (if not available for review, simply state so)?"
      labelPosition="top"
      marginType="normal"
      required={true}
      style={{ ordered: [] }}
      value="null"
    >
      <Option id="76954" value="Yes" />
      <Option id="dea4f" value="No" />
      <Option id="dfaec" value="Not available for review" />
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="triggerMedicalHistoryConcat"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <Text
      id="text40"
      marginType="normal"
      style={{ ordered: [{ color: "info" }] }}
      value="NOTE: If yes, VA will expect any significant results from previous testing be described in the Diagnostic Testing section and incorporated into the exam."
      verticalAlign="center"
    />
  </View>
</Container>
