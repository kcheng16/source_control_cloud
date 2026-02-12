UPDATE
  "ClientLocation"
SET
  "invoice_address_id" = {{ invoiceAddressId }}
WHERE
  "client_location_id" = {{ clientLocationId }}
RETURNING
  "client_location_id" AS "clientLocationId"