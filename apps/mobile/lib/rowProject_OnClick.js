let selectedProject = get_soil_round_and_project_data.data.find((x) => x.project_id == selectedRow.project_id);

varSelectedProject.setValue(selectedProject);

navigator.navigateTo('SamplingRoundList');