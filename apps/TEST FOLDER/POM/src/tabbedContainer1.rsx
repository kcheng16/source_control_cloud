<Container
  id="tabbedContainer1"
  currentViewKey="{{ self.viewKeys[0] }}"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  heightType="fixed"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Tabs
      id="tabs1"
      heightType="fixed"
      itemMode="static"
      navigateContainer={true}
      targetContainerId="tabbedContainer1"
      value="{{ self.values[0] }}"
    >
      <Option id="766d6" value="Tab 1" />
      <Option id="5e2db" value="Tab 2" />
      <Option id="09966" value="Tab 3" />
    </Tabs>
  </Header>
  <View
    id="8aa98"
    icon="bold/interface-user-single"
    iconPosition="left"
    viewKey="Applicant"
  >
    <KeyValue
      id="keyValue1"
      data="{{ getLoanApplicationFromRow.data }}"
      enableSaveActions={true}
      groupLayout="singleColumn"
      labelWrap={true}
    >
      <Property
        id="ID"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Id"
      />
      <Property
        id="ssn_alias"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Ssn alias"
      />
      <Property
        id="id"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="MKIII ID"
        valueOverride="{{ item[0] }}"
      />
      <Property
        id="amount_requested"
        editable="false"
        editableOptions={{}}
        format="currency"
        formatOptions={{
          currency: "USD",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
        }}
        hidden="true"
        label="Amount requested"
        valueOverride="{{ item[0] / 100 }}"
      />
      <Property
        id="first_name"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="First name"
        valueOverride="{{ item[0] }}"
      />
      <Property
        id="last_name"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Last name"
        valueOverride="{{ item[0] }}"
      />
      <Property
        id="email"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Email"
        valueOverride="{{ item[0] }}"
      />
      <Property
        id="phone"
        editable="false"
        editableOptions={{}}
        format="phoneNumber"
        formatOptions={{
          showFormatting: true,
          showCountryCallingCode: true,
          restrictToCountry: false,
        }}
        hidden="false"
        label="Phone"
        valueOverride="{{ 1 + item[0] }}"
      />
      <Property
        id="dob"
        editable="false"
        editableOptions={{}}
        format="date"
        formatOptions={{}}
        hidden="false"
        label="Dob"
        valueOverride="{{ item[0] }}"
      />
      <Property
        id="created_at"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Created at"
      />
      <Property
        id="updated_at"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Updated at"
      />
      <Property
        id="annual_pre_tax_income"
        editable="false"
        editableOptions={{}}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        hidden="false"
        label="Annual pre tax income"
      />
      <Property
        id="housing_status"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Housing status"
      />
      <Property
        id="monthly_housing_cost"
        editable="false"
        editableOptions={{}}
        format="currency"
        formatOptions={{
          currency: "USD",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
        }}
        hidden="false"
        label="Monthly housing cost"
        valueOverride="{{ item[0] / 100 }}"
      />
      <Property
        id="monthly_other_income"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Monthly other income"
      />
      <Property
        id="source_of_other_income"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Source of other income"
      />
      <Property
        id="membership"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Membership"
      />
      <Property
        id="linked_account_balance"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Linked account balance"
      />
      <Property
        id="loan_purpose"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Loan purpose"
      />
      <Property
        id="status"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Status"
      />
      <Property
        id="loan_offer"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Loan offer"
      />
      <Property
        id="external_id"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="External ID"
      />
      <Property
        id="all_loan_offers"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="All loan offers"
      />
      <Property
        id="funded"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Funded"
      />
      <Property
        id="insured"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Insured"
      />
      <Property
        id="price_to_insure"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Price to insure"
      />
      <Property
        id="partner_metadata"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Partner metadata"
      />
      <Property
        id="bank_partner"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Bank partner"
      />
      <Property
        id="publisher"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Publisher"
      />
      <Property
        id="origination_service_loan_id"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Origination service loan ID"
      />
      <Property
        id="loan_docs_signed_at"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Loan docs signed at"
      />
      <Property
        id="linked_account_verified"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Linked account verified"
      />
      <Property
        id="fico_score"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Fico score"
      />
      <Property
        id="is_mla"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Is mla"
      />
      <Property
        id="origination_service_loan_number"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Origination service loan number"
      />
      <Property
        id="has_multiple_income_sources"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Has multiple income sources"
      />
      <Event
        event="clickValue"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="getLoanApplicationFromRow"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </KeyValue>
  </View>
  <View
    id="906d5"
    disabled={false}
    hidden={false}
    icon="bold/money-bank"
    iconPosition="left"
    viewKey="Loan"
  >
    <KeyValue
      id="keyValue6"
      data="{{ getLoanApplicationFromRow.data }}"
      editIcon="bold/interface-edit-pencil"
      enableSaveActions={true}
      groupLayout="singleColumn"
      labelWrap={true}
    >
      <Property
        id="id"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="ID"
      />
      <Property
        id="amount_requested"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Amount requested"
      />
      <Property
        id="membership"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Membership"
      />
      <Property
        id="loan_purpose"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Loan purpose"
      />
      <Property
        id="status"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Status"
      />
      <Property
        id="loan_offer"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="true"
        label="Loan offer"
        valueOverride="{{ item[0] }}"
      />
      <Property
        id="all_loan_offers"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="All loan offers"
      />
      <Property
        id="funded"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Funded"
      />
      <Property
        id="insured"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Insured"
      />
      <Property
        id="price_to_insure"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Price to insure"
      />
      <Property
        id="bank_partner"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Bank partner"
      />
      <Property
        id="publisher"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Publisher"
      />
      <Property
        id="origination_service_loan_id"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Origination service loan ID"
      />
      <Property
        id="loan_docs_signed_at"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Loan docs signed at"
      />
      <Property
        id="first_name"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="First name"
      />
      <Property
        id="last_name"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Last name"
      />
      <Property
        id="email"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Email"
      />
      <Property
        id="phone"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Phone"
      />
      <Property
        id="ssn_alias"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Ssn alias"
      />
      <Property
        id="dob"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Dob"
      />
      <Property
        id="created_at"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Created at"
      />
      <Property
        id="updated_at"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Updated at"
      />
      <Property
        id="annual_pre_tax_income"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Annual pre tax income"
      />
      <Property
        id="housing_status"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Housing status"
      />
      <Property
        id="monthly_housing_cost"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Monthly housing cost"
      />
      <Property
        id="monthly_other_income"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Monthly other income"
      />
      <Property
        id="source_of_other_income"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Source of other income"
      />
      <Property
        id="linked_account_balance"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Linked account balance"
      />
      <Property
        id="external_id"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="External ID"
      />
      <Property
        id="partner_metadata"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Partner metadata"
      />
      <Property
        id="linked_account_verified"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Linked account verified"
      />
      <Property
        id="fico_score"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Fico score"
      />
      <Property
        id="is_mla"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Is mla"
      />
      <Property
        id="origination_service_loan_number"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Origination service loan number"
      />
      <Property
        id="has_multiple_income_sources"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Has multiple income sources"
      />
    </KeyValue>
    <KeyValue
      id="keyValue7"
      data="{{ getLoanApplicationFromRow.data.loan_offer[0] }}"
      editIcon="bold/interface-edit-pencil"
      enableSaveActions={true}
      groupLayout="singleColumn"
      labelWrap={true}
    >
      <Property
        id="loanAmount"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          currency: "USD",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
        }}
        hidden="false"
        label="Loan amount"
        valueOverride="{{ item / 100 }}"
      />
      <Property
        id="interestRate"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="percent"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        hidden="false"
        label="Interest rate"
        valueOverride="{{ item / 100 }}"
      />
      <Property
        id="finalPayment"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          currency: "USD",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
        }}
        hidden="false"
        label="Final payment"
        valueOverride="{{ item / 100 }}"
      />
      <Property
        id="apr"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="percent"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        hidden="false"
        label="Apr"
        valueOverride="{{ item / 100 }}"
      />
      <Property
        id="term"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        hidden="false"
        label="Term (months)"
      />
      <Property
        id="financeCharge"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          currency: "USD",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
        }}
        hidden="false"
        label="Finance charge"
        valueOverride="{{ item / 100}}"
      />
      <Property
        id="totalPayments"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          currency: "USD",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
        }}
        hidden="false"
        label="Total payments"
        valueOverride="{{ item / 100 }}"
      />
      <Property
        id="monthlyPayment"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          currency: "USD",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
        }}
        hidden="false"
        label="Monthly payment"
        valueOverride="{{ item / 100 }}"
      />
      <Property
        id="originationFee"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="currency"
        formatOptions={{
          currency: "USD",
          currencySign: "standard",
          notation: "standard",
          showSeparators: true,
          currencyDisplay: "symbol",
        }}
        hidden="false"
        label="Origination fee"
        valueOverride="{{ item / 100 }}"
      />
      <Property
        id="originationDate"
        editable="false"
        editableOptions={{}}
        format="date"
        formatOptions={{}}
        hidden="false"
        label="Origination date"
      />
      <Property
        id="finalPaymentDate"
        editable="false"
        editableOptions={{}}
        format="date"
        formatOptions={{}}
        hidden="false"
        label="Final payment date"
      />
      <Property
        id="firstPaymentDate"
        editable="false"
        editableOptions={{}}
        format="date"
        formatOptions={{}}
        hidden="false"
        label="First payment date"
      />
    </KeyValue>
  </View>
  <View
    id="efb21"
    icon="bold/interface-content-book-edit"
    iconPosition="left"
    viewKey="Credit Evaluation"
  >
    <KeyValue
      id="keyValue2"
      data="{{ getCreditEvaluationsFromRow.data }}"
      enableSaveActions={true}
      groupLayout="singleColumn"
      heightType="fixed"
      labelWrap={true}
    >
      <Property
        id="id"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="ID"
      />
      <Property
        id="status"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Evaluation Result"
        optionList={{
          manualData: [
            {
              ordered: [
                { value: "Pass" },
                { label: "Pass" },
                { color: "rgb(123, 188, 73)" },
                { textColor: "rgb(255, 255, 255)" },
              ],
            },
            {
              ordered: [
                { value: "Fail" },
                { label: "Fail" },
                { color: "rgb(177, 70, 56)" },
                { textColor: "rgb(255, 255, 255)" },
              ],
            },
          ],
        }}
      />
      <Property
        id="loan_application_id"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Loan application ID"
      />
      <Property
        id="rules"
        editable="false"
        editableOptions={{}}
        format="json"
        formatOptions={{}}
        hidden="true"
        label="Rules"
      />
      <Property
        id="version"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Version"
      />
      <Property
        id="raw_credit_report"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="true"
        label="Raw credit report"
      />
      <Property
        id="created_at"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Created at"
      />
      <Property
        id="updated_at"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Updated at"
      />
      <Property
        id="model"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Model"
      />
    </KeyValue>
    <Table
      id="table2"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{
  Object.entries(getCreditEvaluationsFromRow.data.rules[0])
  .map(([key, value]) => {
    function convertToYearsAndMonths(totalMonths) {
      const years = Math.floor(totalMonths / 12);
      const months = totalMonths % 12;
      
      let result = '';
      
      if (years > 0) {
        result += `${years} year${years > 1 ? 's' : ''}`;
        if (months > 0) result += ' ';
      }
      
      if (months > 0 || totalMonths === 0) {
        result += `${months} month${months !== 1 ? 's' : ''}`;
      }
      
      return result.trim();
    }
    
    let transformedValue = { ...value };
    
    if (key === 'annualIncome') {
      transformedValue.value = `$${(value.value / 100).toLocaleString('en-US', { minimumFractionDigits: 0, maximumFractionDigits: 0 })}`;
    }

    if (
      key === 'unsecuredDebtToAnnualIncome' ||
      key === 'debtToMonthlyIncome'
    ) {
      transformedValue.value = parseFloat(transformedValue.value.split('= ')[1]).toFixed(5)
    }

    if (
      key === 'employmentLength' ||
      key === 'monthsOfCreditHistory'
    ) {
      transformedValue.value = convertToYearsAndMonths(transformedValue.value)
    }
    
    return {
      key,
      ...transformedValue
    };
  })
  .sort((a, b) => a.key.localeCompare(b.key))
  
}}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      emptyMessage="No evaluation found"
      enableSaveActions={true}
      heightType="auto"
      primaryKeyColumnId="19477"
      rowSelection="none"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      toolbarPosition="bottom"
    >
      <Column
        id="f15cb"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="false"
        key="description"
        label="Rule"
        placeholder="Enter value"
        position="center"
        size={362.09375}
        summaryAggregationMode="none"
      />
      <Column
        id="997c2"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="status"
        label="Rule Result"
        optionList={{
          manualData: [
            {
              ordered: [
                { value: "Pass" },
                { label: "Pass" },
                { color: "rgb(123, 188, 73)" },
                { textColor: "rgb(255, 255, 255)" },
              ],
            },
            {
              ordered: [
                { value: "Fail" },
                { label: "Fail" },
                { color: "rgb(177, 70, 56)" },
                { textColor: "rgb(255, 255, 255)" },
              ],
            },
          ],
        }}
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
        valueOverride="{{ _.startCase(item) }}"
      />
      <Column
        id="2213d"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="false"
        key="value"
        label="Value"
        placeholder="Enter value"
        position="center"
        referenceId="value"
        size={314}
        summaryAggregationMode="none"
      />
      <Column
        id="19477"
        alignment="left"
        editable="false"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="key"
        label="Key"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <ToolbarButton
        id="1a"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
      <ToolbarButton
        id="3c"
        icon="bold/interface-download-button-2"
        label="Download"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="exportData"
          pluginId="table2"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="refresh"
          pluginId="table2"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
    </Table>
  </View>
  <View
    id="99d1b"
    icon="bold/interface-home-5"
    iconPosition="left"
    viewKey="Address"
  >
    <KeyValue
      id="keyValue3"
      data="{{ getAddressFromRow.data }}"
      editIcon="bold/interface-edit-pencil"
      enableSaveActions={true}
      groupLayout="singleColumn"
      labelWrap={true}
    >
      <Property
        id="address_line_one"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Address line one"
        valueOverride="{{ item[0] }}"
      />
      <Property
        id="address_line_two"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Address line two"
        valueOverride="{{ item[0] || null }}"
      />
      <Property
        id="city"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="City"
        valueOverride="{{ item[0] }}"
      />
      <Property
        id="state"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="State"
        valueOverride="{{ item[0] }}"
      />
      <Property
        id="zip"
        editable="false"
        editableOptions={{}}
        format="string"
        formatOptions={{}}
        hidden="false"
        label="Zip"
        valueOverride="{{ item[0] }}"
      />
      <Property
        id="move_in_date"
        editable="false"
        editableOptions={{}}
        format="date"
        formatOptions={{ dateFormat: "MMMM yyyy" }}
        hidden="false"
        label="Move in date"
        valueOverride="{{ item[0] }}"
      />
      <Property
        id="id"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="ID"
      />
      <Property
        id="updated_at"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Updated at"
      />
      <Property
        id="created_at"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Created at"
      />
      <Property
        id="loan_application_id"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Loan application ID"
      />
    </KeyValue>
  </View>
  <View
    id="39e16"
    disabled={false}
    hidden={false}
    icon="bold/interface-user-work-laptop"
    iconPosition="left"
    viewKey="Employer"
  >
    <KeyValue
      id="keyValue4"
      data="{{ getEmployerFromRow.data }}"
      editIcon="bold/interface-edit-pencil"
      enableSaveActions={true}
      groupLayout="singleColumn"
      labelWrap={true}
    >
      <Property
        id="id"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="ID"
      />
      <Property
        id="employment_status"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Employment status"
      />
      <Property
        id="employer_name"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Employer name"
      />
      <Property
        id="position"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Position"
      />
      <Property
        id="start_date"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Start date"
      />
      <Property
        id="end_date"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="End date"
      />
      <Property
        id="gross_monthly_income"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Gross monthly income"
      />
      <Property
        id="updated_at"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Updated at"
      />
      <Property
        id="created_at"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Created at"
      />
      <Property
        id="loan_application_id"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Loan application ID"
      />
    </KeyValue>
  </View>
  <View
    id="c976f"
    disabled={false}
    hidden={false}
    icon="bold/mail-inbox-envelope-open"
    iconPosition="left"
    viewKey="Agreements"
  >
    <KeyValue
      id="keyValue5"
      data="{{ getAgreementsFromRow.data }}"
      editIcon="bold/interface-edit-pencil"
      enableSaveActions={true}
      groupLayout="singleColumn"
      itemLabelPosition="top"
      labelWrap={true}
    >
      <Property
        id="type"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="false"
        label="Type"
      />
      <Property
        id="accepted_at"
        editable="false"
        editableOptions={{}}
        format="datetime"
        formatOptions={{}}
        hidden="false"
        label="Accepted at"
        valueOverride="{{ item[0] }}"
      />
      <Property
        id="id"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="ID"
      />
      <Property
        id="updated_at"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Updated at"
      />
      <Property
        id="created_at"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Created at"
      />
      <Property
        id="loan_application_id"
        editable="false"
        editableOptions={{}}
        format="tags"
        formatOptions={{ automaticColors: true }}
        hidden="true"
        label="Loan application ID"
      />
    </KeyValue>
  </View>
</Container>
