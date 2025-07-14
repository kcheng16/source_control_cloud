<GlobalFunctions>
  <SqlQueryUnified
    id="getRows"
    query={include("./lib/getRows.sql", "string")}
    queryTimeout="10001"
    resourceDisplayName="retool_db"
    resourceName="1dafb1eb-888d-4223-8616-232d9ae927e3"
  />
  <State id="selectedItem" />
</GlobalFunctions>
