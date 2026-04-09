<ModalFrame
  id="modalFrame1"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showOverlay={true}
  size="medium"
>
  <Text
    id="modalTitle3"
    value="### Is Payment of ₹{{ toBePaid.value }} received from Customer?"
    verticalAlign="center"
  />
  <Select
    id="select1"
    emptyMessage="No options"
    hideLabel={true}
    itemMode="static"
    labelPosition="top"
    overlayMaxHeight={375}
    placeholder="Select an option"
    showSelectionIndicator={true}
  >
    <Option id="00030" value="UPI Machine" />
    <Option id="00031" value="Cash" />
    <Option id="f6e28" disabled={false} hidden={false} value="Card" />
    <Option id="2eb39" disabled={false} hidden={false} value="UPI" />
  </Select>
  <Button
    id="button22"
    disabled="{{ !select1.selectedItem || CreateOrderCash.isFetching || ConfirmOrderCash.isFetching }}"
    loading="{{ CreateOrderCash.isFetching || ConfirmOrderCash.isFetching }}"
    text="Submit"
  >
    <Event
      enabled="300"
      event="click"
      method="run"
      params={{
        map: {
          src: '// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "payment-mode-submit",\n  object_value: {\n    payment_total: toBePaid.value,\n    order_id: orderJobId.value || "",\n    payment_mode: select1.selectedItem?.label || ""  \n  }\n});\n',
        },
      }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
    <Event
      event="click"
      method="run"
      params={{ map: { src: "CreateOrderCash.trigger();" } }}
      pluginId=""
      type="script"
      waitMs="0"
      waitType="debounce"
    />
  </Button>
  <Text id="text83" value="Payment Mode:" verticalAlign="center" />
  <Divider id="divider43" style={{ map: { color: "surfacePrimary" } }} />
  <Divider id="divider44" style={{ map: { color: "surfacePrimary" } }} />
  <Divider id="divider45" style={{ map: { color: "surfacePrimary" } }} />
</ModalFrame>
