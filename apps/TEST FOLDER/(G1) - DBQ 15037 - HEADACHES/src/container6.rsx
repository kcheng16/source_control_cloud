<Container
  id="container6"
  disabled="{{!cb_157_otherspecifytypeofheada.value}}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden=""
  marginType="normal"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle6"
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="a8b47" viewKey="View 1">
    <TextInput
      id="ti_82_otherdiagnosis1"
      disabled=""
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_82_OTHERDIAGNOSIS1"
      label="Other Diagnosis #1:"
      labelWidth="25"
      marginType="normal"
    >
      <Event
        enabled="{{self.value.length == 0}}"
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "ti_83_icdcode.clearValue();\nti_84_dateofdiagnosis.clearValue();\nti_86_icdcode.clearValue();\nti_87_dateofdiagnosis.clearValue();\nti_88_otherdiagnosis3.clearValue();\nti_89_icdcode.clearValue();\nti_90_dateofdiagnosis.clearValue();\nta_91_1cifthereareadditionaldi.clearValue();\nti_85_otherdiagnosis2.clearValue();",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="ti_83_icdcode"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_83_ICDCODE"
      label="ICD Code:"
      labelWidth="30"
      marginType="normal"
      required="{{ti_82_otherdiagnosis1.value.length > 0}}"
    />
    <TextInput
      id="ti_84_dateofdiagnosis"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_84_DATEOFDIAGNOSIS"
      label="Date of Diagnosis:"
      labelWidth="30"
      marginType="normal"
      required="{{ti_82_otherdiagnosis1.value.length > 0}}"
    />
    <Spacer id="spacer6" marginType="normal" />
    <TextInput
      id="ti_85_otherdiagnosis2"
      disabled="{{ !ti_82_otherdiagnosis1.value }}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_85_OTHERDIAGNOSIS2"
      label="Other Diagnosis #2:"
      labelWidth="25"
      marginType="normal"
    >
      <Event
        enabled="{{self.value.length == 0}}"
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "ti_86_icdcode.clearValue();\nti_87_dateofdiagnosis.clearValue();\nti_88_otherdiagnosis3.clearValue();\nti_89_icdcode.clearValue();\nti_90_dateofdiagnosis.clearValue();\nta_91_1cifthereareadditionaldi.clearValue();",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="ti_86_icdcode"
      disabled="{{!ti_85_otherdiagnosis2.value}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_86_ICDCODE"
      label="ICD Code:"
      labelWidth="30"
      marginType="normal"
      required="{{ti_85_otherdiagnosis2.value.length > 0}}"
    />
    <TextInput
      id="ti_87_dateofdiagnosis"
      disabled="{{!ti_85_otherdiagnosis2.value}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_87_DATEOFDIAGNOSIS"
      label="Date of Diagnosis:"
      labelWidth="30"
      marginType="normal"
      required="{{ti_85_otherdiagnosis2.value.length > 0}}"
    />
    <Spacer id="spacer7" marginType="normal" />
    <TextInput
      id="ti_88_otherdiagnosis3"
      disabled="{{!ti_85_otherdiagnosis2.value}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_88_OTHERDIAGNOSIS3"
      label="Other Diagnosis #3:"
      labelWidth="25"
      marginType="normal"
    >
      <Event
        enabled="{{ self.value.length == 0}}"
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: "ti_89_icdcode.clearValue();\nti_90_dateofdiagnosis.clearValue();\nta_91_1cifthereareadditionaldi.clearValue();",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <TextInput
      id="ti_89_icdcode"
      disabled="{{!ti_88_otherdiagnosis3.value}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_89_ICDCODE"
      label="ICD Code:"
      labelWidth="30"
      marginType="normal"
      required="{{ti_88_otherdiagnosis3.value.length > 0}}"
    />
    <TextInput
      id="ti_90_dateofdiagnosis"
      disabled="{{!ti_88_otherdiagnosis3.value}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_90_DATEOFDIAGNOSIS"
      label="Date of Diagnosis:"
      labelWidth="30"
      marginType="normal"
      required="{{ti_88_otherdiagnosis3.value.length > 0}}"
    />
  </View>
</Container>
