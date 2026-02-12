select
  "ContactPerson"."contact_person_id" as "id",
  "ContactPerson"."name" as "firstName",
  "ContactPerson"."email" as "email",
  "ContactPerson"."phone" as "phone",
  "ContactPersonFunction"."name" as "departmentName"
from
  "ContactPerson"
  left join "ContactPersonFunction" on "ContactPersonFunction"."contact_person_function_id" = "ContactPerson"."contact_person_function_id"
where
  "ContactPerson"."client_location_id" = {{ clientLocationId }};