const result = {{launchOpportunities}}.value.reduce((acc, current) =>{
  let operation = acc.find(x => x.operationTrigger.requestId === current.operationRequestId);
  if(!operation){
    acc.push({
      operationId: "55dd5cca-d90b-49c8-a2f0-68c02e8a04c2",
      requester: {{current_user}}.email,
      operationTrigger: {
          requestId: current.operationRequestId,
          subtaskCount: 1,
      },
      parameters: {
          comment: {{rejectReasonTransformer.value}},
          launchOpportunityIds:[current.id],
          userEmail: {{current_user}}.email
      }
    })
  }else{
    operation.parameters.launchOpportunityIds.push(current.id)
    operation.operationTrigger.subtaskCount++;
  }
  return acc;
}, [])   
return result;
