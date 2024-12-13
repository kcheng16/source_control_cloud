<Container
  id="container10"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  marginType="normal"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle10"
      horizontalAlign="center"
      marginType="normal"
      value="#### SECTION IV - PROSTRATING ATTACKS OF HEADACHE PAIN"
      verticalAlign="center"
    />
  </Header>
  <View id="a8b47" viewKey="View 1">
    <Text
      id="text9"
      marginType="normal"
      style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
      value={
        '<span style="color:#CD6F00">Note:</span> For VA purposes, the term prostrating means “causing extreme exhaustion, powerlessness, debilitation or incapacitation with substantial inability to engage in ordinary activities.” Please complete both questions 4A and 4B.'
      }
      verticalAlign="center"
    />
    <Divider id="divider1" marginType="normal" />
    <RadioGroup
      id="rg_yn4a"
      formDataKey="RG_YN4A"
      groupLayout="wrap"
      itemMode="static"
      label="4A. Migraine / non-migraine -- Does the Veteran have characteristic prostrating attacks of migraine / non-migraine pain?"
      labelPosition="top"
      marginType="normal"
      required={true}
      value="null"
    >
      <Option id="993ad" value="Yes" />
      <Option id="ea7a8" value="No" />
      <Event
        enabled={'{{rg_yn4a.value == "No"}}'}
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="rg_4arg"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <RadioGroup
      id="rg_4arg"
      disabled="{{rg_yn4a.value != 'Yes'}}"
      formDataKey="RG_4ARG"
      groupLayout="singleColumn"
      itemMode="static"
      label={
        '(If "Yes," indicate frequency, on average, of prostrating attacks over the last several months):'
      }
      labelPosition="top"
      labelWrap={true}
      marginType="normal"
      required={'{{rg_yn4a.value == "Yes"}}'}
      value="null"
    >
      <Option id="993ad" value="With less frequent attacks" />
      <Option id="ea7a8" value="Once in 2 months" />
      <Option id="c34d2" value="Once every month" />
      <Option
        id="f86fd"
        disabled={false}
        hidden={false}
        value="Greater than once per month"
      />
    </RadioGroup>
    <RadioGroup
      id="rg_yn4b"
      formDataKey="RG_YN4B"
      groupLayout="wrap"
      itemMode="static"
      label="4B. Does the Veteran have completely prostrating and prolonged attacks of migraines / non-migraine pain?"
      labelPosition="top"
      marginType="normal"
      required={true}
      value="null"
    >
      <Option id="993ad" value="Yes" />
      <Option id="ea7a8" value="No" />
      <Event
        enabled={'{{rg_yn4b.value == "No"}}'}
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="rg_4brg"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <RadioGroup
      id="rg_4brg"
      disabled="{{rg_yn4b.value != 'Yes'}}"
      formDataKey="RG_4BRG"
      groupLayout="singleColumn"
      itemMode="static"
      label={
        '(If "Yes," indicate frequency, on average, of completely prostrating attacks over the last several months):'
      }
      labelPosition="top"
      labelWrap={true}
      marginType="normal"
      required={'{{rg_yn4b.value == "Yes"}}'}
      value="null"
    >
      <Option id="993ad" value="With less frequent attacks" />
      <Option id="ea7a8" value="Once in 2 months" />
      <Option id="c34d2" value="Once every month" />
      <Option
        id="f86fd"
        disabled={false}
        hidden={false}
        value="Greater than once per month"
      />
    </RadioGroup>
  </View>
</Container>
