UPDATE
  "ClientLocation"
SET
  "pickup_address_id" = {{ pickupAddressId }}
WHERE
  "client_location_id" = {{ clientLocationId }}
RETURNING
  "client_location_id" AS "clientLocationId"