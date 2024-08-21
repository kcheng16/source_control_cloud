SELECT
	COUNT(*) as COUNT,
    'current' as type 
FROM
	transactions
WHERE
	transactions.school_id = {{current_user.metadata.SchoolID}} 
    AND transactions.created_at >= {{date.value.current.start}}
    AND transactions.created_at < {{date.value.current.end}}
UNION SELECT 
  COUNT(*) AS COUNT, 
  'past' as type 
FROM
	transactions
    JOIN sales ON transactions.sale_id = sales.id
WHERE
	transactions.school_id = {{current_user.metadata.SchoolID}} 
    AND (
    ({{productFilter.selectedItems.product_id.length <= 0}} OR product_id = any({{productFilter.selectedItems.product_id}}))
  )
  AND 
  
    transactions.created_at >= 
{{date.value.past.start}}
  AND 
    transactions.created_at < {{date.value.past.end}}