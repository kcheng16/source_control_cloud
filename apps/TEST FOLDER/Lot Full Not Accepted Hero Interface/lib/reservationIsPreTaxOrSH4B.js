if( {{getSingleRentalTransaction.data.data.results['0'].purchased_with_commuter_card}} ){
  return {
    textToDisplay : "Rental purchased with commuter card",
    isBusinessOrPreTax : true
  }
} else if ( {{getSingleRentalTransaction.data.data.results['0'].is_business_rental}} ){
  return {
    textToDisplay : "Rental purcheased as a business rental",
    isBusinessOrPreTax : true
  }
} else return {
    textToDisplay : "not pre tax or business",
    isBusinessOrPreTax : false
}