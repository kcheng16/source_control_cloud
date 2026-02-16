const locationId = currentEditLocationId.value;

if (locationId) {
  utils.openApp("383ca144-b896-11f0-b937-1b6cd74f3d25", {
    pageName: "clientLocationsDetails",
    queryParams: { locationId },
  });
} else {
  utils.openApp("383ca144-b896-11f0-b937-1b6cd74f3d25", {
    pageName: "clientLocations",
  });
}
