WITH selected_products AS (
  SELECT *
  FROM jsonb_to_recordset({{JSON.stringify(select.selectedItems)}}) 
    AS specs(id integer, name text, type text)
  )


SELECT
  CASE
    WHEN selected_products.type = 'courses' THEN course_pricing_options.product_id
    WHEN selected_products.type = 'product_collections' THEN product_collection_pricing_options.product_id
    WHEN selected_products.type = 'digital_products' THEN digital_product_pricing_options.product_id
    WHEN selected_products.type = 'creator_products' THEN creator_product_pricing_options.product_id
    WHEN selected_products.type = 'membership_tiers' THEN membership_tier_pricing_options.product_id
  END AS product_id,
  selected_products.type,
  selected_products.id,
  selected_products.name
FROM selected_products
LEFT JOIN course_pricing_options
  ON selected_products.type = 'courses'
  AND course_pricing_options.course_id = selected_products.id
LEFT JOIN product_collection_pricing_options
  ON selected_products.type = 'product_collections'
  AND product_collection_pricing_options.product_collection_id = selected_products.id
LEFT JOIN digital_product_pricing_options
  ON selected_products.type = 'digital_products'
  AND digital_product_pricing_options.digital_product_id = selected_products.id
LEFT JOIN creator_product_pricing_options
  ON selected_products.type = 'creator_products'
  AND creator_product_pricing_options.creator_product_id = selected_products.id
LEFT JOIN membership_tier_pricing_options
  ON selected_products.type = 'membership_tiers'
  AND membership_tier_pricing_options.membership_tier_id = selected_products.id;
