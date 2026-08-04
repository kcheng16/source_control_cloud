<Container
  id="cntPlantDiversity"
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
  title="Plant Diversity"
  widthGrowFactor={1}
>
  <NumberInput
    id="txtPD_GrassCount"
    customValidation="{{ /^[0-9]*$/.test(txtPD_GrassCount.value) && !chkPD_GrassCount.value ? '' : 'Minimum value is 0' }}"
    disabled="{{ chkPD_GrassCount.value }}"
    label="Grass Count"
    placeholder="0"
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.plant_diversity_grass_count }}"
  />
  <Switch
    id="chkPD_GrassCount"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.plant_diversity_grass_count == undefined }}"
    width="full"
  />
  <NumberInput
    id="txtPD_LegumeCount"
    customValidation="{{ /^[0-9]*$/.test(txtPD_LegumeCount.value) && !chkPD_LegumeCount.value ? '' : 'Minimum value is 0' }}"
    disabled="{{ chkPD_LegumeCount.value }}"
    label="Legume Count"
    placeholder={0}
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.plant_diversity_legume_count }}"
  />
  <Switch
    id="chkPD_LegumeCount"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.plant_diversity_legume_count == undefined }}"
    width="full"
  />
  <NumberInput
    id="txtPD_ForbCount"
    customValidation="{{ /^[0-9]*$/.test(txtPD_ForbCount.value) && !chkPD_ForbCount.value ? '' : 'Minimum value is 0' }}"
    disabled="{{ chkPD_ForbCount.value }}"
    label="Forb Count"
    placeholder={0}
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.plant_diversity_forb_count }}"
  />
  <Switch
    id="chkPD_ForbCount"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.plant_diversity_forb_count == undefined }}"
    width="full"
  />
  <NumberInput
    id="txtPD_OtherCount"
    customValidation="{{ /^[0-9]*$/.test(txtPD_OtherCount.value) && !chkPD_OtherCount.value ? '' : 'Minimum value is 0' }}"
    disabled="{{ chkPD_OtherCount.value }}"
    label="Other Count"
    placeholder={0}
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.plant_diversity_other_count }}"
  />
  <Switch
    id="chkPD_OtherCount"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.plant_diversity_other_count == undefined }}"
    width="full"
  />
  <Divider id="divider5" spacing={4} />
</Container>
