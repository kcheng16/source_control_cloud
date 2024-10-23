const callTime = Date.parse({{urlparams.hash.callTime}})
const resEndTime = Date.parse({{getSingleReservation.data.data.ends}});
const resStartTime = Date.parse({{getSingleReservation.data.data.starts}});

//The Parking spot is being left in this if/else statement in case it needs to be included later
if ( {{getSingleFacility.data.data.company_id}} === 1299 ){
  return {
    TPSFacility : true
  }
} else if ( resStartTime > callTime ){
  return {
    beforeStart : true,
    after48Hours : false,
    TPSFacility : false
  }
} else if ( ( callTime - resEndTime ) <= (1000 * 60 * 60 * 48) ){
    return {
      beforeStart : false,
      after48Hours : false,
      TPSFacility : false
  }
} else {
  return {
    beforeStart : false,
    after48Hours : true,
    TPSFacility : false
  }
};