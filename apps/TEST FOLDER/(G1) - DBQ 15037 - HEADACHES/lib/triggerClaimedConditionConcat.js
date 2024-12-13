let otherClaimedCondition = ta_42_1alisttheclaimedconditio.value
let claimedCondition = getDBQForm.data?.[0]?.Conditions__c ?? ''

textAreaClaimedConditions.setValue((claimedCondition + '\n' + otherClaimedCondition).trim())