SELECT
  "CustomerGroup"."name" AS "customerName",
  "CustomerGroup"."coc_number" AS "cocNumber",
  "CustomerGroup"."address_id" AS "addressId",
  "CustomerGroup"."sector_id" AS "sectorId",
  "CustomerGroup"."profile_id" AS "profileId",
  "CustomerGroup"."relation_manager_id" AS "relationManagerId",
  "Sector"."parent_sector_id" AS "parentSectorId",
  "Address"."street" AS "street",
  "Address"."number" AS "houseNumber",
  "Address"."addition" AS "addition",
  "Address"."zipcode" AS "zipCode",
  "Address"."city" AS "city",
  "Address"."country_id" AS "countryId"
FROM
  "CustomerGroup"
  LEFT JOIN "Sector" ON "CustomerGroup"."sector_id" = "Sector"."sector_id"
  LEFT JOIN "Address" ON "CustomerGroup"."address_id" = "Address"."address_id"
WHERE
  "CustomerGroup"."customer_group_id" = {{ customerGroupId }};