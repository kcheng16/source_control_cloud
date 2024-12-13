<Container
  id="containerACEInPerson"
  disabled=""
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  marginType="none"
  padding="0"
  showBody={true}
  showBorder={false}
>
  <Header>
    <Text
      id="containerTitle20"
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="5c50b" viewKey="View 1">
    <Checkbox
      id="cb_11_reviewofavailablerecords"
      disabled="{{ cb_12_reviewofavailablerecords.value }}"
      formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_11_REVIEWOFAVAILABLERECORDSWITHOUTINPERSONORVIDEOTELE"
      hideLabel={false}
      label="Review of available records (without in-person or video telehealth examination) using the Acceptable Clinical Evidence (ACE) process because the existing medical evidence provided sufficient information on which to prepare the questionnaire and such an examination would likely provide no additional relevant evidence."
      labelWrap={true}
      marginType="normal"
      style={{ ordered: [] }}
    >
      <Event
        event="change"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="triggerEvidenceReviewACE"
        type="datasource"
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
    </Checkbox>
    <Text
      id="text34"
      marginType="normal"
      style={{ ordered: [{ color: "info" }] }}
      value="PLEASE NOTE: You may only complete the exam using this method if the ACE process was pre-approved with VES, the records sufficiently reflect the <u>current</u> condition, and a telephone interview or in-person exam would likely provide no additional relevant evidence"
      verticalAlign="center"
    />
    <TextArea
      id="ta_split_ACEreasons"
      autoResize={true}
      disabled="{{!cb_11_reviewofavailablerecords.value || ta_split_ACEnumberofattempts.value.length != 0}}"
      label="If it was determined a telephone interview was not necessary to complete the exam via the ACE process, please provide the reason:"
      labelPosition="top"
      marginType="normal"
      minLines={2}
      required="{{ triggerEvidenceReviewACE.data.ACEreasons && ta_split_ACEnumberofattempts.value.length == 0}}"
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
    <TextArea
      id="ta_split_ACEnumberofattempts"
      autoResize={true}
      disabled="{{!cb_11_reviewofavailablerecords.value || ta_split_ACEreasons.value.length != 0 }}"
      label="If a phone interview was attempted but could not be completed, please specify the number of attempts made:"
      labelPosition="top"
      marginType="normal"
      minLines={2}
      required="{{ triggerEvidenceReviewACE.data.ACEnumberofattempts && ta_split_ACEreasons.value.length == 0}}"
      style={{ ordered: [{ sharedLabel: "" }] }}
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
    <Text
      id="text35"
      marginType="normal"
      style={{ ordered: [{ color: "info" }] }}
      value="NOTE: If a phone interview is needed in order to complete the DBQ but the Veteran is unable to be reached after multiple attempts, please notify VES."
      verticalAlign="center"
    />
  </View>
</Container>
