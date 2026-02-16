INSERT INTO
  "Address" (
    "street",
    "number",
    "addition",
    "city",
    "country_id",
    "zipcode"
  )
VALUES
  (
    {{ street }},
    {{ houseNumber }},
    {{ addition }},
    {{ city }},
    {{ countryId }},
    {{ zipcode }}
  )
RETURNING
  "address_id" AS "addressId";