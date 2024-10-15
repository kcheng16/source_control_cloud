<DrawerFrame
  id="drawerFrame1"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
  showOverlay={true}
  width="medium"
>
  <Header>
    <Text id="drawerTitle1" value="### Recording" verticalAlign="center" />
    <Button
      id="drawerCloseButton1"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="drawerFrame1"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Video
      id="video2"
      playbackRate={1}
      src="{{ `https://api.twilio.com${activeCall.value.recordings[0].media_url}.mp3`}}"
      volume={1}
    />
    <Text
      id="text12"
      hidden="{{ !activeCall.value.recordings[0].transcript }}"
      value="**Transcription**"
      verticalAlign="center"
    />
    <Text
      id="text11"
      style={{ ordered: [] }}
      value="{{ activeCall.value.recordings[0].transcript }}"
      verticalAlign="center"
    />
  </Body>
</DrawerFrame>
