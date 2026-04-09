<Container
  id="container2"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="true"
  marginType="normal"
  padding="12px"
  showBody={true}
  style={{ ordered: [{ borderRadius: "12px" }] }}
>
  <Header>
    <Text
      id="containerTitle2"
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View id="a4f18" viewKey="View 1">
    <Text
      id="text3"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.82)" }] }}
      value={'<h4 style="font-weight:600">Delivery Mode</h4>'}
      verticalAlign="center"
    />
    <SegmentedControl
      id="deliveryModeOptions"
      disabled="{{ localStorage?.values?.userData?.isGuestLogin || AddCart.isFetching }}"
      itemMode="static"
      label=""
      labelPosition="top"
      marginType="normal"
      paddingType="spacious"
      value="{{ localStorage?.values?.userData?.takeawayOrder === false ? self.values[1] : self.values[0] }}"
    >
      <Option id="5a6af" value="Takeaway" />
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: 'const payload = window.updateDeliveryMode(GetCart?.data?.transformedData || [], deliveryModeOptions.selectedIndex);\n\nAddCart.trigger({\n  additionalScope: {\n    payload: JSON.stringify(payload)\n  }\n});\n\nconst userData = localStorage.values.userData;\nlocalStorage.setValue("userData", {\n  ...userData,\n  takeawayOrder: deliveryModeOptions.selectedIndex === 0\n});\n\n// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: deliveryModeOptions.selectedIndex === 0 ? "takeaway" : "home-delivery",\n  object_value: payload\n});',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </SegmentedControl>
    <Text
      id="text4"
      marginType="normal"
      value={
        '<strike style="color:rgba(2, 6, 12, 0.45);">Delivery Fee</strike> <span style="color:#1BA672;">FREE</span>'
      }
      verticalAlign="center"
    />
    <Divider id="divider1" marginType="normal" textSize="default" />
    <IconText
      id="iconText1"
      icon={
        '{{ deliveryModeOptions.selectedIndex === 0 ? "/icon:line/shopping-bag-hand-bag-2" : "/icon:bold/nature-ecology-leaf" }}'
      }
      marginType="normal"
      style={{
        ordered: [
          { color: "rgba(2, 6, 12, 0.6)" },
          {
            iconColor:
              '{{ deliveryModeOptions.selectedIndex === 0 ?  "#02060C" : "#1BA672" }}',
          },
        ],
      }}
      text={
        '{{ deliveryModeOptions.selectedIndex === 0 ? "Paper bags are available" : "No bag delivery is available" }}'
      }
      textSize="default"
    />
  </View>
</Container>
