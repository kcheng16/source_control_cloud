window.updateItemQty = function(skuId, productId, prevItems, delModeSelectedIndex, isRemoveFlow = false, keepSameQtyFlow = false, updatedInputBoxQty = 0) {
  const items = [];

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

  // Update Qty
  for (let idx = 0; idx < items.length; idx++) {
    const sku = items[idx];
    if (sku.itemId === skuId && sku.productId === productId) {
      if (isRemoveFlow) {
        items[idx].quantity = sku.quantity > 0 ? sku.quantity - 1 : 0;
      } else if (keepSameQtyFlow) {
        items[idx].quantity = sku.quantity;
      } else if (updatedInputBoxQty) {
        items[idx].quantity = +updatedInputBoxQty;
      } else {
        items[idx].quantity = sku.quantity + 1;
      }      
    }
  }

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