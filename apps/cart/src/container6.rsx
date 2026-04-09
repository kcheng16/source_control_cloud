<Container
  id="container6"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hoistFetching={true}
  loading="false"
  marginType="normal"
  padding="12px"
  showBody={true}
  style={{ ordered: [{ borderRadius: "8px" }] }}
>
  <Header>
    <Text
      id="containerTitle6"
      marginType="normal"
      value="#### {{ item }}"
      verticalAlign="center"
    />
  </Header>
  <View id="31233" viewKey="View 1">
    <Image
      id="image2"
      fit="contain"
      heightType="fixed"
      horizontalAlign="center"
      marginType="normal"
      src={
        '{{ item.image ? `https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_150,h_150/${item.image}` : "https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_150,h_150/v1694608208/InstamartAssets/B2B%20Assets/Item_Placeholder.png" }}'
      }
      style={{ ordered: [{ borderRadius: "8px" }] }}
    />
    <Text
      id="text17"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.92)" }] }}
      value={
        '<span style="font-weight:500;font-size:13px;">{{item.name}}</span>'
      }
      verticalAlign="center"
    />
    <Button
      id="closeButton1"
      disabled="{{ AddCart.isFetching || listView1.data[i].quantity === 1 }}"
      horizontalAlign="right"
      iconBefore="bold/interface-remove-1"
      loading="false"
      marginType="normal"
      style={{
        ordered: [
          { border: "rgba(2, 6, 12, 0.1)" },
          { icon: "rgb(27, 166, 114)" },
        ],
      }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: 'currentCartItem.setValue(item);\n\nconst payload = window.updateItemQty(item.itemId, item.productId, GetCart?.data?.transformedData || [], deliveryModeOptions.selectedIndex, true);\n\nAddCart.trigger({\n  additionalScope: {\n    payload: JSON.stringify(payload),\n    item\n  }\n});\n\n\n// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "quantity-removed",\n  object_value: payload\n});\n\n',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="closeButton2"
      disabled="{{ AddCart.isFetching }}"
      horizontalAlign="left"
      iconBefore="bold/interface-add-1"
      loading="false"
      marginType="normal"
      style={{
        ordered: [
          { border: "rgba(2, 6, 12, 0.1)" },
          { icon: "rgb(27, 166, 114)" },
        ],
      }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: 'currentCartItem.setValue(item);\n\nconst payload = window.updateItemQty(item.itemId, item.productId, GetCart?.data?.transformedData || [], deliveryModeOptions.selectedIndex);\n\nAddCart.trigger({\n  additionalScope: {\n    payload: JSON.stringify(payload),\n    item\n  }\n});\n\n\n// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "quantity-added",\n  object_value: payload\n});\n\n',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="text20"
      hidden="{{ item.offerprice === item.storePrice }}"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.3)" }] }}
      value="<strike>₹{{item.storePrice * item.quantity}}</strike>"
      verticalAlign="center"
    />
    <Button
      id="closeButton3"
      disabled="{{ AddCart.isFetching }}"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      marginType="normal"
      style={{
        ordered: [{ border: "transparent" }, { icon: "rgba(2, 6, 12, 0.3)" }],
      }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: 'currentCartItem.setValue(item);\n\nconst payload = window.removeItemFromCart(item.itemId, item.productId, GetCart?.data?.transformedData || [], deliveryModeOptions.selectedIndex);\n\n\nif (GetCart?.data?.transformedData?.length === 1) {\n  ClearCart.trigger();\n} else {\n  AddCart.trigger({\n    additionalScope: {\n      payload: JSON.stringify(payload),\n      item\n    }\n  });\n}\n\n// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "item-removed",\n  object_value: payload\n});\n\n',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="text19"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgb(27, 166, 114)" }] }}
      value="<b>{{item.quantity}}</b>"
      verticalAlign="center"
    />
    <TagsWidget2
      id="tags1"
      allowWrap={true}
      data="{{ item.freebie ? ['Free Item'] : (item.picked ? ['In-Store Item'] : ['Online Item']) }}"
      style={{
        ordered: [
          { defaultBackground: "rgba(2, 6, 12, 0.05)" },
          { borderRadius: "4px" },
        ],
      }}
    />
    <Text
      id="text18"
      heightType="fixed"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.45)" }] }}
      value="{{ item.variant }}"
      verticalAlign="center"
    />
    <Text
      id="text21"
      horizontalAlign="center"
      marginType="normal"
      value="<b>₹{{item.offerprice * item.quantity}}</b>"
      verticalAlign="center"
    />
  </View>
</Container>
