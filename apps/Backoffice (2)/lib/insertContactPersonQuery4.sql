INSERT INTO
  "ContactPerson" (
    "status_id",
    "phone",
    "email",
    "name",
    "remark",
    "contact_person_function_id",
    "client_location_id"
  )
VALUES
  (
    {{ statusId }},
    {{ phone }},
    {{ email }},
    {{ name }},
    {{ remark }},
    {{ functionId }},
    {{ clientLocationId }}
  );