<GlobalFunctions>
  <SqlQueryUnified
    id="getProducts"
    isMultiplayerEdited={false}
    query={include("./lib/getProducts.sql", "string")}
    resourceName="fee4db3c-0d24-4aa7-87e4-d6cf6bdf2948"
    warningCodes={[]}
  />
  <SqlQueryUnified
    id="getProductIdForSelectedItems"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("./lib/getProductIdForSelectedItems.sql", "string")}
    resourceName="fee4db3c-0d24-4aa7-87e4-d6cf6bdf2948"
    showSuccessToaster={false}
    warningCodes={[]}
  />
</GlobalFunctions>
