<Container
  id="cntAggregateStability"
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
  title="Aggregate Stability"
  widthGrowFactor={1}
>
  <NumberInput
    id="txtAS_SlakingTopSoil"
    customValidation="{{ (/^(100|[1-9]?[0-9])$/).test(txtAS_SlakingTopSoil.value) && !chkAS_SlakingTopSoil.value ? '' : 'Input valid percentage (0 - 100)' }}"
    disabled="{{ chkAS_SlakingTopSoil.value }}"
    label="Topsoil Slaking (%)"
    placeholder={0}
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.aggregate_stability_topsoil_slaking * 100 }}"
  />
  <Switch
    id="chkAS_SlakingTopSoil"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.aggregate_stability_topsoil_slaking == undefined }}"
    width="full"
  />
  <Select
    id="selAS_DispersionTopSoil"
    disabled="{{ chkAS_DispersionTopSoil.value }}"
    label="Topsoil Dispersion"
    labelPosition="top"
    labels="{{ get_dispersions.data.map((x) => x.option_name) }}"
    placeholder="Select an option"
    required={true}
    value="{{ varSelectedSamplingSiteResult.value?.aggregate_stability_topsoil_dispersion }}"
    values="{{ get_dispersions.data.map((x) => x.option_key) }}"
  />
  <Switch
    id="chkAS_DispersionTopSoil"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.aggregate_stability_topsoil_dispersion == undefined }}"
    width="full"
  />
  <NumberInput
    id="txtAS_SlakingSubSoil"
    customValidation="{{ (/^(100|[1-9]?[0-9])$/).test(txtAS_SlakingSubSoil.value) && !chkAS_SlakingSubSoil.value ? '' : 'Input valid percentage (0 - 100)' }}"
    disabled="{{ chkAS_SlakingSubSoil.value }}"
    label="Subsoil Slaking (%)"
    placeholder={0}
    required={true}
    showStepper={true}
    stepSize={1}
    value="{{ varSelectedSamplingSiteResult.value?.aggregate_stability_subsoil_slaking * 100 }}"
  />
  <Switch
    id="chkAS_SlakingSubSoil"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.aggregate_stability_subsoil_slaking == undefined }}"
    width="full"
  />
  <Select
    id="selAS_DispersionSubSoil"
    disabled="{{ chkAS_DispersionSubSoil.value }}"
    label="Subsoil Dispersion"
    labelPosition="top"
    labels="{{ get_dispersions.data.map((x) => x.option_name) }}"
    placeholder="Select an option"
    required={true}
    value="{{ varSelectedSamplingSiteResult.value?.aggregate_stability_subsoil_dispersion }}"
    values="{{ get_dispersions.data.map((x) => x.option_key) }}"
  />
  <Switch
    id="chkAS_DispersionSubSoil"
    label="Data not available"
    type="checkbox"
    value="{{ varSelectedSamplingSiteResult.value != undefined && varSelectedSamplingSiteResult.value.aggregate_stability_subsoil_dispersion == undefined }}"
    width="full"
  />
  <Divider id="divider7" spacing={4} />
</Container>
