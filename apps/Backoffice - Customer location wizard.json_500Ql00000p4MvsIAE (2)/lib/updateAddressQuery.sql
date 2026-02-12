UPDATE
  "Address"
SET
  "street" = {{ street }},
  "number" = {{ number }},
  "addition" = {{ addition }},
  "city" = {{ city }},
  "country_id" = {{ countryId }},
  "zipcode" = {{ zipcode }}
WHERE
  "address_id" = {{ addressId }}
RETURNING
  "address_id" AS "addressId";