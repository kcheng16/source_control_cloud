SELECT
  "User"."user_id" AS "userId",
  "User"."role_id" AS "userRoleId",
  (
    SELECT
      JSON_OBJECT_AGG(
        "Module"."name",
        JSON_BUILD_OBJECT(
          'read',
          "Permission"."read",
          'update',
          "Permission"."update",
          'delete',
          "Permission"."delete",
          'approve',
          "Permission"."approve",
          'export',
          "Permission"."export",
          'create',
          "Permission"."create"
        )
      )
    FROM
      "Permission"
      INNER JOIN "Module" ON "Module"."module_id" = "Permission"."module_id"
    WHERE
      "Permission"."role_id" = "User"."role_id"
  ) AS "permissions"
FROM
  "User"
WHERE
  "User"."email" = {{ current_user.email }};