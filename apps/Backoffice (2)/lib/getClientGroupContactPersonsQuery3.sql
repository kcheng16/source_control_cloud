select
  "ContactPerson"."contact_person_id" as "contactPersonId",
  "ContactPerson"."name" as "contactPersonName",
  "ContactPerson"."email" as "contactPersonEmail",
  "ContactPerson"."phone" as "contactPersonPhone",
  "ContactPersonFunction"."name" as "contactPersonFunctionName"
from
  "ContactPerson"
  left join "ContactPersonFunction" on "ContactPersonFunction"."contact_person_function_id" = "ContactPerson"."contact_person_function_id"
where
  "ContactPerson"."client_group_id" = {{ clientGroupId }};