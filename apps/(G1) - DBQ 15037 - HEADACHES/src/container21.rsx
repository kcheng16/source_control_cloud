<Container
  id="container21"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  marginType="normal"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle19"
      horizontalAlign="center"
      marginType="none"
      value="#### ACCEPTABLE CLINICAL EVIDENCE (ACE)"
      verticalAlign="center"
    />
  </Header>
  <View id="5c50b" viewKey="View 1">
    <Text
      id="text37"
      marginType="normal"
      style={{ ordered: [{ color: "info" }] }}
      value="<b> NOTE: All exams are expected to be completed via an <u> in-person examination </u> unless use of the ACE process or Tele-C&P has been pre-approved with VES. </b>"
      verticalAlign="center"
    />
    <Text
      id="text46"
      marginType="normal"
      value="**Indicate the method used to obtain medical information to complete this document:**"
      verticalAlign="center"
    />
    <Include src="./containerACEInPerson.rsx" />
    <Container
      id="containerACENotInPerson"
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
          id="containerTitle21"
          marginType="normal"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="5c50b" viewKey="View 1">
        <Checkbox
          id="cb_12_reviewofavailablerecords"
          disabled="{{ cb_11_reviewofavailablerecords.value }}"
          formDataKey="DBQNEUROHEADACHESINCLUDINGMIGRAINEHEADACHES_12_REVIEWOFAVAILABLERECORDSINCONJUNCTIONWITHANINTERVI"
          label="Review of available records in conjunction with an interview with the Veteran (without in-person or video telehealth examination) using the ACE process because the existing medical evidence supplemented with an interview provided sufficient information on which to prepare the questionnaire and such an examination would likely provide no additional relevant evidence."
          labelWrap={true}
          marginType="normal"
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
          id="text36"
          marginType="normal"
          style={{ ordered: [{ color: "primary" }] }}
          value="If the ACE process was pre-approved with VES and the records <u>do not</u> sufficiently reflect the <u>current</u> condition, a telephone interview is required."
          verticalAlign="center"
        />
        <TextArea
          id="ta_split_ACEdateandtime"
          autoResize={true}
          disabled="{{!cb_12_reviewofavailablerecords.value}}"
          label="Please provide the date and time of the phone interview:"
          labelPosition="top"
          marginType="normal"
          minLines={2}
          required="{{ triggerEvidenceReviewACE.data.ACEdateandtime}}"
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
      </View>
    </Container>
  </View>
</Container>
