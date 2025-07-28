<App>
  <Include src="./functions.rsx" />
  <Include src="./src/CaseList.rsx" />
  <Include src="./src/CaseViewer.rsx" />
  <AppStyles id="$appStyles" css={include("./lib/$appStyles.css", "string")} />
  <Include src="./header.rsx" />
  <Include src="./src/Modal_Claim_Lookup.rsx" />
  <Include src="./src/Modal_Member_Lookup.rsx" />
  <Include src="./src/Modal_NewCase.rsx" />
  <Include src="./src/Modal_PA_Lookup.rsx" />
  <Include src="./sidebar.rsx" />
</App>
