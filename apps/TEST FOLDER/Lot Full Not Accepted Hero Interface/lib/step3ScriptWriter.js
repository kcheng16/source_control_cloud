if ( {{getSingleFacility.data.data.company_id}} === 1299 ){
  return '**Reservation is not eligible for cancelation:** unfortunately we are not able to refund this reservation because The Parking Spot does not allow cancellations.'
} else if ({{ cancelBoolean.value.upTo30Mins }}){
  return '**Customer is eligible for cancellation:**  \n\n *"We’re happy to go ahead and get this canceled for you. For next time, you can cancel before the start via the app, website, or our automated phone system."*'
} else {
  return '**This customer is not eligible for cancellation:**  \n\n*"our refund policy states that you can have a full refund up until the moment your reservation starts. As you’re contacting us after the reservation started, this spot was held for you in the garage and I won’t be able to offer a refund."*'
}