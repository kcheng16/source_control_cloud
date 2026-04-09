<Container
  id="container65"
  _gap="0px"
  disabled=""
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  loading=""
  marginType="normal"
  padding="12px"
  showBody={true}
>
  <Header>
    <Text
      id="containerTitle67"
      marginType="normal"
      value="#### {{ item }}"
      verticalAlign="center"
    />
    <Text
      id="containerTitle68"
      marginType="normal"
      value="#### {{ item }}"
      verticalAlign="center"
    />
  </Header>
  <View id="9eee4" viewKey="View 1">
    <Image
      id="image29"
      fit="contain"
      heightType="fixed"
      horizontalAlign="center"
      marginType="normal"
      src="{{image_url_search_results.value + item.images[0]}}"
    />
    <Text
      id="text101"
      disableMarkdown={true}
      hidden=""
      marginType="normal"
      style={{ ordered: [{ color: "rgba(13, 13, 13, 0.75)" }] }}
      value="{{item.price.unit_level_price ? '₹' +item.price.unit_level_price: ''}}"
      verticalAlign="center"
    />
    <Text
      id="text105"
      disableMarkdown={true}
      hidden=""
      marginType="normal"
      style={{ ordered: [{ color: "rgba(13, 13, 13, 0.75)" }] }}
      value="{{item.price.unit_level_price ? '₹' +item.price.unit_level_price: ''}}"
      verticalAlign="center"
    />
    <Text
      id="text100"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(13, 13, 13, 0.75)" }] }}
      value="###### **{{item.qty}}**"
      verticalAlign="center"
    />
    <Button
      id="button29"
      marginType="normal"
      style={{
        ordered: [
          { hoverBackground: "rgba(13, 13, 13, 0)" },
          { border: "rgba(2, 6, 12, 0.15)" },
          { activeBackground: "rgba(207, 207, 207, 0)" },
          { label: "rgb(27, 166, 114)" },
          { borderRadius: "8px" },
        ],
      }}
      styleVariant="outline"
      text="ADD"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: 'item_being_added_to_cart.setValue({...item, product_id: selected_item_for_variant.value.product_id});\n\n// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "add-to-cart-combo",\n  object_value: {search_term: textInput1.value, item}\n});',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="300"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="get_cart"
        type="datasource"
        waitMs="300"
        waitType="debounce"
      />
    </Button>
    <Text
      id="text104"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(13, 13, 13, 0.75)" }] }}
      value="###### **{{item.qty}}**"
      verticalAlign="center"
    />
    <Text
      id="text102"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(13, 13, 13, 0.75)" }] }}
      value="##### ₹{{item.price.offerPrice.units}}"
      verticalAlign="center"
    />
    <Button
      id="button30"
      marginType="normal"
      style={{
        ordered: [
          { hoverBackground: "rgba(13, 13, 13, 0)" },
          { border: "rgba(2, 6, 12, 0.15)" },
          { activeBackground: "rgba(207, 207, 207, 0)" },
          { label: "rgb(27, 166, 114)" },
          { borderRadius: "8px" },
        ],
      }}
      styleVariant="outline"
      text="ADD"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: 'item_being_added_to_cart.setValue({...item, product_id: selected_item_for_variant.value.product_id});\n\n// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "add-to-cart-combo",\n  object_value: {search_term: textInput1.value, item}\n});',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="300"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="get_cart"
        type="datasource"
        waitMs="300"
        waitType="debounce"
      />
    </Button>
    <Tags
      id="tags5"
      allowWrap={true}
      colors="{{ theme.automatic }}"
      hashColors={true}
      hidden={'{{item.price.offerApplied.listingDescription === ""}}'}
      marginType="normal"
      style={{ ordered: [{ defaultBackground: "automatic" }] }}
      value="[{{item.price.offerApplied.listingDescription}}]"
    />
    <Text
      id="text106"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(13, 13, 13, 0.75)" }] }}
      value="##### ₹{{item.price.offerPrice.units}}"
      verticalAlign="center"
    />
    <Text
      id="text103"
      hidden="{{ item?.price?.offerPrice?.units === item?.price?.mrp?.units }}"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(13, 13, 13, 0.5)" }] }}
      value="~~₹{{item.price.mrp.units}}~~"
      verticalAlign="center"
    />
    <Tags
      id="tags6"
      allowWrap={true}
      colors="{{ theme.automatic }}"
      hashColors={true}
      hidden={'{{item.price.offerApplied.listingDescription === ""}}'}
      marginType="normal"
      style={{ ordered: [{ defaultBackground: "automatic" }] }}
      value="[{{item.price.offerApplied.listingDescription}}]"
    />
    <Image
      id="image30"
      fit="contain"
      heightType="fixed"
      horizontalAlign="center"
      marginType="normal"
      src="{{image_url_search_results.value + item.images[0]}}"
    />
    <Text
      id="text107"
      hidden="{{ item?.price?.offerPrice?.units === item?.price?.mrp?.units }}"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(13, 13, 13, 0.5)" }] }}
      value="~~₹{{item.price.mrp.units}}~~"
      verticalAlign="center"
    />
  </View>
</Container>
