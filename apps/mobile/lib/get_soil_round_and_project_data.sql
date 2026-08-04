
SELECT p.name as project_name,
  p.erf_id,
  p.project_state,
  staff_pm.name as project_manager,
  (CASE 
	WHEN p.status = 'Active' and p.condition_at_registration = true and p.condition_variation_approval_date is null then 'Registered with conditions'
	WHEN p.status = 'Active' then 'Registered'
	ELSE s.display_name		
  END ) AS project_status,
  vw_ssr.*
FROM non_spatial.vw_soil_sampling_round_with_forecast vw_ssr
  INNER JOIN non_spatial.projects p
    on vw_ssr.project_id = p.variation and p.status != 'Revoked'
  INNER JOIN non_spatial.project_status s 
    ON s.status = p.status
  LEFT JOIN non_spatial.related_staff rs_pm 
    ON rs_pm.entity_id = p.variation AND rs_pm.role_key::text = 'project-manager'::text
  LEFT JOIN non_spatial.staff staff_pm 
    ON staff_pm.id = rs_pm.staff_id
