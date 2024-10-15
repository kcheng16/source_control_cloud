<GlobalFunctions>
  <Folder id="parentAppAuth">
    <RESTQuery
      id="authTokenQuery"
      body={'[{"key":"email","value":"{{ current_user.email }}"}]'}
      bodyType="json"
      cookies={'[{"key":"","value":""}]'}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      headers={'[{"key":"","value":""}]'}
      isMultiplayerEdited={false}
      query="agents/retool/token-exchange/"
      resourceName="79af9bff-62ed-4a53-a766-344d44333aa6"
      resourceTypeOverride=""
      transformer="// Query results are available as the `data` variable
return data"
      type="POST"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="authorizeParentApp"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="setValue"
        params={{
          ordered: [{ value: "{{ authTokenQuery.data?.user.phone_number }}" }],
        }}
        pluginId="currentPhoneNumber"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <ParentWindowQuery
      id="hasParentApp"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      placeholder="false"
      resourceName="ParentWindow"
      resourceTypeOverride=""
      selector="parentAppConnected"
      transformer="// 
return !!data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="authorizeParentApp"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </ParentWindowQuery>
    <JavascriptQuery
      id="authorizeParentApp"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/authorizeParentApp.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <State id="currentPhoneNumber" />
  </Folder>
  <Folder id="parentAppNotifications">
    <JavascriptQuery
      id="notifyParentNewMessage"
      notificationDuration={4.5}
      query={include("./lib/notifyParentNewMessage.js", "string")}
      resourceName="JavascriptQuery"
      resourceTypeOverride=""
      showSuccessToaster={false}
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <JavascriptQuery
      id="notifyParentnewVoiceMail"
      notificationDuration={4.5}
      query={include("./lib/notifyParentnewVoiceMail.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
  </Folder>
  <Folder id="Call">
    <RESTQuery
      id="listCalls"
      isMultiplayerEdited={false}
      query="telephony/calls?phone_number={{ getPhoneNumberById.value }}"
      queryDisabled="{{ !getPhoneNumberById.value }}"
      resourceName="0a3e4613-0a42-47b2-bfaa-8cfce99fd636"
      transformer=""
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="resetFilterStack"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="triageCall"
      body={
        '[{"key":"task_id","value":"{{ triageCallRetrieveTask.data?.id }}"}]'
      }
      bodyType="json"
      cookies="[]"
      isMultiplayerEdited={false}
      query="telephony/calls/{{ activeCall.value.id }}/triage/"
      resourceName="0a3e4613-0a42-47b2-bfaa-8cfce99fd636"
      runWhenModelUpdates={false}
      type="POST"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="listCalls"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="hide"
        params={{ ordered: [] }}
        pluginId="callTriageModelFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="reset"
        params={{ ordered: [] }}
        pluginId="triageCallRetrieveTask"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <State id="activeCall" />
    <RESTQuery
      id="markCallAsSpam"
      body="[]"
      bodyType="json"
      headers="[]"
      isMultiplayerEdited={false}
      query="telephony/calls/{{ activeCall.value.id }}/triage/"
      resourceName="0a3e4613-0a42-47b2-bfaa-8cfce99fd636"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      type="POST"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="listCalls"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="hide"
        params={{ ordered: [] }}
        pluginId="callTriageModelFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <JavascriptQuery
      id="resetFilterStack"
      notificationDuration={4.5}
      query={include("./lib/resetFilterStack.js", "string")}
      resourceName="JavascriptQuery"
      showSuccessToaster={false}
    />
  </Folder>
  <Folder id="SMS">
    <RESTQuery
      id="listConversations"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query="telephony/conversations/?phone_number={{ getPhoneNumberById.value }}"
      queryDisabled="{{ !getPhoneNumberById.value }}"
      resourceName="0a3e4613-0a42-47b2-bfaa-8cfce99fd636"
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <RESTQuery
      id="retrieveConversation"
      enableTransformer={true}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query="telephony/conversations/{{ activeConversation.value?.id }}"
      queryDisabled="{{ !activeConversation.value }}"
      resourceName="0a3e4613-0a42-47b2-bfaa-8cfce99fd636"
      transformer="// Query results are available as the `data` variable
return data"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        enabled="{{ scrollDownMessageList.value }}"
        event="success"
        method="scrollToIndex"
        params={{
          ordered: [
            { index: "{{ retrieveConversation.data?.messages.length + 1}}" },
            { smooth: true },
          ],
        }}
        pluginId="messagesListView"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="setValue"
        params={{ ordered: [{ value: "false" }] }}
        pluginId="scrollDownMessageList"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="sendNewMessage"
      body="{{ newConversationPayloadTransformer.value }}"
      bodyType="raw"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      headers={
        '[{"key":"Content-Type","value":"application/json"},{"key":"","value":""}]'
      }
      isMultiplayerEdited={false}
      query="telephony/conversations/sms/"
      queryFailureConditions={
        '[{"condition":"{{ metadata.status != 201 }}","message":"{{ data.detail }}"}]'
      }
      resourceName="0a3e4613-0a42-47b2-bfaa-8cfce99fd636"
      runWhenModelUpdates={false}
      successMessage="Message sent."
      transformer="// Query results are available as the `data` variable
return data"
      type="POST"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="hide"
        params={{ ordered: [] }}
        pluginId="sendNewMessageModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="listConversations"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="reset"
        params={{ ordered: [] }}
        pluginId="newMessageRetrieveTask"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="setValue"
        params={{ ordered: [{ value: "1" }] }}
        pluginId="phonesCount"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="setValue"
        params={{ ordered: [{ value: "{{ true }}" }] }}
        pluginId="showDefaultUSCountryCode"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="sendMessageToConversation"
      body={
        '[{"key":"conversation_id","value":"{{ activeConversation.value.id }}","operation":"text"},{"key":"task","value":"{{ conversationFormRetrieveTask.data?.id }}","operation":"text"},{"key":"body","value":"{{ form3.data.body }}","operation":"text"},{"key":"media","value":"{{ form3.data.media? form3.data.media: [] }}","operation":"binary"},{"key":"twilio_phone","value":"{{ selectedPhoneNumber.value }}","operation":"text"}]'
      }
      bodyType="form-data"
      cookies={'[{"key":"","value":""}]'}
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      headers="[]"
      isMultiplayerEdited={false}
      query="telephony/conversations/sms/"
      queryFailureConditions={
        '[{"condition":"{{ metadata.status != 201 }}","message":"{{ data.detail }}"}]'
      }
      queryTimeout="30000"
      resourceName="0a3e4613-0a42-47b2-bfaa-8cfce99fd636"
      runWhenModelUpdates={false}
      successMessage="Message sent."
      transformer="// Query results are available as the `data` variable
return data"
      type="POST"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="retrieveConversation"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="reset"
        params={{ ordered: [] }}
        pluginId="conversationFormRetrieveTask"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="listConversations"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="clear"
        params={{ ordered: [] }}
        pluginId="form3"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <RESTQuery
      id="triageMessage"
      body={
        '[{"key":"task","value":"{{ triageMessageRetrieveTask.data?.id }}"},{"key":"conversation_id","value":"{{ activeConversation.value?.id }}"},{"key":"message_id","value":"{{ activeMessage.value?.ext_id }}"}]'
      }
      bodyType="json"
      cookies="[]"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query="telephony/conversations/sms/triage/"
      resourceName="0a3e4613-0a42-47b2-bfaa-8cfce99fd636"
      runWhenModelUpdates={false}
      successMessage="Message triaged."
      transformer="// Query results are available as the `data` variable
return data"
      type="POST"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="hide"
        params={{ ordered: [] }}
        pluginId="messageTriageModalFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="retrieveConversation"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="reset"
        params={{ ordered: [] }}
        pluginId="triageMessageRetrieveTask"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="listConversations"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <State id="activeConversation" />
    <State id="activeMessage" />
    <Function
      id="newConversationPayloadTransformer"
      funcBody={include("./lib/newConversationPayloadTransformer.js", "string")}
    />
    <State id="phonesCount" value="1" />
    <RESTQuery
      id="retrieveNotes"
      query="telephony/conversations/{{ activeConversation.value?.id }}/notes/"
      queryDisabled="{{ !activeConversation.value }}"
      resourceName="0a3e4613-0a42-47b2-bfaa-8cfce99fd636"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <RESTQuery
      id="updateNotes"
      body={'[{"key":"notes","value":"{{ notesEditableTextArea.value }}"}]'}
      bodyType="json"
      isMultiplayerEdited={false}
      query="telephony/conversations/{{ activeConversation.value?.id }}/notes/"
      queryFailureConditions={
        '[{"condition":"{{ metadata.status != 204 }}","message":"{{ data.detail }}"}]'
      }
      resourceName="0a3e4613-0a42-47b2-bfaa-8cfce99fd636"
      runWhenModelUpdates={false}
      successMessage="Notes updated."
      type="POST"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <RESTQuery
      id="markMessageAsSpam"
      body={
        '[{"key":"conversation_id","value":"{{ activeConversation.value?.id }}"},{"key":"message_id","value":"{{ activeMessage.value.ext_id }}"}]'
      }
      bodyType="json"
      isMultiplayerEdited={false}
      query="telephony/conversations/sms/triage/"
      resourceName="0a3e4613-0a42-47b2-bfaa-8cfce99fd636"
      resourceTypeOverride=""
      runWhenModelUpdates={false}
      type="POST"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="retrieveConversation"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="hide"
        params={{ ordered: [] }}
        pluginId="messageTriageModalFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <JavascriptQuery
      id="bulkTriageMessages"
      _additionalScope={["markSpam"]}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query={include("./lib/bulkTriageMessages.js", "string")}
      resourceName="JavascriptQuery"
      successMessage="{{ Object.keys(untriagedMessageIds.value).length }} message{{ Object.keys(untriagedMessageIds.value).length > 1? 's': ''  }} updated."
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    >
      <Event
        event="success"
        method="hide"
        params={{ ordered: [] }}
        pluginId="bulkTriageMessageModalFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="reset"
        params={{ ordered: [] }}
        pluginId="bulkTriageMessageRetrieveTask"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="retrieveConversation"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="listConversations"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="setValue"
        params={{ ordered: [{ value: "{}" }] }}
        pluginId="untriagedMessageIds"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </JavascriptQuery>
    <RESTQuery
      id="customTriageMessage"
      body={
        '[{"key":"task","value":"{{ !markSpam ?  bulkTriageMessageRetrieveTask.data?.id: undefined}}"},{"key":"conversation_id","value":"{{ activeConversation.value?.id }}"},{"key":"message_id","value":"{{ messageId }}"}]'
      }
      bodyType="json"
      cookies="[]"
      errorTransformer="// The variable 'data' allows you to reference the request's data in the transformer. 
// example: return data.find(element => element.isError)
return data.error"
      isMultiplayerEdited={false}
      query="telephony/conversations/sms/triage/"
      resourceName="0a3e4613-0a42-47b2-bfaa-8cfce99fd636"
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
        method="hide"
        params={{ ordered: [] }}
        pluginId="messageTriageModalFrame"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="retrieveConversation"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="reset"
        params={{ ordered: [] }}
        pluginId="triageMessageRetrieveTask"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="success"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="listConversations"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </RESTQuery>
    <State id="scrollDownMessageList" value="false" />
    <Function
      id="untriagedMessageIds"
      funcBody={include("./lib/untriagedMessageIds.js", "string")}
    />
    <State id="showDefaultUSCountryCode" value="true" />
  </Folder>
  <Folder id="Task">
    <RESTQuery
      id="conversationFormRetrieveTask"
      headers={'[{"key":"","value":""}]'}
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="tasks/by_unique_key/?search_key={{ form3.data.task  }}"
      resourceName="0a3e4613-0a42-47b2-bfaa-8cfce99fd636"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <RESTQuery
      id="newMessageRetrieveTask"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="tasks/by_unique_key/?search_key={{ form2.data.task }}"
      queryDisabled="{{ !form2.data.task }}"
      resourceName="0a3e4613-0a42-47b2-bfaa-8cfce99fd636"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <RESTQuery
      id="triageMessageRetrieveTask"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="tasks/by_unique_key/?search_key={{ messageTriageTaskInput.value }}"
      resourceName="0a3e4613-0a42-47b2-bfaa-8cfce99fd636"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <RESTQuery
      id="triageCallRetrieveTask"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="tasks/by_unique_key/?search_key={{ callTriageTaskInput.value }}"
      resourceName="0a3e4613-0a42-47b2-bfaa-8cfce99fd636"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <RESTQuery
      id="bulkTriageMessageRetrieveTask"
      isMultiplayerEdited={false}
      notificationDuration={4.5}
      query="tasks/by_unique_key/?search_key={{ bulkTriageMessageTaskInput.value }}"
      resourceName="0a3e4613-0a42-47b2-bfaa-8cfce99fd636"
      runWhenModelUpdates={false}
      showFailureToaster={false}
      showSuccessToaster={false}
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
  </Folder>
  <Folder id="Misc">
    <RESTQuery
      id="listPhoneNumbers"
      query="/telephony/phone-numbers/"
      resourceName="0a3e4613-0a42-47b2-bfaa-8cfce99fd636"
      workflowActionType={null}
      workflowBlockUuid={null}
      workflowRunId={null}
    />
    <Function
      id="getPhoneNumberById"
      funcBody={include("./lib/getPhoneNumberById.js", "string")}
    />
  </Folder>
</GlobalFunctions>
