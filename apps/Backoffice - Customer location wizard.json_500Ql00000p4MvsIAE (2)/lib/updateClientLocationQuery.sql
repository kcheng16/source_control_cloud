UPDATE
  "ClientLocation"
SET
  "name" = {{ name }},
  "client_group_id" = {{ groupId }},
  "coc_number" = {{ cocNumber }},
  "sector_id" = {{ sectorId }},
  "client_profile" = {{ profileId }},
  "relation_manager_id" = {{ relationManagerId }},
  "waste_partners_info" = {{ wastePartnersInfo }},
  "invoice_sending_channel" = {{ invoiceSendingChannel }},
  "invoice_freq" = {{ invoiceFreq }},
  "invoice_email" = {{ invoiceEmail }},
  "payment_terms_days" = {{ paymentTermsDays }},
  "debtor_number" = {{ debtorNumber }},
  "btw_number" = {{ btwNumber }}
WHERE
  "client_location_id" = {{ clientLocationId }}
RETURNING
  "client_location_id" AS "clientLocationId"