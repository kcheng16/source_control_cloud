<Container
  id="container67"
  _gap="0px"
  disabled=""
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  loading=""
  marginType="normal"
  padding="0"
  showBody={true}
>
  <Header>
    <Text
      id="containerTitle69"
      marginType="normal"
      value="#### {{ item }}"
      verticalAlign="center"
    />
  </Header>
  <View id="9eee4" viewKey="View 1">
    <Image
      id="image31"
      fit="contain"
      heightType="fixed"
      horizontalAlign="center"
      marginType="normal"
      src="{{image_url_search_results.value + item.images[0]}}"
    />
    <Text
      id="text109"
      disableMarkdown={true}
      hidden=""
      marginType="normal"
      style={{ ordered: [{ color: "rgba(13, 13, 13, 0.75)" }] }}
      value="{{item.price.unit_level_price ? '₹' +item.price.unit_level_price: ''}}"
      verticalAlign="center"
    />
    <Text
      id="text108"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(13, 13, 13, 0.75)" }] }}
      value="###### **{{item.qty}}**"
      verticalAlign="center"
    />
    <Text
      id="text110"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(13, 13, 13, 0.75)" }] }}
      value="##### ₹{{item.price.offerPrice.units}}"
      verticalAlign="center"
    />
    <Button
      id="button31"
      disabled="{{ get_cart_search.isFetching || add_to_cart_search.isFetching }}"
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
              src: 'item_being_added_to_cart.setValue({...item, product_id: selected_item_for_variant.value.product_id, variant_qty: item.qty});\n\n// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "add-to-cart-combo",\n  object_value: {search_term: textInput1.value, item}\n});',
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
        params={{
          map: {
            options: {
              object: {
                onSuccess: null,
                onFailure: null,
                additionalScope: null,
              },
            },
          },
        }}
        pluginId="get_cart_search"
        type="datasource"
        waitMs="300"
        waitType="debounce"
      />
    </Button>
    <Tags
      id="tags7"
      allowWrap={true}
      colors="{{ theme.automatic }}"
      hashColors={true}
      hidden={'{{item.price.offerApplied.listingDescription === ""}}'}
      marginType="normal"
      style={{ ordered: [{ defaultBackground: "automatic" }] }}
      value="[{{item.price.offerApplied.listingDescription}}]"
    />
    <Text
      id="text111"
      hidden="{{ item?.price?.offerPrice?.units === item?.price?.mrp?.units }}"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(13, 13, 13, 0.5)" }] }}
      value="~~₹{{item.price.mrp.units}}~~"
      verticalAlign="center"
    />
  </View>
</Container>
