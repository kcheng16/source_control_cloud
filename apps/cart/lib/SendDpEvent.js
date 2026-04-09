function send_dp_event({ event, object_name, object_value }) {
  send_snowflake_event.trigger({
    additionalScope: {
      data: {
        platform: "retool",
        screen_name: "cart",
        user_agent: navigator.userAgent,
        user_id: `${current_user.id}`,
        session_id: current_user.sid,
        store_id: localStorage.values?.storeData?.storeId,
        context: current_user.email || "",
        event,
        object_name,
        object_value: JSON.stringify({...(object_value || {}), ...localStorage.values})
      }
    }
  });
}
window.send_dp_event = send_dp_event;