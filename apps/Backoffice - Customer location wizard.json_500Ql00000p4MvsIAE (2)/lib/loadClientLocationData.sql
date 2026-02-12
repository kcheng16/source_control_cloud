SELECT
  "ClientLocation"."client_location_id" AS "locationId",
  "ClientLocation"."name" AS "locationName",
  "ClientLocation"."client_group_id" AS "groupId",
  "CustomerGroup"."name" AS "groupName",
  "CustomerGroup"."relation_manager_id" AS "groupRelationManagerId",
  "ClientLocation"."name" AS "customerName",
  "ClientLocation"."coc_number" AS "cocNumber",
  "ClientLocation"."client_profile" AS "customerProfileId",
  "ClientLocation"."sector_id" AS "sectorId",
  "ClientLocation"."relation_manager_id" AS "relationManagerId",
  "ClientLocation"."address_id" as "addressId",
  "ClientLocation"."pickup_address_id" as "pickupAddressId",
  "ClientLocation"."invoice_address_id" as "invoiceAddressId",
  "ClientLocation"."waste_partners_info" as "wastePartnersInfo",
  "ClientLocation"."invoice_sending_channel" as "invoiceSendingChannel",
  "ClientLocation"."invoice_freq" as "invoiceFreq",
  "ClientLocation"."invoice_email" as "invoiceEmail",
  "ClientLocation"."payment_terms_days" as "paymentTermDays",
  "ClientLocation"."btw_number" as "btwNumber",
  "ClientLocation"."debtor_number" as "debtorNumber",
  "Sector"."parent_sector_id" AS "parentSectorId",
  "Address"."street" AS "street",
  "Address"."number" AS "houseNumber",
  "Address"."addition" AS "addition",
  "Address"."zipcode" AS "zipCode",
  "Address"."city" AS "city",
  "Address"."country_id" AS "countryId",
  "PickupAddress"."street" AS "pickupAddressStreet",
  "PickupAddress"."number" AS "pickupAddressHouseNumber",
  "PickupAddress"."addition" AS "pickupAddressAddition",
  "PickupAddress"."zipcode" AS "pickupAddressZipCode",
  "PickupAddress"."city" AS "pickupAddressCity",
  "PickupAddress"."country_id" AS "pickupAddressCountryId",
  "PickupAddressCountry"."name" AS "pickupAddressCountry",
  "InvoiceAddress"."street" AS "invoiceAddressStreet",
  "InvoiceAddress"."number" AS "invoiceAddressHouseNumber",
  "InvoiceAddress"."addition" AS "invoiceAddressAddition",
  "InvoiceAddress"."zipcode" AS "invoiceAddressZipCode",
  "InvoiceAddress"."city" AS "invoiceAddressCity",
  "InvoiceAddress"."country_id" AS "invoiceAddressCountryId",
  "InvoiceAddressCountry"."name" AS "invoiceAddressCountry",
  "ConfigurationStatus"."name" AS "statusName",
  "ConfigurationStatus"."colour_code" AS "statusColor"
FROM
  "ClientLocation"
  LEFT JOIN "ConfigurationStatus" ON "ConfigurationStatus"."configuration_status_id" = "ClientLocation"."status_id"
  LEFT JOIN "CustomerGroup" ON "ClientLocation"."client_group_id" = "CustomerGroup"."customer_group_id"
  LEFT JOIN "Sector" ON "ClientLocation"."sector_id" = "Sector"."sector_id"
  LEFT JOIN "Address" ON "ClientLocation"."address_id" = "Address"."address_id"
  LEFT JOIN "Address" AS "PickupAddress" ON "ClientLocation"."pickup_address_id" = "PickupAddress"."address_id"
  LEFT JOIN "Address" AS "InvoiceAddress" ON "ClientLocation"."invoice_address_id" = "InvoiceAddress"."address_id"
  LEFT JOIN "Country" ON "Country"."country_id" = "Address"."country_id"
  LEFT JOIN "Country" AS "PickupAddressCountry" ON "PickupAddressCountry"."country_id" = "PickupAddress"."country_id"
  LEFT JOIN "Country" AS "InvoiceAddressCountry" ON "PickupAddressCountry"."country_id" = "InvoiceAddress"."country_id"
WHERE
  "ClientLocation"."client_location_id" = {{ currentEditLocationId.value }};