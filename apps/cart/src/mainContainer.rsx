<Container
  id="mainContainer"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  marginType="normal"
  padding="12px"
  showBody={true}
  showBorder={false}
  style={{ ordered: [{ background: "rgba(0, 0, 0, 0)" }] }}
>
  <Header>
    <Text
      id="containerTitle34"
      marginType="normal"
      value="#### Container title"
      verticalAlign="center"
    />
  </Header>
  <View
    id="d7f5c"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="PaymentProgressView"
  >
    <Button
      id="button23"
      disabled="{{ mainContainer.currentViewIndex === 1 && paymentOptions.selectedIndex === 0 }}"
      hidden="{{ mainContainer.currentViewIndex !== 0 }}"
      iconBefore="bold/interface-arrows-left"
      marginType="normal"
      style={{
        ordered: [
          { border: "rgba(255, 220, 204, 0)" },
          { label: "rgb(255, 82, 0)" },
        ],
      }}
      styleVariant="outline"
      text={
        '{{ mainContainer.currentViewIndex === 0 ? "Back to Cart" : "Back to Payments" }}'
      }
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: 'if (mainContainer.currentViewIndex === 0) {\n  tabbedContainer1.setCurrentViewIndex(0);\n  \n  // DP event\n  window.send_dp_event({\n    event: "click",\n    object_name: "back-to-cart",\n    object_value: ""\n  });\n}\nelse if (mainContainer.currentViewIndex === 3) {\n  mainContainer.setCurrentViewIndex(0);\n\n  // DP event\n  window.send_dp_event({\n    event: "click",\n    object_name: "back-to-payment",\n    object_value: ""\n  });\n} else {\n  mainContainer.showPreviousView();\n\n  // DP event\n  window.send_dp_event({\n    event: "click",\n    object_name: "back-to-payment",\n    object_value: ""\n  });\n}',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Include src="./container38.rsx" />
  </View>
  <View
    id="72b0d"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="SuccessView"
  >
    <Include src="./container19.rsx" />
  </View>
  <View
    id="e43d7"
    disabled={false}
    hidden={false}
    iconPosition="left"
    viewKey="FailureView"
  >
    <Button
      id="button24"
      disabled="{{ mainContainer.currentViewIndex === 1 && paymentOptions.selectedIndex === 0 }}"
      hidden="{{ mainContainer.currentViewIndex !== 2 }}"
      iconBefore="bold/interface-arrows-left"
      marginType="normal"
      style={{
        ordered: [
          { border: "rgba(255, 220, 204, 0)" },
          { label: "rgb(255, 82, 0)" },
        ],
      }}
      styleVariant="outline"
      text={'{{ "Back to Payments" }}'}
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: 'mainContainer.setCurrentViewIndex(0);\n\n// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "back-to-payment",\n  object_value: ""\n});\n',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Container
      id="container21"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      heightType="fixed"
      marginType="normal"
      padding="12px"
      showBody={true}
      style={{ ordered: [{ borderRadius: "16px" }] }}
    >
      <Header>
        <Text
          id="containerTitle21"
          marginType="normal"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="dfd3a" viewKey="View 1">
        <Icon
          id="icon4"
          horizontalAlign="center"
          icon="bold/interface-delete-circle"
          marginType="normal"
          style={{ ordered: [{ color: "rgb(250, 60, 90)" }] }}
        />
        <Text
          id="text64"
          horizontalAlign="center"
          marginType="normal"
          style={{ ordered: [{ color: "rgb(250, 60, 90)" }] }}
          value={'<h4 style="font-weight:600;">Uh-oh! Transaction Failed</h4>'}
          verticalAlign="center"
        />
        <Button
          id="button16"
          marginType="normal"
          style={{
            ordered: [
              { borderRadius: "10px" },
              { background: "rgb(255, 82, 0)" },
            ],
          }}
          text="Back to Payments"
        >
          <Event
            event="click"
            method="setCurrentViewIndex"
            params={{ ordered: [{ viewIndex: "0" }] }}
            pluginId="mainContainer"
            type="widget"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
      </View>
    </Container>
  </View>
</Container>
