WITH params AS (
    SELECT
    {{intervalSelect.interval}} AS interval,
    {{date.value.current.start}}::DATE AS start_date,
    {{date.value.current.end}}::DATE AS end_date,
    {{current_user.metadata.SchoolID}}::INT AS school_id
)
SELECT
  c.code,
  COUNT(t.id) AS usage_counte
FROM
    params,
	transactions t
JOIN coupons c on c.id = t.coupon_id
JOIN sales s on s.id = t.sale_id
WHERE
  c.is_single_use = FALSE
  AND t.status = 'paid'
  AND t.school_id = params.school_id
  AND t.created_at >= params.start_date
  AND t.created_at < params.end_date
  AND (
      {{productFilter.selectedItems.product_id.length <= 0}} 
      OR s.product_id = ANY({{productFilter.selectedItems.product_id}})
  )
GROUP BY c.code
ORDER BY usage_counte DESC
LIMIT 8