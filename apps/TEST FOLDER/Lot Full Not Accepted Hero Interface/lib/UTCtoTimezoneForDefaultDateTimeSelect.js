const startTimeUTC = new Date({{getSingleReservation.data.data.starts}});
const countryCode = {{getSingleReservation.data.data.city.country_code}};

const localStart = startTimeUTC.toLocaleString(`en-${countryCode}`, { timeZone: {{getSingleReservation.data.data.timezone}} } );

const offset = startTimeUTC.getTimezoneOffset()

return localStart;