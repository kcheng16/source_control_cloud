try {
  const errorMssage = JSON.parse(search_user_email.error).error.message;
  utils.showNotification({title: 'Uh-oh!', description: errorMssage, notificationType: 'error'});
} catch (e) {

}
