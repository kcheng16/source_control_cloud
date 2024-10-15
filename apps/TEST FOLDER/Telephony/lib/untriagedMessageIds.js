const messages = {{ messagesListView.data }};

const untriaged = [];
messages.forEach(message => {
  if (!message.triaged_at){
    untriaged.push(message.ext_id);
  }
});

return untriaged;