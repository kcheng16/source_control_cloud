const {
  contactPersonFirstNameInput4,
  contactPersonLastNameInput4,
  contactPersonEmailInput4,
  contactPersonPhoneInput4,
  contactPersonDepartmentInput4,
  contactPersonFunctionInput4,
  contactPersonStatusInput4,
  contactPersonRemarkInput4,
} = addContactPersonForm2.data;

const departmentName = getDepartmentQuery5.data?.find(
  (item) => item.departmentId === contactPersonDepartmentInput4
).departmentName;
const functionName = getContactPersonFunctionByDepartmentQuery4.data?.find(
  (item) => item.contactPersonFunctionId === contactPersonFunctionInput4
).contactPersonFunctionName;

const person = {
  id: contactPersonsDraft1.value.length + 1,
  firstName: contactPersonFirstNameInput4,
  lastName: contactPersonLastNameInput4,
  name: `${contactPersonFirstNameInput4} ${contactPersonLastNameInput4}`,
  email: contactPersonEmailInput4,
  phone: contactPersonPhoneInput4,
  departmentName,
  functionName,
  departmentId: contactPersonDepartmentInput4,
  functionId: contactPersonFunctionInput4,
  status: contactPersonStatusInput4,
  remark: contactPersonRemarkInput4,
};

contactPersonsDraft1.setValue([...contactPersonsDraft1.value, person]);

addClientContactPersonModal.hide();
