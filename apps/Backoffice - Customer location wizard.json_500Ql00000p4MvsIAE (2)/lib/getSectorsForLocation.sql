SELECT
  sector_id as "value",
  name as "label",
  parent_sector_id as "parentSectorId"
FROM
  "Sector"
WHERE
  parent_sector_id IS NULL
ORDER BY
  name;