SELECT
  "ContactPersonFunction"."contact_person_function_id" AS "contactPersonFunctionId",
  "ContactPersonFunction"."name" AS "contactPersonFunctionName"
FROM
  "ContactPersonFunction"
WHERE
  "ContactPersonFunction"."department_id" = {{ departmentId }};