var markSpam;

const promises = untriagedMessageIds.value.map((messageId) =>
  customTriageMessage.trigger({
    additionalScope: {
      messageId: messageId,
      markSpam: markSpam
    }
  })
);
await Promise.all(promises);