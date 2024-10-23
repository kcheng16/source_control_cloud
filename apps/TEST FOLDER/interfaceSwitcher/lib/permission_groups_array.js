const groups = {{current_user.groups}}.map(group => group.name);

if ( groups.includes("external_tier1_hero") ){
  return {
    onsiteChange : false,
    customerCancel : false,
    equipmentError : false,
    lotFullNotAccepted : false,
    prePurchase : false
  }
} else if ( groups.includes("MOps_UAT") ){
  return {
    onsiteChange : false,
    customerCancel : false,
    equipmentError : false,
    lotFullNotAccepted : false,
    prePurchase : false
  }
} else if ( groups.includes("MOps_editor") ){
  return {
    onsiteChange : false,
    customerCancel : false,
    equipmentError : false,
    lotFullNotAccepted : false,
    prePurchase : false
  }
} else if ( groups.includes("admin") ){
  return {
    onsiteChange : false,
    customerCancel : false,
    equipmentError : false,
    lotFullNotAccepted : false,
    prePurchase : false
  }
}

