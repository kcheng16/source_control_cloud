const street = addressInput6.value;
const houseNumber = addressInput7.value;
const zipcode = addressInput8.value;
const city = addressInput9.value;
const countryId = addressInput5.value;
const country = addressInput10.selectedLabel;
const [number, addition] = houseNumber.split(" ");

invoiceAddressDraft.setValue({
  street,
  number,
  houseNumber,
  addition,
  zipcode,
  city,
  countryId,
  country,
});
