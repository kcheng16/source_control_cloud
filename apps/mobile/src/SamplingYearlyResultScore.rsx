<Screen
  id="SamplingYearlyResultScore"
  _customShortcuts={[]}
  _hashParams={[]}
  _order={4}
  _searchParams={[]}
  browserTitle={null}
  title="Yearly Result Scoresheet"
  urlSlug={null}
  uuid="e3cc4ac1-d66c-4a28-85ac-dcf17757b329"
>
  <SqlTransformQuery
    id="compile_base_data"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/compile_base_data.sql", "string")}
    resourceName="SQL Transforms"
    showSuccessToaster={false}
  >
    <Event
      id="6975e64d"
      event="success"
      method="trigger"
      params={{}}
      pluginId="compile_scorecard"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </SqlTransformQuery>
  <SqlTransformQuery
    id="compile_scorecard"
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/compile_scorecard.sql", "string")}
    resourceName="SQL Transforms"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="return data[0]"
  />
  <SqlTransformQuery
    id="compile_base_data_backup"
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/compile_base_data_backup.sql", "string")}
    resourceName="SQL Transforms"
    showSuccessToaster={false}
  >
    <Event
      id="6975e64d"
      event="success"
      method="trigger"
      params={{}}
      pluginId="compile_scorecard"
      type="datasource"
      waitMs="0"
      waitType="debounce"
    />
  </SqlTransformQuery>
  <SqlTransformQuery
    id="compile_scorecard_backup"
    enableTransformer={true}
    isMultiplayerEdited={false}
    notificationDuration={4.5}
    query={include("../lib/compile_scorecard_backup.sql", "string")}
    resourceName="SQL Transforms"
    runWhenModelUpdates={false}
    showSuccessToaster={false}
    transformer="return data[0]"
  />
  <Function
    id="trnRestToGrazeRatio"
    funcBody={include("../lib/trnRestToGrazeRatio.js", "string")}
  />
  <Container
    id="grpGC"
    align="flex-start"
    cornerType="square"
    gap={8}
    justify="flex-start"
    layout="column"
    padding={{ left: 0, right: 0, top: 0, bottom: 0 }}
    showBody={true}
    widthGrowFactor={1}
  >
    <Text
      id="txtGC"
      markdown={true}
      size="medium"
      value="**Groundcover - score: {{ compile_scorecard.data.groundcover_score}}** "
      weight="normal"
    />
    <KeyValue
      id="kvGC"
      _rowKeysFormatted={{
        groundcover_bare_ground_count: "Bare ground count",
        groundcover_grass_count: "Grass count",
        groundcover_legume_count: "Legume count",
        groundcover_forb_count: "Forb count",
        groundcover_other_count: "Other count",
        groundcover_overall_proportion: "Overall Proportion",
      }}
      _rowValuesFormatted={{
        groundcover_bare_ground_count: "{{ item }}",
        groundcover_grass_count:
          "{{ `${item == 'N/A' ? 'N/A' : `${item} (${numbro(compile_scorecard.data.groundcover_grass_proportion * 100).format({mantissa: 2})}%)`}` }}",
        groundcover_legume_count:
          "{{ `${item == 'N/A' ? 'N/A' : `${item} (${numbro(compile_scorecard.data.groundcover_legume_proportion * 100).format({mantissa: 2})}%)`}` }}",
        groundcover_forb_count:
          "{{ `${item == 'N/A' ? 'N/A' : `${item} (${numbro(compile_scorecard.data.groundcover_forb_proportion * 100).format({mantissa: 2})}%)`}` }}",
        groundcover_other_count:
          "{{ `${item == 'N/A' ? 'N/A' : `${item} (${numbro(compile_scorecard.data.groundcover_other_proportion * 100).format({mantissa: 2})}%)`}` }}",
        groundcover_overall_proportion:
          "{{ numbro(item * 100).format({mantissa: 2})}}%",
      }}
      allowTextWrapping={true}
      data="{{ _.pick(compile_scorecard.data, ['groundcover_bare_ground_count', 'groundcover_grass_count', 'groundcover_legume_count', 'groundcover_forb_count', 'groundcover_other_count', 'groundcover_overall_proportion']) }}"
      rows={[
        "a",
        "b",
        "c",
        "groundcover_bare_ground_count",
        "groundcover_grass_count",
        "groundcover_legume_count",
        "groundcover_forb_count",
        "groundcover_other_count",
        "groundcover_overall_proportion",
      ]}
      rowVisibility={{
        a: true,
        b: true,
        c: true,
        groundcover_other_count: true,
        groundcover_bare_ground_count: true,
        groundcover_grass_count: "true",
        groundcover_forb_count: true,
        groundcover_overall_proportion: true,
        groundcover_legume_count: true,
      }}
      showSeparator={true}
      valueHorizontalAlignment="right"
      valueWidth="50%"
    />
    <Divider id="divGC" spacing={4} />
  </Container>
  <Container
    id="grpPD"
    align="flex-start"
    cornerType="square"
    gap={8}
    justify="flex-start"
    layout="column"
    padding={{ left: 0, right: 0, top: 0, bottom: 0 }}
    showBody={true}
    widthGrowFactor={1}
  >
    <Text
      id="txtPD"
      markdown={true}
      size="medium"
      value="**Plant Diversity**"
      weight="normal"
    />
    <KeyValue
      id="kvPD"
      _rowKeysFormatted={{
        plant_diversity_forb_count: "Forb count",
        plant_diversity_grass_count: "Grass count",
        plant_diversity_legume_count: "Legume count",
        plant_diversity_other_count: "Other count",
      }}
      allowTextWrapping={true}
      data="{{ _.pick(compile_scorecard.data, [ 'plant_diversity_forb_count', 'plant_diversity_grass_count', 'plant_diversity_legume_count', 'plant_diversity_other_count']) }}"
      rows={[
        "a",
        "b",
        "c",
        "groundcover_bare_ground_count",
        "groundcover_grass_count",
        "groundcover_legume_count",
        "groundcover_forb_count",
        "groundcover_other_count",
        "groundcover_overall_proportion",
        "plant_diversity_forb_count",
        "plant_diversity_grass_count",
        "plant_diversity_legume_count",
        "plant_diversity_other_count",
      ]}
      rowVisibility={{
        a: true,
        b: true,
        c: true,
        plant_diversity_forb_count: true,
        plant_diversity_other_count: true,
        plant_diversity_legume_count: true,
        plant_diversity_grass_count: true,
        groundcover_other_count: true,
        groundcover_bare_ground_count: true,
        groundcover_grass_count: true,
        groundcover_forb_count: true,
        groundcover_overall_proportion: true,
        groundcover_legume_count: true,
      }}
      showSeparator={true}
      valueHorizontalAlignment="right"
      valueWidth="50%"
    />
    <Divider id="divPD" spacing={4} />
  </Container>
  <Include src="./grpWI.rsx" />
  <Container
    id="grpAS"
    align="flex-start"
    cornerType="square"
    gap={8}
    justify="flex-start"
    layout="column"
    padding={{ left: 0, right: 0, top: 0, bottom: 0 }}
    showBody={true}
    widthGrowFactor={1}
  >
    <Text
      id="txtAS"
      markdown={true}
      size="medium"
      style={{}}
      value="**Aggregate  Stability**"
      weight="normal"
    />
    <KeyValue
      id="kvAS"
      _rowKeysFormatted={{
        aggregate_stability_topsoil_slaking: "Slaking (top soil)",
        aggregate_stability_topsoil_dispersion_display: "Dispersion (top soil)",
        aggregate_stability_subsoil_slaking: "Slaking (sub soil)",
        aggregate_stability_subsoil_dispersion_display: "Dispersion (sub soil)",
      }}
      _rowValuesFormatted={{
        aggregate_stability_topsoil_slaking:
          "{{ `${item == 'N/A' ? 'N/A' : `${item * 100}%`} (score: ${compile_scorecard.data.aggregate_stability_topsoil_slaking_score})` }}",
        aggregate_stability_subsoil_slaking:
          "{{ `${item == 'N/A' ? 'N/A' : `${item * 100}%`} (score: ${compile_scorecard.data.aggregate_stability_subsoil_slaking_score})` }}",
        aggregate_stability_topsoil_dispersion_display:
          "{{ `${item} (score: ${compile_scorecard.data.aggregate_stability_topsoil_dispersion_score})` }}",
        aggregate_stability_subsoil_dispersion_display:
          "{{ `${item} (score: ${compile_scorecard.data.aggregate_stability_subsoil_dispersion_score})` }}",
      }}
      allowTextWrapping={true}
      data="{{ _.pick(compile_scorecard.data, [ 'aggregate_stability_topsoil_slaking', 'aggregate_stability_topsoil_dispersion_display', 'aggregate_stability_subsoil_slaking', 'aggregate_stability_subsoil_dispersion_display']) }}"
      direction="vertical"
      rows={[
        "a",
        "b",
        "c",
        "plant_diversity_forb_count",
        "plant_diversity_grass_count",
        "plant_diversity_legume_count",
        "plant_diversity_other_count",
        "water_infiltration_sample_1",
        "water_infiltration_sample_2",
        "water_infiltration_sample_3",
        "water_infiltration_sample_1_mm_ph",
        "water_infiltration_sample_2_mm_ph",
        "water_infiltration_sample_3_mm_ph",
        "water_infiltration_avg_mm_ph",
        "aggregate_stability_topsoil_slaking",
        "aggregate_stability_topsoil_dispersion_display",
        "aggregate_stability_subsoil_slaking",
        "aggregate_stability_subsoil_dispersion_display",
      ]}
      rowVisibility={{
        water_infiltration_sample_1: true,
        a: true,
        water_infiltration_sample_2: true,
        b: true,
        water_infiltration_sample_3: true,
        c: true,
        plant_diversity_forb_count: true,
        water_infiltration_avg_mm_ph: true,
        plant_diversity_other_count: true,
        aggregate_stability_topsoil_dispersion_display: true,
        aggregate_stability_subsoil_slaking: true,
        plant_diversity_legume_count: true,
        plant_diversity_grass_count: true,
        water_infiltration_sample_1_mm_ph: true,
        water_infiltration_sample_2_mm_ph: true,
        water_infiltration_sample_3_mm_ph: true,
        aggregate_stability_subsoil_dispersion_display: true,
        aggregate_stability_topsoil_slaking: true,
      }}
      showSeparator={true}
      valueHorizontalAlignment="right"
      valueWidth="50%"
    />
    <Divider id="divAS" spacing={4} />
  </Container>
  <Container
    id="grpOD"
    align="flex-start"
    cornerType="square"
    gap={8}
    justify="flex-start"
    layout="column"
    padding={{ left: 0, right: 0, top: 0, bottom: 0 }}
    showBody={true}
    widthGrowFactor={1}
  >
    <Text
      id="txtOD"
      markdown={true}
      size="medium"
      value="**Other Data**"
      weight="normal"
    />
    <KeyValue
      id="kvOD"
      _rowKeysFormatted={{
        humus_smell_level_at_5cm_display: "Humus smell at 5cm",
        soil_organisms_diversity_count: "Soil organism diversity",
        soil_organisms_earthworm_count: "Earthworm count",
        is_legume_nodules_red: "Legume nodules red",
        site_graze_days_per_year: "Graze",
        site_rest_days_per_year: "Rest",
        is_legume_nodules_present: "Legume nodules present",
        site_rest_to_graze_ratio: "Rest to graze ratio",
        topsoil_depth_in_cm: "Topsoil depth",
      }}
      _rowValuesFormatted={{
        topsoil_depth_in_cm:
          "{{ `${item == 'N/A' ? 'N/A' : `${item}cm`} (score: ${compile_scorecard.data.topsoil_depth_score})` }}",
        is_legume_nodules_present: "{{ item ? 'Yes' : 'No'  }}",
        is_legume_nodules_red: "{{ item ? 'Yes' : 'No'  }}",
        soil_organisms_diversity_count:
          "{{ `${item} (score:${compile_scorecard.data.soil_organisms_diversity_score})` }}",
        site_rest_days_per_year:
          "{{ item != 'N/A' ? `${item} days/year` : 'No data' }}",
        site_graze_days_per_year:
          "{{ item != 'N/A' ? `${item} days/year` : 'No data' }}",
        site_rest_to_graze_ratio: "{{ trnRestToGrazeRatio.value }}",
      }}
      allowTextWrapping={true}
      data="{{ _.pick(compile_scorecard.data, [ 'topsoil_depth_in_cm', 'humus_smell_level_at_5cm_display', 'soil_organisms_diversity_count', 'soil_organisms_earthworm_count', 'is_legume_nodules_present', 'is_legume_nodules_red', 'site_rest_days_per_year', 'site_graze_days_per_year', 'site_rest_to_graze_ratio']) }}"
      direction="vertical"
      rows={[
        "a",
        "b",
        "c",
        "plant_diversity_forb_count",
        "plant_diversity_grass_count",
        "plant_diversity_legume_count",
        "plant_diversity_other_count",
        "water_infiltration_sample_1",
        "water_infiltration_sample_2",
        "water_infiltration_sample_3",
        "water_infiltration_sample_1_mm_ph",
        "water_infiltration_sample_2_mm_ph",
        "water_infiltration_sample_3_mm_ph",
        "water_infiltration_avg_mm_ph",
        "aggregate_stability_topsoil_slaking",
        "aggregate_stability_topsoil_dispersion_display",
        "aggregate_stability_subsoil_slaking",
        "aggregate_stability_subsoil_dispersion_display",
        "topsoil_depth_in_cm",
        "humus_smell_level_at_5cm_display",
        "is_legume_nodules_present",
        "is_legume_nodules_red",
        "soil_organisms_diversity_count",
        "soil_organisms_earthworm_count",
        "soil_organisms_diversity_score",
        "site_rest_days_per_year",
        "site_graze_days_per_year",
        "site_rest_to_graze_ratio",
      ]}
      rowVisibility={{
        water_infiltration_sample_1: true,
        a: true,
        water_infiltration_sample_2: true,
        b: true,
        water_infiltration_sample_3: true,
        c: true,
        plant_diversity_forb_count: true,
        humus_smell_level_at_5cm_display: true,
        water_infiltration_avg_mm_ph: true,
        plant_diversity_other_count: true,
        aggregate_stability_topsoil_dispersion_display: true,
        aggregate_stability_subsoil_slaking: true,
        plant_diversity_legume_count: true,
        soil_organisms_diversity_count: true,
        plant_diversity_grass_count: true,
        soil_organisms_diversity_score: true,
        soil_organisms_earthworm_count: true,
        is_legume_nodules_red: true,
        site_graze_days_per_year: true,
        site_rest_days_per_year: true,
        water_infiltration_sample_1_mm_ph: true,
        is_legume_nodules_present: true,
        water_infiltration_sample_2_mm_ph: true,
        water_infiltration_sample_3_mm_ph: true,
        site_rest_to_graze_ratio: true,
        topsoil_depth_in_cm: true,
        aggregate_stability_subsoil_dispersion_display: true,
        aggregate_stability_topsoil_slaking: true,
      }}
      showSeparator={true}
      valueHorizontalAlignment="right"
      valueWidth="50%"
    />
    <Divider id="divOD" spacing={4} />
  </Container>
  <Text
    id="text2"
    size="medium"
    value="Aggregate Stability"
    weight="semibold"
  />
  <Button id="button1" size="large" text="Button">
    <Event
      id="de3a920f"
      event="click"
      method="navigateTo"
      params={{ map: { screenPluginId: "SamplingRoundAddEdit" } }}
      pluginId=""
      type="navigator"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Multiselect
    id="selCFAsSamplers2"
    hidden="{{ varSelectedSamplingRound.value.sampling_type != 'type_yearly' }}"
    label="CF Staffs as Samplers"
    labelPosition="top"
    labels=""
    placeholder="Select staff names"
    value="{{ varSelectedSamplingRound.value?.cf_staff_as_sampler_ids }}"
    values={
      '["test", "10.0.1.9", "Adrian Vandenbergh","Alec Downey","Alec Neville","Alexis Terry"]'
    }
  />
</Screen>
