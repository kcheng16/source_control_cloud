<Container
  id="container11"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  marginType="normal"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle11"
      horizontalAlign="center"
      marginType="normal"
      value="#### SECTION V - OTHER PERTINENT PHYSICAL FINDINGS, COMPLICATIONS, CONDITIONS, SIGNS, SYMPTOMS, AND SCARS"
      verticalAlign="center"
    />
  </Header>
  <View id="a8b47" viewKey="View 1">
    <RadioGroup
      id="rg_5ayn"
      formDataKey="RG_5AYN"
      groupLayout="wrap"
      itemMode="static"
      label="5A. Does the Veteran have any other pertinent physical findings, complications, conditions, signs or symptoms related to any conditions listed in the diagnosis section above?"
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
        params={{ ordered: [] }}
        pluginId="ta_139_ifyesdescribebriefsumma"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <TextArea
      id="ta_139_ifyesdescribebriefsumma"
      autoResize={true}
      disabled={'{{rg_5ayn.value != "Yes"}}'}
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_139_IFYESDESCRIBEBRIEFSUMMARY"
      label="If yes, describe (brief summary):"
      labelPosition="top"
      marginType="normal"
      minLines={2}
      required={'{{rg_5ayn.value == "Yes"}}'}
    />
    <RadioGroup
      id="rg_5byn"
      formDataKey="RG_5BYN"
      groupLayout="wrap"
      itemMode="static"
      label="5B. Does the Veteran have any scars or other disfigurement (of the skin) related to any conditions or to the treatment of any conditions listed in the diagnosis section?"
      labelPosition="top"
      marginType="normal"
      required={true}
      value="null"
    >
      <Option id="993ad" value="Yes" />
      <Option id="ea7a8" value="No" />
    </RadioGroup>
    <Text
      id="text10"
      hidden="{{ rg_5byn.value != 'Yes'}}"
      marginType="normal"
      style={{ ordered: [{ color: "warning" }] }}
      value="**If yes, also complete the appropriate dermatological questionnaire.**"
      verticalAlign="center"
    />
    <Button
      id="button7"
      hidden="{{ rg_5byn.value != 'Yes'}}"
      marginType="normal"
      text="Add"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "parent.postMessage({'event':'addDbq','payload':{'wsid': '13015'}},'*');",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="text45"
      hidden="{{ rg_5byn.value != 'Yes'}}"
      marginType="normal"
      style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
      value="Add Scar DBQ"
      verticalAlign="center"
    />
    <Text
      id="text11"
      marginType="normal"
      value="Note: If there are multiple scars, enter additional locations and measurements in Comments section below."
      verticalAlign="center"
    />
    <TextArea
      id="ta_142_5ccommentsifany"
      autoResize={true}
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_142_5CCOMMENTSIFANY"
      label="5C. Comments, if any:"
      labelPosition="top"
      marginType="normal"
      minLines={2}
    />
  </View>
</Container>
