<Container
  id="container14"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  marginType="normal"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle14"
      horizontalAlign="center"
      marginType="normal"
      value="#### SECTION VII - FUNCTIONAL IMPACT"
      verticalAlign="center"
    />
  </Header>
  <View id="a8b47" viewKey="View 1">
    <Text
      id="text14"
      marginType="normal"
      style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
      value="Note: Provide the impact of only the diagnosed condition(s), without consideration of the impact of other medical conditions or factors, such as age."
      verticalAlign="center"
    />
    <RadioGroup
      id="rg_functional_impact_yn_rg"
      formDataKey="RG_Functional_Impact_YN_RG"
      groupLayout="wrap"
      itemMode="static"
      label="7A. Regardless of the Veteran's current employment status, do the conditions listed in the diagnosis section impact his/her ability to perform any type of occupational task (such as standing, walking, lifting, sitting, etc.)?"
      labelPosition="top"
      labelWrap={true}
      marginType="normal"
      required={true}
      value="null"
    >
      <Option id="993ad" value="Yes" />
      <Option id="ea7a8" value="No" />
      <Event
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ta_148_ifyesdescribethefunctio"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <Text
      id="text43"
      marginType="normal"
      style={{ ordered: [{ color: "info" }] }}
      value="**NOTE: If the veteran is retired, please respond to this question as though the Veteran was not retired (to the greatest extent possible).**"
      verticalAlign="center"
    />
    <TextArea
      id="ta_148_ifyesdescribethefunctio"
      autoResize={true}
      disabled={'{{rg_functional_impact_yn_rg.value != "Yes"}}'}
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_148_IFYESDESCRIBETHEFUNCTIONALIMPACTOFEACHCONDITIONPRO"
      label="If yes, describe the functional impact of each condition, providing one or more examples:"
      labelPosition="top"
      marginType="normal"
      minLines={2}
      required={'{{rg_functional_impact_yn_rg.value == "Yes"}}'}
    />
  </View>
</Container>
