const results = [];
let obj = {};
for (let i=0; i<data.cards?.length; i++) {
  obj = {};

  const gridElements = data.cards[i].card?.card?.gridElements?.infoWithStyle?.items || [];

  for (let j=0; j<gridElements?.length; j++) {
    obj = {};

    obj.is_combo = gridElements[j].variations.length > 1 ? true : false;
    obj.product_name = gridElements[j].displayName;
    obj.product_id = gridElements[j].productId;
    obj.available = gridElements[j].isAvail;
    obj.in_stock = gridElements[j].inStock;
    if (obj.is_combo) {
      obj.combo_details = [];
    }
    for (let k=0; k<gridElements[j].variations?.length; k++) {

      const nestedGridElement = gridElements[j].variations[k];
      if (obj.is_combo) {
        obj.combo_details.push({
          qty: nestedGridElement.quantityDescription,
          price: nestedGridElement.price,
          images: nestedGridElement.imageIds,
          spin: nestedGridElement.spinId,
          itemId: nestedGridElement.skuId,
          cart_allowed_quantity: nestedGridElement.cartAllowedQuantity?.allowedQuantity
        })
        obj.image = nestedGridElement.imageIds[0];
        obj.qty = `${nestedGridElement.quantityDescription}${nestedGridElement.secondaryQuantityDescription ? ' ' +nestedGridElement.secondaryQuantityDescription : ''}`;
        obj.price = nestedGridElement.price;
      } else {

        obj.image = nestedGridElement.imageIds[0];
        obj.qty = nestedGridElement.quantityDescription;
        obj.price = nestedGridElement.price;
        obj.spin = nestedGridElement.spinId;
        obj.itemId = nestedGridElement.skuId;
        obj.cart_allowed_quantity = nestedGridElement.cartAllowedQuantity?.allowedQuantity;
      }
    }
    results.push(obj);
  }
}

const arr = search_results.value.concat(results);
search_results.setValue(arr);

