SELECT distinct project_name as title,
  CONCAT(erf_id, ' | ', project_manager) as body,
  project_state,
  project_status as caption,
  project_id,
  erf_id,
  project_manager,
  project_state,
  project_status,
  project_name
from {{ get_soil_round_and_project_data.data }}
where CONCAT(erf_id, ',', project_manager, ',', project_name, ',', project_status) like CONCAT('%',{{ txtSearchProjects.value}}, '%') OR {{ txtSearchProjects.value == '' }}
order by project_name