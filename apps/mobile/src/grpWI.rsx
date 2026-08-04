<Container
  id="grpWI"
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
    id="txtWI"
    markdown={true}
    size="medium"
    value="**Water Infiltration - score: {{ compile_scorecard.data.water_infiltration_score}}**"
    weight="normal"
  />
  <KeyValue
    id="kvWI"
    _rowKeysFormatted={{
      water_infiltration_sample_1: "Sample 1 (mm/6min)",
      water_infiltration_sample_2: "Sample 2 (mm/6min)",
      water_infiltration_sample_3: "Sample 3 (mm/6min)",
      water_infiltration_sample_1_mm_ph: "Sample 1 (mm/hour)",
      water_infiltration_sample_2_mm_ph: "Sample 2 (mm/hour)",
      water_infiltration_sample_3_mm_ph: "Sample 3 (mm/hour)",
      water_infiltration_avg_mm_ph: "Average (mm/hour)",
    }}
    _rowValuesFormatted={{
      map: {
        water_infiltration_avg_mm_ph:
          "{{ numbro(item).format({mantissa: 2}) }}",
      },
    }}
    allowTextWrapping={true}
    data="{{ _.pick(compile_scorecard.data, [ 'water_infiltration_sample_1', 'water_infiltration_sample_2', 'water_infiltration_sample_3', 'water_infiltration_sample_1_mm_ph', 'water_infiltration_sample_2_mm_ph', 'water_infiltration_sample_3_mm_ph', 'water_infiltration_avg_mm_ph']) }}"
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
      plant_diversity_legume_count: true,
      plant_diversity_grass_count: true,
      water_infiltration_sample_1_mm_ph: true,
      water_infiltration_sample_2_mm_ph: true,
      water_infiltration_sample_3_mm_ph: true,
    }}
    showSeparator={true}
    valueHorizontalAlignment="right"
    valueWidth="50%"
  />
  <Divider id="divWI" spacing={4} />
  <Text
    id="txtAS2"
    markdown={true}
    size="medium"
    style={{}}
    value="**Aggregate Stability 1**"
    weight="normal"
  />
  <Text
    id="txtAS3"
    markdown={true}
    size="medium"
    style={{}}
    value="**Aggregate Stability 12**"
    weight="normal"
  />
  <Text
    id="txtAS4"
    markdown={true}
    size="medium"
    style={{}}
    value="**Aggregate Stability 123**"
    weight="normal"
  />
  <Text
    id="txtAS5"
    markdown={true}
    size="medium"
    style={{}}
    value="**Aggregate Stability 1234**"
    weight="normal"
  />
</Container>
