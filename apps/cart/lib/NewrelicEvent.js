const myHeaders = new Headers();
myHeaders.append("X-Insert-Key", "CPDMQSXvjxGCdL_E02P9eZ-NJcEg-uGk");
myHeaders.append("Content-Type", "application/json");

const raw = JSON.stringify({
  "eventType": 'society_stores_dashboard_' + (urlparams.href.includes("retool") ? 'uat' : 'prod'),
  "storeId": localStorage.values?.storeData?.storeId || "-",
  "screen": "cart",
  "user_email": current_user?.email || "-",
  ...data
});

const requestOptions = {
  method: "POST",
  headers: myHeaders,
  body: raw,
  redirect: "follow"
};

fetch("https://insights-collector.newrelic.com/v1/accounts/737486/events", requestOptions)
  .catch((error) => console.error('error',error));