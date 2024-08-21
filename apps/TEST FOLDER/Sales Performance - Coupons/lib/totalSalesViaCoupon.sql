WITH total_sales_via_coupon as (
    SELECT 
        transactions.original_product_charge_usd,
        transactions.coupon_id,
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
    FROM 
        transactions
    JOIN sales ON transactions.sale_id = sales.id
    WHERE 
        transactions.school_id = {{current_user.metadata.SchoolID}}
        AND (
    ({{productFilter.selectedItems.product_id.length <= 0}} OR product_id = any({{productFilter.selectedItems.product_id}}))
  )
  AND (
  {{couponFilter.value == 0}} OR
   transactions.coupon_id = any({{couponFilter.value}}))
) 

SELECT
    SUM(CASE WHEN type = 'current' THEN original_product_charge_usd ELSE 0 END) AS total_sales_current,
    SUM(CASE WHEN type = 'current' AND coupon_id IS NOT NULL THEN original_product_charge_usd ELSE 0 END) AS total_sales_with_coupon_current,
    SUM(CASE WHEN type = 'past' THEN original_product_charge_usd ELSE 0 END) AS total_sales_past,
    SUM(CASE WHEN type = 'past' AND coupon_id IS NOT NULL THEN original_product_charge_usd ELSE 0 END) AS total_sales_with_coupon_past
FROM 
  total_sales_via_coupon
