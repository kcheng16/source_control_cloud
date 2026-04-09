<Container
  id="container47"
  disabled=""
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  marginType="normal"
  padding="0"
  showBody={true}
  style={{ ordered: [{ border: "rgba(224, 224, 224, 0.4)" }] }}
>
  <Header>
    <Text
      id="containerTitle49"
      marginType="normal"
      value="#### {{ item }}"
      verticalAlign="center"
    />
  </Header>
  <View id="68e43" viewKey="View 1">
    <Image
      id="image24"
      fit="contain"
      heightType="fixed"
      horizontalAlign="center"
      marginType="normal"
      src="{{image_url_search_results.value + item.image}}"
      style={{ ordered: [{ grayscale: '{{!item.in_stock ? "100%" : "0%"}}' }] }}
    />
    <Text
      id="text86"
      heightType="fixed"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(13, 13, 13, 0.75)" }] }}
      value="###### **{{item.product_name}}**"
      verticalAlign="center"
    />
    <Divider id="divider46" marginType="normal" textSize="default" />
    <Text
      id="text87"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(13, 13, 13, 0.45)" }] }}
      value="**{{item.qty}}**"
      verticalAlign="center"
    />
    <Tags
      id="tags3"
      allowWrap={true}
      colors="{{theme.automatic}}"
      hashColors={true}
      hidden={'{{item?.price?.offer_applied?.product_description === ""}}'}
      horizontalAlign="right"
      marginType="normal"
      style={{ ordered: [{ defaultBackground: "automatic" }] }}
      value="{{item?.price?.offerApplied?.listingDescription ? [item?.price?.offerApplied?.listingDescription] : []}}"
    />
    <Text
      id="text84"
      marginType="normal"
      value="**₹{{item.price?.offerPrice?.units}}**"
      verticalAlign="center"
    />
    <Text
      id="text85"
      hidden="{{ item?.price?.offerPrice?.units === item?.price?.mrp?.units }}"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(13, 13, 13, 0.2)" }] }}
      value="~~**₹{{item.price?.mrp?.units}}**~~"
      verticalAlign="center"
    />
    <Button
      id="button27"
      disabled="{{!item.in_stock}}"
      iconAfter={
        '{{ item.is_combo ? "/icon:bold/interface-arrows-button-down" : ""}}'
      }
      marginType="normal"
      style={{
        ordered: [
          { label: '{{item.in_stock ? "#1BA672" : "rgba(2, 6, 12, 0.6)" }}' },
          { border: "rgba(2, 6, 12, 0.15)" },
          { borderRadius: "8px" },
          { activeBackground: "surfacePrimary" },
          { hoverBackground: "surfacePrimary" },
        ],
      }}
      styleVariant="outline"
      text="{{ item.in_stock ? (item.is_combo ? `${item.combo_details.length} options` : 'ADD') : 'Sold Out'}}"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "\nif (item.is_combo) {\n  selected_item_for_variant.setValue(item);\n} else {\n  selected_item_for_variant.setValue(null);\n}",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="300"
        waitType="debounce"
      />
      <Event
        enabled="{{item.is_combo}}"
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="modalFrame2"
        type="widget"
        waitMs="300"
        waitType="debounce"
      />
      <Event
        enabled="{{!item.is_combo}}"
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: '// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "add-to-cart",\n  object_value: {search_term: textInput1.value, item}\n});\n\nitem_being_added_to_cart.setValue(item);',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="300"
        waitType="debounce"
      />
      <Event
        enabled="{{!item.is_combo}}"
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="get_cart_search"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
