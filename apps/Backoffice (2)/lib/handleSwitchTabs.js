const viewIndex = clientGroupAddModalTabs23.selectedIndex;

let data = null;
if (currentEditLocationId.value) {
  data = await loadClientLocationData.trigger();
  statusText.setValue(data.statusName);
  statusColor.setValue(data.statusColor);
}

switch (viewIndex) {
  case 0:
    fetchClientGeneralData();
    break;
  case 1:
    fetchOpeningHoursData();
    break;
  case 2:
    fetchContactPersonData();
    break;
  case 3:
    break;
  case 4:
    break;
}

function fetchOpeningHoursData() {
  if(!data) {
    return;
  }
  getOpenHoursQuery.trigger();
}

function fetchContactPersonData() {
  getDepartmentQuery5.trigger();
  if(!data) {
    return;
  }
  getClientGroupContactPersonsQuery3.trigger({
    additionalScope: { clientGroupId: data.groupId },
  });
  getClientLocationContactPersonQuery.trigger({
    additionalScope: { clientLocationId: data.locationId },
  });
}

function fetchClientGeneralData() {
  getCustomerProfilesForLocation.trigger();
  getRelationManagersForLocation.trigger();
  getClientGroupsForSelection.trigger();
  getSubSectorsForLocation.trigger({
    additionalScope: { parentSectorId: data.parentSectorId },
  });
}
