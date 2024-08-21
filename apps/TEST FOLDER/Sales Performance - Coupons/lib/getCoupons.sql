WITH params AS (
    SELECT
        {{date.value.current.start}}::DATE AS start_dt,
        {{date.value.current.end}}::DATE AS end_dt,
        {{current_user.metadata.SchoolID}}::INT AS school_id
)

SELECT
  c.id,
  c.code as name,
  c.product_id
FROM params, coupons c
WHERE
    c.school_id = params.school_id
    AND c.is_single_use = false
    AND c.expiration_date >= params.start_dt
    AND (
      c.product_id IS NULL OR
      (
        {{productFilter.selectedItems.product_id.length <= 0}} 
        OR product_id = ANY({{productFilter.selectedItems.product_id}})
      )
  )

