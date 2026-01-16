<GlobalFunctions>
  <RetoolUserActionQuery
    id="getUserTasks"
    actionCategory="userTask"
    actionType="get_tasks"
    endingBefore=""
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    resourceName="RetoolUserAction"
    resourceTypeOverride=""
    runWhenPageLoads={true}
    selectedUserTaskDefinitionIds={'["1fcc0da7-287f-40a8-bfbf-908bad005e28"]'}
    selectedUserTaskName=""
    selectedWorkflowIds={'["0f674ded-fbb1-4fa1-92c2-ed8c77a6b82a"]'}
    startingAfter=""
    taskName=""
    transformer="// Query results are available as the data variable
return data"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RetoolUserActionQuery
    id="getSingleUserTask"
    actionCategory="userTask"
    actionType="get_task"
    enableTransformer={true}
    endingBefore=""
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    isMultiplayerEdited={false}
    queryDisabled="{{ urlparams.hash.userTaskId === undefined }}"
    resourceName="RetoolUserAction"
    resourceTypeOverride=""
    runWhenPageLoads={true}
    selectedUserTaskName=""
    startingAfter=""
    taskName=""
    transformer="// Query results are available as the data variable
return data"
    userTaskInstanceId="{{ urlparams.hash.userTaskId }}"
    watchedParams={["urlparams.hash.userTaskId"]}
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  />
  <RetoolUserActionQuery
    id="submitUserTask"
    actionCategory="userTask"
    actionType="complete_task"
    endingBefore=""
    errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
    outputPayload={'{ "approved": {{ checkbox1.value }} }'}
    resourceName="RetoolUserAction"
    resourceTypeOverride=""
    selectedUserTaskName=""
    startingAfter=""
    taskName=""
    transformer="// Query results are available as the data variable
return data"
    userTaskInstanceId="{{ table1.selectedRow.id }}"
    workflowActionType={null}
    workflowBlockUuid={null}
    workflowRunId={null}
  >
    <Event
      id="c3fad1c0"
      event="success"
      method="trigger"
      params={{ ordered: [] }}
      pluginId="getUserTasks"
      type="datasource"
      waitMs="500"
      waitType="debounce"
    />
  </RetoolUserActionQuery>
</GlobalFunctions>
