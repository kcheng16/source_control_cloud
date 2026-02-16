const shouldInherit = segmentedControl7.value;

let data = null;
const selectedGroupId = selectClientGroup.value;
if (selectedGroupId) {
  data = await getClientGroupDataForInherit.trigger({
    additionalScope: { customerGroupId: selectedGroupId },
  });
}

if (shouldInherit) {
  container456.setData({
    companyName9: data.customerName,
    cocInput4: data.cocNumber,
    sectorSelector4: data.parentSectorId,
    select44: data.sectorId,
    clientProfileSelector4: data.profileId,
    relationSelector4: data.relationManagerId,
  });
  checkbox4.setValue(data.addressId === null);
  container457.setData({
    streetInput4: data.street,
    postcalCodeInput4: data.zipCode,
    countrySelector4: data.countryId,
    houseNumberInput4: `${data.houseNumber} ${data.addition}`,
    cityInput4: data.city,
  });
  await getSubSectorsForLocation.trigger({
    additionalScope: { parentSectorId: data.parentSectorId },
  });
} else {
  container456.clear();
  container457.clear();
}

if (data?.relationManagerId) {
  relationSelector4.setValue(data?.relationManagerId);
}
