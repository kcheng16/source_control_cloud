const resStart = Date.parse({{getSingleReservation.data.data.starts}});
const resMarket = {{getSingleReservation.data.data.city}};
const currentTime = new Date();
const blackoutObj = {
  removable_by_external_user: true
};
const locale = {{getSingleReservation.data.data.city.country_code}};
const operatorManaged = {{getSingleFacility.data.data.is_operator_managed_inventory}};
const currentUserEmail = {{current_user.email}};

//formate the 12hour time to 24hour time
function convertTime12to24 (time12h){
  const [time, modifier] = time12h.split(' ');
  let [hours, minutes] = time.split(':');
  if(hours === "12"){
    hours = "00"
  }
  if (modifier === "PM"){
    hours = parseInt(hours, 10) + 12;
  }
  return `${hours}:${minutes}`;
}  
//change m/d/yy format to yyyy-mm-dd
function convertDate (unformattedDate){
  let [m, d, y] = unformattedDate.split('/');
  if (d.length === 1) {d = `0${d}`};
  if (m.length === 1) {m = `0${m}`};
  return `${y}-${m}-${d}`
}
//concat formatted time and formatted date to create appropriate dateTime string                                                                              
function formatDateTime (unformattedDateTime){
  const [unformattedDate, unformattedTime] = unformattedDateTime.split(', ');
  const time24 = convertTime12to24(unformattedTime);
  const formattedDate = convertDate(unformattedDate);
  return `${formattedDate}T${time24}`;
}
                                                                                                  
if(resMarket.id === 15){
  if(+currentTime - resStart > (1000 * 60 * 60 * 5) || operatorManaged){
    //false indicates that the blackout button will not be active
    blackoutObj.activate = false;
  } else {
    const unformattedStart = currentTime.toLocaleString(`en-${locale}`, {timeZone: {{getSingleReservation.data.data.timezone}} });
    const unformattedEnd = new Date(+currentTime + (1000 * 60 * 60 * 5)).toLocaleString(`en-${locale}`, { timeZone: {{getSingleReservation.data.data.timezone}} });
      blackoutObj.spot_blackout_type_title = "range";
      blackoutObj.title = `lot full - created in retool by ${currentUserEmail}`;
      blackoutObj.starts = formatDateTime(unformattedStart);
      blackoutObj.ends = formatDateTime(unformattedEnd);
      blackoutObj.activate = true;
  }
} else {
  if (+currentTime - resStart > (1000 * 60 * 60 * 2) || operatorManaged){
    //false indicates that the blackout button will not be active
    blackoutObj.activate = false;
  } else {
    const unformattedStart = currentTime.toLocaleString(`en-${locale}`, {timeZone: {{getSingleReservation.data.data.timezone}} });
    const unformattedEnd = new Date(+currentTime + (1000 * 60 * 60 * 2)).toLocaleString(`en-${locale}`, { timeZone: {{getSingleReservation.data.data.timezone}} });
      blackoutObj.spot_blackout_type_title = "range";
      blackoutObj.title = `lot full - created in retool by ${currentUserEmail}`;
      blackoutObj.starts = formatDateTime(unformattedStart);
      blackoutObj.ends = formatDateTime(unformattedEnd)
      blackoutObj.activate = true;
  }
}


return blackoutObj