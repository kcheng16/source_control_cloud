<Container
  id="container15"
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
      id="containerTitle15"
      marginType="normal"
      value="#### {{ item }}"
      verticalAlign="center"
    />
  </Header>
  <View id="31233" viewKey="View 1">
    <Image
      id="image8"
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
      id="text42"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.92)" }] }}
      value={
        '<span style="font-weight:500;font-size:13px;">{{item.name}}</span>'
      }
      verticalAlign="center"
    />
    <Container
      id="container72"
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text
          id="containerTitle74"
          value="#### Container title"
          verticalAlign="center"
        />
      </Header>
      <View id="00030" viewKey="View 1">
        <Button
          id="closeButton4"
          disabled="{{ AddCart.isFetching || listView2.data[i].quantity === 1 }}"
          horizontalAlign="center"
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
                  src: 'currentCartItem.setValue(item);\n\nconst payload = window.updateItemQty(item.itemId, item.productId, GetCart?.data?.transformedData || [], deliveryModeOptions.selectedIndex, true);\n\nAddCart.trigger({\n  additionalScope: {\n    payload: JSON.stringify(payload),\n  }\n});\n\n\n// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "quantity-removed",\n  object_value: payload\n});\n\n',
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
          id="closeButton5"
          disabled="{{ AddCart.isFetching }}"
          horizontalAlign="center"
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
                  src: 'currentCartItem.setValue(item);\n\nconst payload = window.updateItemQty(item.itemId, item.productId, GetCart?.data?.transformedData || [], deliveryModeOptions.selectedIndex);\n\nAddCart.trigger({\n  additionalScope: {\n    payload: JSON.stringify(payload),\n  }\n});\n\n\n// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "quantity-added",\n  object_value: payload\n});\n\n',
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Button>
        <NumberInput
          id="numberInput1"
          currency="USD"
          decimalPlaces="0"
          disabled="{{ AddCart.isFetching }}"
          formDataKey="quantity"
          inputValue={0}
          label=""
          labelPosition="top"
          loading=""
          max="5000"
          min="1"
          preventScroll={true}
          showSeparators={true}
          showStepper={true}
          style={{ map: { text: "#1ba672" } }}
          value="{{ item.quantity }}"
        >
          <Event
            event="change"
            method="run"
            params={{
              map: {
                src: 'console.log("asdas");\n\nif (numberInput1.value > 0 && numberInput1.value <= 5000) {\n  currentCartItem.setValue(item);\n  const payload = window.updateItemQty(item.itemId, item.productId, GetCart?.data?.transformedData || [], deliveryModeOptions.selectedIndex, false, false, numberInput1.value);\n\n  console.log(payload);\n  \n  AddCart.trigger({\n    additionalScope: {\n      payload: JSON.stringify(payload),\n    }\n  });\n  \n  \n  // DP event\n  window.send_dp_event({\n    event: "click",\n    object_name: "input-quantity-added",\n    object_value: payload\n  });\n} else {\n  utils.showNotification({\n    title: "Allowed value is from 1 to 5000",\n    notificationType: \'warning\'\n  });\n}',
              },
            }}
            pluginId=""
            type="script"
            waitMs="500"
            waitType="debounce"
          />
          <Event
            event="change"
            method="setIn"
            params={{
              keyPath: '[{{ i }}, "quantity"]',
              value: "{{ self.value }}",
            }}
            pluginId="listItems"
            type="state"
            waitMs="500"
            waitType="debounce"
          />
        </NumberInput>
      </View>
    </Container>
    <Text
      id="text45"
      hidden="{{ item.offerprice === item.storePrice }}"
      horizontalAlign="center"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.3)" }] }}
      value="<strike>₹{{item.storePrice * item.quantity}}</strike>"
      verticalAlign="center"
    />
    <Button
      id="closeButton6"
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
              src: 'const payload = window.removeItemFromCart(item.itemId, item.productId, GetCart?.data?.transformedData || [], deliveryModeOptions.selectedIndex);\n\n\nif (GetCart?.data?.transformedData?.length === 1) {\n  ClearCart.trigger();\n} else {\n  currentCartItem.setValue(item);\n\n  AddCart.trigger({\n    additionalScope: {\n      payload: JSON.stringify(payload),\n    }\n  });\n}\n\n// DP event\nwindow.send_dp_event({\n  event: "click",\n  object_name: "item-removed",\n  object_value: payload\n});\n\n',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <TagsWidget2
      id="tags2"
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
      id="text43"
      heightType="fixed"
      marginType="normal"
      style={{ ordered: [{ color: "rgba(2, 6, 12, 0.45)" }] }}
      value="{{ item.variant }}"
      verticalAlign="center"
    />
    <Text
      id="text46"
      horizontalAlign="center"
      marginType="normal"
      value="<b>₹{{item.offerprice * item.quantity}}</b>"
      verticalAlign="center"
    />
  </View>
</Container>
