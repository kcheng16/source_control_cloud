select
  "OpeningHours"."opening_hours_id" as "openingHoursId",
  "OpeningHours"."day_of_week" as "dayOfWeek",
  "OpeningHours"."open_time" as "openTime",
  "OpeningHours"."close_time" as "closeTime",
  "OpeningHours"."is_open" as "isOpen"
from
  "OpeningHours"
where
  "customer_location_id" = {{ currentEditLocationId.value }}
order by
  "day_of_week";