<Container
  id="container9"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  marginType="normal"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle9"
      horizontalAlign="center"
      marginType="normal"
      value="#### SECTION III - SYMPTOMS"
      verticalAlign="center"
    />
  </Header>
  <View id="a8b47" viewKey="View 1">
    <RadioGroup
      id="rg_yn3a"
      formDataKey="RG_YN3A"
      groupLayout="wrap"
      itemMode="static"
      label="3A. Does the Veteran experience headache pain?"
      labelPosition="top"
      marginType="normal"
      required={true}
      value="null"
    >
      <Option id="993ad" value="Yes" />
      <Option id="ea7a8" value="No" />
      <Event
        enabled={'{{rg_yn3a.value == "No"}}'}
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="cbg_headachepain"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled={'{{rg_yn3a.value == "No"}}'}
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ti_104_describe"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled={'{{rg_yn3a.value == "No"}}'}
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="rg_3crg"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled={'{{rg_yn3a.value == "No"}}'}
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="rg_3drg"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ti_119_describe"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ti_124_describe"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <CheckboxGroup
      id="cbg_headachepain"
      disabled="{{rg_yn3a.value != 'Yes'}}"
      groupLayout="singleColumn"
      itemMode="static"
      label={'(If "Yes," check all that apply to headache pain):'}
      labelPosition="top"
      labelWrap={true}
      marginType="normal"
      required="{{rg_yn3a.value == 'Yes'}}"
      value=""
    >
      <Option
        id="54f2a"
        label="Constant head pain"
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_98_CONSTANTHEADPAIN"
      />
      <Option
        id="1b204"
        label="Pulsating or throbbing head pain"
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_99_PULSATINGORTHROBBINGHEADPAIN"
      />
      <Option
        id="8c7db"
        label="Pain localized to one side of the head"
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_100_PAINLOCALIZEDTOONESIDEOFTHEHEAD"
      />
      <Option
        id="a3c6e"
        disabled={false}
        hidden={false}
        label="Pain on both sides of the head"
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_101_PAINONBOTHSIDESOFTHEHEAD"
      />
      <Option
        id="15d06"
        disabled={false}
        hidden={false}
        label="Pain worsens with physical activity"
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_102_PAINWORSENSWITHPHYSICALACTIVITY"
      />
      <Option
        id="d9977"
        disabled={false}
        hidden={false}
        label="Other, describe: "
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_103_OTHERDESCRIBE"
      />
      <Event
        enabled="{{!cbg_headachepain.value.includes('DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_103_OTHERDESCRIBE')}}"
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ti_104_describe"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </CheckboxGroup>
    <TextInput
      id="ti_104_describe"
      disabled="{{!cbg_headachepain.value.includes('DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_103_OTHERDESCRIBE')}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_104_DESCRIBE"
      hidden=""
      label=""
      labelPosition="top"
      marginType="normal"
      required="{{cbg_headachepain.value.includes('DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_103_OTHERDESCRIBE')}}"
    />
    <RadioGroup
      id="rg_yn3b"
      disabled=""
      formDataKey="RG_YN3B"
      groupLayout="wrap"
      itemMode="static"
      label="3B. Does the Veteran experience non-headache symptoms associated with headaches? (Including symptoms associated with an aura prior to headache pain)"
      labelPosition="top"
      marginType="normal"
      required={true}
      value="null"
    >
      <Option id="993ad" value="Yes" />
      <Option id="ea7a8" value="No" />
      <Event
        enabled={'{{rg_yn3b.value == "No"}}'}
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="cbg_nonheadache"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled={'{{rg_yn3b.value == "No"}}'}
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ti_114_describe"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <CheckboxGroup
      id="cbg_nonheadache"
      disabled="{{rg_yn3b.value != 'Yes'}}"
      groupLayout="singleColumn"
      itemMode="static"
      label={'(If "Yes," check all that apply):'}
      labelPosition="top"
      labelWrap={true}
      marginType="normal"
      required={'{{rg_yn3b.value == "Yes"}}'}
      value=""
    >
      <Option
        id="54f2a"
        label="Nausea"
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_107_NAUSEA"
      />
      <Option
        id="1b204"
        label="Vomiting"
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_108_VOMITING"
      />
      <Option
        id="8c7db"
        label="Sensitivity to light"
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_109_SENSITIVITYTOLIGHT"
      />
      <Option
        id="a3c6e"
        disabled={false}
        hidden={false}
        label="Sensitivity to sound"
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_110_SENSITIVITYTOSOUND"
      />
      <Option
        id="15d06"
        disabled={false}
        hidden={false}
        label="Changes in vision (such as scotoma, flashes of light, tunnel vision)"
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_111_CHANGESINVISIONSUCHASSCOTOMAFLASHESOFLIGHTTUNNELVI"
      />
      <Option
        id="881bd"
        disabled={false}
        hidden={false}
        label="Sensory changes (such as feeling of pins and needles in extremities)"
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_112_SENSORYCHANGESSUCHASFEELINGOFPINSANDNEEDLESINEXTRE"
      />
      <Option
        id="d9977"
        disabled={false}
        hidden={false}
        label="Other, describe: "
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_113_OTHERDESCRIBE"
      />
      <Event
        enabled="{{!cbg_nonheadache.value.includes('DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_113_OTHERDESCRIBE')}}"
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ti_114_describe"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </CheckboxGroup>
    <TextInput
      id="ti_114_describe"
      disabled="{{!cbg_nonheadache.value.includes('DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_113_OTHERDESCRIBE')}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_114_DESCRIBE"
      hidden=""
      label=""
      labelPosition="top"
      marginType="normal"
      required="{{cbg_nonheadache.value.includes('DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_113_OTHERDESCRIBE')}}"
    />
    <RadioGroup
      id="rg_3crg"
      disabled="{{rg_yn3a.value != 'Yes'}}"
      formDataKey="RG_3CRG"
      groupLayout="singleColumn"
      itemMode="static"
      label="3C. Indicate duration of typical head pain"
      labelPosition="top"
      labelWrap={true}
      marginType="normal"
      required="{{rg_yn3a.value == 'Yes'}}"
      value="null"
    >
      <Option id="993ad" value="Less than 1 day" />
      <Option id="ea7a8" value="1-2 days" />
      <Option id="c34d2" value="More than 2 days" />
      <Option
        id="f86fd"
        disabled={false}
        hidden={false}
        label="Other, describe:"
        value="Other, describe"
      />
      <Event
        enabled=""
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ti_119_describe"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <TextInput
      id="ti_119_describe"
      disabled={'{{rg_3crg.value != "Other, describe"}}'}
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_119_DESCRIBE"
      hidden=""
      label=""
      labelPosition="top"
      marginType="normal"
      required={'{{rg_3crg.value == "Other, describe"}}'}
    />
    <RadioGroup
      id="rg_3drg"
      disabled="{{rg_yn3a.value != 'Yes'}}"
      formDataKey="RG_3DRG"
      groupLayout="singleColumn"
      itemMode="static"
      label="3D. Indicate location of typical head pain"
      labelCaption="NOTE: Make sure this response is consistent with the response in 3A above regarding laterality."
      labelPosition="top"
      labelWrap={true}
      marginType="normal"
      required="{{rg_yn3a.value == 'Yes'}}"
      style={{ ordered: [{ caption: "info" }] }}
      value="null"
    >
      <Option id="993ad" value="Right side of head" />
      <Option id="ea7a8" value="Left side of head" />
      <Option id="c34d2" value="Both sides of head" />
      <Option
        id="f86fd"
        disabled={false}
        hidden={false}
        label="Other, describe:"
        value="Other, describe"
      />
      <Event
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ti_124_describe"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <TextInput
      id="ti_124_describe"
      disabled={'{{rg_3drg.value != "Other, describe"}}'}
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_124_DESCRIBE"
      hidden=""
      label=""
      labelPosition="top"
      marginType="normal"
      required={'{{rg_3drg.value == "Other, describe"}}'}
    />
  </View>
</Container>
