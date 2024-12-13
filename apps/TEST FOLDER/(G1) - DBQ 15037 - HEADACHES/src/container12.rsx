<Container
  id="container12"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  marginType="normal"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle12"
      horizontalAlign="center"
      marginType="normal"
      value="#### SECTION VI - DIAGNOSTIC TESTING"
      verticalAlign="center"
    />
  </Header>
  <View id="a8b47" viewKey="View 1">
    <Text
      id="text41"
      marginType="normal"
      style={{ ordered: [{ color: "warning" }] }}
      value="**NOTE: Diagnostic testing is not required for this examination report; if studies have already been completed, provide the most recent results below.**"
      verticalAlign="center"
    />
    <RadioGroup
      id="rg_yn6"
      formDataKey="RG_yn6"
      groupLayout="wrap"
      itemMode="static"
      label="6A. Are there any other significant diagnostic test findings and/or results?"
      labelPosition="top"
      marginType="normal"
      required={true}
      value="null"
    >
      <Option id="993ad" value="Yes" />
      <Option id="ea7a8" value="No" />
      <Event
        event="change"
        method="clearValue"
        params={{
          ordered: [
            { options: { object: { block: "nearest", behavior: "auto" } } },
          ],
        }}
        pluginId="ti_split_typeoftestprocedure"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ti_split_datediagnostic"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ta_split_resultsdiagnostic"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{rg_yn6.value == 'No'}}"
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="textAreaDiagnosticTestingExample"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <Include src="./container13.rsx" />
    <TextArea
      id="textAreaDiagnosticTestingExample"
      autoResize={true}
      disabled="true"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_145_IFYESPROVIDETYPEOFTESTORPROCEDUREDATEANDRESULTSBRI"
      label="Testing Value - Diagnostic Testing"
      labelPosition="top"
      marginType="normal"
      minLines={2}
    />
  </View>
</Container>
