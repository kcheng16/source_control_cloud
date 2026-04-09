<Container
  id="container8"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  marginType="normal"
  padding="12px"
  showBody={true}
>
  <Header>
    <Text
      id="containerTitle8"
      marginType="normal"
      value="#### {{ item }}"
      verticalAlign="center"
    />
  </Header>
  <View id="ff279" viewKey="View 1">
    <Image
      id="image3"
      fit="contain"
      heightType="fixed"
      horizontalAlign="center"
      marginType="normal"
      src={
        '{{ item?.images?.[0] ? `https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_150,h_150/${item?.images?.[0]}` : "https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_150,h_150/v1694608208/InstamartAssets/B2B%20Assets/Item_Placeholder.png" }}'
      }
    />
    <Text
      id="text27"
      marginType="normal"
      value={'<b>{{ item?.attributes?.productName || "" }}</b>'}
      verticalAlign="center"
    />
    <Text
      id="text28"
      marginType="normal"
      value="{{ item.variant }}"
      verticalAlign="center"
    />
    <Text
      id="text29"
      marginType="normal"
      style={{ ordered: [{ color: "rgb(147, 149, 159)" }] }}
      value={'{{ "MRP ₹" + item.attributes.mrp }}'}
      verticalAlign="center"
    />
    <Button
      id="button6"
      disabled="{{ AddCart.isFetching }}"
      loading="{{ AddCart.isFetching }}"
      marginType="normal"
      style={{ ordered: [{ background: "rgb(255, 82, 0)" }] }}
      text="Add Item"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: "window.AddItemManually(item, GetCart.data.transformedData);",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </View>
</Container>
