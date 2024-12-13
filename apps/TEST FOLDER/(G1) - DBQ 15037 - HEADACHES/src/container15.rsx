<Container
  id="container15"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  marginType="normal"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle15"
      horizontalAlign="center"
      marginType="normal"
      value="#### SECTION VIII - REMARKS"
      verticalAlign="center"
    />
  </Header>
  <View id="a8b47" viewKey="View 1">
    <TextArea
      id="ta_split_remarks"
      autoResize={true}
      disabled="true"
      label="Remarks (These are auto-populated from previous responses within the report. Please review prior to submission to VES)."
      labelPosition="top"
      marginType="normal"
      minLines={2}
      style={{ ordered: [{ sharedLabel: "info" }] }}
    />
    <TextArea
      id="ta_149_8aremarksifanypleaseide"
      autoResize={true}
      formDataKey="{{self.id}}"
      label="8A. Additional Remarks (if any - please identify the section to which the remark pertains when appropriate)."
      labelPosition="top"
      marginType="normal"
      minLines={2}
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
    </TextArea>
    <RadioGroup
      id="rg_split_criticalfindingyesno"
      formDataKey="{{self.id}}"
      groupLayout="wrap"
      itemMode="static"
      label="Is there a need for the Veteran to follow up with his/her primary care provider regarding any life threatening findings in this examination (not limited to claimed condition(s))?"
      labelPosition="top"
      labelWrap={true}
      marginType="normal"
      required={true}
      value="null"
    >
      <Option id="2a187" value="Yes" />
      <Option id="8efc0" value="No" />
      <Event
        enabled="{{rg_split_criticalfindingyesno.value=='No'}}"
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="rg_split_criticalfindingifyes"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{rg_split_criticalfindingyesno.value=='No'}}"
        event="change"
        method="clearValue"
        params={{ ordered: [] }}
        pluginId="rg_split_criticalfindinglifethreatening"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
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
        pluginId="triggerRemarkConcat"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <RadioGroup
      id="rg_split_criticalfindingifyes"
      disabled="{{rg_split_criticalfindingyesno.value != 'Yes'}}"
      formDataKey="{{self.id}}"
      groupLayout="wrap"
      itemMode="static"
      label="If Yes, was the Veteran notified to follow up with his/her primary care provider?"
      labelPosition="top"
      marginType="normal"
      required="{{rg_split_criticalfindingyesno.value=='Yes'}}"
      value="null"
    >
      <Option id="2a187" value="Yes" />
      <Option id="8efc0" value="No" />
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
        pluginId="triggerRemarkConcat"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <RadioGroup
      id="rg_split_criticalfindinglifethreatening"
      disabled="{{rg_split_criticalfindingyesno.value != 'Yes'}}"
      formDataKey="{{self.id}}"
      groupLayout="wrap"
      itemMode="static"
      label="Was a copy of the test result identifying the life threatening condition/findings provided to the Veteran or Veteran's primary care provider?"
      labelPosition="top"
      marginType="normal"
      required="{{rg_split_criticalfindingyesno.value=='Yes'}}"
      value="null"
    >
      <Option id="2a187" value="Yes" />
      <Option id="8efc0" value="No" />
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
        pluginId="triggerRemarkConcat"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <RadioGroup
      id="rg_split_criticalfindinghomeless"
      formDataKey="{{self.id}}"
      groupLayout="wrap"
      itemMode="static"
      label="Does the Veteran or Service Member identify as homeless?"
      labelPosition="top"
      marginType="normal"
      required={true}
      value="null"
    >
      <Option id="2a187" value="Yes" />
      <Option id="8efc0" value="No" />
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
        pluginId="triggerRemarkConcat"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RadioGroup>
    <ListViewBeta
      id="listViewAdditionalQuestions"
      _primaryKeys="{{ item.Id }}"
      computeAllInstanceValues={true}
      data="{{ parseAdditionalQuestions.data?.parseInterface }}"
      heightType="auto"
      hidden="{{ parseAdditionalQuestions.data == undefined || parseAdditionalQuestions.data?.length == 0}}"
      itemWidth="200px"
      marginType="none"
      numColumns={3}
      padding="0"
    >
      <Container
        id="container19"
        footerPadding="4px 12px"
        headerPadding="4px 12px"
        hidden=""
        marginType="normal"
        padding="12px"
        showBody={true}
      >
        <View id="10934" viewKey="View 1">
          <Text
            id="text27"
            imageWidth="fill"
            marginType="normal"
            value="**{{item.Ques__c}}**"
            verticalAlign="center"
          />
          <TextArea
            id="textAreaAdditionalQuestion"
            autoResize={true}
            formDataKey="{{self.id}}"
            label=""
            labelPosition="top"
            marginType="normal"
            minLines={2}
            required={true}
            value="{{ item.answer }}"
          >
            <Event
              event="blur"
              method="run"
              params={{
                ordered: [
                  {
                    src: "let questionIndex = additionalQuestions.value.findIndex(q => q.Id == item.Id)\n\nitem.answer = textAreaAdditionalQuestion.value\n\nawait additionalQuestions.setIn([questionIndex], item);\n\nawait parseAdditionalQuestions.trigger();\nawait triggerRemarkConcat.trigger();",
                  },
                ],
              }}
              pluginId=""
              type="script"
              waitMs="0"
              waitType="debounce"
            />
          </TextArea>
        </View>
      </Container>
    </ListViewBeta>
    <TextArea
      id="textAreaRemarksExample"
      autoResize={true}
      disabled="true"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_149_8AREMARKSIFANYPLEASEIDENTIFYTHESECTIONTOWHICHTHERE"
      label="Testing Value - Remarks"
      labelPosition="top"
      marginType="normal"
      minLines={2}
    />
  </View>
</Container>
