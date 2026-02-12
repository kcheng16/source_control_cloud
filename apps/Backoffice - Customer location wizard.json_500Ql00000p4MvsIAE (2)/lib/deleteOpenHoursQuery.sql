delete from
  "OpeningHours"
where
  "customer_location_id" = {{ clientLocationId }};