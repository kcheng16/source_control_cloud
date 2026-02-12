UPDATE
  "OpeningHours"
SET
  "open_time" = {{ openTime }},
  "close_time" = {{ closeTime }},
  "is_open" = {{ isOpen }}
WHERE
  "customer_location_id" = {{ clientLocationId }}
  and "day_of_week" = {{ dayOfWeek }}
RETURNING
  "opening_hours_id" AS "openingHoursId";