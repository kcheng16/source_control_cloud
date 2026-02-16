update
  "ClientLocation"
set
  "status_id" = {{ statusId }}
where
  "client_location_id" = {{ customerLocationId }};