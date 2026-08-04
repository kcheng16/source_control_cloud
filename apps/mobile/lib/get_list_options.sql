SELECT l.list_key, lo.*
FROM non_spatial.list_options lo
  INNER JOIN non_spatial.lists l
    ON l.id = lo.list_id
where l.list_key in ('soil_dispersion', 'soil_humus_smell_level', 'soil_paddock_use_as')
order by l.list_key, lo.order_column, lo.option_name