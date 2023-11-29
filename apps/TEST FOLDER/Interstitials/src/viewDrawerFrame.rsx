<DrawerFrame
  id="viewDrawerFrame"
  hidden={true}
  isHiddenOnMobile={true}
  showFooter="true"
  showHeader={true}
  showOverlay={true}
  width="large"
>
  <Header>
    <Text
      id="viewDrawerTItle"
      hidden="{{getSelectedInterstitial.isFetching}}"
      value="### {{ selectedInterstitial.value.name }}"
      verticalAlign="center"
    />
    <Button
      id="button1"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="viewDrawerFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "null" }] }}
        pluginId="errorMessage"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Tags
      id="viewStatusTag"
      allowWrap={true}
      colors="[{{ statusMap.value[selectedInterstitial.value.status].color }}]"
      hashColors={true}
      hidden="{{getSelectedInterstitial.isFetching}}"
      style={{ ordered: [{ defaultBackground: "automatic" }] }}
      value="[{{ statusMap.value[selectedInterstitial.value.status].label }}]"
    />
    <Module
      id="simpleFormUpdate"
      createInterstitialFormOutput="{{createInterstitialFormOutput.value}}"
      errorMessage="{{ errorMessage.value }}"
      formType="update"
      getInterstitialsPage="getInterstitialsPage"
      getSelectedInterstitial="getSelectedInterstitial"
      hidden="{{ selectedInterstitial.value.data.layout !== 'simple' }}"
      hideCreateDrawerFrame="hideCreateDrawerFrame"
      interstitialName="{{selectedInterstitialName.value}}"
      name="Simple Form"
      pageUuid="a6d2d699-24c6-442b-a9ed-26327f8d4d7b"
      patchInterstitial="patchInterstitial"
      postConfig="postConfig"
      putInterstitial="putInterstitial"
      selectedInterstitial="{{ selectedInterstitial.value }}"
      setErrorMessage="setErrorMessage"
      setSelectedInterstitialName="setSelectedInterstitialName"
      showViewDrawerFrame="showViewDrawerFrame"
      submitFormTrigger="{{ submitUpdateForm.data }}"
      uploadImages="uploadImages"
    />
    <Module
      id="standardFormUpdate"
      errorMessage="{{ errorMessage.value }}"
      formType="update"
      getInterstitialsPage="getInterstitialsPage"
      getSelectedInterstitial="getSelectedInterstitial"
      hidden="{{ selectedInterstitial.value.data.layout !== 'standard' }}"
      hideCreateDrawerFrame="hideCreateDrawerFrame"
      interstitialName="{{ selectedInterstitialName.value }}"
      name="Standard Form"
      pageUuid="1153900a-7bfd-4c0d-b774-f78b621a7cb4"
      patchInterstitial="patchInterstitial"
      postConfig="postConfig"
      putInterstitial="putInterstitial"
      selectedInterstitial="{{ selectedInterstitial.value }}"
      setErrorMessage="setErrorMessage"
      setSelectedInterstitialName="setSelectedInterstitialName"
      showViewDrawerFrame="showViewDrawerFrame"
      submitFormTrigger="{{ submitUpdateForm.data }}"
      uploadImages="uploadImages"
    />
    <Module
      id="ratingsBinaryFormUpdate"
      errorMessage="{{ errorMessage.value }}"
      formType="update"
      getInterstitialsPage="getInterstitialsPage"
      getSelectedInterstitial="getSelectedInterstitial"
      hidden="{{selectedInterstitial.value.data.layout !== 'ratingsBinary'}}"
      hideCreateDrawerFrame="hideCreateDrawerFrame"
      interstitialName="{{ selectedInterstitialName.value }}"
      name="Ratings Binary Form"
      output1="{{output1.value}}"
      pageUuid="a5207841-d457-40ec-8fca-98c996c3504c"
      patchInterstitial="patchInterstitial"
      postConfig="postConfig"
      putInterstitial="putInterstitial"
      selectedInterstitial="{{ selectedInterstitial.value }}"
      setErrorMessage="setErrorMessage"
      setSelectedInterstitialName="setSelectedInterstitialName"
      showViewDrawerFrame="showViewDrawerFrame"
      submitFormTrigger="{{ submitUpdateForm.data }}"
      uploadImages="uploadImages"
    />
    <Text
      id="viewUserInfoText"
      value="Last Modified: {{selectedInterstitial.value.lastModified}}
Created By: {{selectedInterstitial.value.createdBy}}
Created Time: {{selectedInterstitial.value.createdTime}}"
      verticalAlign="center"
    />
  </Body>
  <Footer>
    <Button
      id="deleteButton"
      hidden="true"
      iconBefore={'{{  "/icon:bold/interface-delete-bin-1"  }}'}
      style={{ ordered: [{ border: "danger" }, { label: "danger" }] }}
      styleVariant="outline"
    />
    <Button
      id="duplicateButton"
      hidden="true"
      iconBefore="bold/interface-align-layers-3"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="Duplicate"
    />
    <Button
      id="saveDraftButton"
      disabled=""
      hidden="{{getSelectedInterstitial.isFetching ||  selectedInterstitial.value.state !== 'draft' }}"
      iconBefore="bold/interface-content-save"
      styleVariant="solid"
      submitTargetId=""
      text="Save Draft"
    >
      <Event
        event="click"
        method="run"
        params={{ ordered: [{ src: "submitUpdateForm.trigger()" }] }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="testingButton"
      disabled=""
      hidden="{{getSelectedInterstitial.isFetching ||  selectedInterstitial.value.state !== 'draft' }}"
      iconAfter="bold/interface-arrows-right-alternate"
      style={{ ordered: [{ background: "success" }] }}
      styleVariant="solid"
      submitTargetId=""
      text="Testing"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "updateInterstitialState.trigger({\n  additionalScope: {\n    newState: 'test'\n  }\n})",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="viewersButton"
      hidden="{{getSelectedInterstitial.isFetching || !['draft', 'test'].includes(selectedInterstitial.value.status)}}"
      iconBefore="bold/interface-edit-view"
      style={{ ordered: [] }}
      styleVariant="outline"
      text="Viewers"
    >
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="viewersDrawerFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="pauseButton"
      hidden="{{getSelectedInterstitial.isFetching || selectedInterstitial.value.state !== 'active' || selectedInterstitial.value.status === 'ended' }}"
      iconBefore={
        '{{selectedInterstitial.value.paused ? "/icon:bold/entertainment-control-button-play" : "/icon:bold/entertainment-control-button-pause-1" }}'
      }
      styleVariant="solid"
      submitTargetId=""
      text="{{selectedInterstitial.value.paused ? 'Resume' : 'Pause' }}"
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="toggleInterstitialPause"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="publishButton"
      disabled=""
      hidden="{{getSelectedInterstitial.isFetching ||  selectedInterstitial.value.state !== 'test' }}"
      iconAfter="bold/interface-arrows-right-alternate"
      style={{ ordered: [{ background: "success" }] }}
      styleVariant="solid"
      submitTargetId=""
      text="Publish"
    >
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="publishConfirmFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="rejectButton"
      hidden="{{getSelectedInterstitial.isFetching || selectedInterstitial.value.state !== 'test' }}"
      iconBefore="bold/interface-arrows-left-alternate"
      style={{ ordered: [{ background: "danger" }] }}
      styleVariant="solid"
      submitTargetId=""
      text="Reject"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "updateInterstitialState.trigger({\n  additionalScope: {\n    newState: 'draft'\n  }\n})",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="endButton"
      hidden="{{getSelectedInterstitial.isFetching ||  !['live', 'scheduled'].includes(selectedInterstitial.value.status) }}"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ background: "danger" }] }}
      styleVariant="solid"
      submitTargetId=""
      text="End"
    >
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="endConfirmationFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="archiveButton"
      disabled=""
      hidden="{{getSelectedInterstitial.isFetching ||  selectedInterstitial.value.status !== 'ended' }}"
      iconBefore="bold/mail-inbox-tray-1"
      styleVariant="solid"
      submitTargetId=""
      text="Archive"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "updateInterstitialState.trigger({\n  additionalScope: {\n    newState: 'archive'\n  }\n})",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</DrawerFrame>
