WITH
params AS (
    SELECT
    {{intervalSelect.interval}} AS interval,
    {{date.value.current.start}}::DATE AS start_date,
    {{date.value.current.end}}::DATE AS end_date,
    {{current_user.metadata.SchoolID}}::INT AS school_id
),
top_coupons AS (
  SELECT
    c.id,
    c.code,
    COUNT(t.id) AS usage_counte
  FROM
    params,
    transactions t
  JOIN coupons c ON c.id = t.coupon_id
  JOIN sales s ON t.sale_id = s.id
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
  GROUP BY c.id, c.code
  ORDER BY usage_counte DESC
  LIMIT 8
)

SELECT
  DATE_TRUNC('day', t.created_at) AS date,
  tc.code as code,
  COUNT(t.id) AS usage_counte
FROM params, transactions t
JOIN top_coupons tc ON tc.id = t.coupon_id
WHERE
    t.status = 'paid'
    AND t.school_id = params.school_id
    AND t.created_at >= params.start_date
    AND t.created_at < params.end_date
GROUP BY date, tc.code
ORDER BY date, tc.code