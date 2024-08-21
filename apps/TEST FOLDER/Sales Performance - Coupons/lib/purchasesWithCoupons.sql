SELECT
    CASE
        WHEN transactions.created_at >= {{date.value.current.start}}
        AND transactions.created_at < {{date.value.current.end}} THEN 'current'
        WHEN transactions.created_at >= {{date.value.past.start}}
        AND transactions.created_at < {{date.value.past.end}} THEN 'past'
    END AS time_period,
    SUM(
        CASE
            WHEN transactions.coupon_id IS NOT NULL THEN 1
            ELSE 0
        END
    ) AS cnt_transactions_with_coupons,
  COUNT(*) AS cnt_transactions
   
FROM
    transactions
    JOIN sales ON transactions.sale_id = sales.id
WHERE
    transactions.school_id = {{current_user.metadata.SchoolID}}
    AND (
        (
            transactions.created_at >= {{date.value.current.start}}
            AND transactions.created_at < {{date.value.current.end}}
        )
        OR (
            transactions.created_at >= {{date.value.past.start}}
            AND transactions.created_at < {{date.value.past.end}}
        )
    )
    AND ({{productFilter.selectedItems.product_id.length <= 0}} OR sales.product_id = any({{productFilter.selectedItems.product_id}}))
    AND ({{couponFilter.value == 0}} OR transactions.coupon_id = any({{couponFilter.value}}))

GROUP BY
    time_period
