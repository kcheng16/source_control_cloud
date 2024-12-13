<App>
  <Include src="./functions.rsx" />
  <AppStyles id="$appStyles" css="._xYepX._63c2n { color: #3170F9}" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="0"
    sticky={null}
    style={{ ordered: [{ canvas: "rgb(255, 255, 255)" }] }}
    type="main"
  >
    <Form
      id="form1"
      disabled=""
      disableSubmit="{{ retoolContext.inEditorMode ? false : getDBQPermission.data?.isFormWritable != true }}"
      footerPadding="0"
      headerPadding="4px 12px"
      initialData="{{ getForm.data?.raw_form_answers?.[0]}}"
      marginType="none"
      padding="12px"
      requireValidation={true}
      showBody={true}
      showBorder={false}
      showFooter={true}
      showFooterBorder={false}
      showHeader={true}
    >
      <Header>
        <Text
          id="formTitle1"
          heightType="fixed"
          horizontalAlign="center"
          marginType="normal"
          value="#### HEADACHES (INCLUDING MIGRAINE HEADACHES) DBQ"
          verticalAlign="center"
        />
      </Header>
      <Body>
        <Tabs
          id="tabs1"
          alignment="center"
          disabled="false"
          itemMode="static"
          marginType="normal"
          navigateContainer={true}
          style={{ ordered: [] }}
          targetContainerId="formTabs"
          value="{{ self.values[0] }}"
        >
          <Option id="7d46c" value="Tab 1" />
          <Option id="91971" value="Tab 2" />
          <Option id="e3d3d" value="Tab 3" />
        </Tabs>
        <Include src="./src/formTabs.rsx" />
      </Body>
      <Footer>
        <Include src="./src/containerNavButtons.rsx" />
      </Footer>
      <Event
        event="submit"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="parseForm"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="submit"
        method="run"
        params={{
          ordered: [{ src: "parent.postMessage('saveAndSubmit','*');" }],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="invalid"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="errorValidation"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="invalid"
        method="showNotification"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { notificationType: "error" },
                  { title: "Form Error" },
                  { duration: "5" },
                  {
                    description:
                      "Please review the tabs with an exclamation for errors",
                  },
                ],
              },
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="submit"
        method="setValue"
        params={{ ordered: [{ value: "{}" }] }}
        pluginId="validationMessages"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="invalid"
        method="setValue"
        params={{ ordered: [{ value: "true" }] }}
        pluginId="isSubmitAttempt"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="submit"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { onSuccess: null },
                  { onFailure: null },
                  { additionalScope: { ordered: [{ actionType: "submit" }] } },
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
    </Form>
  </Frame>
</App>
