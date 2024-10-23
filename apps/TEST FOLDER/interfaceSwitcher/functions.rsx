<GlobalFunctions>
  <Function
    id="ymd_to_mdy"
    funcBody={include("./lib/ymd_to_mdy.js", "string")}
  />
  <Function
    id="permission_groups_array"
    funcBody={include("./lib/permission_groups_array.js", "string")}
  />
  <Function
    id="transformer3"
    funcBody={include("./lib/transformer3.js", "string")}
  />
  <SqlTransformQuery
    id="query2"
    query={include("./lib/query2.sql", "string")}
    resourceName="SQL Transforms"
    resourceTypeOverride=""
  >
    <Event
      enabled="{{ workaroundQuery.value }}"
      event="success"
      method="open"
      params={{ ordered: [] }}
      pluginId="modal1"
      type="widget"
      waitMs="0"
      waitType="debounce"
    />
  </SqlTransformQuery>
</GlobalFunctions>
