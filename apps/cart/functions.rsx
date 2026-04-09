<GlobalFunctions>
  <Folder id="JS">
    <JavascriptQuery
      id="AddToCartUtil"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/AddToCartUtil.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      showFailureToaster={false}
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <JavascriptQuery
      id="UpdateItemQtyUtil"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/UpdateItemQtyUtil.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      showFailureToaster={false}
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <JavascriptQuery
      id="RemoveItemUtil"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      notificationDuration={4.5}
      query={include("./lib/RemoveItemUtil.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <JavascriptQuery
      id="UpdateDeliveryMode"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/UpdateDeliveryMode.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <JavascriptQuery
      id="NewrelicEvent"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/NewrelicEvent.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <JavascriptQuery
      id="SendDpEvent"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/SendDpEvent.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <JavascriptQuery
      id="AddItemManually"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/AddItemManually.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="resetScanItemFocus"
      notificationDuration={4.5}
      query={include("./lib/resetScanItemFocus.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="Cart">
    <RESTQuery
      id="GetCart"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      headers={
        '[{"key":"Content-Type","value":"application/json"},{"key":"deviceId","value":"{{ localStorage?.values?.userData?.deviceId }}"},{"key":"versionCode","value":"2100"},{"key":"x-channel","value":"IM-POS"},{"key":"token","value":"{{ localStorage?.values?.userData?.token }}"},{"key":"tid","value":"{{ localStorage?.values?.userData?.tid }}"},{"key":"sid","value":"{{ localStorage?.values?.userData?.sid }}"}]'
      }
      isMultiplayerEdited={false}
      query="/api/v2/view?cartType=INSTAMART&pageType=INSTAMART_CART"
      resourceDisplayName="IM Checkout Service"
      resourceName="860f84f2-5d70-4aad-b72e-e7bb9ae84d9e"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      runWhenPageLoads={true}
      showFailureToaster={false}
      showSuccessToaster={false}
      transformer={
        'if (data?.data) {\n  const finalData = [];\n\n  for (let idx = 0; idx < data.data.items.length; idx++) {\n    const item = data.data.items[idx];\n\n      for (let j = 0; j < item.metadata.variations.length; j++) {\n          const variant = item.metadata.variations[j];\n          finalData.push({\n            itemId: variant.id,\n            spin: variant.spin,\n            productId: item.metadata.product_id,\n            storeId: item.storeId,\n            name: variant.display_name,\n            picked: item.picked,\n            variant: variant.sku_quantity_with_combo,\n            quantity: item.quantity,\n            storePrice: variant.price.store_price,\n            offerprice: variant.price.offer_price,\n            image: variant.images?.[0] || "",\n            freebie: item.freebie\n          });\n      }\n  }\n\n  return {\n    ...data,\n    transformedData: finalData\n  }\n}\n\nreturn data;'
      }
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        enabled="{{ false }}"
        event="success"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "warning",
              title: "{{ GetCart?.data?.statusMessage }}",
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="run"
        params={{
          map: {
            src: 'listItems.setValue(GetCart?.data?.transformedData?.length ? GetCart.data.transformedData : []);\n\nwindow.triggerNewRelicEvent({\n  apiData: GetCart,\n  eventName: "get-cart-success"\n});\n',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="run"
        params={{ map: { src: "resetScanItemFocus.trigger();" } }}
        pluginId=""
        type="script"
        waitMs="300"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: GetCart,\n  eventName: "get-cart-failure",\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="BarcodeScanManually"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      headers={'[{"key":"source","value":"mim-dashboard"}]'}
      query="internal/getSkuDetailsFromBarcode?barcode={{ enterBarcodeInput.value }}&storeId={{ localStorage?.values?.storeData?.storeId }}&includeLocations=false&includePrice=false"
      resourceDisplayName="scm-api-gateway"
      resourceName="bc1a5442-18c9-49ad-bdfa-b181d3a44998"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: BarcodeScanManually,\n  eventName: "barcode-scan-success"\n});\n',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "error",
              title:
                '{{ BarcodeScanManually?.data?.data?.statusMessage || "Failed to fetch sku details from barcode" }}',
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: BarcodeScanManually,\n  eventName: "barcode-scan-failure"\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="BarcodeScanByPaste"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      headers={'[{"key":"source","value":"mim-dashboard"}]'}
      isMultiplayerEdited={false}
      query="internal/getSkuDetailsFromBarcode?barcode={{hiddenInputCart2.value}}&storeId={{ localStorage?.values?.storeData?.storeId }}&includeLocations=false"
      resourceDisplayName="scm-api-gateway"
      resourceName="bc1a5442-18c9-49ad-bdfa-b181d3a44998"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="run"
        params={{
          map: {
            src: 'if (BarcodeScanByPaste?.data?.data?.skus?.length) {\n  const item = BarcodeScanByPaste.data.data.skus[0];\n\n  currentCartItem.setValue(item);\n\n  const isItemAlreadyInCart = GetCart.data?.transformedData?.find(cartItem => cartItem.itemId === item.id && cartItem.productId === item?.attributes?.productId);\n\n  if (isItemAlreadyInCart) {\n      const payload = window.updateItemQty(item.id, item?.attributes?.productId, GetCart?.data?.transformedData || [], deliveryModeOptions.selectedIndex);\n    \n      AddCart.trigger({\n        additionalScope: {\n          payload: JSON.stringify(payload),\n        }\n      });\n    \n      // DP event\n      window.send_dp_event({\n        event: "click",\n        object_name: "quantity-added",\n        object_value: payload\n      });\n    \n  } else {\n      AddCart.trigger({\n        additionalScope: {\n          payload: JSON.stringify(window.addToCart(item, GetCart?.data?.transformedData || [], deliveryModeOptions.selectedIndex)),\n        }\n      });\n    \n      window.triggerNewRelicEvent({\n        apiData: BarcodeScanByPaste,\n        eventName: "barcode-scan-by-paste-success"\n      });\n    \n      // DP event\n      window.send_dp_event({\n        event: "click",\n        object_name: "item-added",\n        object_value: item\n      });\n  }\n  \n} else {\n  utils.showNotification({\n    title: "Barcode not found",\n    notificationType: "error"\n  });\n\n  window.triggerNewRelicEvent({\n    apiData: BarcodeScanByPaste,\n    eventName: "barcode-scan-by-paste-not-found"\n  });\n\n  // DP event\n  window.send_dp_event({\n    event: "click",\n    object_name: "item-added-failure",\n    object_value: ""\n  });\n}\n\nresetScanItemFocus.trigger();\n',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "error",
              title:
                '{{ BarcodeScanByPaste?.data?.data?.statusMessage || "Failed to fetch sku details from barcode" }}',
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: BarcodeScanByPaste,\n  eventName: "barcode-scan-by-paste-failure"\n});\nresetScanItemFocus.trigger();',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="AddCart"
      _additionalScope={[]}
      body="{{payload}}"
      bodyType="raw"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      headers={
        '[{"key":"Content-Type","value":"application/json"},{"key":"deviceId","value":"{{ localStorage?.values?.userData?.deviceId }}"},{"key":"versionCode","value":"2100"},{"key":"x-channel","value":"IM-POS"},{"key":"token","value":"{{ localStorage?.values?.userData?.token }}"},{"key":"tid","value":"{{ localStorage?.values?.userData?.tid }}"},{"key":"sid","value":"{{ localStorage?.values?.userData?.sid }}"}]'
      }
      isMultiplayerEdited={false}
      query="/api/v2/view/INSTAMART?pageType=INSTAMART_CART"
      resourceDisplayName="IM Checkout Service"
      resourceName="860f84f2-5d70-4aad-b72e-e7bb9ae84d9e"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      type="POST"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: AddCart,\n  eventName: "add-cart-success"\n});\n\nif (cartStatusCodes.value[AddCart.data.statusCode]) {\n\n  // DP event\n  window.send_dp_event({\n    event: "click",\n    object_name: "add-cart-validation-failed",\n    object_value: { statusCode: AddCart.data.statusCode, currentCartItem }\n  });\n\n  if (currentCartItem.value) {\n\n    if (cartStatusCodes.value[AddCart.data.statusCode].isBlocking) {\n      // revert back qty\n      const payload = window.updateItemQty(currentCartItem.value?.itemId, currentCartItem.value?.productId, GetCart?.data?.transformedData || [], deliveryModeOptions.selectedIndex, false, true);\n    \n      AddCart.trigger({\n        additionalScope: {\n          payload: JSON.stringify(payload),\n        }\n      }).then(() => {\n        cartValidationErrMsg.setValue(cartStatusCodes.value[AddCart.data.statusCode]);\n        modalFrame3.show();\n      });\n    } else {\n      cartValidationErrMsg.setValue(cartStatusCodes.value[AddCart.data.statusCode]);\n      modalFrame3.show();\n\n      // As calling Get cart immediately sometimes gives outdated quantity\n      setTimeout(() => {\n        GetCart.trigger();    \n      }, 200);\n    }\n  }\n} else {\n\n  // As calling Get cart immediately sometimes gives outdated quantity\n  setTimeout(() => {\n    GetCart.trigger();    \n  }, 200);\n}\n\naddItemModal.hide();\n',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ !!(!cartStatusCodes.value[AddCart.data?.statusCode]?.isBlocking && cartStatusCodes.value[AddCart.data?.statusCode]?.msg) }}"
        event="success"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "error",
              title: "{{ AddCart.data.statusMessage }}",
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "error",
              title:
                '{{ AddCart?.data?.statusMessage || "Failed to add item to the cart" }}',
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="trigger"
        params={{}}
        pluginId="GetCart"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: AddCart,\n  eventName: "add-cart-failure"\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="ClearCart"
      bodyType="json"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      headers={
        '[{"key":"Content-Type","value":"application/json"},{"key":"deviceId","value":"{{ localStorage?.values?.userData?.deviceId }}"},{"key":"versionCode","value":"2100"},{"key":"x-channel","value":"IM-POS"},{"key":"token","value":"{{ localStorage?.values?.userData?.token }}"},{"key":"tid","value":"{{ localStorage?.values?.userData?.tid }}"},{"key":"sid","value":"{{ localStorage?.values?.userData?.sid }}"}]'
      }
      isMultiplayerEdited={false}
      query="api/v2/view/clear-cart?cartType=INSTAMART&pageType=INSTAMART_CART"
      resourceDisplayName="IM Checkout Service"
      resourceName="860f84f2-5d70-4aad-b72e-e7bb9ae84d9e"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      type="POST"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="run"
        params={{
          ordered: [
            {
              src: 'GetCart.trigger();\n\nwindow.triggerNewRelicEvent({\n  apiData: ClearCart,\n  eventName: "clear-cart-success"\n});',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="showNotification"
        params={{
          ordered: [
            {
              options: {
                ordered: [
                  { notificationType: "error" },
                  {
                    title:
                      '{{ ClearCart?.data?.statusMessage || "Failed to clear cart" }}',
                  },
                ],
              },
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="GetCart"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          ordered: [
            {
              src: 'window.triggerNewRelicEvent({\n  apiData: ClearCart,\n  eventName: "clear-cart-failure"\n});',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <State
      id="cartStatusCodes"
      value={
        '{\n  104: {\n    isBlocking: true,\n    msg: "Qty(s) of some of the item(s) have been reduced due to availability issues",\n  },\n  151: {\n    isBlocking: true,\n    msg: "Qty(s) of some of the item(s) have been reduced due to availability issues",\n  },\n  161: {\n    isBlocking: true,\n    msg: "Some of the item(s) are not in stock currently",\n  },\n  145: {\n    msg: "The store is not serviceable at the moment. Please try again after sometime.",\n  },\n  101: {\n    msg: "No valid items in cart, please try adding a valid item",\n  },\n  1: {\n    msg: "Oops, something went wrong. Please try again after sometime",\n  },\n  146: {\n    msg: "Store is unavailable at the moment. Please try again after sometime",\n  },\n  135: {\n    msg: "User address is not serviceable at the moment. Please try again after sometime",\n  },\n  150: {\n    msg: "Oops, something went wrong. Please try again after sometime",\n  }\n}'
      }
    />
    <State id="cartValidationErrMsg" value={'""'} />
    <State id="currentCartItem" />
    <State id="listItems" value="[]" />
  </Folder>
  <Folder id="Resources">
    <RESTQuery
      id="user_logout"
      bodyType="json"
      confirmationMessage="Are you sure you want to logout?"
      enableTransformer={true}
      headers={
        '[{"key":"user-agent","value":""},{"key":"Content-Type","value":""},{"key":"tid","value":"{{localStorage.values.userData.tid}}"},{"key":"token","value":"{{localStorage.values.userData.token}}"},{"key":"deviceId","value":"{{localStorage.values.userData.deviceId}}"}]'
      }
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="api/v1/app/logout"
      requireConfirmation={true}
      resourceDisplayName="Sand User Service"
      resourceName="33bcf6f7-3eda-4aa1-b830-33de609d784c"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      type="POST"
    >
      <Event
        event="success"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: user_logout,\n  eventName: "user-logout-success"\n});\n\nlocalStorage.clear();',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="openApp"
        params={{ map: { uuid: "d47a6520-f43d-4fc4-ac97-0da24059be1f" } }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: user_logout,\n  eventName: "user-logout-failure"\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "info",
              title: "Failed to logout user",
              description: "{{ user_logout.error }}",
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="send_snowflake_event"
      body={
        '[{"key":"event","value":"{{data}}"},{"key":"header","value":"{\\"eventId\\":3196, \\"uuid\\": {{uuid.v4()}}, \\"appName\\":\\"society-stores-dashboard\\", \\"timestamp\\": {{new Date().getTime()}}, \\"schemaVersion\\":\\"1.0.0\\", \\"name\\":\\"SocietyStoresDashboardEvent\\"}"}]'
      }
      bodyType="json"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      notificationDuration={4.5}
      query="message"
      resourceDisplayName="DP Event"
      resourceName="90e7592a-0117-4ed3-92fd-8e430b73e648"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      type="POST"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <JavascriptQuery
      id="TriggerNewrelicEvent"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      notificationDuration={4.5}
      query={include("./lib/TriggerNewrelicEvent.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
  </Folder>
  <Folder id="Payment">
    <RESTQuery
      id="GetCartForPayment"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      headers={
        '[{"key":"Content-Type","value":"application/json"},{"key":"deviceId","value":"{{ localStorage?.values?.userData?.deviceId }}"},{"key":"versionCode","value":"2100"},{"key":"x-channel","value":"IM-POS"},{"key":"token","value":"{{ localStorage?.values?.userData?.token }}"},{"key":"tid","value":"{{ localStorage?.values?.userData?.tid }}"},{"key":"sid","value":"{{ localStorage?.values?.userData?.sid }}"}]'
      }
      isMultiplayerEdited={false}
      query="/api/v2/view?cartType=INSTAMART&pageType=INSTAMART_CART"
      resourceDisplayName="IM Checkout Service"
      resourceName="860f84f2-5d70-4aad-b72e-e7bb9ae84d9e"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      runWhenPageLoads={true}
      showFailureToaster={false}
      showSuccessToaster={false}
      transformer={
        'if (data?.data) {\n  const finalData = [];\n\n  for (let idx = 0; idx < data.data.items.length; idx++) {\n    const item = data.data.items[idx];\n\n      for (let j = 0; j < item.metadata.variations.length; j++) {\n          const variant = item.metadata.variations[j];\n          finalData.push({\n            itemId: variant.id,\n            spin: variant.spin,\n            productId: item.metadata.product_id,\n            storeId: item.storeId,\n            name: variant.display_name,\n            picked: item.picked,\n            variant: variant.sku_quantity_with_combo,\n            quantity: item.quantity,\n            storePrice: variant.price.store_price,\n            offerprice: variant.price.offer_price,\n            image: variant.images?.[0] || "",\n            freebie: item.freebie\n          });\n      }\n  }\n\n  return {\n    ...data,\n    transformedData: finalData\n  }\n}\n\nreturn data;'
      }
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        enabled="{{ false }}"
        event="success"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "warning",
              title: "{{ GetCartForPayment?.data?.statusMessage }}",
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="run"
        params={{
          map: {
            src: 'if (GetCartForPayment?.data) {\n  orderItems.setValue(GetCartForPayment.data.transformedData);\n  toBePaid.setValue(GetCartForPayment?.data?.data?.bill?.toPay || 0.0);\n  mainContainer.setCurrentViewIndex(0);\n}\n\nwindow.triggerNewRelicEvent({\n  apiData: GetCartForPayment,\n  eventName: "get-cart-payment-success",\n  shouldLogResponse: false\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: GetCart,\n  eventName: "get-cart-payment-failure",\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <State id="orderItems" value="[]" />
    <State id="toBePaid" value="0.0" />
    <RESTQuery
      id="CreateOrderCash"
      body={
        '{\n  "address_id": "{{localStorage.values.userAddress.id}}",\n  "payment_info": {\n      "payment_type": "PRE_PAYMENT",\n      "transaction_amount": {{Number(GetCartForPayment.data?.data?.bill?.toPay)}},\n      "order_context": "ORDER_JOB",\n      "payment_method": "Cash"\n  },\n  "payment_type": "PRE_PAYMENT",\n  "user_consent": "PROCEED_WITH_DUPLICATE_ORDER"\n}'
      }
      bodyType="raw"
      headers={
        '[{"key":"Content-Type","value":"application/json"},{"key":"deviceId","value":"{{ localStorage?.values?.userData?.deviceId }}"},{"key":"versionCode","value":"2100"},{"key":"x-channel","value":"IM-POS"},{"key":"token","value":"{{ localStorage?.values?.userData?.token }}"},{"key":"tid","value":"{{ localStorage?.values?.userData?.tid }}"},{"key":"sid","value":"{{ localStorage?.values?.userData?.sid }}"},{"key":"user-agent","value":"web"}]'
      }
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="/api/v1/checkout/order?cartType=INSTAMART"
      resourceDisplayName="IM Checkout Service"
      resourceName="860f84f2-5d70-4aad-b72e-e7bb9ae84d9e"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      type="POST"
    >
      <Event
        event="success"
        method="run"
        params={{
          map: {
            src: 'if (CreateOrderCash?.data?.statusCode === 0) {\n  ConfirmOrderCash.trigger();\n  orderJobId.setValue(CreateOrderCash?.data?.data?.order_group_id || "");\n\n  window.triggerNewRelicEvent({\n    apiData: CreateOrderCash,\n    eventName: "create-order-cash-success"\n  });\n  \n  \n} else {\n  utils.showNotification({\n    title: CreateOrderCash?.data?.statusMessage || "Failed to create order",\n    notificationType: "error"\n  });\n\n   window.triggerNewRelicEvent({\n    apiData: CreateOrderCash,\n    eventName: "create-order-cash-failure"\n  });\n}\n  ',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ !!CreateOrderCash?.error?.statusMessage }}"
        event="failure"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "info",
              title: "{{ CreateOrderCash?.error?.statusMessage }}",
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          map: {
            src: ' window.triggerNewRelicEvent({\n  apiData: CreateOrderCash,\n  eventName: "create-order-cash-failure"\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="ConfirmOrderCash"
      body={
        '{\n  "order_id": "{{CreateOrderCash?.data?.data?.order_group_id || ""}}",\n  "payment_transaction_id": "{{CreateOrderCash?.data?.data?.orders?.[0].order_jobs?.[0].payment_info?.[0].transaction_id || ""}}"\n}'
      }
      bodyType="raw"
      headers={
        '[{"key":"Content-Type","value":"application/json"},{"key":"deviceId","value":"{{ localStorage?.values?.userData?.deviceId }}"},{"key":"versionCode","value":"2100"},{"key":"x-channel","value":"IM-POS"},{"key":"token","value":"{{ localStorage?.values?.userData?.token }}"},{"key":"tid","value":"{{ localStorage?.values?.userData?.tid }}"},{"key":"sid","value":"{{ localStorage?.values?.userData?.sid }}"},{"key":"user-agent","value":"web"}]'
      }
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="/api/v1/checkout/confirm/order?cartType=INSTAMART"
      resourceDisplayName="IM Checkout Service"
      resourceName="860f84f2-5d70-4aad-b72e-e7bb9ae84d9e"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      type="POST"
    >
      <Event
        event="success"
        method="run"
        params={{
          map: {
            src: 'if (ConfirmOrderCash?.data?.statusCode === 0) {\n  mainContainer.setCurrentViewIndex(1);\n\n   window.triggerNewRelicEvent({\n    apiData: ConfirmOrderCash,\n    eventName: "confirm-order-success"\n  });\n\n  // DP event\n  window.send_dp_event({\n    event: "click",\n    object_name: "payment-completion",\n    object_value: {\n      payment_total: toBePaid.value,\n      order_id: orderJobId.value || "",\n      payment_mode: select1.selectedItem?.label || ""  \n    }\n  });\n  \n} else {\n  utils.showNotification({\n    title: ConfirmOrderCash?.data?.statusMessage || "Failed to confirm order",\n    notificationType: "error"\n  });\n\n  window.triggerNewRelicEvent({\n    apiData: ConfirmOrderCash,\n    eventName: "confirm-order-failure"\n  });\n\n  // DP event\n  window.send_dp_event({\n    event: "click",\n    object_name: "payment-fail",\n    object_value: {\n      payment_total: toBePaid.value,\n      order_id: orderJobId.value || ""\n    }\n  });\n}\n  ',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ ConfirmOrderCash?.data?.statusCode === 0 }}"
        event="success"
        method="run"
        params={{
          map: {
            src: "// Hide modal and reset payment mode selection\nselect1.resetValue();\nmodalFrame1.toggleHidden();",
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ !!ConfirmOrderCash?.error?.statusMessage }}"
        event="failure"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "info",
              title: "{{ ConfirmOrderCash?.error?.statusMessage }}",
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          map: {
            src: ' window.triggerNewRelicEvent({\n  apiData: ConfirmOrderCash,\n  eventName: "confirm-order-failure"\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <State id="orderJobId" />
    <RESTQuery
      id="GenerateInvoice"
      body={
        '[{"key":"entityId","value":"{{ orderJobId.value }}"},{"key":"preSignDocuments","value":"{\\"preSign\\": true, \\"ttlInHours\\": 24}"}]'
      }
      bodyType="json"
      headers={
        '[{"key":"Content-Type","value":"application/json"},{"key":"Accept","value":"application/json"}]'
      }
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="api/v1/invoices/getInvoices"
      resourceDisplayName="Taco Service Internal API"
      resourceName="bd1342cb-d362-4e8c-8f8b-dbb707d56da8"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      type="POST"
    >
      <Event
        event="success"
        method="run"
        params={{
          map: {
            src: '\n// Open Cart Flow on Finish transaction btn\nif (GenerateInvoice?.data?.data?.[0]?.invoicePreSignedUrl) {\n  \n  window.triggerNewRelicEvent({\n    apiData: GenerateInvoice,\n    eventName: "generate-invoice-success"\n  });\n  \n  utils.openUrl(GenerateInvoice?.data?.data?.[0]?.invoicePreSignedUrl, {newTab: true});\n\n  // Go to cart if all items are from exp center\n  if (orderItems.value?.every(item => item.picked === true)) {\n    tabbedContainer1.setCurrentViewIndex(0);\n    GetCart.trigger();\n    \n    // Clear LS\n    localStorage.setValue("orderJobId", "");\n\n  }\n\n} else {\n  utils.showNotification({\n    title: "Failed to generate invoice",\n    description: "",\n    notificationType: "error"\n  });\n  \n  window.triggerNewRelicEvent({\n    apiData: GenerateInvoice,\n    eventName: "generate-invoice-failure"\n  });\n}',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "error",
              title: "Failed to generate invoice",
              description: "{{ GenerateInvoice.error }}",
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: GenerateInvoice,\n  eventName: "generate-invoice-failure"\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="GetOrderSummary"
      body={
        '{\n    "order_id": "{{orderJobId.value}}",\n    "usecase_id": "b2CSocietyStoreOrderSummaryUsecase",\n    "preSignDocuments": {\n        "preSign": true,\n        "ttlInHours": 24\n    }\n}'
      }
      bodyType="raw"
      headers={
        '[{"key":"Content-Type","value":"application/json"},{"key":"Accept","value":"application/json"}]'
      }
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="/api/v1/multi-entity/invoices/pre-terminal/INSTAMART/sync"
      resourceDisplayName="Taco Service Internal API"
      resourceName="bd1342cb-d362-4e8c-8f8b-dbb707d56da8"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      type="POST"
    >
      <Event
        event="success"
        method="run"
        params={{
          map: {
            src: 'if (GetOrderSummary?.data?.data?.invoicePreSignedUrl) {\n  \n  window.triggerNewRelicEvent({\n    apiData: GetOrderSummary,\n    eventName: "generate-order-summary-success"\n  });\n\n  utils.openUrl(GetOrderSummary?.data?.data?.invoicePreSignedUrl, {\n    newTab: true\n  });\n\n  // Go to cart if all items are not from exp center\n  if (!orderItems.value?.every(item => item.picked === true)) {\n    tabbedContainer1.setCurrentViewIndex(0);\n    GetCart.trigger();\n    \n    // Clear LS\n    localStorage.setValue("orderJobId", "");\n\n  }\n\n} else {\n  utils.showNotification({\n    title: "Failed to generate order summary",\n    description: "",\n    notificationType: "error"\n  });\n  \n  window.triggerNewRelicEvent({\n    apiData: GetOrderSummary,\n    eventName: "generate-order-summary-failure"\n  });\n}',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: GetOrderSummary,\n  eventName: "get-print-copy-failure"\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "info",
              title: "Failed to generate order summary",
              description: "{{ GetOrderSummary.error }}",
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
  </Folder>
  <Folder id="Search">
    <State id="search_result_current_offset_number" value="1" />
    <State id="search_results_offset" value="0" />
    <State id="auto_suggestions" />
    <State id="search_results" value="[]" />
    <State id="selected_item_for_variant" />
    <State id="cart_data" value="{{cart_req_body_blob.value}}" />
    <State
      id="item_being_added_to_cart"
      value={
        '{\n          "itemId": "",\n          "serviceLine": "INSTAMART",\n          "quantity": 1,\n          "productId": "",\n          "meta": {\n              "type": "structure",\n              "storeId": {{localStorage.values?.storeData?.storeId}},\n              "picked": false\n          },\n          "spin": ""\n      }'
      }
    />
    <JavascriptQuery
      id="search_results_transformer"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/search_results_transformer.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="transform_cart_items"
      notificationDuration={4.5}
      query={include("./lib/transform_cart_items.js", "string")}
      resourceName="JavascriptQuery"
      runWhenPageLoads={true}
      showSuccessToaster={false}
    />
    <JavascriptQuery
      id="reset_search_data"
      notificationDuration={4.5}
      query={include("./lib/reset_search_data.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
    <RESTQuery
      id="fetch_auto_suggestions"
      headers={
        '[{"key":"metaInfo","value":""},{"key":"X-Source","value":"IM-POS"},{"key":"ageConsent","value":"false"},{"key":"X-Marketplace-Id","value":"swiggy"},{"key":"X-Business-Line-Id","value":"BUSINESS_LINE_INSTAMART"},{"key":"Content-Type","value":"application/json"},{"key":"accept","value":"application/json"},{"key":"user-agent","value":"Retool"},{"key":"tid","value":"{{ localStorage.values.userData.tid }}"},{"key":"deviceId","value":"{{ localStorage.values.userData.deviceId }}"}]'
      }
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="api/v1/instamart/auto_suggest?auto_suggest.query={{textInput1.value}}&pod_id={{localStorage.values?.storeData?.storeId}}&lat={{localStorage.values?.storeData.latitude}}&lng={{localStorage.values?.storeData.longitude}}&auto_suggest.tracking_id={{uuid.v4()}}"
      resourceDisplayName="Instamart Discovery Service"
      resourceName="6735c562-eb90-4650-82fd-45c2abb1363e"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
    >
      <Event
        event="success"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: fetch_auto_suggestions,\n  eventName: "fetch-auto-suggestions-success",\n  shouldLogResponse: false\n\n});\n\nif (fetch_auto_suggestions.data.success) {\n  let val = fetch_auto_suggestions.data.success?.cards || [];\n\n  val = val?.[0]?.groupedCard?.cardGroupMap?.["INSTAMART"]?.cards || [];\n  auto_suggestions.setValue({suggestions: val, secondary_suggestions: []});  \n}\n\ncontainer50.setHidden(false);',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "error",
              title: "Failed to get suggestions",
              description: "{{fetch_auto_suggestions.error}}",
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: fetch_auto_suggestions,\n  eventName: "fetch-auto-suggestions-failure"\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <State
      id="image_url_auto_suggestions"
      value="https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,h_96,w_96/"
    />
    <State
      id="image_url_search_results"
      value="https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_252,h_272/"
    />
    <State
      id="image_url_combo_variants"
      value="https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,h_128,w_128/"
    />
    <State
      id="cart_req_body_blob"
      value={
        '{\n  "location": {\n    "latitude": {{localStorage.values?.userAddress?.latitude}},\n    "longitude": {{localStorage.values?.userAddress?.longitude}}\n  },\n  "cartMetaData": {\n      "owner": "APP",\n      "deliveryType": "INSTANT",\n      "preferredAddressId": {{localStorage.values?.userAddress?.id}},\n      "useReusablePackaging": false,\n      "walkInOrder": true,\n      "takeawayOrder": {{localStorage.values?.userData?.takeawayOrder}},\n      "storeIds": [{{localStorage.values?.storeData?.storeId}}]\n  },\n  "cartType": "INSTAMART",\n  "items": [\n      {{item_being_added_to_cart.value}}\n  ]\n}'
      }
    />
    <RESTQuery
      id="fetch_search_results"
      body={
        '{\n    "facets": [],\n    "query": {{textInput1.value}},\n    "page_type": "PAGE_TYPE_INSTAMART_SEARCH_PAGE",\n    "search_results_offset": {{ search_results_offset.value }},\n    "sort_attribute": "",\n    "ads_disabled": true\n}'
      }
      bodyType="raw"
      headers={
        '[{"key":"platform","value":"IM-POS"},{"key":"X-Marketplace-Id","value":"swiggy"},{"key":"X-Business-Line-Id","value":"BUSINESS_LINE_INSTAMART"},{"key":"Content-Type","value":"application/json"},{"key":"accept","value":"application/json"},{"key":"user-agent","value":"Retool"},{"key":"tid","value":"{{ localStorage.values.userData.tid }}"},{"key":"deviceId","value":"{{ localStorage.values.userData.deviceId }}"},{"key":"version-code","value":"1516"}]'
      }
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="api/v1/instamart/search?lat={{localStorage.values?.storeData.latitude}}&lng={{localStorage.values?.storeData.longitude}}&offset={{ search_result_current_offset_number.value }}&pod_id={{localStorage.values?.storeData?.storeId}}&page_name=search"
      resourceDisplayName="Instamart Discovery Service"
      resourceName="6735c562-eb90-4650-82fd-45c2abb1363e"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      type="POST"
    >
      <Event
        event="success"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: fetch_search_results,\n  eventName: "fetch-search-results-success",\n  shouldLogResponse: false\n});\n\nif (fetch_search_results.data.success) {\n  search_results_transformer.trigger({\n    additionalScope: {\n      data: fetch_search_results.data?.success || {}\n    }\n  })\n} else {\n  utils.showNotification({\n    title: "No search results found",\n    notificationType: "info"\n  })\n}',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "info",
              title: "Failed to get search results",
              description: "{{fetch_search_results.error}}",
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: fetch_search_results,\n  eventName: "fetch-search-results-failure"\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="add_to_cart_search"
      body="{{cart_data.value}}"
      bodyType="raw"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      headers={
        '[{"key":"Content-Type","value":"application/json"},{"key":"deviceId","value":"{{ localStorage?.values?.userData?.deviceId }}"},{"key":"versionCode","value":"2100"},{"key":"x-channel","value":"IM-POS"},{"key":"token","value":"{{ localStorage?.values?.userData?.token }}"},{"key":"tid","value":"{{ localStorage?.values?.userData?.tid }}"},{"key":"sid","value":"{{ localStorage?.values?.userData?.sid }}"},{"key":"user-agent","value":"Retool"}]'
      }
      isMultiplayerEdited={false}
      query="api/v2/view/INSTAMART?pageType=INSTAMART_CART"
      resourceDisplayName="IM Checkout Service"
      resourceName="860f84f2-5d70-4aad-b72e-e7bb9ae84d9e"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      type="POST"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: add_to_cart_search,\n  eventName: "add-cart-search-success"\n});\n\nif (add_to_cart_search.data.data) {\n  const itemsClone = JSON.parse(JSON.stringify(add_to_cart_search.data?.data?.items || []));\n  const itemInCart = itemsClone.find(item => item.itemId === item_being_added_to_cart.value?.itemId);\n\n  const productName = selected_item_for_variant.value?.product_name ? `${selected_item_for_variant.value?.product_name} (${item_being_added_to_cart.value?.variant_qty})` : `${item_being_added_to_cart.value?.product_name} (${item_being_added_to_cart.value?.qty})`;\n\n  utils.showNotification({\n    title: itemInCart ? `${itemInCart.quantity} qty(s) added for ${productName}` : "Item added to cart!",\n    notificationType: "success"\n  });\n} else {\n  utils.showNotification({\n    title: add_to_cart_search.data?.statusMessage || "Failed to add item to cart",\n    notificationType: "error"\n  })\n}',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "error",
              title: "Failed to add item to cart",
              description: "{{add_to_cart_search.error}}",
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: add_to_cart_search,\n  eventName: "add-cart-search-failure"\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="get_cart_search"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      headers={
        '[{"key":"Content-Type","value":"application/json"},{"key":"deviceId","value":"{{ localStorage?.values?.userData?.deviceId }}"},{"key":"versionCode","value":"2100"},{"key":"x-channel","value":"IM-POS"},{"key":"token","value":"{{ localStorage?.values?.userData?.token }}"},{"key":"tid","value":"{{ localStorage?.values?.userData?.tid }}"},{"key":"sid","value":"{{ localStorage?.values?.userData?.sid }}"}]'
      }
      isMultiplayerEdited={false}
      query="/api/v2/view?cartType=INSTAMART&pageType=INSTAMART_CART"
      resourceDisplayName="IM Checkout Service"
      resourceName="860f84f2-5d70-4aad-b72e-e7bb9ae84d9e"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: get_cart_search,\n  eventName: "get-cart-search-success"\n});\n\nconst itemsClone = JSON.parse(JSON.stringify(get_cart_search.data?.data?.items || []));\nconst itemInCart = itemsClone.find(item => item.itemId === item_being_added_to_cart.value?.itemId);\n\n\nconst allowedQty = selected_item_for_variant.value?.cart_allowed_quantity || item_being_added_to_cart.value?.cart_allowed_quantity;\nconst productName = selected_item_for_variant.value?.product_name ? `${selected_item_for_variant.value?.product_name} (${item_being_added_to_cart.value?.variant_qty})` : `${item_being_added_to_cart.value?.product_name} (${item_being_added_to_cart.value?.qty})`;\n\nif (allowedQty === 0 || itemInCart?.quantity >= allowedQty) {\n  utils.showNotification({\n    title: !itemInCart?.quantity ? `Sorry! We don\'t have enough quantity for ${productName} at the moment` : `Max limit reached. Only ${allowedQty} qty(s) available for ${productName}`,\n    notificationType: "error"\n  });\n\n  return;\n}\n\nif (itemInCart) {\n  itemInCart.quantity += 1;\n} else {\n  itemsClone.push({\n        "itemId": item_being_added_to_cart.value?.itemId || "",\n        "quantity": 1,\n        "metadata": {\n          "product_id": item_being_added_to_cart.value?.product_id || "",\n          "variations": [{\n            "spin": item_being_added_to_cart.value?.spin          \n          }]\n        },\n        "storeId": localStorage.values?.storeData?.storeId || "",\n        "picked": false,\n        \n    });\n}\n\nconst finalItemsForCart = window.transformCartItems(itemsClone);\ncart_data.setIn(["items"], finalItemsForCart);\n\nsetTimeout(() => {\n  add_to_cart_search.trigger();\n}, 500);',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "error",
              title: "Failed to add item to cart",
              description: "{{get_cart_search.error}}",
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: get_cart_search,\n  eventName: "get-cart-search-failure"\n});\n',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
  </Folder>
  <Folder id="PastOrders">
    <RESTQuery
      id="downloadOrderSummary"
      body={
        '{\n    "order_id": {{data.orderId}},\n    "usecase_id": "b2CSocietyStoreOrderSummaryUsecase",\n    "preSignDocuments": {\n        "preSign": true,\n        "ttlInHours": 24\n    }\n}'
      }
      bodyType="raw"
      headers={
        '[{"key":"Content-Type","value":"application/json"},{"key":"Accept","value":"application/json"}]'
      }
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="/api/v1/multi-entity/invoices/pre-terminal/INSTAMART/sync"
      resourceDisplayName="Taco Service Internal API"
      resourceName="bd1342cb-d362-4e8c-8f8b-dbb707d56da8"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      type="POST"
    >
      <Event
        event="success"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: downloadOrderSummary,\n  eventName: "download-order-summary-success"\n});\n\n\nif (downloadOrderSummary?.data?.data?.invoicePreSignedUrl) {\nutils.openUrl(downloadOrderSummary?.data?.data?.invoicePreSignedUrl, {\n  newTab: true\n});\n} else {\n  utils.showNotification({\n    title: "Failed to download order summary",\n    notificationType: "error"\n  })\n}',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "error",
              title:
                '{{ downloadOrderSummary?.data?.data?.statusMessage || "Failed to download order summary, please try again" }}',
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: downloadOrderSummary,\n  eventName: "download-order-summary-failure"\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="downloadInvoice"
      body={
        '[{"key":"entityId","value":"{{ data.orderId }}"},{"key":"preSignDocuments","value":"{\\"preSign\\": true, \\"ttlInHours\\": 24}"}]'
      }
      bodyType="json"
      headers={
        '[{"key":"Content-Type","value":"application/json"},{"key":"Accept","value":"application/json"}]'
      }
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="api/v1/invoices/getInvoices"
      resourceDisplayName="Taco Service Internal API"
      resourceName="bd1342cb-d362-4e8c-8f8b-dbb707d56da8"
      runWhenModelUpdates={false}
      showSuccessToaster={false}
      type="POST"
    >
      <Event
        event="success"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: downloadInvoice,\n  eventName: "download-order-invoice-success"\n});\n\nif (downloadInvoice?.data?.data?.[0]?.invoicePreSignedUrl) {\n  utils.openUrl(downloadInvoice?.data?.data?.[0]?.invoicePreSignedUrl, {\n    newTab: true\n  });\n} else {\n  utils.showNotification({\n    title: "Failed to download order summary",\n    notificationType: "error"\n  })\n}',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "error",
              title:
                '{{ downloadInvoice?.data?.data?.statusMessage || "Invoice generation failed, please retry again" }}',
              description: "",
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: downloadInvoice,\n  eventName: "download-invoice-failure"\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="GetOrderHistory"
      enableTransformer={true}
      headers={
        '[{"key":"User-Agent","value":"web"},{"key":"tid","value":"{{localStorage.values.userData.tid}}"},{"key":"token","value":"{{localStorage.values.userData.token}}"}]'
      }
      isMultiplayerEdited={false}
      query="api/v1/order/history?order_type=DASH&count=20&from_time={{'' +moment(new Date(date1.value)).add(1, 'day').get()}}"
      resourceDisplayName="Dash Timeline Service"
      resourceName="cdf89047-1068-482f-b272-8ffd85793f47"
      runWhenModelUpdates={false}
      runWhenPageLoads={true}
      showFailureToaster={false}
      showSuccessToaster={false}
    >
      <Event
        enabled="{{ GetOrderHistory.data?.statusCode !== 0 }}"
        event="success"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "error",
              title: "Failed to fetch order history",
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="run"
        params={{
          map: {
            src: 'if (GetOrderHistory.data?.statusCode === 0 ) {\n  window.triggerNewRelicEvent({\n    apiData: GetOrderHistory,\n    eventName: "get-order-history-success"\n  });  \n} else {\n  window.triggerNewRelicEvent({\n    apiData: GetOrderHistory,\n    eventName: "get-order-history-failure"\n  });\n}',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled=""
        event="failure"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "error",
              title: "Failed to fetch order history",
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: GetOrderHistory,\n  eventName: "get-order-history-failure"\n});',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <State id="shipmentItems" value="null" />
    <GRPCQuery
      id="CancelOrder"
      confirmationMessage="##### Are you sure you want to cancel this order ID - {{ table1.selectedRow?.order_group_id }} ?"
      isMultiplayerEdited={false}
      methodName="CancelOrder"
      query={include("./lib/CancelOrder.proto", "string")}
      requireConfirmation={true}
      resourceDisplayName="IM Post order"
      resourceName="90291dc3-14ef-4d08-b7b7-767d3bf98cf4"
      serviceName="instamartgateway.postorder.v1.PostOrderAPI"
      showFailureToaster={false}
      showSuccessToaster={false}
    >
      <Event
        enabled=""
        event="success"
        method="showNotification"
        params={{
          map: {
            options: { notificationType: "success", title: "Order cancelled" },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: CancelOrder,\n  eventName: "cancel-order-success"\n});\n\nGetOrderHistory.trigger();',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="showNotification"
        params={{
          map: {
            options: {
              notificationType: "error",
              title: "{{ CancelOrder.error }}",
            },
          },
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="failure"
        method="run"
        params={{
          map: {
            src: 'window.triggerNewRelicEvent({\n  apiData: CancelOrder,\n  eventName: "cancel-order-failure"\n});\n',
          },
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </GRPCQuery>
  </Folder>
</GlobalFunctions>
