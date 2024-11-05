<App>
  <Include src="./functions.rsx" />
  <UrlFragments id="$urlFragments" value={{ ordered: [{ "": "" }] }} />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    paddingType="normal"
    sticky={null}
    type="main"
  >
    <FileInput
      id="fileInput1"
      _isUpgraded={true}
      iconBefore="bold/programming-browser-search"
      labelPosition="top"
      maxCount={20}
      maxSize="1kb"
      textBefore="Browse"
    />
    <TextInput id="textInput1" marginType="normal" placeholder="Enter value" />
    <Text
      id="text1"
      marginType="normal"
      value="{{urlparams.hash.my_email}}"
      verticalAlign="center"
    />
  </Frame>
</App>
