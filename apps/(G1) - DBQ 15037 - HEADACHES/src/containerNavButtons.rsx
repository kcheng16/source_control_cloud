<Container
  id="containerNavButtons"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  marginType="none"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle22"
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="e4e13" viewKey="View 1">
    <Button
      id="buttonNavBack"
      hidden="{{formTabs.currentViewIndex === 0 }}"
      iconBefore="bold/interface-arrows-left"
      marginType="normal"
      style={{ ordered: [] }}
      text="Back"
    >
      <Event
        event="click"
        method="setCurrentViewIndex"
        params={{
          ordered: [{ viewIndex: "{{formTabs.currentViewIndex - 1}}" }],
        }}
        pluginId="formTabs"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button id="buttonNavSave" marginType="normal" text="Save">
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="parseForm"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="validate"
        params={{ ordered: [] }}
        pluginId="form1"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{isSubmitAttempt.value}}"
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="errorValidation"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "if(getDBQPermission.data.SignatureExists) {\nparent.postMessage('ClearSignature','*');\n  await new Promise(r => setTimeout(r, 5000));\n  await getDBQPermission.trigger();\n} else {\n  parent.postMessage('save','*');\n}",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { onSuccess: null },
                  { onFailure: null },
                  { additionalScope: { ordered: [{ actionType: "save" }] } },
                ],
              },
            },
          ],
        }}
        pluginId="triggerSaveAuditForm"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="buttonNavNext"
      hidden="{{formTabs.currentViewIndex === formTabs.viewKeys.length - 1 }}"
      iconAfter="bold/interface-arrows-right"
      marginType="normal"
      text="Save & Next"
    >
      <Event
        event="click"
        method="setCurrentViewIndex"
        params={{
          ordered: [{ viewIndex: "{{formTabs.currentViewIndex + 1}}" }],
        }}
        pluginId="formTabs"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="buttonNavSubmit"
      hidden="{{formTabs.currentViewIndex !== formTabs.viewKeys.length - 1 }}"
      marginType="normal"
      submit={true}
      submitTargetId="form1"
      text="Save & Submit"
    />
  </View>
</Container>
