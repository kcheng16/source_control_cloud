const {
  companyName9: name,
  cocInput4: cocNumber,
  select44: sectorId,
  clientProfileSelector4: profileId,
  relationSelector4: relationManagerId,
} = container456.data;
const {
  streetInput4: street,
  postcalCodeInput4: zipcode,
  countrySelector4: countryId,
  houseNumberInput4: houseNumber,
  cityInput4: city,
} = container457.data;
const {
  companyName10: invoiceEmail,
  companyName12: paymentTermsDays,
  companyName11: debtorNumber,
  companyName13: btwNumber,
} = container464.data;
const [number, addition] = houseNumber.trim().split(" ");
const groupId = selectClientGroup.value;
const wastePartnersInfo = textArea1.value;
const invoiceSendingChannel = segmentedControl12.value;
const invoiceFreq = segmentedControl11.value;
let clientLocationId = currentEditLocationId.value;

if (!isFormDirty.value && !currentEditLocationId.value) {
  goBack.trigger();
  return;
}

if (clientLocationId) {
  //update
  await updateClientLocationQuery.trigger({
    additionalScope: {
      name,
      cocNumber,
      sectorId,
      profileId,
      relationManagerId,
      groupId,
      clientLocationId,
      wastePartnersInfo,
      invoiceSendingChannel,
      invoiceFreq,
      invoiceEmail,
      paymentTermsDays,
      debtorNumber,
      btwNumber,
    },
  });
} else {
  //create
  const statusId = getConfigurationStatusesQuery.data.find(
    (item) => item.configurationStatusName === "Concept"
  )?.configurationStatusId;
  const location = await insertClientLocationQuery.trigger({
    additionalScope: {
      name,
      cocNumber,
      sectorId,
      profileId,
      relationManagerId,
      groupId,
      statusId,
      wastePartnersInfo,
      invoiceSendingChannel,
      invoiceFreq,
      invoiceEmail,
      paymentTermsDays,
      debtorNumber,
      btwNumber,
    },
  });
  clientLocationId = location.clientLocationId;
}

const addressId = loadClientLocationData?.data?.addressId;
const hasAddress = !checkbox4.value;

if (hasAddress) {
  const address = addressId
    ? await updateAddressQuery.trigger({
        additionalScope: {
          addressId,
          street,
          zipcode,
          countryId,
          city,
          number,
          addition,
        },
      })
    : await insertAddressQuery.trigger({
        additionalScope: {
          street,
          zipcode,
          countryId,
          city,
          number,
          addition,
        },
      });
  await updateClientLocationAddressQuery.trigger({
    additionalScope: {
      clientLocationId,
      addressId: address.addressId,
    },
  });
} else {
  if (addressId)
    await deleteAddressQuery.trigger({ additionalScope: { addressId } });
}

const pickupAddressId = loadClientLocationData?.data?.pickupAddressId;
const hasPickupAddress = segmentedControl8.value;
if (hasPickupAddress) {
  const { street, zipcode, countryId, city, number, addition } =
    pickupAddressDraft.value;
  const pickupAddress = pickupAddressId
    ? await updateAddressQuery.trigger({
        additionalScope: {
          addressId: pickupAddressId,
          street,
          zipcode,
          countryId,
          city,
          number,
          addition,
        },
      })
    : await insertAddressQuery.trigger({
        additionalScope: {
          street,
          zipcode,
          countryId,
          city,
          number,
          addition,
        },
      });
  await updateClientLocationPickupAddressQuery.trigger({
    additionalScope: {
      clientLocationId,
      pickupAddressId: pickupAddress.addressId,
    },
  });
} else {
  if (pickupAddressId)
    await deleteAddressQuery.trigger({
      additionalScope: { addressId: pickupAddressId },
    });
}

const openingHoursData = getOpenHoursQuery.data || [];
const hasOpenHours = segmentedControl9.value;
if (hasOpenHours) {
  await Promise.all(
    Object.entries(openHours.value).map(([dayOfWeek, data]) => {
      const { openTime, closeTime, isOpen } = data;
      return openingHoursData.length === 0
        ? insertOpeningHoursQuery.trigger({
            additionalScope: {
              dayOfWeek,
              clientLocationId,
              openTime,
              closeTime,
              isOpen,
            },
          })
        : updateOpeningHoursQuery.trigger({
            additionalScope: {
              dayOfWeek: parseInt(dayOfWeek),
              clientLocationId,
              openTime,
              closeTime,
              isOpen,
            },
          });
    })
  );
} else {
  await deleteOpenHoursQuery.trigger({
    additionalScope: { clientLocationId },
  });
}

const invoiceAddressId = loadClientLocationData?.data?.invoiceAddressId;
const hasInvoiceAddress = segmentedControl10.value;
if (hasInvoiceAddress) {
  const { street, zipcode, countryId, city, number, addition } =
    invoiceAddressDraft.value;
  const invoiceAddress = invoiceAddressId
    ? await updateAddressQuery.trigger({
        additionalScope: {
          addressId: invoiceAddressId,
          street,
          zipcode,
          countryId,
          city,
          number,
          addition,
        },
      })
    : await insertAddressQuery.trigger({
        additionalScope: {
          street,
          zipcode,
          countryId,
          city,
          number,
          addition,
        },
      });
  await updateClientLocationInvoiceAddressQuery.trigger({
    additionalScope: {
      clientLocationId,
      invoiceAddressId: invoiceAddress.addressId,
    },
  });
} else {
  if (invoiceAddressId)
    await deleteAddressQuery.trigger({
      additionalScope: { addressId: invoiceAddressId },
    });
}

await Promise.all(
  contactPersonsDraft1.value.map((item) => {
    return insertContactPersonQuery4.trigger({
      additionalScope: {
        name: item.name,
        statusId: item.status,
        phone: item.phone,
        email: item.email,
        remark: item.remark,
        functionId: item.functionId,
        clientLocationId,
      },
    });
  })
);

if (transitToActive === true) {
  const requiredFields = [
    selectClientGroup,
    companyName9,
    sectorSelector4,
    select44,
    clientProfileSelector4,
    streetInput4,
    houseNumberInput4,
    postcalCodeInput4,
    cityInput4,
    countrySelector4,
  ];
  const text = [];
  for (const field of requiredFields) {
    if (!field.value) {
      text.push(`${field.label}`);
    }
    requiredFieldsMessageText.setValue(
      text.map((item) => `- ${item}`).join("\n")
    );
  }
  if (text.length === 0) {
    const activeStatusId = getConfigurationStatusesQuery.data.find(
      (item) => item.configurationStatusName === "Active"
    ).configurationStatusId;

    await updateCustomerLocationStatusQuery.trigger({
      additionalScope: {
        statusId: activeStatusId,
        customerLocationId: clientLocationId,
      },
    });
    goBack.trigger();
  } else {
    requiredFieldsModal.show();
  }
  return;
}

goBack.trigger();
