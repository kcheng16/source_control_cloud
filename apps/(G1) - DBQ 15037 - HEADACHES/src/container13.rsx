<Container
  id="container13"
  disabled={'{{ rg_yn6.value != "Yes"}}'}
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden=""
  marginType="none"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle13"
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="a8b47" viewKey="View 1">
    <Text
      id="text13"
      marginType="normal"
      value="If yes, provide type of test or procedure, date and results (brief summary):"
      verticalAlign="center"
    />
    <TextInput
      id="ti_split_typeoftestprocedure"
      disabled={'{{ rg_yn6.value == "No"}}'}
      label="Type of test or procedure: "
      labelWidth="20"
      marginType="normal"
      required="{{ rg_yn6.value == 'Yes'}}"
    >
      <Event
        event="blur"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="triggerDiagnosticTestingConcat"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="ti_split_datediagnostic"
      disabled={'{{ rg_yn6.value == "No"}}'}
      label="Date:"
      labelWidth="20"
      marginType="normal"
      required="{{rg_yn6.value == 'Yes'}}"
    >
      <Event
        event="blur"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="triggerDiagnosticTestingConcat"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="ta_split_resultsdiagnostic"
      disabled={'{{ rg_yn6.value == "No"}}'}
      label="Results (brief summary):"
      labelWidth="20"
      marginType="normal"
      required="{{rg_yn6.value == 'Yes'}}"
    >
      <Event
        event="blur"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="triggerDiagnosticTestingConcat"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
  </View>
</Container>
