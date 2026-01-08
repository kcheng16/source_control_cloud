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
    selectedUserTaskDefinitionIds={'["8cbcb7df-c039-4ace-9138-0c1ffdd58949"]'}
    selectedUserTaskName=""
    selectedWorkflowIds={'["6a9c1509-7b9d-4740-a9b1-55f50c357973"]'}
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
      id="9b7f88c4"
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
