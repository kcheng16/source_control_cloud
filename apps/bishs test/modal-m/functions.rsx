<GlobalFunctions>
  <RESTQuery
    id="query1"
    query="https://www.httpbin.org/get?my_key_is=123456"
    resourceName="REST-WithoutResource"
    resourceTypeOverride=""
    runWhenModelUpdates={false}
  >
    <Event
      event="success"
      method="confetti"
      params={{ ordered: [] }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </RESTQuery>
  <JavascriptQuery
    id="query2"
    query={include("./lib/query2.js", "string")}
    resourceName="JavascriptQuery"
  />
</GlobalFunctions>
