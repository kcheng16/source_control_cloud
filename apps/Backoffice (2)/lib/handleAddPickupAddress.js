const street = addressInput1.value;
const houseNumber = addressInput2.value;
const zipcode = addressInput3.value;
const city = addressInput4.value;
const countryId = addressInput5.value;
const country = addressInput5.selectedLabel;
const [number, addition] = houseNumber.split(" ");

pickupAddressDraft.setValue({
  street,
  number,
  houseNumber,
  addition,
  zipcode,
  city,
  countryId,
  country,
});
