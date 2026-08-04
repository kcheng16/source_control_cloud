CALL non_spatial.process_dynamic_procedure_call(
	p_procedure_name => {{ procedureName }}::TEXT,
    p_json_params => {{ parameters }}::JSONB,
    p_log_by => NULL::UUID,
    p_result => NULL::TEXT
)