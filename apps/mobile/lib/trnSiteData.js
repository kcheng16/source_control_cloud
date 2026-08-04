return {
  id: {{ varSelectedSamplingSite.value?.id }},
  soil_sampling_round_id: {{ varSelectedSamplingRound.value?.id }},
  site_number: {{ varSelectedSamplingSite.value?.site_number }},
  site_name: {{ txtSiteName.value }},
  sample_taken_date: {{ dtSampleTakenDate.value == '' ? '' : moment(dtSampleTakenDate.value).format("yyyy-MM-D") }},
  latitude: {{ txtlatitude.value }},
  longitude: {{ txtLongitude.value }},
  note: {{ txtNote.value }},
  cea: {{ txtCEA.value }},
  strata: {{ txtStrata.value }},
  property: {{ txtProperty.value }},
  paddock_use_as: {{ selPaddockUseAs.value }},
  paddock_use_as_other: {{ selPaddockUseAs.value != 'use_as_other' ? '' : txtPaddockAsOther.value }},
  paddock_use_as_display: {{ get_list_options.data.find((x) => x.option_key == selPaddockUseAs.value)?.option_name }}
};