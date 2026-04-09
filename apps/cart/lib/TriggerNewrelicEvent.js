/**
 * Triggers a custom New Relic event for API monitoring.
 *
 * @param {Object} options.apiData - API response or request-related data.
 * @param {string} options.eventName - The name of the event.
 */
function triggerNewRelicEvent({ apiData, eventName, shouldLogResponse = true }) {
  const value = JSON.stringify({
    headers: apiData.headers,
    body: apiData.body,
    error: apiData.error,
    data: shouldLogResponse ? apiData.data : "",
    runTime: apiData.queryRunTime,
    finishedTime: apiData.finished,
    requestTime: apiData.requestSentTimestamp,
    "userData": localStorage.values?.userData,
    "userAddress": localStorage.values?.userAddress,
    "storeData": localStorage.values?.storeData,
  });

  NewrelicEvent?.trigger({
    additionalScope: {
      data: {
        user_agent: navigator.userAgent,
        user_id: `${current_user.id}`,
        session_id: current_user.sid,
        value: value,
        eventName: eventName
      }
    }
  });
}


window.triggerNewRelicEvent = triggerNewRelicEvent;