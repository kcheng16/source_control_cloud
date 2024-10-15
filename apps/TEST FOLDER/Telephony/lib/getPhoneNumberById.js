const phoneNumbers = {{ listPhoneNumbers.data }};
const selectedPhoneId = {{ selectedPhoneNumber.value }};

for (const phoneNumber of phoneNumbers) {
  if (phoneNumber.id == selectedPhoneId){
    return phoneNumber.number;
  }
}