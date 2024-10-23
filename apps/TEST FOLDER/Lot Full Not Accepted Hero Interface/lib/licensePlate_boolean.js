

if ( ( {{getSingleFacility.data.data.company_id}} === 177 || {{getSingleFacility.data.data.company_id}} === 58 ) && ( {{ select3.selectedItem.Hero_Tag__c }} === 'a3M0H0000019UvAUAU' || {{ select3.selectedItem.Hero_Tag__c }} === 'a3M0H0000019UvBUAU' ) ){
  return {
    licensePlate_required : true
  }
} else return {
  licensePlate_required : false
}