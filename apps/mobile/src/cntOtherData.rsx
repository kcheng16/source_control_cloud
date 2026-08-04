<Container
  id="cntOtherData"
  align="flex-start"
  collapsedIcon="bold/interface-arrows-button-down"
  collapsible={true}
  cornerType="square"
  expandedIcon="bold/interface-arrows-button-up"
  gap={8}
  justify="flex-start"
  layout="column"
  padding={{ left: 0, right: 0, top: 0, bottom: 0 }}
  showBody={true}
  title="Other Data"
  widthGrowFactor={1}
>
  <NumberInput
    id="txtOt_TopsoilDepth"
    customValidation="{{ /^[0-9]*$/.test(txtOt_TopsoilDepth.value) && !chkOt_TopsoilDepth.value ? '' : 'Minimum value is 0' }}"
    disabled="{{ chkOt_TopsoilDepth.value }}"
    label="Topsoil depth (in cm)"
    placeholder={0}
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.topsoil_depth_in_cm }}"
  />
  <Switch
    id="chkOt_TopsoilDepth"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.topsoil_depth_in_cm == undefined }}"
    width="full"
  />
  <Select
    id="selOt_HumusSmell"
    disabled="{{ chkOt_HumusSmell.value }}"
    label="Humus Smell at 5cm"
    labelPosition="top"
    labels="{{ get_humus_smells.data.map((x) => x.option_name) }}"
    placeholder="Select an option"
    required={true}
    value="{{ varSelectedSamplingSiteResult.value?.humus_smell_level_at_5cm }}"
    values="{{ get_humus_smells.data.map((x) => x.option_key) }}"
  />
  <Switch
    id="chkOt_HumusSmell"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.humus_smell_level_at_5cm == undefined }}"
    width="full"
  />
  <Select
    id="selOt_LegumePresent"
    disabled="{{ chkOt_LegumePresent.value }}"
    label="Are legume nodules present?"
    labelPosition="top"
    labels="['Yes', 'No']"
    placeholder="Select an option"
    required={true}
    value="{{ varSelectedSamplingSiteResult.value?.is_legume_nodules_present.toString() }}"
    values="['true', 'false']"
  />
  <Switch
    id="chkOt_LegumePresent"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.is_legume_nodules_present == undefined }}"
    width="full"
  />
  <Select
    id="selOt_LegumeIsRed"
    disabled="{{ chkOt_LegumeIsRed.value }}"
    label="Are legume nodules red?"
    labelPosition="top"
    labels="['Yes', 'No']"
    placeholder="Select an option"
    required={true}
    value="{{ varSelectedSamplingSiteResult.value?.is_legume_nodules_red.toString() }}"
    values="['true', 'false']"
  />
  <Switch
    id="chkOt_LegumeIsRed"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.is_legume_nodules_red == undefined }}"
    width="full"
  />
  <NumberInput
    id="txtOt_SpeciesCount"
    customValidation="{{ /^[0-9]*$/.test(txtOt_SpeciesCount.value) && !chkOt_SpeciesCount.value ? '' : 'Minimum value is 0' }}"
    disabled="{{ chkOt_SpeciesCount.value }}"
    label="Number of soil organism species"
    placeholder={0}
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.soil_organisms_diversity_count }}"
  />
  <Switch
    id="chkOt_SpeciesCount"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.soil_organisms_diversity_count == undefined }}"
    width="full"
  />
  <NumberInput
    id="txtOt_EarthwormCount"
    customValidation="{{ /^[0-9]*$/.test(txtOt_EarthwormCount.value) && !chkOt_EarthwormCount.value ? '' : 'Minimum value is 0' }}"
    disabled="{{ chkOt_EarthwormCount.value }}"
    label="Number of earthworms"
    placeholder={0}
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.soil_organisms_earthworm_count }}"
  />
  <Switch
    id="chkOt_EarthwormCount"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.soil_organisms_earthworm_count == undefined }}"
    width="full"
  />
  <NumberInput
    id="txtOt_RestDay"
    customValidation="{{ /^[0-9]*$/.test(txtOt_RestDay.value) && !chkOt_RestDay.value ? '' : 'Minimum value is 0' }}"
    disabled="{{ chkOt_RestDay.value }}"
    label="Rest days per year"
    placeholder={0}
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.site_rest_days_per_year }}"
  />
  <Switch
    id="chkOt_RestDay"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.site_rest_days_per_year == undefined }}"
    width="full"
  />
  <NumberInput
    id="txtOt_GrazeDay"
    customValidation="{{ /^[0-9]*$/.test(txtOt_GrazeDay.value) && !chkOt_GrazeDay.value ? '' : 'Minimum value is 0' }}"
    disabled="{{ chkOt_GrazeDay.value }}"
    label="Graze days per year"
    placeholder={0}
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.site_graze_days_per_year }}"
  />
  <Switch
    id="chkOt_GrazeDay"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.site_graze_days_per_year == undefined }}"
    width="full"
  />
  <Divider id="divider8" spacing={4} />
</Container>
