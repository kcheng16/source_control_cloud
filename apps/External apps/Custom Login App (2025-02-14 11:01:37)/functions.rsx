<GlobalFunctions>
  <RetoolUserActionQuery
    id="login"
    email="{{ EmailInput.value }}"
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    metadata={null}
    password="{{ PasswordInput.value }}"
    resourceName="RetoolUserAction"
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
      method="openUrl"
      params={{
        ordered: [{ url: "/" }, { options: { ordered: [{ newTab: false }] } }],
      }}
      pluginId=""
      type="util"
      waitMs="0"
      waitType="debounce"
    />
  </RetoolUserActionQuery>
</GlobalFunctions>
