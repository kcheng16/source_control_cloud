<Container
  id="container4"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  marginType="normal"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle4"
      horizontalAlign="center"
      marginType="normal"
      value="#### EVIDENCE REVIEW"
      verticalAlign="center"
    />
  </Header>
  <View id="a8b47" viewKey="View 1">
    <Text
      id="text31"
      marginType="normal"
      style={{ ordered: [{ color: "info" }] }}
      value={
        '<b>*NOTE: If you reviewed the records and are unsure which option to select you may select "VA e-folder" and the QA will ensure that the correct option is selected on the final report.</b>'
      }
      verticalAlign="center"
    />
    <CheckboxGroup
      id="cbg_evidencereview"
      disabled=""
      formDataKey="{{self.id}}"
      itemMode="static"
      label="Evidence reviewed (check all that apply):"
      labelPosition="top"
      labelWrap={true}
      marginType="normal"
      minColumnWidth="400"
      required={true}
      value=""
    >
      <Option
        id="54f2a"
        disabled="{{ triggerEvidenceReviewACE.data.parentDisabled}}"
        label="Not Requested"
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_13_NOTREQUESTED"
      />
      <Option
        id="1b204"
        disabled="{{ triggerEvidenceReviewACE.data.childrenDisabled}}"
        label="VA claims file (hard copy paper C-file)"
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_14_VACLAIMSFILEHARDCOPYPAPERCFILE"
      />
      <Option
        id="c1097"
        disabled="{{ triggerEvidenceReviewACE.data.childrenDisabled}}"
        hidden={false}
        label="VA e-folder"
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_15_VAEFOLDER"
      />
      <Option
        id="30db1"
        disabled="{{ triggerEvidenceReviewACE.data.parentDisabled}}"
        hidden={false}
        label="No records were reviewed"
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_16_NORECORDSWEREREVIEWED"
      />
      <Option
        id="ada10"
        disabled="{{ triggerEvidenceReviewACE.data.childrenDisabled}}"
        hidden={false}
        label="VA electronic health record"
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_17_VAELECTRONICHEALTHRECORD"
      />
      <Option
        id="dfe1c"
        disabled="{{ triggerEvidenceReviewACE.data.childrenDisabled}}"
        hidden={false}
        label="Other, please specify in comments box"
        value="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_18_OTHERPLEASESPECIFYINCOMMENTSBOX"
      />
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="triggerEvidenceReviewACE"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </CheckboxGroup>
    <Text
      id="text42"
      marginType="normal"
      value="**Evidence Comments:**"
      verticalAlign="center"
    />
    <Checkbox
      id="checkboxERAllAvailable"
      disabled="{{ !triggerEvidenceReviewACE.data.otherCommentRequired }}"
      label="All available records were reviewed and findings considered when completing this DBQ."
      marginType="normal"
      required=""
    >
      <Event
        event="true"
        method="setValue"
        params={{
          ordered: [
            {
              value:
                "{{'All available records were reviewed and findings considered when completing this DBQ. \\n' + ta_19_evidencecomments.value}}",
            },
          ],
        }}
        pluginId="ta_19_evidencecomments"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="false"
        method="setValue"
        params={{
          ordered: [
            {
              value:
                "{{ ta_19_evidencecomments.value.replace(self.label + ' ','').trim()}}",
            },
          ],
        }}
        pluginId="ta_19_evidencecomments"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Checkbox>
    <Text
      id="text33"
      marginType="normal"
      style={{ ordered: [{ color: "info" }] }}
      value="NOTE: Selecting this option will auto-generate this statement into the Evidence Comments box in the final report for you, as well as any additional comments made below."
      verticalAlign="center"
    />
    <TextArea
      id="ta_19_evidencecomments"
      autoResize={true}
      disabled="{{ !triggerEvidenceReviewACE.data.otherCommentRequired}}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_19_EVIDENCECOMMENTS"
      hideLabel={true}
      label="Additional evidence comments: "
      labelPosition="top"
      marginType="normal"
      minLines={2}
      required="{{ triggerEvidenceReviewACE.data.otherCommentRequired}}"
    />
  </View>
</Container>
