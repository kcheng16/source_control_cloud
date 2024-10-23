<Container
  id="salesforceInfoContainer"
  _gap={0}
  footerPadding="4px 12px"
  footerPaddingType="normal"
  headerPadding="4px 12px"
  headerPaddingType="normal"
  hoistFetching={true}
  marginType="normal"
  padding="12px"
  paddingType="normal"
  showBody={true}
  showHeader={true}
  style={{ ordered: [{ border: "rgb(203, 212, 222)" }] }}
>
  <Header>
    <Text
      id="salesforceTitle"
      _disclosedFields={{ array: [] }}
      marginType="normal"
      value="###### Salesforce Case Information"
      verticalAlign="center"
    />
  </Header>
  <View id="60004" viewKey="View 1">
    <TextInput
      id="reservationForCase"
      _disclosedFields={{
        array: [
          "tooltipText",
          "border",
          "text",
          "adornmentBackground",
          "sharedValidation",
          "background",
          "accent",
          "sharedLabel",
        ],
      }}
      disabled=""
      label="Rental ID"
      labelWidth="25"
      marginType="normal"
      placeholder="{{step1Module1.currentRID}}"
      readOnly="true"
      style={{
        ordered: [
          { border: "rgb(203, 212, 222)" },
          { text: "rgb(0, 0, 0)" },
          { adornmentBackground: "rgb(255, 255, 255)" },
          { sharedValidation: "rgb(224, 20, 56)" },
          { accent: "rgb(18, 113, 235)" },
          { sharedLabel: "rgb(0, 0, 0)" },
        ],
      }}
      tooltipText="If you need to change this reservation, please select from the table in step 1"
      value="{{step1Module1.currentRID}}"
    />
    <HTML
      id="html1"
      css={include("../lib/html1.css", "string")}
      hidden="{{ !timeBasedActiveBoolean.value }}"
      html="{{ timeBasedMessages.data.data.time_based_getting_here }}"
    />
    <TextInput
      id="salesforceCaseNumber"
      _disclosedFields={{
        array: [
          "tooltipText",
          "border",
          "text",
          "adornmentBackground",
          "sharedValidation",
          "background",
          "accent",
          "sharedLabel",
        ],
      }}
      disabled=""
      label="Case Number"
      labelWidth="25"
      marginType="normal"
      placeholder="Press Find SFDC Case button"
      readOnly="true"
      style={{
        ordered: [
          { border: "rgb(203, 212, 222)" },
          { text: "rgb(0, 0, 0)" },
          { adornmentBackground: "rgb(255, 255, 255)" },
          { sharedValidation: "rgb(224, 20, 56)" },
          { accent: "rgb(18, 113, 235)" },
          { sharedLabel: "rgb(0, 0, 0)" },
        ],
      }}
      tooltipText="please select reservation from table below and press Select Reservation"
      value="{{getCaseNumber.data['0'].CaseNumber}}"
    />
    <Button
      id="refreshInteractionIdForCaseNumber"
      hidden={'{{salesforceCaseNumber.value != ""}}'}
      marginType="normal"
      text="Find SFDC Case"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getCaseNumber"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <TextInput
      id="customerEmail"
      _disclosedFields={{
        array: [
          "sharedValidation",
          "text",
          "border",
          "accent",
          "adornmentBackground",
          "sharedLabel",
        ],
      }}
      disabled=""
      label="Customer Email"
      labelWidth="25"
      marginType="normal"
      placeholder="{{step1Module1.reservationEmail}}"
      readOnly="true"
      style={{
        ordered: [
          { sharedValidation: "rgb(224, 20, 56)" },
          { text: "rgb(0, 0, 0)" },
          { border: "rgb(203, 212, 222)" },
          { accent: "rgb(18, 113, 235)" },
          { adornmentBackground: "rgb(255, 255, 255)" },
          { sharedLabel: "rgb(0, 0, 0)" },
        ],
      }}
      value="{{step1Module1.reservationEmail}}"
    />
    <TextInput
      id="textInput92"
      hidden=""
      label="Customer Phone"
      labelWidth="38"
      readOnly="true"
      tooltipText="This is the number the customer called from"
      value="{{urlparams.hash.phoneNum}}"
    />
    <Text
      id="text92"
      hidden="{{getUniqueUserId.data['0'].Customer_Notes__c === null}}"
      marginType="normal"
      value="**Customer notes:** {{getUniqueUserId.data['0'].Customer_Notes__c}}"
      verticalAlign="center"
    />
  </View>
</Container>
