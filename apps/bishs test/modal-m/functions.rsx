<GlobalFunctions>
  <RESTQuery
    id="query1"
    query="https://www.httpbin.org/get?my_key_is=123456"
    resourceName="REST-WithoutResource"
    resourceTypeOverride=""
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
</GlobalFunctions>
