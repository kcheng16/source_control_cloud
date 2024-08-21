<App>
  <Include src="./functions.rsx" />
  <GlobalWidgetOutput
    id="selectedItems"
    value="{{getProductIdForSelectedItems.data}}"
  />
  <GlobalWidgetOutput
    id="selectedProductId"
    value="{{ getProductIdForSelectedItems.data.product_id || []}}"
  />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <ModuleContainerWidget
      id="moduleContainer"
      backgroundColor="white"
      isGlobalWidgetContainer={true}
    >
      <Multiselect
        id="select"
        data="{{ getProducts.data }}"
        disabledByIndex=""
        emptyMessage="No options"
        label="Products"
        labelPosition="top"
        labels="{{ item.name }}"
        marginType="normal"
        overlayMaxHeight={375}
        placeholder="Select options"
        showSelectionIndicator={true}
        value=""
        values="{{ item.id }}"
        wrapTags={true}
      />
    </ModuleContainerWidget>
  </Frame>
</App>
