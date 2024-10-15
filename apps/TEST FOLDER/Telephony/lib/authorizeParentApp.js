const {token} = authTokenQuery.data || {}

if(token && hasParentApp.data) {
  parent.parent.postMessage({eventType:'authToken', payload: {token}}, '*');
}
