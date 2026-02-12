UPDATE
  "ClientLocation"
SET
  "address_id" = {{ addressId }}
WHERE
  "client_location_id" = {{ clientLocationId }}
RETURNING
  "client_location_id" AS "clientLocationId"