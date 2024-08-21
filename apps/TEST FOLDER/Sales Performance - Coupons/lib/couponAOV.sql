WITH coupon_aov AS (
  SELECT
    transactions.net_charge_usd,
    transactions.coupon_id,
    transactions.school_id,
    sales.product_id,
    CASE 
      WHEN transactions.created_at >= {{date.value.current.start}}
        AND transactions.created_at < {{date.value.current.end}}
        THEN 'current'
      WHEN transactions.created_at >= {{date.value.past.start}}
        AND transactions.created_at < {{date.value.past.end}}
        THEN 'past'
      ELSE NULL
    END AS type
  FROM transactions 
  JOIN sales ON transactions.sale_id = sales.id
  WHERE 
    transactions.school_id = {{current_user.metadata.SchoolID}} 
    AND transactions.coupon_id IS NOT NULL
    AND (
    ({{productFilter.selectedItems.product_id.length <= 0}} OR product_id = any({{productFilter.selectedItems.product_id}}))
)
  AND (
  {{couponFilter.value == 0}} OR
   transactions.coupon_id = any({{couponFilter.value}}))
)

select
   SUM(CASE WHEN type = 'current' THEN net_charge_usd ELSE 0 END) AS current_gmv,
  SUM(CASE WHEN type = 'past' THEN net_charge_usd ELSE 0 END) AS past_gmv,
  SUM(CASE WHEN type = 'current' THEN 1 ELSE 0 END) AS current_total_count,
  SUM(CASE WHEN type = 'past' THEN 1 ELSE 0 END) AS past_total_count
FROM coupon_aov
