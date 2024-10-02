<GlobalFunctions>
  <SqlQueryUnified
    id="getLoanListBlue"
    importedQueryInputs={{ ordered: [{ bankPartner: "bluefcu" }] }}
    isImported={true}
    playgroundQueryName="getLoanListByCU"
    playgroundQueryUuid="7ee83fce-cdd6-4200-af57-1d7da54eae01"
    query={include("./lib/getLoanListBlue.sql", "string")}
    resourceName="48a8151f-24f1-493a-8ebf-fe8f9194fe1c"
    retoolVersion="3.87.0"
    showLatestVersionUpdatedWarning={true}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="getLoanApplicationFromRow"
    importedQueryInputs={{
      ordered: [{ loanApplicationId: "{{ table1.selectedRow.ID }}" }],
    }}
    isImported={true}
    notificationDuration={4.5}
    playgroundQueryName="getLoanApplicationByID"
    playgroundQueryUuid="5a8bf05f-80a8-4439-9bf5-73ce9b04e6ff"
    query={include("./lib/getLoanApplicationFromRow.sql", "string")}
    resourceName="48a8151f-24f1-493a-8ebf-fe8f9194fe1c"
    retoolVersion="3.87.0"
    showSuccessToaster={false}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="getCreditEvaluationsFromRow"
    importedQueryInputs={{
      ordered: [{ loanApplicationId: "{{ table1.selectedRow.ID }}" }],
    }}
    isImported={true}
    notificationDuration={4.5}
    playgroundQueryName="getCreditEvaluationsByLoanApplicationId"
    playgroundQueryUuid="0c716c24-4da2-4ae0-901f-7d8097a4f1b4"
    query={include("./lib/getCreditEvaluationsFromRow.sql", "string")}
    resourceName="48a8151f-24f1-493a-8ebf-fe8f9194fe1c"
    retoolVersion="3.87.0"
    showLatestVersionUpdatedWarning={true}
    showSuccessToaster={false}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="getAddressFromRow"
    importedQueryInputs={{
      ordered: [{ loanApplicationId: "{{ table1.selectedRow.ID }}" }],
    }}
    isImported={true}
    notificationDuration={4.5}
    playgroundQueryName="getAddressesByLoanApplicationId"
    playgroundQueryUuid="d0c5c7ab-c6e5-4496-b693-4b0f584af6e1"
    query={include("./lib/getAddressFromRow.sql", "string")}
    resourceName="48a8151f-24f1-493a-8ebf-fe8f9194fe1c"
    retoolVersion="3.87.0"
    showSuccessToaster={false}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="getEmployerFromRow"
    importedQueryInputs={{
      ordered: [{ loanApplicationId: "{{ table1.selectedRow.ID }}" }],
    }}
    isImported={true}
    notificationDuration={4.5}
    playgroundQueryName="getEmployersByLoanApplicationId"
    playgroundQueryUuid="57f6b38d-1fcb-4dfc-9dbc-99d72018b66d"
    query={include("./lib/getEmployerFromRow.sql", "string")}
    resourceName="48a8151f-24f1-493a-8ebf-fe8f9194fe1c"
    retoolVersion="3.87.0"
    showSuccessToaster={false}
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="getAgreementsFromRow"
    importedQueryInputs={{
      ordered: [{ loanApplicationId: "{{ table1.selectedRow.ID }}" }],
    }}
    isImported={true}
    notificationDuration={4.5}
    playgroundQueryName="getAgreementsByLoanApplicationId"
    playgroundQueryUuid="79b1151b-b73e-4efc-a3a9-226113bdc9a4"
    query={include("./lib/getAgreementsFromRow.sql", "string")}
    resourceName="48a8151f-24f1-493a-8ebf-fe8f9194fe1c"
    retoolVersion="3.87.0"
    showSuccessToaster={false}
    warningCodes={[]}
  />
  <State id="variable1" />
</GlobalFunctions>
