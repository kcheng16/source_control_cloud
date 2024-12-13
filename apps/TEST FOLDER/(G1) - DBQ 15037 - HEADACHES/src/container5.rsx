<Container
  id="container5"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  marginType="normal"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle5"
      horizontalAlign="center"
      marginType="normal"
      value="#### SECTION I - DIAGNOSIS"
      verticalAlign="center"
    />
  </Header>
  <View id="a8b47" viewKey="View 1">
    <Text
      id="text38"
      marginType="normal"
      style={{ ordered: [{ color: "rgb(0, 0, 0)" }] }}
      value="Note: These are condition(s) for which an evaluation has been requested on the exam request form (Internal VA) or for which the Veteran has requested medical evidence be provided for submission to VA."
      verticalAlign="center"
    />
    <Text
      id="text47"
      marginType="normal"
      style={{ ordered: [{ color: "info" }] }}
      value="**NOTE: The following textbox is disabled which will allow the claimed condition(s) to auto-populate within the Final Report.**"
      verticalAlign="center"
    />
    <TextArea
      id="textAreaClaimedConditions"
      autoResize={true}
      disabled="true"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_42_1ALISTTHECLAIMEDCONDITIONSTHATPERTAINTOTHISQUESTIO"
      label="1A. List the claimed condition(s) that pertain to this questionnaire:"
      labelPosition="top"
      marginType="normal"
      minLines={2}
      style={{ ordered: [] }}
      value="{{ getDBQForm.data?.[0]?.Conditions__c}}"
    />
    <TextArea
      id="ta_42_1alisttheclaimedconditio"
      autoResize={true}
      label="Other claimed conditions that pertain to this questionnaire:"
      labelPosition="top"
      marginType="normal"
      minLines={2}
    >
      <Event
        event="blur"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="triggerClaimedConditionConcat"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextArea>
    <Spacer id="spacer1" marginType="normal" />
    <Text
      id="text4"
      marginType="normal"
      value="Note: These are the diagnoses determined during this current evaluation of the claimed condition(s) listed above. If there is no diagnosis, if the diagnosis is different from a previous diagnosis for this condition, or if there is a diagnosis of a complication due to the claimed condition(s), explain your findings and reasons in the Remarks section. Date of diagnosis can be the date of the evaluation if the clinician is making the initial diagnosis or an approximate date determined through record review or reported history."
      verticalAlign="center"
    />
    <Text
      id="text25"
      marginType="normal"
      value="**1B. Select diagnoses associated with the claimed condition(s) (check all that apply):**"
      verticalAlign="center"
    />
    <IconText
      id="iconText1"
      hidden="{{cb_43_theveterandoesnothaveacu.value || cb_70_migraineincludingmigrain.value ||  
  cb_73_tension.value ||  
  cb_76_cluster.value ||  
  cb_157_otherspecifytypeofheada.value }}"
      icon="bold/interface-alert-warning-circle"
      marginType="normal"
      style={{ ordered: [{ iconColor: "danger" }, { color: "danger" }] }}
      text="At least one selection is required."
    />
    <Checkbox
      id="cb_43_theveterandoesnothaveacu"
      customValidation="{{validatecb_43.data}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_43_THEVETERANDOESNOTHAVEACURRENTDIAGNOSISASSOCIATEDWI"
      hideValidationMessage={true}
      label="The Veteran does not have a current diagnosis associated with any claimed condition(s) listed above. (Explain your findings and reasons in the Remarks section)"
      labelWrap={true}
      marginType="normal"
    >
      <Event
        event="change"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                object: {
                  onSuccess: null,
                  onFailure: null,
                  additionalScope: null,
                },
              },
            },
          ],
        }}
        pluginId="conditoinalClear_1b"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="false"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ta_split_explainfindingsandreasons"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="triggerRemarkConcat"
        type="datasource"
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
    </Checkbox>
    <TextInput
      id="ta_split_explainfindingsandreasons"
      disabled="{{ !cb_43_theveterandoesnothaveacu.value }}"
      label="Please explain your findings and reasons:"
      labelPosition="top"
      labelWrap={true}
      marginType="normal"
      required="{{ cb_43_theveterandoesnothaveacu.value }}"
    >
      <Event
        event="blur"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="triggerRemarkConcat"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <Checkbox
      id="cb_70_migraineincludingmigrain"
      disabled="{{form1.data.DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_43_THEVETERANDOESNOTHAVEACURRENTDIAGNOSISASSOCIATEDWI}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_70_MIGRAINEINCLUDINGMIGRAINEVARIANTS"
      label="Migraine including migraine variants"
      marginType="normal"
      style={{ ordered: [] }}
    >
      <Event
        event="false"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ti_71_icdcode"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="false"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ti_72_dateofdiagnosis"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Checkbox>
    <TextInput
      id="ti_71_icdcode"
      disabled="{{ !cb_70_migraineincludingmigrain.value}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_71_ICDCODE"
      label="ICD Code:"
      labelWidth="30"
      marginType="normal"
      required="{{cb_70_migraineincludingmigrain.value}}"
    />
    <TextInput
      id="ti_72_dateofdiagnosis"
      disabled="{{ !cb_70_migraineincludingmigrain.value}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_72_DATEOFDIAGNOSIS"
      label="Date of Diagnosis:"
      labelWidth="30"
      marginType="normal"
      required="{{cb_70_migraineincludingmigrain.value}}"
    />
    <TextInput
      id="ti_74_icdcode"
      disabled="{{!cb_73_tension.value}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_74_ICDCODE"
      label="ICD Code:"
      labelWidth="30"
      marginType="normal"
      required="{{cb_73_tension.value}}"
    />
    <TextInput
      id="ti_75_dateofdiagnosis"
      disabled="{{!cb_73_tension.value}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_75_DATEOFDIAGNOSIS"
      label="Date of Diagnosis"
      labelWidth="30"
      marginType="normal"
      required="{{cb_73_tension.value}}"
    />
    <TextInput
      id="ti_77_icdcode"
      disabled="{{!cb_76_cluster.value}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_77_ICDCODE"
      label="ICD Code:"
      labelWidth="30"
      marginType="normal"
      required="{{cb_76_cluster.value}}"
    />
    <TextInput
      id="ti_78_dateofdiagnosis"
      disabled="{{!cb_76_cluster.value}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_78_DATEOFDIAGNOSIS"
      label="Date of Diagnosis:"
      labelWidth="30"
      marginType="normal"
      required="{{cb_76_cluster.value}}"
    />
    <Spacer id="spacer2" marginType="normal" />
    <TextInput
      id="ti_159_icdcode"
      disabled="{{!cb_157_otherspecifytypeofheada.value}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_159_ICDCODE"
      label="ICD Code:"
      labelWidth="30"
      marginType="normal"
      required="{{ cb_157_otherspecifytypeofheada.value}}"
    />
    <TextInput
      id="ti_160_dateofdiagnosis"
      disabled="{{!cb_157_otherspecifytypeofheada.value}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_160_DATEOFDIAGNOSIS"
      label="Date of Diagnosis:"
      labelWidth="30"
      marginType="normal"
      required="{{ cb_157_otherspecifytypeofheada.value}}"
    />
    <Checkbox
      id="cb_73_tension"
      disabled="{{form1.data.DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_43_THEVETERANDOESNOTHAVEACURRENTDIAGNOSISASSOCIATEDWI}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_73_TENSION"
      label="Tension"
      marginType="normal"
    >
      <Event
        event="false"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ti_74_icdcode"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="false"
        method="setValue"
        params={{ ordered: [] }}
        pluginId="ti_75_dateofdiagnosis"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Checkbox>
    <Spacer id="spacer3" marginType="normal" />
    <Checkbox
      id="cb_76_cluster"
      disabled="{{form1.data.DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_43_THEVETERANDOESNOTHAVEACURRENTDIAGNOSISASSOCIATEDWI}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_76_CLUSTER"
      label="Cluster"
      marginType="normal"
    >
      <Event
        event="false"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ti_77_icdcode"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="false"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ti_78_dateofdiagnosis"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Checkbox>
    <Spacer id="spacer4" marginType="normal" />
    <Checkbox
      id="cb_157_otherspecifytypeofheada"
      disabled="{{form1.data.DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_43_THEVETERANDOESNOTHAVEACURRENTDIAGNOSISASSOCIATEDWI}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_157_OTHERSPECIFYTYPEOFHEADACHE"
      label="Other (specify type of headache)"
      marginType="normal"
      required="{{ cb_157_otherspecifytypeofheada.value}}"
    >
      <Event
        event="false"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="conditoinalClear_1b"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="false"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ti_159_icdcode"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="false"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ti_160_dateofdiagnosis"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="false"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="ti_158_otherspecifytypeofheada"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Checkbox>
    <TextInput
      id="ti_158_otherspecifytypeofheada"
      disabled="{{form1.data.DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_43_THEVETERANDOESNOTHAVEACURRENTDIAGNOSISASSOCIATEDWI}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_158_OTHERSPECIFYTYPEOFHEADACHE"
      hideLabel={true}
      labelPosition="top"
      marginType="normal"
      required="{{ cb_157_otherspecifytypeofheada.value}}"
    />
    <Include src="./container6.rsx" />
    <TextArea
      id="ta_91_1cifthereareadditionaldi"
      autoResize={true}
      disabled="{{!ti_88_otherdiagnosis3.value}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_91_1CIFTHEREAREADDITIONALDIAGNOSESTHATPERTAINTOAHEADA"
      label="1C. If there are additional diagnoses that pertain to a headache condition, list using above format:"
      labelPosition="top"
      marginType="normal"
      minLines={2}
      required="{{ti_88_otherdiagnosis3.value.length > 0}}"
    />
  </View>
</Container>
