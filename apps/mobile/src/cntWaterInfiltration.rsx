<Container
  id="cntWaterInfiltration"
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
  title="Water Infiltration"
  widthGrowFactor={1}
>
  <NumberInput
    id="txtWI_Sample1"
    customValidation="{{ /^[0-9]*$/.test(txtWI_Sample1.value) && !chkWI_Sample1.value ? '' : 'Minimum value is 0' }}"
    disabled="{{ chkWI_Sample1.value }}"
    label="Sample 1 (mm/6min)"
    placeholder={0}
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.water_infiltration_sample_1 }}"
  />
  <Switch
    id="chkWI_Sample1"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.water_infiltration_sample_1 == undefined }}"
    width="full"
  />
  <NumberInput
    id="txtWI_Sample2"
    customValidation="{{ /^[0-9]*$/.test(txtWI_Sample2.value) && !chkWI_Sample2.value ? '' : 'Minimum value is 0' }}"
    disabled="{{ chkWI_Sample2.value }}"
    label="Sample 2 (mm/6min)"
    placeholder={0}
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.water_infiltration_sample_2 }}"
  />
  <Switch
    id="chkWI_Sample2"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.water_infiltration_sample_2 == undefined }}"
    width="full"
  />
  <NumberInput
    id="txtWI_Sample3"
    customValidation="{{ /^[0-9]*$/.test(txtWI_Sample3.value) && !chkWI_Sample3.value ? '' : 'Minimum value is 0' }}"
    disabled="{{ chkWI_Sample3.value }}"
    label="Sample 3 (mm/6min)"
    placeholder={0}
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.water_infiltration_sample_3 }}"
  />
  <Switch
    id="chkWI_Sample3"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.water_infiltration_sample_3 == undefined }}"
    width="full"
  />
  <Divider id="divider6" spacing={4} />
</Container>
