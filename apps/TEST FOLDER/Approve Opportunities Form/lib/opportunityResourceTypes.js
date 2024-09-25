
  const counts = {
    CAMPAIGN: 0,
    ADGROUP: 0,
    AD: 0
  }

{{ launchOpportunities.value }}.forEach(opp => {
  counts.CAMPAIGN += opp.resourceTypeCounts.CAMPAIGN;
  counts.ADGROUP += opp.resourceTypeCounts.ADGROUP;
  counts.AD += opp.resourceTypeCounts.AD;
});

return counts