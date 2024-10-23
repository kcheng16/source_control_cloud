const utcString = new Date({{getSingleReservation.data.data.starts}}).toLocaleString('en-US', {timeZone : "UTC"});
const tzString = new Date({{getSingleReservation.data.data.starts}}).toLocaleString('en-US', {timeZone : {{getSingleFacility.data.data.timezone}} });
const tzDate = new Date(tzString);
const utcDate = new Date(utcString);

const offset = (tzDate - utcDate)/(1000 * 60 * 60)

let usableOffset = ""

let submissionTime = "" 
// the date Time picker removes offset if the time is changed in the UI, this takes that into account if necessary.
if ({{ closeCaseFormDataCache.value.dateTime3.split("T")[1].includes('-') }}) { 
  submissionTime = {{closeCaseFormDataCache.value.dateTime3.slice(0, -4) }}
usableOffset = ('0'.concat(offset.toString().slice(1).concat('00')))} else {
  submissionTime = {{ closeCaseFormDataCache.value.dateTime3 }}
usableOffset = ('-0'.concat(offset.toString().slice(1).concat('00')))
  } 


const timeWithCalculatedOffset = submissionTime.concat(usableOffset)
console.log(timeWithCalculatedOffset)

return timeWithCalculatedOffset