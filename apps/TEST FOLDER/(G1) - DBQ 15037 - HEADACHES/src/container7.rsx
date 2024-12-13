<Container
  id="container7"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  marginType="normal"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle7"
      horizontalAlign="center"
      marginType="normal"
      value="#### SECTION II - MEDICAL HISTORY"
      verticalAlign="center"
    />
  </Header>
  <View id="a8b47" viewKey="View 1">
    <Text
      id="text39"
      marginType="normal"
      style={{ ordered: [{ color: "info" }] }}
      value="**Note: Please provide as many specific details regarding the history of the Veteran's claimed condition as possible:**"
      verticalAlign="center"
    />
    <Text
      id="text5"
      marginType="normal"
      value="**2A. Describe the history, including onset and course, of the Veteran's headache condition(s). Brief summary:**"
      verticalAlign="center"
    />
    <Include src="./container8.rsx" />
    <RadioGroup
      id="rg_2byn"
      formDataKey="RG_2BYN"
      groupLayout="wrap"
      itemMode="static"
      label="2B. Does the Veteran's treatment plan include taking daily prescribed medication for the diagnosed condition(s)?"
      labelPosition="top"
      marginType="normal"
      required={true}
      value="null"
    >
      <Option id="993ad" value="Yes" />
      <Option id="ea7a8" value="No" />
      <Event
        enabled="{{rg_2byn.value == 'No'}}"
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ta_95_ifyeslistonlythosemedica"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <TextArea
      id="ta_95_ifyeslistonlythosemedica"
      autoResize={true}
      disabled={'{{rg_2byn.value == "No"}}'}
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_95_IFYESLISTONLYTHOSEMEDICATIONSUSEDFORTHEDIAGNOSEDCO"
      hidden=""
      label="If yes, list only those medications used for the diagnosed condition(s):"
      labelPosition="top"
      marginType="normal"
      minLines={2}
      required={'{{rg_2byn.value == "Yes"}}'}
    />
    <TextArea
      id="textAreaMedicalHistoryExample"
      autoResize={true}
      disabled="true"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_92_2ADESCRIBETHEHISTORYINCLUDINGONSETANDCOURSEOFTHEVE"
      hidden=""
      label="Testing Value - Medical History"
      labelPosition="top"
      marginType="normal"
      minLines={2}
    />
  </View>
</Container>
