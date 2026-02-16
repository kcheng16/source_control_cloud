const locationId = url.searchParams.locationId;
const tabIndex = url.searchParams.tabIndex;

if (locationId) {
  currentEditLocationId.setValue(parseInt(locationId));
}

if (tabIndex) {
  tabbedContainer14.setCurrentViewIndex(parseInt(tabIndex));
}

handleSwitchTabs.trigger();
