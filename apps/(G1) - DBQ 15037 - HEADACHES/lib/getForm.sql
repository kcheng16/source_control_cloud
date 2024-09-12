SELECT 
  *
FROM 
  dbq_forms
WHERE 
  dbq_form_id = {{urlparams.dbqFormId}} AND is_active = true
ORDER BY created_date DESC
LIMIT 1