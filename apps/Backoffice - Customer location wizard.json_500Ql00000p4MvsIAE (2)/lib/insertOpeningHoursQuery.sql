insert into
  "OpeningHours" (
    "customer_location_id",
    "day_of_week",
    "open_time",
    "close_time",
    "is_open"
  )
values
  (
    {{ clientLocationId }},
    {{ dayOfWeek }},
    {{ openTime }},
    {{ closeTime }},
    {{ isOpen }}
  )
returning
  "opening_hours_id" as "openingHoursId";