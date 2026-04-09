window.addToCart = function(item, prevItems, delModeSelectedIndex) {
  let items = [];

  const getItem = function({ itemId, quantity, productId, storeId, picked, spin }) {
    return {
      itemId: itemId,
      serviceLine: "INSTAMART",
      quantity: quantity,
      productId: productId,
      meta: {
          type: "structure",
          storeId: storeId,
          picked: picked
      },
      spin: spin
    }
  };

  const otherItems = [];
  for (let idx = 0; idx < prevItems.length; idx++) {
      const prevItem = prevItems[idx];
      otherItems.push(getItem({
        itemId: prevItem.itemId,
        quantity: prevItem.quantity,
        productId: prevItem.productId,
        storeId: prevItem.storeId,
        picked: prevItem.picked,
        spin: prevItem.spin
      }));
  }

  // Existing Items
  items.push(...otherItems);

  // Remove same item if present already
  const filteredItems = [];
  for (let idx = 0; idx < items.length; idx++) {
      const sku = items[idx];
      if (sku.itemId !== item.itemId) {
        filteredItems.push(sku);
      }
  }
  items = filteredItems;

  // New Item
   items.push(getItem({
     itemId: item.id,
     quantity: 1,
     productId: item.attributes.productId,
     storeId: localStorage?.values?.storeData?.storeId,
     picked: true,
     spin: item.spin
   }));

  return {
      location: {
        latitude: localStorage?.values?.userAddress?.latitude,
        longitude: localStorage?.values?.userAddress?.longitude,
      },
      cartMetaData: {
        owner: "APP",
        deliveryType: "INSTANT",
        preferredAddressId: localStorage?.values?.userAddress?.id || "",
        useReusablePackaging: false,
        walkInOrder: true,
        takeawayOrder: delModeSelectedIndex === 0
      },
      cartType: "INSTAMART",
      items
  }
}