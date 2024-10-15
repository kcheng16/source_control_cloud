let payload = {{ form2.data }};

payload.phone_numbers = payload.phoneNumbersInputlistView
  .map(entry => entry.phoneNumber1)
  .filter(phoneNumber => phoneNumber && phoneNumber.length >= 12);
delete payload.phoneNumbersInputlistView;

payload.task = {{ newMessageRetrieveTask.data?.id }};
payload.twilio_phone = {{ selectedPhoneNumber.value }};

return payload;