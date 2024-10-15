<App>
  <Include src="./functions.rsx" />
  <SyncFunction
    id="formatPhoneNumber"
    body={
      'const parsed = libphonenumber.parsePhoneNumber(number);\n\nif (parsed.countryCallingCode == "1"){\n  return parsed.formatNational();\n}\nelse {\n  return libphonenumber.parsePhoneNumber(number).formatInternational();\n}'
    }
    parameters={{
      ordered: [
        {
          number: {
            ordered: [{ name: "number" }, { sampleValue: "+12133734253" }],
          },
        },
      ],
    }}
  />
  <Include src="./src/bulkTriageMessageModalFrame.rsx" />
  <Include src="./src/callTriageModelFrame.rsx" />
  <Include src="./src/drawerFrame1.rsx" />
  <Include src="./src/messageTriageModalFrame.rsx" />
  <Include src="./src/sendNewMessageModal.rsx" />
  <Frame
    id="$main"
    enableFullBleed={false}
    isHiddenOnDesktop={false}
    isHiddenOnMobile={false}
    padding="8px 12px"
    sticky={null}
    type="main"
  >
    <Include src="./src/tabbedContainer1.rsx" />
    <CustomComponent
      id="websockets"
      allowPopups={true}
      iframeCode={
        "<script src=\"https://cdn.socket.io/4.7.5/socket.io.min.js\" integrity=\"sha384-2huaZvOR9iDzHqslqwpR87isEmrfxqyWOF7hr7BY6KG0+hVKLoEXMPUJw3ynWuhO\" crossorigin=\"anonymous\"></script>\n<script src=\"https://cdn.jsdelivr.net/npm/marked/marked.min.js\"></script>\n<!-- You can add any HTML/CSS/JS here. UMD versions are required.\nKeep in mind that Custom Components are sensitive to bundle sizes, so try using a\ncustom implementation when possible. -->\n<script crossorigin src=\"https://unpkg.com/react@18/umd/react.development.js\"></script>\n<script crossorigin src=\"https://unpkg.com/react-dom@18/umd/react-dom.development.js\"></script>\n\n<div id=\"react\"></div>\n\n<script type=\"text/babel\">\n  const MyCustomComponent = ({ triggerQuery, model, modelUpdate }) => {\n\n    React.useEffect(() => {\n      const socket = io(\n        model.apiUrl,\n        {\n          reconnectionAttempts: 2,\n          ackTimeout: 5000,\n          timeout: 5000,\n          transports: ['websocket'],\n          query: { phone_number_id: model.phoneNumberId },\n        }\n      )\n      socket.on('new_message', (data) => {\n        const parsed_data = JSON.parse(data);\n        triggerQuery('listConversations');\n        triggerQuery('notifyParentNewMessage');\n        if (model.activeConversation.ext_id == parsed_data.conversation_id) {\n          triggerQuery('retrieveConversation');\n        }\n      });\n\n      socket.on('new_call', (data) => triggerQuery('listCalls'));\n      socket.on('call_updated', (data) => triggerQuery('listCalls'));\n      socket.on('new_recording', (data) => triggerQuery('listCalls'));\n      socket.on('new_transcript', (data) => triggerQuery('listCalls'));\n      \n      return () => {\n        socket.off('new_message');\n        socket.off('new_call');\n        socket.off('call_updated');\n        socket.off('new_recording');\n        socket.off('new_transcription');\n        socket.disconnect();\n      };\n    }, [model.phoneNumberId, model.activeConversation])\n\n    return (<div />)\n  }\n\n  // This is the entrypoint for the React component.\n  const ConnectedComponent = Retool.connectReactComponent(MyCustomComponent)\n  const container = document.getElementById('react')\n  const root = ReactDOM.createRoot(container)\n  root.render(<ConnectedComponent />)\n</script>"
      }
      model={
        '{\n  "env": {{ retoolContext.environment }},\n  "listConversations": "listConversations",\n  "retrieveConversation": "retrieveConversation",\n  "activeConversation": {{ activeConversation.value }},\n  "listCalls": "listCalls",\n  "phoneNumberId": {{ selectedPhoneNumber.value }},\n  "token": {{ authTokenQuery.data.token }},\n  "apiUrl": {{ retoolContext.configVars.DUCKBILL_API_URL }},\n}'
      }
    />
  </Frame>
</App>
