function AddItemManually (addedItem, cartItems) {
  currentCartItem.setValue(addedItem);

  const isItemAlreadyInCart = cartItems?.find(cartItem => cartItem.itemId === addedItem.id && cartItem.productId === addedItem?.attributes?.productId);

  if (isItemAlreadyInCart) {
      const payload = window.updateItemQty(addedItem.id, addedItem?.attributes?.productId, cartItems || [], deliveryModeOptions.selectedIndex);
    
    AddCart.trigger({
      additionalScope: {
        payload: JSON.stringify(payload),
      }
    });
    
    // DP event
    window.send_dp_event({
      event: "click",
      object_name: "quantity-added",
      object_value: payload
    });
  } else {
  
    const payload = window.addToCart(addedItem, cartItems || [], deliveryModeOptions.selectedIndex);
    
    AddCart.trigger({
      additionalScope: {
        payload: JSON.stringify(payload),
      }
    });
    
    
    // DP event
    window.send_dp_event({
      event: "click",
      object_name: "enter-barcode-add-item",
      object_value: payload
    });
  }
}
window.AddItemManually = AddItemManually;