const endTime = Date.parse({{getSingleReservation.data.data.ends}});
const currentTime = +(new Date());
let rebookBoolean = false;
const adminBoolean = {{getSingleRentalTransaction.data.data.results['0'].rental_is_rebookable}};
const commuterCard = {{getSingleRentalTransaction.data.data.results['0'].purchased_with_commuter_card}};
const business = {{getSingleRentalTransaction.data.data.results['0'].is_business_rental}};
const oversizeFeeBoolean = {{priceBreakdown.data.oversize_fee}} != "0.00";

if(endTime > currentTime && adminBoolean && !oversizeFeeBoolean && !commuterCard && !business && {{reservationForCase.value}} != ""){
  rebookBoolean = false
} else {
  rebookBoolean = true
}
  
return rebookBoolean;