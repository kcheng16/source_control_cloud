const transformCartItems = function(items) {
  let transformedItems = [];
  for (let item of items) {
    transformedItems.push({
      itemId: item.itemId,
      serviceLine: "INSTAMART",
      quantity: item.quantity,
      productId: item.metadata?.product_id,
      meta: {
          type: "structure",
          storeId: item.storeId,
          picked: item.picked || false,
          freebie: item.tradeFreebie ? true : false,
      },
      spin: item.metadata?.variations?.[0].spin,
      tradeFreebie: item.tradeFreebie ? true : false
    })
  }

  return transformedItems;
};

window.transformCartItems = transformCartItems;