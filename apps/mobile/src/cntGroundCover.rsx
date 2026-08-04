<Container
  id="cntGroundCover"
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
  title="Groundcover"
  widthGrowFactor={1}
>
  <NumberInput
    id="txtGC_GrassCount"
    customValidation="{{ /^[0-9]*$/.test(txtGC_GrassCount.value) && !chkGC_GrassCount.value ? '' : 'Minimum value is 0' }}"
    disabled="{{ chkGC_GrassCount.value }}"
    label="Grass Count"
    placeholder={0}
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.groundcover_grass_count }}"
  />
  <Switch
    id="chkGC_GrassCount"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.groundcover_grass_count == undefined }}"
    width="full"
  />
  <NumberInput
    id="txtGC_LegumeCount"
    customValidation="{{ /^[0-9]*$/.test(txtGC_LegumeCount.value) && !chkGC_LegumeCount.value ? '' : 'Minimum value is 0' }}"
    disabled="{{ chkGC_LegumeCount.value }}"
    label="Legume Count"
    placeholder={0}
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.groundcover_legume_count }}"
  />
  <Switch
    id="chkGC_LegumeCount"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.groundcover_legume_count == undefined }}"
    width="full"
  />
  <NumberInput
    id="txtGC_ForbCount"
    customValidation="{{ /^[0-9]*$/.test(txtGC_ForbCount.value) && !chkGC_ForbCount.value ? '' : 'Minimum value is 0' }}"
    disabled="{{ chkGC_ForbCount.value }}"
    label="Forb Count"
    placeholder={0}
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.groundcover_forb_count }}"
  />
  <Switch
    id="chkGC_ForbCount"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.groundcover_forb_count == undefined }}"
    width="full"
  />
  <NumberInput
    id="txtGC_OtherCount"
    customValidation="{{ /^[0-9]*$/.test(txtGC_OtherCount.value) && !chkGC_OtherCount.value ? '' : 'Minimum value is 0' }}"
    disabled="{{ chkGC_OtherCount.value }}"
    label="Other Count"
    placeholder={0}
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.groundcover_other_count }}"
  />
  <Switch
    id="chkGC_OtherCount"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.groundcover_other_count == undefined }}"
    width="full"
  />
  <NumberInput
    id="txtGC_BareGroundCount"
    customValidation="{{ /^[0-9]*$/.test(txtGC_BareGroundCount.value) && !chkGC_BareGroundCount.value ? '' : 'Minimum value is 0' }}"
    disabled="{{ chkGC_BareGroundCount.value }}"
    label="Bare Ground Count"
    placeholder={0}
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.groundcover_bare_ground_count }}"
  />
  <Switch
    id="chkGC_BareGroundCount"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.groundcover_bare_ground_count == undefined }}"
    width="full"
  />
  <Divider id="divider4" spacing={4} />
</Container>
