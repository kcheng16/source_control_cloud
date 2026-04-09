<ModalFrame
  id="scanItemModal"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showOverlay={true}
  style={{ ordered: [{ borderRadius: "16px" }] }}
>
  <Header>
    <Text
      id="modalTitle2"
      marginType="normal"
      value="### Container title"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton2"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      marginType="normal"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="scanItemModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <TextInput
      id="hiddenInputCart1"
      hidden="false"
      label=""
      labelPosition="top"
      marginType="normal"
      placeholder="Enter value"
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: 'const barcodeValue = hiddenInputCart1.value;\n\nif (hiddenInputCart1.value.length > 0) {\n  BarcodeScanByPaste.trigger();\n} else {\n  hiddenInputCart1.clearValidation();\n  hiddenInputCart1.clearValue();\n  hiddenInputCart1.focus();\n}\n\n// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "item-scanned",\n  object_value: {\n    barcode: barcodeValue\n  }\n});\n',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </TextInput>
    <Icon
      id="icon2"
      horizontalAlign="center"
      icon="line/interface-delete-1"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.45)" }] }}
    >
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="scanItemModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Image
      id="image5"
      dbBlobId="3dac1618-39e1-4772-8cc0-b0ee6c02169a"
      fit="contain"
      heightType="fixed"
      horizontalAlign="center"
      marginType="normal"
      src="https://ik.imagekit.io/xp8c4ep1p/Society%20Store/scan%20to%20add%20items.png?updatedAt=1743569222878"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "hiddenInputCart1.clearValidation();\nhiddenInputCart1.clearValue();\nhiddenInputCart1.focus();",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Image>
    <Text
      id="text31"
      heightType="fixed"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.45)" }] }}
      value="#### Scan to add Item"
      verticalAlign="center"
    />
    <Text
      id="text33"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.45)" }] }}
      value="Click the scan icon if you are unable to scan"
      verticalAlign="center"
    />
    <Divider id="divider2" marginType="normal" textSize="default" />
    <Text
      id="text32"
      heightType="fixed"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.45)" }] }}
      value="OR"
      verticalAlign="center"
    />
    <Button
      id="button7"
      marginType="normal"
      style={{ ordered: [{ label: "rgb(255, 82, 0)" }] }}
      styleVariant="outline"
      text="Enter Manual Barcode"
    >
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="scanItemModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="addItemModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: '// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "enter-barcode-cta-click",\n  object_value: ""\n});',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text id="emptyTextScanModal" marginType="normal" verticalAlign="center" />
  </Body>
</ModalFrame>
