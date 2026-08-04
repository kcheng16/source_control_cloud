<MobileApp>
  <Include src="./functions.rsx" />
  <Include src="./src/SamplingRoundAddEdit.rsx" />
  <Include src="./src/SamplingRoundList.rsx" />
  <Include src="./src/SamplingSiteAddEdit.rsx" />
  <Include src="./src/SamplingYearlyResultScore.rsx" />
  <Include src="./src/SoilProjectList.rsx" />
  <TabScreen
    id="tabscreen"
    _order={0}
    defaultTab="SamplingYearlyResultScore"
    items={[
      {
        screen: "SoilProjectList",
        icon: "bold/interface-text-formatting-list-bullets",
      },
      {
        screen: "SamplingYearlyResultScore",
        detailScreen: "",
        icon: null,
        title: null,
      },
    ]}
    uuid="f32e103f-54ca-4b1a-99c3-e70b5b44b7da"
  />
</MobileApp>
