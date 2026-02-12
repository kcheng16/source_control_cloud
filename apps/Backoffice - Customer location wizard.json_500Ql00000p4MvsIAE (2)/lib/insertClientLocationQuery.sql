INSERT INTO
  "ClientLocation" (
    "name",
    "client_group_id",
    "coc_number",
    "sector_id",
    "client_profile",
    "relation_manager_id",
    "status_id",
    "waste_partners_info",
    "invoice_sending_channel",
    "invoice_freq",
    "invoice_email",
    "payment_terms_days",
    "debtor_number",
    "btw_number"
  )
VALUES
  (
    {{ name }},
    {{ groupId }},
    {{ cocNumber }},
    {{ sectorId }},
    {{ profileId }},
    {{ relationManagerId }},
    {{ statusId }},
    {{ wastePartnersInfo }},
    {{ invoiceSendingChannel }},
    {{ invoiceFreq }},
    {{ invoiceEmail }},
    {{ paymentTermsDays }},
    {{ debtorNumber }},
    {{ btwNumber }}
  )
RETURNING
  "client_location_id" AS "clientLocationId";