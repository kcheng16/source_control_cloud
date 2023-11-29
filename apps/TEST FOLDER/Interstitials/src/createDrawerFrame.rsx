<DrawerFrame
  id="createDrawerFrame"
  hidden={true}
  isHiddenOnMobile={true}
  showFooter={true}
  showHeader={true}
  showOverlay={true}
  width="large"
>
  <Header>
    <Text
      id="createTItle"
      heightType="fixed"
      value="### New Interstitial"
      verticalAlign="center"
    />
    <Button
      id="createDrawerCloseButton"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="createDrawerFrame"
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
    <Container id="layoutSelectContainer" showBody={true} showBorder={false}>
      <View id="f19df" viewKey="View 1">
        <Select
          id="createLayoutSelect"
          emptyMessage="No options"
          itemMode="static"
          label="Select Layout"
          labelCaption="Select a defined layout for your game."
          labelPosition="top"
          overlayMaxHeight={375}
          placeholder="Select Layout"
          required={true}
          showSelectionIndicator={true}
          value="null"
        >
          <Option id="c6393" label="Simple" value="simple" />
          <Option
            id="dd3d4"
            disabled={false}
            hidden={false}
            label="Ratings Binary"
            value="ratingsBinary"
          />
          <Option
            id="64786"
            disabled={false}
            hidden={false}
            label="Standard"
            value="standard"
          />
        </Select>
        <TextInput
          id="createNameInput"
          label="Name"
          labelCaption="Unique, alphanumeric, dashes only"
          labelPosition="top"
          pattern="^[a-z0-9][a-zA-Z0-9-]*[a-z0-9]$"
          patternType="regex"
          placeholder="Enter value"
          required={true}
        />
      </View>
    </Container>
    <Module
      id="standardFormCreate"
      errorMessage="{{ errorMessage.value }}"
      formType="create"
      getInterstitialsPage="getInterstitialsPage"
      getSelectedInterstitial="getSelectedInterstitial"
      hidden=""
      hideCreateDrawerFrame="hideCreateDrawerFrame"
      interstitialName="{{ createNameInput.value }}"
      name="Standard Form"
      pageUuid="1153900a-7bfd-4c0d-b774-f78b621a7cb4"
      patchInterstitial="patchInterstitial"
      postConfig="postConfig"
      putInterstitial="putInterstitial"
      selectedInterstitial="draft"
      setErrorMessage="setErrorMessage"
      setSelectedInterstitialName="setSelectedInterstitialName"
      showViewDrawerFrame="showViewDrawerFrame"
      submitFormTrigger="{{ submitCreateForm.data }}"
      uploadImages="uploadImages"
    />
    <Divider id="divider18" />
    <Module
      id="simpleFormCreate"
      createInterstitialFormData="{{createInterstitialFormData.value}}"
      errorMessage="{{ errorMessage.value }}"
      formType="create"
      getInterstitialsPage="getInterstitialsPage"
      getSelectedInterstitial="getSelectedInterstitial"
      hidden="{{createLayoutSelect.value !== 'simple' || !createNameInput.value || createNameInput.invalid }}"
      hideCreateDrawerFrame="hideCreateDrawerFrame"
      interstitialName="{{ createNameInput.value }}"
      name="Simple Form"
      pageUuid="a6d2d699-24c6-442b-a9ed-26327f8d4d7b"
      patchInterstitial="patchInterstitial"
      postConfig="postConfig"
      putInterstitial="putInterstitial"
      selectedInterstitial=""
      setErrorMessage="setErrorMessage"
      setSelectedInterstitialName="setSelectedInterstitialName"
      showViewDrawerFrame="showViewDrawerFrame"
      submitForm="submitCreateForm"
      submitFormTrigger="{{ submitCreateForm.data }}"
      uploadImages="uploadImages"
    />
    <Module
      id="ratingsBinaryFormCreate"
      errorMessage="{{ errorMessage.value }}"
      formType="create"
      getInterstitialsPage="getInterstitialsPage"
      getSelectedInterstitial="getSelectedInterstitial"
      hidden="{{createLayoutSelect.value !== 'ratingsBinary' || !createNameInput.value || createNameInput.invalid }}"
      hideCreateDrawerFrame="hideCreateDrawerFrame"
      interstitialName="{{ createNameInput.value }}"
      name="Ratings Binary Form"
      pageUuid="a5207841-d457-40ec-8fca-98c996c3504c"
      patchInterstitial="patchInterstitial"
      postConfig="postConfig"
      putInterstitial="putInterstitial"
      selectedInterstitial=""
      setErrorMessage="setErrorMessage"
      setSelectedInterstitialName="setSelectedInterstitialName"
      showViewDrawerFrame="showViewDrawerFrame"
      submitFormTrigger="{{ submitCreateForm.data }}"
      uploadImages="uploadImages"
    />
  </Body>
  <Footer>
    <Button
      id="createSaveDraftButton"
      disabled=""
      hidden="{{!createLayoutSelect.value || !createNameInput.value || createNameInput.invalid }}"
      iconBefore="bold/interface-content-save"
      styleVariant="solid"
      submitTargetId=""
      text="Save Draft"
    >
      <Event
        event="click"
        method="run"
        params={{ ordered: [{ src: "submitCreateForm.trigger()" }] }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
</DrawerFrame>
