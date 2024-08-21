WITH total_amount_discounted AS (
  SELECT
    (coupons.discount_percent * transactions.original_product_charge_usd) AS discount_amount,
    transactions.id,
    sales.product_id,
    transactions.coupon_id,
    CASE
      WHEN transactions.created_at >= {{date.value.current.start}} 
      AND transactions.created_at < {{date.value.current.end}} THEN 'current'
      WHEN transactions.created_at >= {{date.value.past.start}} 
      AND transactions.created_at < {{date.value.past.end}} THEN 'past'
    END AS type
  FROM
    transactions
    JOIN coupons ON coupons.id = transactions.coupon_id
    JOIN sales ON transactions.sale_id = sales.id
  WHERE
    transactions.school_id = {{current_user.metadata.SchoolID}} 
    AND transactions.status = 'paid'
    AND (
      (transactions.created_at >= {{date.value.current.start}} 
      AND transactions.created_at < {{date.value.current.end}})
      OR 
      (transactions.created_at >= {{date.value.past.start}} 
      AND transactions.created_at < {{date.value.past.end}})
    )
)
SELECT
  SUM(
    CASE
      WHEN type = 'current' THEN discount_amount
      ELSE 0
    END
  ) AS current,
  SUM(
    CASE
      WHEN type = 'past' THEN discount_amount
      ELSE 0
    END
  ) AS past
FROM
  total_amount_discounted
WHERE
  (
    {{productFilter.selectedItems.product_id.length <= 0}} 
    OR product_id = ANY({{productFilter.selectedItems.product_id}})
  )
  AND
  (
    {{couponFilter.value == 0}} 
    OR coupon_id = ANY({{couponFilter.value}})
  )

