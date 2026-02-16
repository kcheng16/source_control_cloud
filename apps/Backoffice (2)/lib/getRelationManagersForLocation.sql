SELECT
  "RelationManager"."user_id" AS "value",
  COALESCE(
    "User".name,
    CONCAT(
      'Relation Manager ',
      "RelationManager"."relation_manager_id"
    )
  ) AS "label"
FROM
  "RelationManager"
  LEFT JOIN "User" ON "RelationManager"."user_id" = "User"."user_id"
ORDER BY
  "User"."name";